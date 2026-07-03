import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import Link from 'next/link'
import ModuleForm from '../module-form'

export default async function NewModulePage() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/login')

  const { data: me } = await supabase.from('learners').select('is_admin').eq('id', user.id).single()
  if (!(me as { is_admin: boolean } | null)?.is_admin) redirect('/modules')

  return (
    <div className="max-w-4xl mx-auto px-4 sm:px-6 py-10">
      <div className="mb-8">
        <Link href="/admin/modules" className="text-xs text-[#8A93A8] hover:text-[#C5CAD8] transition-colors">
          ← Module Management
        </Link>
        <h1 className="text-3xl font-bold text-[#F2F4F8] mt-2" style={{ fontFamily: 'Georgia, serif' }}>
          Add Module
        </h1>
      </div>
      <ModuleForm mode="new" />
    </div>
  )
}
