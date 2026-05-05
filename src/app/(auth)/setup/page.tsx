'use client'

import { useState, Suspense } from 'react'
import { useRouter, useSearchParams } from 'next/navigation'
import { createClient } from '@/lib/supabase/client'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'

function SetupForm() {
  const router = useRouter()
  const searchParams = useSearchParams()
  const supabase = createClient()

  const [name, setName] = useState(searchParams.get('name') ?? '')
  const [role, setRole] = useState('Summit 360 Pathfinder')
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault()
    if (name.trim().length < 2) {
      setError('Name must be at least 2 characters.')
      return
    }

    setLoading(true)
    setError(null)

    const { data: { user } } = await supabase.auth.getUser()
    if (!user) { router.push('/login'); return }

    const { error: upsertError } = await supabase.from('learners').upsert(
      { id: user.id, name: name.trim(), role: role.trim() || 'Summit 360 Pathfinder' },
      { onConflict: 'id' }
    )

    if (upsertError) {
      setError(upsertError.message || 'Something went wrong. Please try again.')
      setLoading(false)
      return
    }

    router.push('/')
    router.refresh()
  }

  return (
    <form onSubmit={handleSubmit} className="space-y-5">
      <div className="space-y-1.5">
        <Label htmlFor="name" className="text-[#C5CAD8] text-sm">Full name</Label>
        <Input
          id="name"
          value={name}
          onChange={(e) => setName(e.target.value)}
          placeholder="e.g. Rey Dumasig"
          required
          minLength={2}
          className="bg-[#161922] border-[#2A3044] text-[#F2F4F8] placeholder:text-[#8A93A8] focus-visible:ring-[#1F7A8C]"
        />
      </div>

      <div className="space-y-1.5">
        <Label htmlFor="role" className="text-[#C5CAD8] text-sm">
          Role <span className="text-[#8A93A8] font-normal">(optional)</span>
        </Label>
        <Input
          id="role"
          value={role}
          onChange={(e) => setRole(e.target.value)}
          placeholder="Summit 360 Pathfinder"
          className="bg-[#161922] border-[#2A3044] text-[#F2F4F8] placeholder:text-[#8A93A8] focus-visible:ring-[#1F7A8C]"
        />
      </div>

      {error && <p className="text-sm text-[#FF7A6A]">{error}</p>}

      <Button
        type="submit"
        disabled={loading || name.trim().length < 2}
        className="w-full bg-[#1F7A8C] hover:bg-[#2EA8BE] text-white font-medium h-11"
      >
        {loading ? 'Saving…' : 'Enter the Academy →'}
      </Button>
    </form>
  )
}

export default function SetupPage() {
  return (
    <div className="min-h-screen flex flex-col items-center justify-center bg-[#0F1115] px-4">
      <div className="mb-8 text-center">
        <div className="inline-flex items-center gap-2 mb-3">
          <span className="w-2.5 h-2.5 rounded-full bg-[#E15A4C]" />
          <span className="text-[#F2F4F8] font-semibold tracking-wide text-sm uppercase">Summit 360</span>
        </div>
        <h1 className="text-3xl font-bold text-[#F2F4F8]" style={{ fontFamily: 'Georgia, serif' }}>
          Welcome to the Academy
        </h1>
        <p className="text-[#8A93A8] text-sm mt-1 max-w-xs">
          Confirm your name — it will appear on every certificate you earn.
        </p>
      </div>

      <div className="w-full max-w-sm bg-[#1C2030] border border-[#2A3044] rounded-xl p-8">
        <Suspense fallback={<div className="h-40 animate-pulse bg-[#2A3044] rounded-lg" />}>
          <SetupForm />
        </Suspense>
      </div>
    </div>
  )
}
