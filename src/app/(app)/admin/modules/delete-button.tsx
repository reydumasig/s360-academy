'use client'

import { useState } from 'react'
import { useRouter } from 'next/navigation'

export default function DeleteButton({ code, title }: { code: string; title: string }) {
  const router = useRouter()
  const [confirming, setConfirming] = useState(false)
  const [deleting, setDeleting] = useState(false)

  async function handleDelete() {
    setDeleting(true)
    const res = await fetch(`/api/admin/modules/${code}`, { method: 'DELETE' })
    if (res.ok) {
      router.refresh()
    } else {
      const d = await res.json()
      alert(d.error ?? 'Delete failed')
      setDeleting(false)
      setConfirming(false)
    }
  }

  if (confirming) {
    return (
      <span className="flex items-center gap-2 text-xs">
        <span className="text-[#8A93A8]">Delete &ldquo;{title}&rdquo;?</span>
        <button
          onClick={handleDelete}
          disabled={deleting}
          className="text-[#E15A4C] hover:text-red-400 font-medium transition-colors disabled:opacity-50"
        >
          {deleting ? 'Deleting…' : 'Yes, delete'}
        </button>
        <button
          onClick={() => setConfirming(false)}
          className="text-[#8A93A8] hover:text-[#C5CAD8] transition-colors"
        >
          Cancel
        </button>
      </span>
    )
  }

  return (
    <button
      onClick={() => setConfirming(true)}
      className="text-xs text-[#8A93A8] hover:text-[#E15A4C] transition-colors"
    >
      Delete
    </button>
  )
}
