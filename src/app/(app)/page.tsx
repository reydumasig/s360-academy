import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import { MODULE_ORDER, LEVELS, isUnlocked, computeStats } from '@/lib/modules'
import type { ModuleWithProgress } from '@/types'
import ModuleCard from '@/components/modules/module-card'
import LevelHeader from '@/components/modules/level-header'

export default async function ModulesPage() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/login')

  const [{ data: modulesData }, { data: progressData }] = await Promise.all([
    supabase.from('modules').select('code,title,subtitle,level_key,level_label,duration_min,sort_order').order('sort_order'),
    supabase.from('module_progress').select('module_code,started_at,completed_at,score').eq('learner_id', user.id),
  ])

  const progressMap = new Map(
    (progressData ?? []).map((p) => [p.module_code, p])
  )

  const modules: ModuleWithProgress[] = (modulesData ?? []).map((m) => {
    const progress = progressMap.get(m.code)
    return {
      ...m,
      started: !!progress,
      completed: !!progress?.completed_at,
      score: progress?.score ?? null,
      unlocked: false,
    }
  })

  // Compute unlock states (needs ordered list first)
  modules.forEach((m) => {
    m.unlocked = isUnlocked(m.code, modules)
  })

  const stats = computeStats(modules)

  const modulesByLevel = LEVELS.map((level) => ({
    ...level,
    modules: modules.filter((m) => m.level_key === level.key),
  }))

  return (
    <div className="max-w-7xl mx-auto px-4 sm:px-6 py-10">
      {/* Hero */}
      <section className="mb-12">
        <h1
          className="text-3xl sm:text-4xl font-bold text-[#F2F4F8] mb-2"
          style={{ fontFamily: 'Georgia, serif' }}
        >
          Pathfinder AI Academy
        </h1>
        <p className="text-[#8A93A8] mb-8 max-w-xl">
          15 modules across 5 levels. Complete each module to unlock the next.
        </p>

        {/* Stat tiles */}
        <div className="grid grid-cols-2 sm:grid-cols-4 gap-3">
          {[
            { label: 'Modules completed', value: `${stats.completed} / ${stats.total}` },
            { label: 'Progress', value: `${stats.percent}%` },
            { label: 'Minutes completed', value: stats.minutes_completed.toString() },
            { label: 'Minutes total', value: stats.minutes_total.toString() },
          ].map(({ label, value }) => (
            <div key={label} className="bg-[#1C2030] border border-[#2A3044] rounded-xl p-4">
              <div className="text-2xl font-bold text-[#1F7A8C]">{value}</div>
              <div className="text-xs text-[#8A93A8] mt-0.5">{label}</div>
            </div>
          ))}
        </div>
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
