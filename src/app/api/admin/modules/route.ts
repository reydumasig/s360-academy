import { createClient, createAdminClient } from '@/lib/supabase/server'
import { NextResponse } from 'next/server'

async function assertAdmin() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return null
  const { data } = await supabase.from('learners').select('is_admin').eq('id', user.id).single()
  return (data as { is_admin: boolean } | null)?.is_admin ? user : null
}

export async function POST(request: Request) {
  const user = await assertAdmin()
  if (!user) return NextResponse.json({ error: 'Forbidden' }, { status: 403 })

  const body = await request.json()
  const { code, title, subtitle, level_key, level_label, duration_min, pass_score, sort_order, content } = body

  if (!code || !title || !level_key) {
    return NextResponse.json({ error: 'code, title and level_key are required' }, { status: 400 })
  }

  const admin = createAdminClient()
  const { error } = await admin.from('modules').insert({
    code: code.trim().toUpperCase(),
    title,
    subtitle: subtitle ?? '',
    level_key,
    level_label: level_label ?? '',
    duration_min: Number(duration_min) || 30,
    pass_score: Number(pass_score) || 0.7,
    sort_order: Number(sort_order),
    content: content ?? {},
  })

  if (error) {
    if (error.code === '23505' && error.message.includes('sort_order')) {
      return NextResponse.json(
        { error: `sort_order ${sort_order} is already used by another module — choose a different position` },
        { status: 409 }
      )
    }
    return NextResponse.json({ error: error.message }, { status: 400 })
  }
  return NextResponse.json({ ok: true })
}
