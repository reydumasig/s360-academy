import Link from 'next/link'
import { Badge } from '@/components/ui/badge'
import type { ModuleWithProgress } from '@/types'

interface ModuleCardProps {
  module: ModuleWithProgress
}

export default function ModuleCard({ module }: ModuleCardProps) {
  const { code, title, subtitle, level_label, duration_min, completed, started, unlocked, score } = module

  const statusBadge = completed
    ? { label: 'Completed', className: 'bg-[#4CAF75]/15 text-[#4CAF75] border-[#4CAF75]/30' }
    : started
    ? { label: 'In progress', className: 'bg-[#1F7A8C]/15 text-[#2EA8BE] border-[#1F7A8C]/30' }
    : !unlocked
    ? { label: 'Locked', className: 'bg-[#2A3044] text-[#8A93A8] border-[#2A3044]' }
    : { label: 'Not started', className: 'bg-[#232940] text-[#8A93A8] border-[#2A3044]' }

  const cardContent = (
    <div
      className={`h-full bg-[#1C2030] border rounded-xl p-5 flex flex-col transition-colors ${
        unlocked
          ? 'border-[#2A3044] hover:border-[#1F7A8C]/50 hover:bg-[#232940] cursor-pointer'
          : 'border-[#2A3044] opacity-60 cursor-not-allowed'
      }`}
    >
      {/* Header */}
      <div className="flex items-start justify-between gap-2 mb-3">
        <span className="font-mono text-xs text-[#8A93A8]">{code}</span>
        <Badge className={`text-[10px] shrink-0 ${statusBadge.className}`}>
          {statusBadge.label}
        </Badge>
      </div>

      {/* Level */}
      <p className="text-[10px] text-[#1F7A8C] font-medium uppercase tracking-wider mb-1">
        {level_label}
      </p>

      {/* Title */}
      <h3
        className="text-[#F2F4F8] font-semibold text-base leading-snug mb-1.5"
        style={{ fontFamily: 'Georgia, serif' }}
      >
        {title}
      </h3>

      {/* Subtitle */}
      <p className="text-[#8A93A8] text-xs leading-relaxed flex-1">{subtitle}</p>

      {/* Footer */}
      <div className="flex items-center justify-between mt-4 pt-3 border-t border-[#2A3044]">
        <span className="text-[#8A93A8] text-xs">{duration_min} min</span>
        {completed && score !== null && (
          <span className="text-[#4CAF75] text-xs font-medium">{score}%</span>
        )}
      </div>
    </div>
  )

  if (!unlocked) return cardContent

  return (
    <Link href={`/modules/${code}`} className="block h-full">
      {cardContent}
    </Link>
  )
}
