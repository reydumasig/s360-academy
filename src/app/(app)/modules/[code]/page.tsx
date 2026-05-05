import { createClient } from '@/lib/supabase/server'
import { redirect, notFound } from 'next/navigation'
import { isUnlocked } from '@/lib/modules'
import type { ModuleWithProgress, ModuleContentSchema, Module } from '@/types'

interface PageProps {
  params: Promise<{ code: string }>
}

type ProgressRow = { module_code: string; completed_at: string | null; score: number | null }

export default async function ModulePage({ params }: PageProps) {
  const { code } = await params
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/login')

  const [{ data: moduleRaw }, { data: progressRaw }] = await Promise.all([
    supabase.from('modules').select('*').eq('code', code).single(),
    supabase.from('module_progress').select('module_code,completed_at,score').eq('learner_id', user.id),
  ])

  if (!moduleRaw) notFound()
  const moduleData = moduleRaw as Module
  const allProgress = (progressRaw ?? []) as ProgressRow[]

  const progressMap = new Map(allProgress.map((p) => [p.module_code, p]))

  const allModules: ModuleWithProgress[] = allProgress.map((p) => ({
    code: p.module_code,
    title: '',
    subtitle: '',
    level_key: '',
    level_label: '',
    duration_min: 0,
    sort_order: 0,
    started: true,
    completed: !!p.completed_at,
    score: p.score,
    unlocked: false,
  }))

  if (code !== 'PF01' && !isUnlocked(code, allModules)) {
    redirect('/')
  }

  await supabase.from('module_progress').upsert(
    { learner_id: user.id, module_code: code },
    { onConflict: 'learner_id,module_code', ignoreDuplicates: true }
  )

  const myProgress = progressMap.get(code)
  const content = moduleData.content as ModuleContentSchema

  return (
    <div className="max-w-4xl mx-auto px-4 sm:px-6 py-10">
      <div className="mb-8">
        <p className="text-xs text-[#1F7A8C] font-medium uppercase tracking-wider mb-1">
          {moduleData.level_label} · {code}
        </p>
        <h1
          className="text-3xl font-bold text-[#F2F4F8] mb-2"
          style={{ fontFamily: 'Georgia, serif' }}
        >
          {moduleData.title}
        </h1>
        <p className="text-[#8A93A8]">{moduleData.subtitle}</p>
        <div className="flex items-center gap-4 mt-3 text-xs text-[#8A93A8]">
          <span>{moduleData.duration_min} min</span>
          {myProgress?.completed_at && (
            <span className="text-[#4CAF75]">✓ Completed · {myProgress.score}%</span>
          )}
        </div>
      </div>

      {/* Content placeholder — Sprint 3 fills this */}
      {!content || Object.keys(content).length === 0 ? (
        <div className="bg-[#1C2030] border border-[#2A3044] rounded-xl p-8 text-center">
          <p className="text-[#8A93A8] text-sm">
            Content for this module is being prepared. Check back soon.
          </p>
        </div>
      ) : (
        <div className="space-y-8">
          {content.overview_html && (
            <section>
              <h2 className="text-xl font-semibold text-[#F2F4F8] mb-4" style={{ fontFamily: 'Georgia, serif' }}>
                Overview
              </h2>
              <div
                className="text-[#C5CAD8] leading-relaxed"
                dangerouslySetInnerHTML={{ __html: content.overview_html }}
              />
            </section>
          )}
        </div>
      )}
    </div>
  )
}
