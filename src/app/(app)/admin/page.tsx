import { createClient } from '@/lib/supabase/server'
import { createAdminClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import Link from 'next/link'

type LearnerRow = { id: string; name: string; role: string; started_at: string; last_seen_at: string | null }
type ProgressRow = { learner_id: string; module_code: string; completed_at: string | null; score: number | null }
type ModuleRow = { code: string; title: string; level_label: string; sort_order: number }
type CertRow = { learner_id: string; module_code: string; cert_id: string; issued_at: string }

export default async function AdminPage() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/login')

  // Auth check via anon client (own row)
  const { data: meRaw } = await supabase
    .from('learners')
    .select('id,is_admin')
    .eq('id', user.id)
    .single()
  const me = meRaw as { id: string; is_admin: boolean } | null
  if (!me?.is_admin) redirect('/modules')

  // All data via admin client (bypasses RLS)
  const admin = createAdminClient()

  const [
    { data: learnersRaw },
    { data: progressRaw },
    { data: modulesRaw },
    { data: certsRaw },
  ] = await Promise.all([
    admin.from('learners').select('id,name,role,started_at,last_seen_at').order('started_at', { ascending: false }),
    admin.from('module_progress').select('learner_id,module_code,completed_at,score'),
    admin.from('modules').select('code,title,level_label,sort_order').order('sort_order'),
    admin.from('certificates').select('learner_id,module_code,cert_id,issued_at').order('issued_at', { ascending: false }),
  ])

  const allLearners = (learnersRaw ?? []) as LearnerRow[]
  const allProgress = (progressRaw ?? []) as ProgressRow[]
  const allModules = (modulesRaw ?? []) as ModuleRow[]
  const allCerts = (certsRaw ?? []) as CertRow[]

  const TOTAL_MODULES = allModules.length || 15

  // Per-learner completion map: learner_id → Set of completed module codes
  const completedByLearner = new Map<string, Set<string>>()
  allProgress.forEach((p) => {
    if (p.completed_at) {
      if (!completedByLearner.has(p.learner_id)) completedByLearner.set(p.learner_id, new Set())
      completedByLearner.get(p.learner_id)!.add(p.module_code)
    }
  })

  // Per-module analytics: code → { started, completed }
  const moduleStats = new Map<string, { started: number; completed: number }>()
  allModules.forEach((m) => moduleStats.set(m.code, { started: 0, completed: 0 }))
  allProgress.forEach((p) => {
    if (!moduleStats.has(p.module_code)) return
    const s = moduleStats.get(p.module_code)!
    s.started++
    if (p.completed_at) s.completed++
  })

  // Summary stats
  const totalCompletions = allProgress.filter((p) => p.completed_at).length
  const fullCompletions = allLearners.filter((l) => (completedByLearner.get(l.id)?.size ?? 0) >= TOTAL_MODULES).length
  const avgPct = allLearners.length
    ? Math.round(allLearners.reduce((sum, l) => sum + (completedByLearner.get(l.id)?.size ?? 0), 0) / allLearners.length / TOTAL_MODULES * 100)
    : 0

  // Cert lookup by learner for display
  const certsByLearner = new Map<string, CertRow[]>()
  allCerts.forEach((c) => {
    if (!certsByLearner.has(c.learner_id)) certsByLearner.set(c.learner_id, [])
    certsByLearner.get(c.learner_id)!.push(c)
  })

  return (
    <div className="max-w-6xl mx-auto px-4 sm:px-6 py-10">
      <div className="flex items-start justify-between mb-8">
        <div>
          <h1 className="text-3xl font-bold text-[#F2F4F8] mb-1" style={{ fontFamily: 'Georgia, serif' }}>
            Admin Dashboard
          </h1>
          <p className="text-[#8A93A8] text-sm">Org-wide Pathfinder progress.</p>
        </div>
        <Link
          href="/admin/modules"
          className="bg-[#1C2030] border border-[#2A3044] hover:border-[#1F7A8C] text-[#C5CAD8] hover:text-[#F2F4F8] font-medium px-4 py-2 rounded-lg text-sm transition-colors"
        >
          Manage Modules →
        </Link>
      </div>

      {/* ── Summary tiles ── */}
      <div className="grid grid-cols-2 sm:grid-cols-4 gap-3 mb-10">
        <Tile value={allLearners.length} label="Total Pathfinders" />
        <Tile value={totalCompletions} label="Total completions" />
        <Tile value={fullCompletions} label={`Full completions (${TOTAL_MODULES}/${TOTAL_MODULES})`} />
        <Tile value={`${avgPct}%`} label="Avg completion rate" />
      </div>

      {/* ── Module Analytics ── */}
      <section className="mb-10">
        <h2 className="text-xs text-[#8A93A8] font-medium uppercase tracking-widest mb-4">Module Analytics</h2>
        <div className="bg-[#1C2030] border border-[#2A3044] rounded-xl overflow-hidden">
          <div className="overflow-x-auto">
            <table className="w-full text-sm">
              <thead>
                <tr className="border-b border-[#2A3044]">
                  {['Code', 'Module', 'Started', 'Completed', 'Rate'].map((h) => (
                    <th key={h} className="px-5 py-3 text-left text-xs text-[#8A93A8] font-medium">{h}</th>
                  ))}
                </tr>
              </thead>
              <tbody>
                {allModules.map((m) => {
                  const stat = moduleStats.get(m.code) ?? { started: 0, completed: 0 }
                  const rate = stat.started > 0 ? Math.round(stat.completed / stat.started * 100) : 0
                  return (
                    <tr key={m.code} className="border-b border-[#2A3044] last:border-0 hover:bg-[#1A1E2C]">
                      <td className="px-5 py-3 font-mono text-xs text-[#8A93A8]">{m.code}</td>
                      <td className="px-5 py-3">
                        <p className="text-[10px] text-[#1F7A8C] uppercase tracking-wider mb-0.5">{m.level_label}</p>
                        <p className="text-[#C5CAD8] text-xs leading-snug">{m.title}</p>
                      </td>
                      <td className="px-5 py-3 text-[#8A93A8] text-xs">{stat.started}</td>
                      <td className="px-5 py-3 text-[#4CAF75] text-xs font-medium">{stat.completed}</td>
                      <td className="px-5 py-3">
                        <div className="flex items-center gap-2">
                          <div className="w-16 h-1.5 bg-[#2A3044] rounded-full overflow-hidden">
                            <div className="h-full bg-[#1F7A8C] rounded-full" style={{ width: `${rate}%` }} />
                          </div>
                          <span className="text-xs text-[#8A93A8]">{rate}%</span>
                        </div>
                      </td>
                    </tr>
                  )
                })}
              </tbody>
            </table>
          </div>
        </div>
      </section>

      {/* ── Learner Progress ── */}
      <section className="mb-10">
        <h2 className="text-xs text-[#8A93A8] font-medium uppercase tracking-widest mb-4">All Pathfinders</h2>
        <div className="bg-[#1C2030] border border-[#2A3044] rounded-xl overflow-hidden">
          <div className="overflow-x-auto">
            <table className="w-full text-sm">
              <thead>
                <tr className="border-b border-[#2A3044]">
                  {['Name', 'Role', 'Progress', 'Completed Modules', 'Certs', 'Last Seen'].map((h) => (
                    <th key={h} className="px-5 py-3 text-left text-xs text-[#8A93A8] font-medium">{h}</th>
                  ))}
                </tr>
              </thead>
              <tbody>
                {allLearners.map((l) => {
                  const completed = completedByLearner.get(l.id) ?? new Set<string>()
                  const count = completed.size
                  const pct = Math.round(count / TOTAL_MODULES * 100)
                  const certs = certsByLearner.get(l.id) ?? []
                  const lastSeen = l.last_seen_at
                    ? new Date(l.last_seen_at).toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: 'numeric' })
                    : '—'
                  return (
                    <tr key={l.id} className="border-b border-[#2A3044] last:border-0 hover:bg-[#1A1E2C]">
                      <td className="px-5 py-4 text-[#F2F4F8] font-medium text-sm">{l.name}</td>
                      <td className="px-5 py-4 text-[#8A93A8] text-xs max-w-[140px] truncate">{l.role}</td>
                      <td className="px-5 py-4">
                        <div className="flex items-center gap-2">
                          <div className="w-20 h-1.5 bg-[#2A3044] rounded-full overflow-hidden">
                            <div
                              className="h-full rounded-full"
                              style={{
                                width: `${pct}%`,
                                background: count >= TOTAL_MODULES ? '#E7C36A' : '#1F7A8C',
                              }}
                            />
                          </div>
                          <span className="text-xs text-[#8A93A8] whitespace-nowrap">{count} / {TOTAL_MODULES}</span>
                        </div>
                      </td>
                      <td className="px-5 py-4">
                        {count === 0 ? (
                          <span className="text-xs text-[#8A93A8]">—</span>
                        ) : (
                          <div className="flex flex-wrap gap-1">
                            {allModules.filter((m) => completed.has(m.code)).map((m) => (
                              <span
                                key={m.code}
                                className="font-mono text-[9px] bg-[#1F7A8C]/20 text-[#2EA8BE] border border-[#1F7A8C]/30 rounded px-1.5 py-0.5"
                              >
                                {m.code}
                              </span>
                            ))}
                          </div>
                        )}
                      </td>
                      <td className="px-5 py-4 text-[#E7C36A] text-xs font-medium">{certs.length}</td>
                      <td className="px-5 py-4 text-[#8A93A8] text-xs whitespace-nowrap">{lastSeen}</td>
                    </tr>
                  )
                })}
                {allLearners.length === 0 && (
                  <tr>
                    <td colSpan={6} className="px-5 py-8 text-center text-[#8A93A8] text-sm">
                      No Pathfinders enrolled yet.
                    </td>
                  </tr>
                )}
              </tbody>
            </table>
          </div>
        </div>
      </section>

      {/* ── Recent Certificates ── */}
      {allCerts.length > 0 && (
        <section>
          <h2 className="text-xs text-[#8A93A8] font-medium uppercase tracking-widest mb-4">
            Issued Certificates <span className="text-[#2A3044] font-normal">({allCerts.length})</span>
          </h2>
          <div className="bg-[#1C2030] border border-[#2A3044] rounded-xl overflow-hidden">
            <div className="overflow-x-auto">
              <table className="w-full text-sm">
                <thead>
                  <tr className="border-b border-[#2A3044]">
                    {['Cert ID', 'Learner', 'Module', 'Issued'].map((h) => (
                      <th key={h} className="px-5 py-3 text-left text-xs text-[#8A93A8] font-medium">{h}</th>
                    ))}
                  </tr>
                </thead>
                <tbody>
                  {allCerts.slice(0, 50).map((c) => {
                    const learner = allLearners.find((l) => l.id === c.learner_id)
                    const mod = allModules.find((m) => m.code === c.module_code)
                    return (
                      <tr key={c.cert_id} className="border-b border-[#2A3044] last:border-0 hover:bg-[#1A1E2C]">
                        <td className="px-5 py-3 font-mono text-xs text-[#E7C36A]">{c.cert_id}</td>
                        <td className="px-5 py-3 text-[#C5CAD8] text-sm">{learner?.name ?? '—'}</td>
                        <td className="px-5 py-3">
                          <span className="font-mono text-xs text-[#8A93A8] mr-2">{c.module_code}</span>
                          <span className="text-xs text-[#C5CAD8]">{mod?.title ?? ''}</span>
                        </td>
                        <td className="px-5 py-3 text-[#8A93A8] text-xs whitespace-nowrap">
                          {new Date(c.issued_at).toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: 'numeric' })}
                        </td>
                      </tr>
                    )
                  })}
                </tbody>
              </table>
            </div>
          </div>
        </section>
      )}
    </div>
  )
}

function Tile({ value, label }: { value: string | number; label: string }) {
  return (
    <div className="bg-[#1C2030] border border-[#2A3044] rounded-xl p-4">
      <div className="text-2xl font-bold text-[#1F7A8C]">{value}</div>
      <div className="text-xs text-[#8A93A8] mt-0.5 leading-snug">{label}</div>
    </div>
  )
}
