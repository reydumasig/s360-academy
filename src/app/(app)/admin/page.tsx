import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'

type LearnerRow = { id: string; name: string; role: string; started_at: string; last_seen_at: string | null }
type ProgressRow = { learner_id: string; completed_at: string | null }

export default async function AdminPage() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/login')

  const { data: meRaw } = await supabase
    .from('learners')
    .select('id,is_admin')
    .eq('id', user.id)
    .single()
  const me = meRaw as { id: string; is_admin: boolean } | null
  if (!me?.is_admin) redirect('/')

  const { data: learnersRaw } = await supabase
    .from('learners')
    .select('id,name,role,started_at,last_seen_at')
    .order('started_at', { ascending: false })
  const allLearners = (learnersRaw ?? []) as LearnerRow[]

  const { data: progressRaw } = await supabase
    .from('module_progress')
    .select('learner_id,completed_at')
  const allProgress = (progressRaw ?? []) as ProgressRow[]

  const completionMap = new Map<string, number>()
  allProgress.forEach((p) => {
    if (p.completed_at) {
      completionMap.set(p.learner_id, (completionMap.get(p.learner_id) ?? 0) + 1)
    }
  })

  return (
    <div className="max-w-6xl mx-auto px-4 sm:px-6 py-10">
      <h1
        className="text-3xl font-bold text-[#F2F4F8] mb-1"
        style={{ fontFamily: 'Georgia, serif' }}
      >
        Admin Dashboard
      </h1>
      <p className="text-[#8A93A8] mb-8">Org-wide Pathfinder progress.</p>

      {/* Summary tiles */}
      <div className="grid grid-cols-2 sm:grid-cols-3 gap-3 mb-10">
        <div className="bg-[#1C2030] border border-[#2A3044] rounded-xl p-4">
          <div className="text-2xl font-bold text-[#1F7A8C]">{allLearners.length}</div>
          <div className="text-xs text-[#8A93A8] mt-0.5">Total Pathfinders</div>
        </div>
        <div className="bg-[#1C2030] border border-[#2A3044] rounded-xl p-4">
          <div className="text-2xl font-bold text-[#1F7A8C]">
            {allProgress.filter((p) => p.completed_at).length}
          </div>
          <div className="text-xs text-[#8A93A8] mt-0.5">Total completions</div>
        </div>
        <div className="bg-[#1C2030] border border-[#2A3044] rounded-xl p-4">
          <div className="text-2xl font-bold text-[#1F7A8C]">
            {allLearners.filter((l) => (completionMap.get(l.id) ?? 0) >= 15).length}
          </div>
          <div className="text-xs text-[#8A93A8] mt-0.5">Full completions</div>
        </div>
      </div>

      {/* Learner table */}
      <div className="bg-[#1C2030] border border-[#2A3044] rounded-xl overflow-hidden">
        <div className="px-5 py-4 border-b border-[#2A3044]">
          <h2 className="text-[#F2F4F8] font-semibold text-sm">All Pathfinders</h2>
        </div>
        <div className="overflow-x-auto">
          <table className="w-full text-sm">
            <thead>
              <tr className="border-b border-[#2A3044]">
                {['Name', 'Role', 'Completed', 'Started'].map((h) => (
                  <th key={h} className="px-5 py-3 text-left text-xs text-[#8A93A8] font-medium">
                    {h}
                  </th>
                ))}
              </tr>
            </thead>
            <tbody>
              {allLearners.map((l) => (
                <tr key={l.id} className="border-b border-[#2A3044] last:border-0">
                  <td className="px-5 py-3 text-[#C5CAD8]">{l.name}</td>
                  <td className="px-5 py-3 text-[#8A93A8] text-xs">{l.role}</td>
                  <td className="px-5 py-3 text-[#4CAF75] text-xs">
                    {completionMap.get(l.id) ?? 0} / 15
                  </td>
                  <td className="px-5 py-3 text-[#8A93A8] text-xs">
                    {new Date(l.started_at).toLocaleDateString()}
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  )
}
