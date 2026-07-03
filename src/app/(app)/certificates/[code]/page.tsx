import { createClient } from '@/lib/supabase/server'
import { redirect, notFound } from 'next/navigation'
import Link from 'next/link'
import PrintButton from './print-button'

interface PageProps {
  params: Promise<{ code: string }>
}

type CertRow = { cert_id: string; issued_at: string }
type ModuleRow = { title: string; level_label: string; subtitle: string }
type LearnerRow = { name: string; role: string }

export default async function CertificatePage({ params }: PageProps) {
  const { code } = await params
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/login')

  const [{ data: certRaw }, { data: moduleRaw }, { data: learnerRaw }] = await Promise.all([
    supabase.from('certificates').select('cert_id,issued_at').eq('learner_id', user.id).eq('module_code', code).single(),
    supabase.from('modules').select('title,level_label,subtitle').eq('code', code).single(),
    supabase.from('learners').select('name,role').eq('id', user.id).single(),
  ])

  if (!certRaw || !moduleRaw) notFound()

  const cert = certRaw as CertRow
  const courseModule = moduleRaw as ModuleRow
  const learner = (learnerRaw as LearnerRow | null) ?? { name: 'Pathfinder', role: 'Summit 360 Pathfinder' }

  const issuedDate = new Date(cert.issued_at).toLocaleDateString('en-US', {
    year: 'numeric', month: 'long', day: 'numeric',
  })

  return (
    <div className="min-h-screen bg-[#0F1115]">
      {/* Action bar — hidden on print */}
      <div className="print:hidden max-w-4xl mx-auto px-4 sm:px-6 pt-8 pb-6 flex items-center justify-between">
        <Link href="/certificates" className="text-xs text-[#8A93A8] hover:text-[#C5CAD8] transition-colors">
          ← All certificates
        </Link>
        <PrintButton />
      </div>

      {/* Certificate — centred, max 760px */}
      <div className="flex justify-center px-4 pb-16 print:p-0 print:block">
        <div
          id="certificate"
          className="w-full max-w-[760px] bg-[#1C2030] print:bg-white relative"
          style={{ aspectRatio: '1.414 / 1' }} /* A4 landscape ratio */
        >
          {/* Outer border */}
          <div className="absolute inset-3 border border-[#E7C36A]/30 print:border-[#c9a84c] pointer-events-none" />
          <div className="absolute inset-[14px] border border-[#1F7A8C]/20 print:border-[#1F7A8C]/40 pointer-events-none" />

          {/* Content */}
          <div className="relative h-full flex flex-col items-center justify-between px-12 py-10 print:px-16 print:py-12">

            {/* Top — brand */}
            <div className="flex flex-col items-center gap-1 text-center">
              <div className="flex items-center gap-2 mb-3">
                <span className="w-2.5 h-2.5 rounded-full bg-[#E15A4C] print:bg-[#E15A4C]" />
                <span className="text-[#C5CAD8] print:text-[#333] font-semibold tracking-[0.2em] text-xs uppercase">
                  Summit 360
                </span>
              </div>
              <p className="text-[10px] tracking-[0.25em] uppercase text-[#1F7A8C] font-semibold">
                Pathfinder AI Academy
              </p>
              <p className="text-[10px] tracking-[0.2em] uppercase text-[#8A93A8] print:text-[#666]">
                Certificate of Completion
              </p>
            </div>

            {/* Middle — main content */}
            <div className="flex flex-col items-center text-center gap-3">
              <p className="text-[#8A93A8] print:text-[#666] text-xs tracking-wide">
                This certifies that
              </p>
              <h1
                className="text-[#F2F4F8] print:text-[#111] font-bold leading-tight"
                style={{ fontFamily: 'Georgia, serif', fontSize: 'clamp(22px, 4vw, 36px)' }}
              >
                {learner.name}
              </h1>
              <p className="text-[#8A93A8] print:text-[#555] text-xs tracking-wide max-w-sm">
                has successfully completed
              </p>
              <div className="space-y-1">
                <p className="text-[10px] text-[#1F7A8C] font-semibold uppercase tracking-widest">
                  {courseModule.level_label}
                </p>
                <h2
                  className="text-[#F2F4F8] print:text-[#222] font-semibold leading-snug"
                  style={{ fontFamily: 'Georgia, serif', fontSize: 'clamp(14px, 2.5vw, 20px)' }}
                >
                  {courseModule.title}
                </h2>
              </div>
            </div>

            {/* Bottom — signatories + cert ID */}
            <div className="w-full">
              <div className="flex items-end justify-between gap-4">
                {/* Three signatories */}
                <div className="flex items-end gap-6 flex-1">
                  {[
                    { name: 'Lane Elmer', title: 'CEO' },
                    { name: 'Adot Diuyan', title: 'COO' },
                    { name: 'Rey Dumasig', title: 'Director, AI & Technology' },
                  ].map((s) => (
                    <div key={s.name} className="min-w-0">
                      <div className="w-24 h-px bg-[#E7C36A]/50 print:bg-[#c9a84c] mb-2" />
                      <p className="text-[#F2F4F8] print:text-[#111] font-semibold text-xs leading-snug" style={{ fontFamily: 'Georgia, serif' }}>
                        {s.name}
                      </p>
                      <p className="text-[#8A93A8] print:text-[#555] text-[9px] mt-0.5 whitespace-nowrap">
                        {s.title}
                      </p>
                    </div>
                  ))}
                </div>

                {/* Date + cert ID */}
                <div className="text-right shrink-0">
                  <p className="text-[#C5CAD8] print:text-[#333] text-xs mb-1">{issuedDate}</p>
                  <p className="font-mono text-[10px] text-[#8A93A8] print:text-[#666]">{cert.cert_id}</p>
                </div>
              </div>
            </div>

          </div>
        </div>
      </div>
    </div>
  )
}
