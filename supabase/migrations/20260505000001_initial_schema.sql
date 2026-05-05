-- S360 Pathfinder AI Academy — initial schema

-- Learner profiles (one per auth user)
CREATE TABLE IF NOT EXISTS public.learners (
  id            UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  name          TEXT NOT NULL,
  role          TEXT NOT NULL DEFAULT 'Summit 360 Pathfinder',
  is_admin      BOOLEAN NOT NULL DEFAULT FALSE,
  started_at    TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  last_seen_at  TIMESTAMPTZ
);

-- Module catalogue (15 rows, code is immutable after launch)
CREATE TABLE IF NOT EXISTS public.modules (
  code          TEXT PRIMARY KEY,
  title         TEXT NOT NULL,
  subtitle      TEXT NOT NULL,
  level_key     TEXT NOT NULL CHECK (level_key IN ('foundations','tools','prompting','workflows','excellence')),
  level_label   TEXT NOT NULL,
  duration_min  INT NOT NULL CHECK (duration_min > 0),
  pass_score    FLOAT NOT NULL CHECK (pass_score > 0 AND pass_score <= 1),
  sort_order    INT NOT NULL UNIQUE,
  content       JSONB NOT NULL DEFAULT '{}'
);

-- Per-learner module progress (one row per learner × module)
CREATE TABLE IF NOT EXISTS public.module_progress (
  id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  learner_id    UUID NOT NULL REFERENCES public.learners(id) ON DELETE CASCADE,
  module_code   TEXT NOT NULL REFERENCES public.modules(code),
  started_at    TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  completed_at  TIMESTAMPTZ,
  score         INT CHECK (score >= 0 AND score <= 100),
  UNIQUE (learner_id, module_code)
);

-- Knowledge-check attempt log (immutable history)
CREATE TABLE IF NOT EXISTS public.kc_attempts (
  id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  learner_id    UUID NOT NULL REFERENCES public.learners(id) ON DELETE CASCADE,
  module_code   TEXT NOT NULL REFERENCES public.modules(code),
  answers       JSONB NOT NULL,
  score         INT NOT NULL CHECK (score >= 0 AND score <= 100),
  passed        BOOLEAN NOT NULL,
  attempted_at  TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Issued certificates (immutable — never delete after issue)
CREATE TABLE IF NOT EXISTS public.certificates (
  id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  learner_id    UUID NOT NULL REFERENCES public.learners(id) ON DELETE CASCADE,
  module_code   TEXT NOT NULL REFERENCES public.modules(code),
  cert_id       TEXT NOT NULL UNIQUE,
  issued_at     TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Indexes for common queries
CREATE INDEX IF NOT EXISTS idx_module_progress_learner ON public.module_progress (learner_id);
CREATE INDEX IF NOT EXISTS idx_kc_attempts_learner ON public.kc_attempts (learner_id);
CREATE INDEX IF NOT EXISTS idx_certificates_learner ON public.certificates (learner_id);
CREATE INDEX IF NOT EXISTS idx_modules_sort ON public.modules (sort_order);

-- ─── Row Level Security ───────────────────────────────────────────────────────

ALTER TABLE public.learners        ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.modules         ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.module_progress ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.kc_attempts     ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.certificates    ENABLE ROW LEVEL SECURITY;

-- Learners: own row only
CREATE POLICY "learners_select_own" ON public.learners
  FOR SELECT USING (auth.uid() = id);
CREATE POLICY "learners_insert_own" ON public.learners
  FOR INSERT WITH CHECK (auth.uid() = id);
CREATE POLICY "learners_update_own" ON public.learners
  FOR UPDATE USING (auth.uid() = id);

-- Modules: everyone can read (authenticated)
CREATE POLICY "modules_select_authenticated" ON public.modules
  FOR SELECT USING (auth.role() = 'authenticated');

-- Module progress: own rows only
CREATE POLICY "progress_select_own" ON public.module_progress
  FOR SELECT USING (auth.uid() = learner_id);
CREATE POLICY "progress_insert_own" ON public.module_progress
  FOR INSERT WITH CHECK (auth.uid() = learner_id);
CREATE POLICY "progress_update_own" ON public.module_progress
  FOR UPDATE USING (auth.uid() = learner_id);
CREATE POLICY "progress_delete_own" ON public.module_progress
  FOR DELETE USING (auth.uid() = learner_id);

-- KC attempts: own rows only, insert only (no updates/deletes)
CREATE POLICY "kc_select_own" ON public.kc_attempts
  FOR SELECT USING (auth.uid() = learner_id);
CREATE POLICY "kc_insert_own" ON public.kc_attempts
  FOR INSERT WITH CHECK (auth.uid() = learner_id);

-- Certificates: own rows only, no deletes
CREATE POLICY "certs_select_own" ON public.certificates
  FOR SELECT USING (auth.uid() = learner_id);
CREATE POLICY "certs_insert_own" ON public.certificates
  FOR INSERT WITH CHECK (auth.uid() = learner_id);

-- Admin override: service_role bypasses RLS (Supabase default)
-- Admin reads: learners with is_admin=true can see all learner data
CREATE POLICY "admin_select_all_learners" ON public.learners
  FOR SELECT USING (
    EXISTS (
      SELECT 1 FROM public.learners l
      WHERE l.id = auth.uid() AND l.is_admin = TRUE
    )
  );

CREATE POLICY "admin_select_all_progress" ON public.module_progress
  FOR SELECT USING (
    EXISTS (
      SELECT 1 FROM public.learners l
      WHERE l.id = auth.uid() AND l.is_admin = TRUE
    )
  );

CREATE POLICY "admin_select_all_certs" ON public.certificates
  FOR SELECT USING (
    EXISTS (
      SELECT 1 FROM public.learners l
      WHERE l.id = auth.uid() AND l.is_admin = TRUE
    )
  );
