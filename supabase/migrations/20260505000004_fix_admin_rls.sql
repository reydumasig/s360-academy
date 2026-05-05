-- Fix infinite recursion in admin RLS policies.
-- The original policies queried the learners table from within a learners policy,
-- which PostgreSQL detects as infinite recursion.
-- Solution: a SECURITY DEFINER function that reads learners without triggering RLS.

CREATE OR REPLACE FUNCTION public.current_user_is_admin()
RETURNS BOOLEAN
LANGUAGE sql
SECURITY DEFINER
STABLE
SET search_path = public
AS $$
  SELECT COALESCE(
    (SELECT is_admin FROM public.learners WHERE id = auth.uid()),
    FALSE
  )
$$;

-- Drop the recursive policies
DROP POLICY IF EXISTS "admin_select_all_learners"  ON public.learners;
DROP POLICY IF EXISTS "admin_select_all_progress"  ON public.module_progress;
DROP POLICY IF EXISTS "admin_select_all_certs"     ON public.certificates;

-- Recreate using the non-recursive function
CREATE POLICY "admin_select_all_learners" ON public.learners
  FOR SELECT USING (public.current_user_is_admin());

CREATE POLICY "admin_select_all_progress" ON public.module_progress
  FOR SELECT USING (public.current_user_is_admin());

CREATE POLICY "admin_select_all_certs" ON public.certificates
  FOR SELECT USING (public.current_user_is_admin());
