import type { ModuleWithProgress, DashboardStats } from '@/types'

export const MODULE_ORDER = [
  'PF01', 'PF02', 'PF03',
  'PF04', 'PF05', 'PF06',
  'PF07', 'PF08', 'PF09',
  'PF10', 'PF11', 'PF12',
  'PF13', 'PF14', 'PF15',
]

export const LEVELS = [
  { key: 'foundations', label: 'Level 1 — Foundations', description: 'Build the mental model. Understand AI, your toolkit, and the Pathfinder Promise.' },
  { key: 'tools',       label: 'Level 2 — Tools',       description: 'Master Claude Chat, Cowork, and Code. Learn to train your Summit Partner on AI.' },
  { key: 'prompting',   label: 'Level 3 — Prompting',   description: 'Write prompts that work every time. The CRAFT framework and advanced techniques.' },
  { key: 'workflows',   label: 'Level 4 — Workflows',   description: 'Onboard Partners, triage inboxes, run meetings. AI in your daily rhythm.' },
  { key: 'excellence',  label: 'Level 5 — Excellence',  description: "Deliver in your Partner's voice. Stay safe. Ship your personal AI Playbook." },
]

export function isUnlocked(code: string, modules: ModuleWithProgress[]): boolean {
  const idx = MODULE_ORDER.indexOf(code)
  if (idx <= 0) return true
  return MODULE_ORDER.slice(0, idx).every((prevCode) => {
    const m = modules.find((mod) => mod.code === prevCode)
    return m?.completed === true
  })
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

export function getCertId(code: string, year = 2026): string {
  const num = code.replace('PF', '').padStart(2, '0')
  return `S360-PF${num}-${year}`
}
