import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import { LEVELS, isUnlocked, computeStats } from '@/lib/modules'
import type { ModuleWithProgress } from '@/types'
import ModuleCard from '@/components/modules/module-card'
import LevelHeader from '@/components/modules/level-header'

type ModuleRow = {
  code: string; title: string; subtitle: string
  level_key: string; level_label: string; duration_min: number; sort_order: number
}
type ProgressRow = { module_code: string; started_at: string; completed_at: string | null; score: number | null }

export default async function ModulesPage() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/login')

  const [{ data: learnerRaw }, { data: modulesRaw }, { data: progressRaw }] = await Promise.all([
    supabase.from('learners').select('name').eq('id', user.id).single(),
    supabase.from('modules').select('code,title,subtitle,level_key,level_label,duration_min,sort_order').order('sort_order'),
    supabase.from('module_progress').select('module_code,started_at,completed_at,score').eq('learner_id', user.id),
  ])

  const learnerName = (learnerRaw as { name: string } | null)?.name ?? 'Pathfinder'
  const modulesData = (modulesRaw ?? []) as ModuleRow[]
  const progressData = (progressRaw ?? []) as ProgressRow[]
  const progressMap = new Map(progressData.map((p) => [p.module_code, p]))

  const modules: ModuleWithProgress[] = modulesData.map((m) => {
    const progress = progressMap.get(m.code)
    return {
      ...m,
      started: !!progress,
      completed: !!progress?.completed_at,
      score: progress?.score ?? null,
      unlocked: false,
    }
  })
  modules.forEach((m) => { m.unlocked = isUnlocked(m.code, modules) })

  const stats = computeStats(modules)

  // Find next module to work on
  const nextUp = modules.find((m) => m.unlocked && !m.completed)

  const modulesByLevel = LEVELS.map((level) => ({
    ...level,
    modules: modules.filter((m) => m.level_key === level.key),
  })).filter((level) => level.modules.length > 0)

  return (
    <div className="max-w-7xl mx-auto px-4 sm:px-6 py-10">

      {/* Hero */}
      <section className="mb-12">
        <p className="text-[#8A93A8] text-sm mb-1">
          Welcome back, <span className="text-[#C5CAD8] font-medium">{learnerName}</span>
        </p>
        <h1
          className="text-3xl sm:text-4xl font-bold text-[#F2F4F8] mb-6"
          style={{ fontFamily: 'Georgia, serif' }}
        >
          Pathfinder AI Academy
        </h1>

        {/* Progress bar */}
        <div className="mb-6">
          <div className="flex items-center justify-between mb-1.5">
            <span className="text-xs text-[#8A93A8]">Overall progress</span>
            <span className="text-xs font-medium text-[#2EA8BE]">{stats.percent}%</span>
          </div>
          <div className="h-1.5 bg-[#2A3044] rounded-full overflow-hidden">
            <div
              className="h-full bg-[#1F7A8C] rounded-full transition-all duration-500"
              style={{ width: `${stats.percent}%` }}
            />
          </div>
        </div>

        {/* Stat tiles */}
        <div className="grid grid-cols-2 sm:grid-cols-4 gap-3 mb-6">
          {[
            { label: 'Modules completed', value: `${stats.completed} / ${stats.total}` },
            { label: 'Progress', value: `${stats.percent}%` },
            { label: 'Hours completed', value: `${Math.round(stats.minutes_completed / 60 * 10) / 10}h` },
            { label: 'Total hours', value: `${Math.round(stats.minutes_total / 60 * 10) / 10}h` },
          ].map(({ label, value }) => (
            <div key={label} className="bg-[#1C2030] border border-[#2A3044] rounded-xl p-4">
              <div className="text-2xl font-bold text-[#1F7A8C]">{value}</div>
              <div className="text-xs text-[#8A93A8] mt-0.5">{label}</div>
            </div>
          ))}
        </div>

        {/* Next up nudge */}
        {nextUp && stats.completed === 0 && (
          <div className="bg-[#1F7A8C]/10 border border-[#1F7A8C]/25 rounded-xl px-5 py-4 flex items-center gap-4">
            <div className="flex-1">
              <p className="text-xs text-[#2EA8BE] font-medium uppercase tracking-wide mb-0.5">Start here</p>
              <p className="text-[#F2F4F8] font-medium text-sm" style={{ fontFamily: 'Georgia, serif' }}>
                {nextUp.title}
              </p>
            </div>
            <span className="text-[#2EA8BE] text-sm font-medium shrink-0">{nextUp.duration_min} min →</span>
          </div>
        )}
        {nextUp && stats.completed > 0 && (
          <div className="bg-[#1F7A8C]/10 border border-[#1F7A8C]/25 rounded-xl px-5 py-4 flex items-center gap-4">
            <div className="flex-1">
              <p className="text-xs text-[#2EA8BE] font-medium uppercase tracking-wide mb-0.5">Next up</p>
              <p className="text-[#F2F4F8] font-medium text-sm" style={{ fontFamily: 'Georgia, serif' }}>
                {nextUp.title}
              </p>
            </div>
            <span className="text-[#2EA8BE] text-sm font-medium shrink-0">{nextUp.duration_min} min →</span>
          </div>
        )}
        {!nextUp && stats.completed === stats.total && stats.total > 0 && (
          <div className="bg-[#E7C36A]/10 border border-[#E7C36A]/25 rounded-xl px-5 py-4">
            <p className="text-[#E7C36A] font-semibold" style={{ fontFamily: 'Georgia, serif' }}>
              🎉 Academy complete — all modules finished.
            </p>
          </div>
        )}
      </section>

      {/* Modules by level */}
      <div className="space-y-12">
        {modulesByLevel.map((level) => (
          <section key={level.key}>
            <LevelHeader label={level.label} description={level.description} />
            <div className="grid sm:grid-cols-2 lg:grid-cols-3 gap-4">
              {level.modules.map((module) => (
                <ModuleCard key={module.code} module={module} />
              ))}
            </div>
          </section>
        ))}
      </div>
    </div>
  )
}
