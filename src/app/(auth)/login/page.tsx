'use client'

import { useState } from 'react'
import { createClient } from '@/lib/supabase/client'
import { Button } from '@/components/ui/button'

export default function LoginPage() {
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const supabase = createClient()

  async function handleGoogleLogin() {
    setLoading(true)
    setError(null)
    const { error } = await supabase.auth.signInWithOAuth({
      provider: 'google',
      options: {
        redirectTo: `${window.location.origin}/auth/callback`,
        queryParams: {
          hd: 's360team.com',
        },
      },
    })
    if (error) {
      setError(error.message)
      setLoading(false)
    }
  }

  return (
    <div className="min-h-screen flex flex-col items-center justify-center bg-[#0F1115] px-4">
      {/* Brand */}
      <div className="mb-10 text-center">
        <div className="inline-flex items-center gap-2 mb-4">
          <span className="w-3 h-3 rounded-full bg-[#E15A4C]" />
          <span className="text-[#F2F4F8] font-semibold tracking-wide text-sm uppercase">
            Summit 360
          </span>
        </div>
        <h1
          className="text-4xl font-bold text-[#F2F4F8] mb-2"
          style={{ fontFamily: 'Georgia, serif' }}
        >
          Pathfinder AI Academy
        </h1>
        <p className="text-[#8A93A8] text-sm max-w-sm">
          Judgement first. AI as amplifier. The Pathfinder owns every decision.
        </p>
      </div>

      {/* Card */}
      <div className="w-full max-w-sm bg-[#1C2030] border border-[#2A3044] rounded-xl p-8">
        <h2 className="text-[#F2F4F8] font-semibold text-lg mb-1">Sign in</h2>
        <p className="text-[#8A93A8] text-sm mb-6">
          Use your <span className="text-[#C5CAD8]">@s360team.com</span> Google account.
        </p>

        {error && (
          <div className="mb-4 rounded-lg bg-[#D3594C]/10 border border-[#D3594C]/30 px-4 py-3 text-sm text-[#FF7A6A]">
            {error}
          </div>
        )}

        <Button
          onClick={handleGoogleLogin}
          disabled={loading}
          className="w-full bg-[#1F7A8C] hover:bg-[#2EA8BE] text-white font-medium h-11"
        >
          {loading ? 'Redirecting…' : 'Continue with Google'}
        </Button>
      </div>

      <p className="mt-8 text-[#8A93A8] text-xs text-center max-w-xs">
        Access is restricted to Summit 360 team members.
      </p>
    </div>
  )
}
