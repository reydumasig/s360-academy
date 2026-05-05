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

  return (
    <div className="max-w-7xl mx-auto px-4 sm:px-6 py-10">
      <h1
        className="text-3xl font-bold text-[#F2F4F8] mb-2"
        style={{ fontFamily: 'Georgia, serif' }}
      >
        Certificates
      </h1>
      <p className="text-[#8A93A8] mb-8">
        Earn a certificate by completing each module&apos;s knowledge check.
      </p>

      <div className="grid sm:grid-cols-2 lg:grid-cols-3 gap-4">
        {modulesData.map((m) => {
          const cert = certMap.get(m.code)
          return (
            <div
              key={m.code}
              className={`bg-[#1C2030] border rounded-xl p-5 flex flex-col gap-3 ${
                cert ? 'border-[#E7C36A]/30' : 'border-[#2A3044] opacity-60'
              }`}
            >
              <div className="flex items-start justify-between gap-2">
                <span className="font-mono text-xs text-[#8A93A8]">{m.code}</span>
                {cert ? (
                  <span className="text-xs text-[#E7C36A] font-medium">Earned</span>
                ) : (
                  <span className="text-xs text-[#8A93A8]">Locked</span>
                )}
              </div>
              <div>
                <p className="text-[10px] text-[#1F7A8C] font-medium uppercase tracking-wider mb-0.5">
                  {m.level_label}
                </p>
                <p className="text-[#F2F4F8] text-sm font-medium" style={{ fontFamily: 'Georgia, serif' }}>
                  {m.title}
                </p>
              </div>
              {cert && (
                <div className="mt-auto pt-3 border-t border-[#2A3044] flex items-center justify-between">
                  <span className="text-[#8A93A8] text-xs font-mono">{cert.cert_id}</span>
                  <Link
                    href={`/certificates/${m.code}`}
                    className="text-xs text-[#1F7A8C] hover:text-[#2EA8BE] transition-colors"
                  >
                    View →
                  </Link>
                </div>
              )}
            </div>
          )
        })}
      </div>
    </div>
  )
}
