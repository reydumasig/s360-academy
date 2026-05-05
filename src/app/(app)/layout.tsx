import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import Nav from '@/components/nav/nav'

export default async function AppLayout({ children }: { children: React.ReactNode }) {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()

  if (!user) redirect('/login')

  const { data: learnerRaw } = await supabase
    .from('learners')
    .select('name,role,is_admin')
    .eq('id', user.id)
    .single()
  const learner = learnerRaw as { name: string; role: string; is_admin: boolean } | null

  return (
    <div className="min-h-screen flex flex-col bg-[#0F1115]">
      <Nav
        learnerName={learner?.name ?? user.email ?? 'Pathfinder'}
        isAdmin={learner?.is_admin ?? false}
      />
      <main className="flex-1">{children}</main>
    </div>
  )
}
