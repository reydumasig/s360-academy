import { createClient, createAdminClient } from '@/lib/supabase/server'
import { redirect, notFound } from 'next/navigation'
import Link from 'next/link'
import ModuleForm from '../../module-form'

interface PageProps { params: Promise<{ code: string }> }

export default async function EditModulePage({ params }: PageProps) {
  const { code } = await params
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/login')

  const { data: me } = await supabase.from('learners').select('is_admin').eq('id', user.id).single()
  if (!(me as { is_admin: boolean } | null)?.is_admin) redirect('/modules')

  const admin = createAdminClient()
  const { data: moduleRaw } = await admin
    .from('modules')
    .select('code,title,subtitle,level_key,level_label,duration_min,pass_score,sort_order,content')
    .eq('code', code)
    .single()

  if (!moduleRaw) notFound()

  const m = moduleRaw as {
    code: string; title: string; subtitle: string
    level_key: string; level_label: string
    duration_min: number; pass_score: number; sort_order: number
    content: object
  }

  return (
    <div className="max-w-4xl mx-auto px-4 sm:px-6 py-10">
      <div className="mb-8">
        <Link href="/admin/modules" className="text-xs text-[#8A93A8] hover:text-[#C5CAD8] transition-colors">
          ← Module Management
        </Link>
        <h1 className="text-3xl font-bold text-[#F2F4F8] mt-2" style={{ fontFamily: 'Georgia, serif' }}>
          Edit {m.code} — {m.title}
        </h1>
      </div>
      <ModuleForm mode="edit" initialValues={m} />
    </div>
  )
}
