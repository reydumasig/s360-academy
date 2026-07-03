import { createClient } from '@/lib/supabase/server'
import { createAdminClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'

type LearnerRow = { id: string; name: string; started_at: string }
type ProgressRow = { learner_id: string; module_code: string; completed_at: string | null }
type CertRow = { learner_id: string }
type ModuleRow = { code: string; level_label: string; sort_order: number }

const MEDALS = ['🥇', '🥈', '🥉']

export default async function LeaderboardPage() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/login')

  const admin = createAdminClient()

  const [{ data: learnersRaw }, { data: progressRaw }, { data: certsRaw }, { data: modulesRaw }] = await Promise.all([
    admin.from('learners').select('id,name,started_at').order('started_at'),
    admin.from('module_progress').select('learner_id,module_code,completed_at'),
    admin.from('certificates').select('learner_id'),
    admin.from('modules').select('code,level_label,sort_order').order('sort_order'),
  ])

  const learners = (learnersRaw ?? []) as LearnerRow[]
  const progress = (progressRaw ?? []) as ProgressRow[]
  const certs = (certsRaw ?? []) as CertRow[]
  const modules = (modulesRaw ?? []) as ModuleRow[]
  const TOTAL = modules.length || 15
  const moduleByCode = new Map(modules.map((m) => [m.code, m]))

  // Build completion counts + each learner's furthest-reached level label
  const completionMap = new Map<string, number>()
  const furthestSortOrder = new Map<string, number>()
  const levelLabelMap = new Map<string, string>()
  progress.forEach((p) => {
    if (!p.completed_at) return
    completionMap.set(p.learner_id, (completionMap.get(p.learner_id) ?? 0) + 1)
    const mod = moduleByCode.get(p.module_code)
    if (mod && mod.sort_order > (furthestSortOrder.get(p.learner_id) ?? -Infinity)) {
      furthestSortOrder.set(p.learner_id, mod.sort_order)
      levelLabelMap.set(p.learner_id, mod.level_label)
    }
  })
  const certMap = new Map<string, number>()
  certs.forEach((c) => certMap.set(c.learner_id, (certMap.get(c.learner_id) ?? 0) + 1))
  const getLevelLabel = (learnerId: string) => levelLabelMap.get(learnerId) ?? 'Enrolled'

  // Sort: completions desc, then earliest started (loyalty tiebreak)
  const ranked = [...learners].sort((a, b) => {
    const diff = (completionMap.get(b.id) ?? 0) - (completionMap.get(a.id) ?? 0)
    if (diff !== 0) return diff
    return new Date(a.started_at).getTime() - new Date(b.started_at).getTime()
  })

  const myRank = ranked.findIndex((l) => l.id === user.id) + 1
  const myCompletions = completionMap.get(user.id) ?? 0

  return (
    <div className="max-w-3xl mx-auto px-4 sm:px-6 py-10">

      {/* Header */}
      <div className="mb-8">
        <h1 className="text-3xl font-bold text-[#F2F4F8] mb-1" style={{ fontFamily: 'Georgia, serif' }}>
          Leaderboard
        </h1>
        <p className="text-[#8A93A8] text-sm">
          {ranked.length} Pathfinder{ranked.length !== 1 ? 's' : ''} enrolled · ranked by modules completed
        </p>
      </div>

      {/* Your standing chip */}
      {myRank > 0 && (
        <div className="mb-6 bg-[#1F7A8C]/10 border border-[#1F7A8C]/25 rounded-xl px-5 py-3 flex items-center justify-between gap-4">
          <p className="text-sm text-[#C5CAD8]">
            You are <span className="text-[#2EA8BE] font-semibold">#{myRank}</span> with{' '}
            <span className="text-[#F2F4F8] font-semibold">{myCompletions} / {TOTAL}</span> modules completed
          </p>
          <span className="text-xs text-[#1F7A8C] font-medium uppercase tracking-wider shrink-0">
            {getLevelLabel(user.id)}
          </span>
        </div>
      )}

      {/* Rankings */}
      <div className="space-y-2">
        {ranked.map((learner, i) => {
          const rank = i + 1
          const completions = completionMap.get(learner.id) ?? 0
          const numCerts = certMap.get(learner.id) ?? 0
          const pct = Math.round(completions / TOTAL * 100)
          const isMe = learner.id === user.id
          const isTop3 = rank <= 3
          const isFullComplete = completions >= TOTAL

          return (
            <div
              key={learner.id}
              className={`relative flex items-center gap-4 rounded-xl px-5 py-4 border transition-colors ${
                isMe
                  ? 'bg-[#1F7A8C]/10 border-[#1F7A8C]/40'
                  : 'bg-[#1C2030] border-[#2A3044] hover:border-[#3A4054]'
              } ${isFullComplete ? 'border-[#E7C36A]/30' : ''}`}
            >
              {/* Rank */}
              <div className="w-8 shrink-0 text-center">
                {isTop3 ? (
                  <span className="text-lg">{MEDALS[rank - 1]}</span>
                ) : (
                  <span className={`text-sm font-semibold ${isMe ? 'text-[#2EA8BE]' : 'text-[#8A93A8]'}`}>
                    #{rank}
                  </span>
                )}
              </div>

              {/* Avatar initial */}
              <div
                className={`w-9 h-9 rounded-full flex items-center justify-center text-sm font-bold shrink-0 ${
                  isFullComplete
                    ? 'bg-[#E7C36A]/20 text-[#E7C36A]'
                    : isMe
                    ? 'bg-[#1F7A8C]/30 text-[#2EA8BE]'
                    : 'bg-[#2A3044] text-[#8A93A8]'
                }`}
              >
                {learner.name.charAt(0).toUpperCase()}
              </div>

              {/* Name + level + progress */}
              <div className="flex-1 min-w-0">
                <div className="flex items-center gap-2 mb-1">
                  <span
                    className={`text-sm font-semibold truncate ${isMe ? 'text-[#F2F4F8]' : 'text-[#C5CAD8]'}`}
                    style={{ fontFamily: 'Georgia, serif' }}
                  >
                    {learner.name}
                    {isMe && <span className="ml-1.5 text-[10px] text-[#1F7A8C] font-medium uppercase tracking-wider"> you</span>}
                  </span>
                  {isFullComplete && (
                    <span className="text-[10px] font-semibold text-[#E7C36A] uppercase tracking-wider shrink-0">
                      Graduate
                    </span>
                  )}
                </div>
                <div className="flex items-center gap-2">
                  <div className="flex-1 max-w-[160px] h-1.5 bg-[#2A3044] rounded-full overflow-hidden">
                    <div
                      className="h-full rounded-full"
                      style={{
                        width: `${pct}%`,
                        background: isFullComplete ? '#E7C36A' : isMe ? '#2EA8BE' : '#1F7A8C',
                      }}
                    />
                  </div>
                  <span className="text-xs text-[#8A93A8] whitespace-nowrap">{completions} / {TOTAL}</span>
                </div>
              </div>

              {/* Level + certs */}
              <div className="text-right shrink-0">
                <p className="text-[10px] text-[#1F7A8C] font-medium uppercase tracking-wider mb-0.5">
                  {getLevelLabel(learner.id)}
                </p>
                {numCerts > 0 && (
                  <p className="text-[10px] text-[#E7C36A]">
                    {numCerts} cert{numCerts !== 1 ? 's' : ''}
                  </p>
                )}
              </div>
            </div>
          )
        })}

        {ranked.length === 0 && (
          <div className="text-center py-16 text-[#8A93A8] text-sm">
            No Pathfinders enrolled yet.
          </div>
        )}
      </div>
    </div>
  )
}
