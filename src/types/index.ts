export * from './database'

export type ModuleContentSchema = {
  overview_html: string
  outcomes: string[]
  topics: {
    title: string
    body: string[]
    example?: string
    pro_tip?: string
    watch_out?: string
  }[]
  walkthrough_intro?: string
  walkthrough?: { title: string; body: string }[]
  practice_intro?: string
  practice?: { label: string; html: string }[]
  kc: {
    pass_score: number
    items: KcItem[]
  }
  further?: { title: string; url: string; note: string }[]
}

export type KcItem =
  | {
      type: 'mcq'
      prompt: string
      options: string[]
      correct: number
      explain: string
    }
  | {
      type: 'open'
      prompt: string
      answer: string
    }

export type LevelKey = 'foundations' | 'tools' | 'prompting' | 'workflows' | 'excellence'

export type ModuleWithProgress = {
  code: string
  title: string
  subtitle: string
  level_key: string
  level_label: string
  duration_min: number
  sort_order: number
  started: boolean
  completed: boolean
  score: number | null
  unlocked: boolean
}

export type DashboardStats = {
  completed: number
  total: number
  percent: number
  minutes_completed: number
  minutes_total: number
}
