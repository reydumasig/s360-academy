import { createClient } from '@/lib/supabase/server'
import { NextResponse } from 'next/server'
import { getCertId } from '@/lib/modules'
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
    await supabase.from('certificates').upsert(
      { learner_id: user.id, module_code: code, cert_id: certId },
      { onConflict: 'cert_id', ignoreDuplicates: true }
    )
  }

  return NextResponse.json({ score, passed, results })
}
