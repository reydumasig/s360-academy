import { createClient, createAdminClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import Link from 'next/link'
import DeleteButton from './delete-button'

type ModuleRow = { code: string; title: string; level_label: string; duration_min: number; pass_score: number; sort_order: number }

export default async function AdminModulesPage() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/login')

  const { data: me } = await supabase.from('learners').select('is_admin').eq('id', user.id).single()
  if (!(me as { is_admin: boolean } | null)?.is_admin) redirect('/modules')

  const admin = createAdminClient()
  const { data: modulesRaw } = await admin.from('modules').select('code,title,level_label,duration_min,pass_score,sort_order').order('sort_order')
  const modules = (modulesRaw ?? []) as ModuleRow[]

  return (
    <div className="max-w-5xl mx-auto px-4 sm:px-6 py-10">
      <div className="flex items-center justify-between mb-8">
        <div>
          <div className="flex items-center gap-2 mb-1">
            <Link href="/admin" className="text-xs text-[#8A93A8] hover:text-[#C5CAD8] transition-colors">
              ← Admin
            </Link>
          </div>
          <h1 className="text-3xl font-bold text-[#F2F4F8]" style={{ fontFamily: 'Georgia, serif' }}>
            Module Management
          </h1>
          <p className="text-[#8A93A8] text-sm mt-1">{modules.length} module{modules.length !== 1 ? 's' : ''} in the curriculum</p>
        </div>
        <Link
          href="/admin/modules/new"
          className="bg-[#1F7A8C] hover:bg-[#2EA8BE] text-white font-semibold px-5 py-2.5 rounded-lg text-sm transition-colors"
        >
          + Add module
        </Link>
      </div>

      <div className="bg-[#1C2030] border border-[#2A3044] rounded-xl overflow-hidden">
        <div className="overflow-x-auto">
          <table className="w-full text-sm">
            <thead>
              <tr className="border-b border-[#2A3044]">
                {['#', 'Code', 'Title', 'Level', 'Duration', 'Pass', 'Actions'].map(h => (
                  <th key={h} className="px-5 py-3 text-left text-xs text-[#8A93A8] font-medium">{h}</th>
                ))}
              </tr>
            </thead>
            <tbody>
              {modules.map((m) => (
                <tr key={m.code} className="border-b border-[#2A3044] last:border-0 hover:bg-[#1A1E2C]">
                  <td className="px-5 py-3 text-[#8A93A8] text-xs">{m.sort_order}</td>
                  <td className="px-5 py-3 font-mono text-xs text-[#2EA8BE]">{m.code}</td>
                  <td className="px-5 py-3 text-[#C5CAD8]">{m.title}</td>
                  <td className="px-5 py-3 text-[#8A93A8] text-xs">{m.level_label}</td>
                  <td className="px-5 py-3 text-[#8A93A8] text-xs">{m.duration_min} min</td>
                  <td className="px-5 py-3 text-[#8A93A8] text-xs">{Math.round(m.pass_score * 100)}%</td>
                  <td className="px-5 py-3">
                    <div className="flex items-center gap-3">
                      <Link
                        href={`/admin/modules/${m.code}/edit`}
                        className="text-xs text-[#1F7A8C] hover:text-[#2EA8BE] transition-colors font-medium"
                      >
                        Edit
                      </Link>
                      <DeleteButton code={m.code} title={m.title} />
                    </div>
                  </td>
                </tr>
              ))}
              {modules.length === 0 && (
                <tr>
                  <td colSpan={7} className="px-5 py-10 text-center text-[#8A93A8] text-sm">
                    No modules yet. <Link href="/admin/modules/new" className="text-[#1F7A8C] hover:underline">Add the first one.</Link>
                  </td>
                </tr>
              )}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  )
}
