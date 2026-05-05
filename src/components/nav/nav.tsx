'use client'

import Link from 'next/link'
import { usePathname, useRouter } from 'next/navigation'
import { createClient } from '@/lib/supabase/client'

interface NavProps {
  learnerName: string
  isAdmin: boolean
}

export default function Nav({ learnerName, isAdmin }: NavProps) {
  const pathname = usePathname()
  const router = useRouter()
  const supabase = createClient()

  async function handleSignOut() {
    await supabase.auth.signOut()
    router.push('/login')
    router.refresh()
  }

  const links = [
    { href: '/', label: 'Modules' },
    { href: '/certificates', label: 'Certificates' },
    { href: '/dashboard', label: 'Dashboard' },
    ...(isAdmin ? [{ href: '/admin', label: 'Admin' }] : []),
  ]

  return (
    <header className="border-b border-[#2A3044] bg-[#161922] sticky top-0 z-50">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 h-14 flex items-center justify-between">
        {/* Brand */}
        <Link href="/" className="flex items-center gap-2 shrink-0">
          <span className="w-2.5 h-2.5 rounded-full bg-[#E15A4C]" />
          <span className="text-[#F2F4F8] font-semibold text-sm tracking-wide">
            S360 Academy
          </span>
        </Link>

        {/* Nav links */}
        <nav className="hidden md:flex items-center gap-1">
          {links.map(({ href, label }) => (
            <Link
              key={href}
              href={href}
              className={`px-3 py-1.5 rounded-md text-sm font-medium transition-colors ${
                pathname === href
                  ? 'bg-[#1C2030] text-[#F2F4F8]'
                  : 'text-[#8A93A8] hover:text-[#C5CAD8] hover:bg-[#1C2030]'
              }`}
            >
              {label}
            </Link>
          ))}
        </nav>

        {/* Learner chip + sign out */}
        <div className="flex items-center gap-3">
          <span className="hidden sm:block text-[#8A93A8] text-xs truncate max-w-[160px]">
            {learnerName}
          </span>
          <button
            onClick={handleSignOut}
            className="text-xs text-[#8A93A8] hover:text-[#E15A4C] transition-colors"
          >
            Sign out
          </button>
        </div>
      </div>
    </header>
  )
}
