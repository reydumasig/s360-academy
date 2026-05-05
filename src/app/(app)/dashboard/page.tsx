import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import { computeStats, isUnlocked } from '@/lib/modules'
import type { ModuleWithProgress } from '@/types'

type ProgressRow = { module_code: string; started_at: string; completed_at: string | null; score: number | null }
type ModuleRow = { code: string; title: string; level_label: string; duration_min: number; sort_order: number }
type LearnerRow = { name: string; role: string }

export default async function DashboardPage() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/login')

  const [{ data: learnerRaw }, { data: modulesRaw }, { data: progressRaw }] = await Promise.all([
    supabase.from('learners').select('name,role').eq('id', user.id).single(),
    supabase.from('modules').select('code,title,level_label,duration_min,sort_order').order('sort_order'),
    supabase.from('module_progress').select('module_code,started_at,completed_at,score').eq('learner_id', user.id),
  ])

  const learner = learnerRaw as LearnerRow | null
  const modulesData = (modulesRaw ?? []) as ModuleRow[]
  const progressData = (progressRaw ?? []) as ProgressRow[]
  const progressMap = new Map(progressData.map((p) => [p.module_code, p]))

  const modules: ModuleWithProgress[] = modulesData.map((m) => {
    const p = progressMap.get(m.code)
    return {
      ...m,
      subtitle: '',
      level_key: '',
      started: !!p,
      completed: !!p?.completed_at,
      score: p?.score ?? null,
      unlocked: false,
    }
  })
  modules.forEach((m) => { m.unlocked = isUnlocked(m.code, modules) })

  const stats = computeStats(modules)

  return (
    <div className="max-w-5xl mx-auto px-4 sm:px-6 py-10">
      <h1
        className="text-3xl font-bold text-[#F2F4F8] mb-1"
        style={{ fontFamily: 'Georgia, serif' }}
      >
        Dashboard
      </h1>
      <p className="text-[#8A93A8] mb-8">
        {learner?.name ?? 'Pathfinder'} · {learner?.role}
      </p>

      {/* Stats */}
      <div className="grid grid-cols-2 sm:grid-cols-4 gap-3 mb-10">
        {[
          { label: 'Completed', value: `${stats.completed} / ${stats.total}` },
          { label: 'Progress', value: `${stats.percent}%` },
          { label: 'Min completed', value: stats.minutes_completed },
          { label: 'Min total', value: stats.minutes_total },
        ].map(({ label, value }) => (
          <div key={label} className="bg-[#1C2030] border border-[#2A3044] rounded-xl p-4">
            <div className="text-2xl font-bold text-[#1F7A8C]">{value}</div>
            <div className="text-xs text-[#8A93A8] mt-0.5">{label}</div>
          </div>
        ))}
      </div>

      {/* Activity table */}
      <div className="bg-[#1C2030] border border-[#2A3044] rounded-xl overflow-hidden">
        <div className="px-5 py-4 border-b border-[#2A3044]">
          <h2 className="text-[#F2F4F8] font-semibold text-sm">Module activity</h2>
        </div>
        <table className="w-full text-sm">
          <thead>
            <tr className="border-b border-[#2A3044]">
              {['Module', 'Level', 'Score', 'Status'].map((h) => (
                <th key={h} className="px-5 py-3 text-left text-xs text-[#8A93A8] font-medium">
                  {h}
                </th>
              ))}
            </tr>
          </thead>
          <tbody>
            {modules.map((m) => (
              <tr key={m.code} className="border-b border-[#2A3044] last:border-0">
                <td className="px-5 py-3">
                  <span className="font-mono text-xs text-[#8A93A8] mr-2">{m.code}</span>
                  <span className="text-[#C5CAD8]">{m.title}</span>
                </td>
                <td className="px-5 py-3 text-[#8A93A8] text-xs">{m.level_label}</td>
                <td className="px-5 py-3 text-xs">
                  {m.score !== null ? (
                    <span className="text-[#4CAF75]">{m.score}%</span>
                  ) : (
                    <span className="text-[#8A93A8]">—</span>
                  )}
                </td>
                <td className="px-5 py-3 text-xs">
                  {m.completed ? (
                    <span className="text-[#4CAF75]">Completed</span>
                  ) : m.started ? (
                    <span className="text-[#2EA8BE]">In progress</span>
                  ) : (
                    <span className="text-[#8A93A8]">Not started</span>
                  )}
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  )
}
