import { createClient, createAdminClient } from '@/lib/supabase/server'
import { NextResponse } from 'next/server'

async function assertAdmin() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return null
  const { data } = await supabase.from('learners').select('is_admin').eq('id', user.id).single()
  return (data as { is_admin: boolean } | null)?.is_admin ? user : null
}

interface RouteParams { params: Promise<{ code: string }> }

export async function PUT(request: Request, { params }: RouteParams) {
  const user = await assertAdmin()
  if (!user) return NextResponse.json({ error: 'Forbidden' }, { status: 403 })

  const { code } = await params
  const body = await request.json()
  const { title, subtitle, level_key, level_label, duration_min, pass_score, sort_order, content } = body

  const admin = createAdminClient()
  const { error } = await admin.from('modules').update({
    title,
    subtitle,
    level_key,
    level_label,
    duration_min: Number(duration_min),
    pass_score: Number(pass_score),
    sort_order: Number(sort_order),
    content,
  }).eq('code', code)

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

export async function DELETE(_request: Request, { params }: RouteParams) {
  const user = await assertAdmin()
  if (!user) return NextResponse.json({ error: 'Forbidden' }, { status: 403 })

  const { code } = await params
  const admin = createAdminClient()
  const { error } = await admin.from('modules').delete().eq('code', code)

  if (error) return NextResponse.json({ error: error.message }, { status: 400 })
  return NextResponse.json({ ok: true })
}
