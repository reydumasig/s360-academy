export type Json =
  | string
  | number
  | boolean
  | null
  | { [key: string]: Json | undefined }
  | Json[]

export type Database = {
  public: {
    Tables: {
      learners: {
        Row: {
          id: string
          name: string
          role: string
          started_at: string
          last_seen_at: string | null
          is_admin: boolean
        }
        Insert: {
          id: string
          name: string
          role?: string
          started_at?: string
          last_seen_at?: string | null
          is_admin?: boolean
        }
        Update: {
          name?: string
          role?: string
          last_seen_at?: string | null
          is_admin?: boolean
        }
      }
      modules: {
        Row: {
          code: string
          title: string
          subtitle: string
          level_key: string
          level_label: string
          duration_min: number
          pass_score: number
          sort_order: number
          content: Json
        }
        Insert: {
          code: string
          title: string
          subtitle: string
          level_key: string
          level_label: string
          duration_min: number
          pass_score: number
          sort_order: number
          content: Json
        }
        Update: {
          title?: string
          subtitle?: string
          level_key?: string
          level_label?: string
          duration_min?: number
          pass_score?: number
          sort_order?: number
          content?: Json
        }
      }
      module_progress: {
        Row: {
          id: string
          learner_id: string
          module_code: string
          started_at: string
          completed_at: string | null
          score: number | null
        }
        Insert: {
          id?: string
          learner_id: string
          module_code: string
          started_at?: string
          completed_at?: string | null
          score?: number | null
        }
        Update: {
          completed_at?: string | null
          score?: number | null
        }
      }
      kc_attempts: {
        Row: {
          id: string
          learner_id: string
          module_code: string
          answers: Json
          score: number
          passed: boolean
          attempted_at: string
        }
        Insert: {
          id?: string
          learner_id: string
          module_code: string
          answers: Json
          score: number
          passed: boolean
          attempted_at?: string
        }
        Update: never
      }
      certificates: {
        Row: {
          id: string
          learner_id: string
          module_code: string
          cert_id: string
          issued_at: string
        }
        Insert: {
          id?: string
          learner_id: string
          module_code: string
          cert_id: string
          issued_at?: string
        }
        Update: never
      }
    }
    Views: Record<string, never>
    Functions: Record<string, never>
    Enums: Record<string, never>
  }
}

export type Learner = Database['public']['Tables']['learners']['Row']
export type Module = Database['public']['Tables']['modules']['Row']
export type ModuleProgress = Database['public']['Tables']['module_progress']['Row']
export type KcAttempt = Database['public']['Tables']['kc_attempts']['Row']
export type Certificate = Database['public']['Tables']['certificates']['Row']
