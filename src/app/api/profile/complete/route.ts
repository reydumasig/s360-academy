import { createClient, createAdminClient } from '@/lib/supabase/server'
import { NextResponse } from 'next/server'

export async function POST(request: Request) {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })

  const body = await request.json()
  const name = String(body.name ?? '').trim()
  const role = String(body.role ?? '').trim() || 'Summit 360 Pathfinder'

  if (name.length < 2) {
    return NextResponse.json({ error: 'Name must be at least 2 characters.' }, { status: 400 })
  }

  const admin = createAdminClient()
  const { error } = await admin.from('learners').upsert(
    { id: user.id, name, role },
    { onConflict: 'id' }
  )

  if (error) {
    console.error('[profile/complete] upsert failed:', error.message)
    return NextResponse.json({ error: error.message }, { status: 500 })
  }

  return NextResponse.json({ ok: true })
}
