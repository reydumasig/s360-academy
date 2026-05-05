import { createClient, createAdminClient } from '@/lib/supabase/server'
import { NextResponse } from 'next/server'
import { getCertId } from '@/lib/modules'
import { sendCertificateEmail } from '@/lib/email'
import type { ModuleContentSchema, KcItem } from '@/types'
import type { Json } from '@/types/database'

interface RouteParams {
  params: Promise<{ code: string }>
}

export async function POST(request: Request, { params }: RouteParams) {
  const { code } = await params
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })

  const body = await request.json()
  const { answers } = body as { answers: (number | string)[] }

  const { data: moduleRaw } = await supabase
    .from('modules')
    .select('code,pass_score,content')
    .eq('code', code)
    .single()

  if (!moduleRaw) return NextResponse.json({ error: 'Module not found' }, { status: 404 })

  const moduleData = moduleRaw as { code: string; pass_score: number; content: Json }
  const content = moduleData.content as unknown as ModuleContentSchema
  const kcItems: KcItem[] = content?.kc?.items ?? []

  let correct = 0
  const results = kcItems.map((item, i) => {
    if (item.type === 'mcq') {
      const isCorrect = Number(answers[i]) === item.correct
      if (isCorrect) correct++
      return { type: 'mcq' as const, correct: isCorrect, explain: item.explain, model_answer: null }
    } else {
      correct++ // open questions: full credit for completing
      return { type: 'open' as const, correct: true, explain: null, model_answer: item.answer }
    }
  })

  const total = kcItems.length
  const score = total > 0 ? Math.round((correct / total) * 100) : 100
  const passed = total > 0 ? correct / total >= moduleData.pass_score : true

  await supabase.from('kc_attempts').insert({
    learner_id: user.id,
    module_code: code,
    answers: answers as unknown as Json,
    score,
    passed,
  })

  if (passed) {
    const now = new Date().toISOString()
    await supabase.from('module_progress').upsert(
      { learner_id: user.id, module_code: code, completed_at: now, score },
      { onConflict: 'learner_id,module_code' }
    )

    const certId = getCertId(code)
    const { data: existingCert } = await supabase
      .from('certificates')
      .select('id')
      .eq('cert_id', certId)
      .single()

    if (!existingCert) {
      await supabase.from('certificates').insert({
        learner_id: user.id, module_code: code, cert_id: certId,
      })

      // Fetch learner name + email for the certificate email
      try {
        const admin = createAdminClient()
        const [{ data: learnerRow }, { data: moduleRow }, { data: authUser }] = await Promise.all([
          admin.from('learners').select('name').eq('id', user.id).single(),
          admin.from('modules').select('title,level_label').eq('code', code).single(),
          admin.auth.admin.getUserById(user.id),
        ])

        if (learnerRow && moduleRow && authUser.user?.email) {
          await sendCertificateEmail({
            to: authUser.user.email,
            learnerName: (learnerRow as { name: string }).name,
            moduleTitle: (moduleRow as { title: string; level_label: string }).title,
            levelLabel: (moduleRow as { title: string; level_label: string }).level_label,
            certId,
            moduleCode: code,
            issuedAt: now,
          })
        }
      } catch (emailErr) {
        // Email failure should not block the response
        console.error('[submit] certificate email failed:', emailErr)
      }
    }
  }

  return NextResponse.json({ score, passed, results })
}
