import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import Link from 'next/link'

type ModuleRow = { code: string; title: string; level_label: string; sort_order: number }
type CertRow = { module_code: string; cert_id: string; issued_at: string }

export default async function CertificatesPage() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/login')

  const [{ data: modulesRaw }, { data: certsRaw }] = await Promise.all([
    supabase.from('modules').select('code,title,level_label,sort_order').order('sort_order'),
    supabase.from('certificates').select('module_code,cert_id,issued_at').eq('learner_id', user.id),
  ])

  const modulesData = (modulesRaw ?? []) as ModuleRow[]
  const certsData = (certsRaw ?? []) as CertRow[]
  const certMap = new Map(certsData.map((c) => [c.module_code, c]))
  const earned = certsData.length

  return (
    <div className="max-w-5xl mx-auto px-4 sm:px-6 py-10">

      {/* Header */}
      <div className="mb-8">
        <h1 className="text-3xl font-bold text-[#F2F4F8] mb-1" style={{ fontFamily: 'Georgia, serif' }}>
          Certificates
        </h1>
        <p className="text-[#8A93A8] text-sm">
          {earned === 0
            ? 'Complete a module knowledge check to earn your first certificate.'
            : `${earned} of ${modulesData.length} certificates earned.`}
        </p>
      </div>

      {/* Earned certificates — full cards at top */}
      {earned > 0 && (
        <section className="mb-10">
          <h2 className="text-xs text-[#8A93A8] font-medium uppercase tracking-widest mb-4">Earned</h2>
          <div className="grid sm:grid-cols-2 lg:grid-cols-3 gap-4">
            {modulesData.filter((m) => certMap.has(m.code)).map((m) => {
              const cert = certMap.get(m.code)!
              const issuedDate = new Date(cert.issued_at).toLocaleDateString('en-US', {
                month: 'short', day: 'numeric', year: 'numeric',
              })
              return (
                <Link key={m.code} href={`/certificates/${m.code}`} className="group block">
                  <div className="h-full bg-[#1C2030] border border-[#E7C36A]/25 hover:border-[#E7C36A]/60 rounded-xl p-5 flex flex-col gap-3 transition-all duration-150 hover:bg-[#232940]">

                    {/* Top row */}
                    <div className="flex items-start justify-between gap-2">
                      <span className="font-mono text-xs text-[#8A93A8]">{m.code}</span>
                      <span className="text-[10px] font-semibold text-[#E7C36A] uppercase tracking-wider">
                        🎓 Earned
                      </span>
                    </div>

                    {/* Title */}
                    <div className="flex-1">
                      <p className="text-[10px] text-[#1F7A8C] font-medium uppercase tracking-wider mb-1">
                        {m.level_label}
                      </p>
                      <p className="text-[#F2F4F8] text-sm font-semibold leading-snug" style={{ fontFamily: 'Georgia, serif' }}>
                        {m.title}
                      </p>
                    </div>

                    {/* Footer */}
                    <div className="pt-3 border-t border-[#2A3044] flex items-center justify-between">
                      <div>
                        <p className="font-mono text-[10px] text-[#E7C36A]/70">{cert.cert_id}</p>
                        <p className="text-[10px] text-[#8A93A8] mt-0.5">{issuedDate}</p>
                      </div>
                      <span className="text-xs text-[#2EA8BE] group-hover:text-[#1F7A8C] transition-colors font-medium">
                        View →
                      </span>
                    </div>

                  </div>
                </Link>
              )
            })}
          </div>
        </section>
      )}

      {/* Remaining modules — compact list */}
      {earned < modulesData.length && (
        <section>
          <h2 className="text-xs text-[#8A93A8] font-medium uppercase tracking-widest mb-4">
            {earned === 0 ? 'All modules' : 'Still to earn'}
          </h2>
          <div className="bg-[#1C2030] border border-[#2A3044] rounded-xl overflow-hidden">
            {modulesData.filter((m) => !certMap.has(m.code)).map((m, i, arr) => (
              <div
                key={m.code}
                className={`flex items-center gap-4 px-5 py-4 ${i < arr.length - 1 ? 'border-b border-[#2A3044]' : ''}`}
              >
                <span className="font-mono text-xs text-[#8A93A8] w-10 shrink-0">{m.code}</span>
                <div className="flex-1 min-w-0">
                  <p className="text-[10px] text-[#1F7A8C] font-medium uppercase tracking-wider mb-0.5">
                    {m.level_label}
                  </p>
                  <p className="text-[#C5CAD8] text-sm truncate">{m.title}</p>
                </div>
                <span className="text-[#8A93A8] text-xs shrink-0">🔒</span>
              </div>
            ))}
          </div>
        </section>
      )}

    </div>
  )
}
