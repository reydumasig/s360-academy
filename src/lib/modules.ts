import type { ModuleWithProgress, DashboardStats } from '@/types'

export const LEVELS = [
  { key: 'onboarding',  label: 'Level 0 — Onboarding',  description: 'Welcome to Summit 360. Complete all six modules to unlock the Pathfinder AI Academy.' },
  { key: 'foundations', label: 'Level 1 — Foundations', description: 'Build the mental model. Understand AI, your toolkit, and the Pathfinder Promise.' },
  { key: 'tools',       label: 'Level 2 — Tools',       description: 'Master Claude Chat, Cowork, and Code. Learn to train your Summit Partner on AI.' },
  { key: 'prompting',   label: 'Level 3 — Prompting',   description: 'Write prompts that work every time. The CRAFT framework and advanced techniques.' },
  { key: 'workflows',   label: 'Level 4 — Workflows',   description: 'Onboard Partners, triage inboxes, run meetings. AI in your daily rhythm.' },
  { key: 'excellence',  label: 'Level 5 — Excellence',  description: "Deliver in your Partner's voice. Stay safe. Ship your personal AI Playbook." },
]

export function isUnlocked(code: string, modules: ModuleWithProgress[]): boolean {
  const current = modules.find((m) => m.code === code)
  if (!current) return false
  const preceding = modules.filter((m) => m.sort_order < current.sort_order)
  if (preceding.length === 0) return true
  return preceding.every((m) => m.completed === true)
}

export function computeStats(modules: ModuleWithProgress[]): DashboardStats {
  const completed = modules.filter((m) => m.completed).length
  const total = modules.length
  const percent = total > 0 ? Math.round((completed / total) * 100) : 0
  const minutes_completed = modules
    .filter((m) => m.completed)
    .reduce((sum, m) => sum + m.duration_min, 0)
  const minutes_total = modules.reduce((sum, m) => sum + m.duration_min, 0)
  return { completed, total, percent, minutes_completed, minutes_total }
}

export function getCertId(code: string, userId: string, year = 2026): string {
  const tag = userId.replace(/-/g, '').slice(0, 6).toUpperCase()
  return `S360-${code}-${tag}-${year}`
}
