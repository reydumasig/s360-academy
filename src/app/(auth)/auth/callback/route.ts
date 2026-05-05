import { createClient, createAdminClient } from '@/lib/supabase/server'
import { NextResponse } from 'next/server'

export async function GET(request: Request) {
  const { searchParams, origin } = new URL(request.url)
  const code = searchParams.get('code')

  if (code) {
    // User client handles the OAuth exchange and sets session cookies
    const supabase = await createClient()
    const { data, error } = await supabase.auth.exchangeCodeForSession(code)

    if (!error && data.user) {
      const displayName =
        data.user.user_metadata?.full_name ||
        data.user.email?.split('@')[0] ||
        'Pathfinder'

      // Admin client bypasses RLS for reliable DB reads/writes on this server route
      const admin = createAdminClient()

      const { data: existing } = await admin
        .from('learners')
        .select('id')
        .eq('id', data.user.id)
        .single()

      if (!existing) {
        const { error: insertErr } = await admin.from('learners').insert({
          id: data.user.id,
          name: displayName,
          role: 'Summit 360 Pathfinder',
          last_seen_at: new Date().toISOString(),
        })

        if (insertErr) {
          console.error('[callback] learner insert failed:', insertErr.message)
        }

        const setupUrl = new URL('/setup', origin)
        setupUrl.searchParams.set('name', displayName)
        return buildRedirect(request, setupUrl.toString())
      }

      // Returning user — update last seen and go straight to academy
      await admin
        .from('learners')
        .update({ last_seen_at: new Date().toISOString() })
        .eq('id', data.user.id)

      return buildRedirect(request, `${origin}/`)
    }
  }

  return NextResponse.redirect(`${origin}/login?error=auth_failed`)
}

function buildRedirect(request: Request, url: string) {
  const { origin } = new URL(request.url)
  const forwardedHost = request.headers.get('x-forwarded-host')
  const isLocal = process.env.NODE_ENV === 'development'

  if (isLocal) return NextResponse.redirect(url)
  if (forwardedHost) {
    // Rewrite origin to the forwarded host for production
    return NextResponse.redirect(url.replace(origin, `https://${forwardedHost}`))
  }
  return NextResponse.redirect(url)
}
