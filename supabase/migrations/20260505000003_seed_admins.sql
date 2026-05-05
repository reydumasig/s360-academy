-- Run AFTER the admin users have logged in for the first time (so their rows exist in learners).
-- This grants admin dashboard access to Adot and Rey.

UPDATE public.learners
SET is_admin = TRUE
WHERE id IN (
  SELECT id FROM auth.users
  WHERE email IN ('adot.diuyan@s360team.com', 'rey.dumasig@s360team.com')
);
