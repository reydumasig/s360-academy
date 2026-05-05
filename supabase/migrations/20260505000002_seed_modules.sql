-- Seed module catalogue — metadata only (content JSONB populated per sprint)
-- Module codes are IMMUTABLE after launch (certificates reference them)

INSERT INTO public.modules (code, title, subtitle, level_key, level_label, duration_min, pass_score, sort_order, content)
VALUES

-- Level 1 — Foundations
('PF01', 'AI Lift — Judgement First, AI as Amplifier',
 'Why judgement matters more now, not less.',
 'foundations', 'Level 1 · Foundations', 35, 0.8, 1, '{}'),

('PF02', 'How AI Actually Works — A Grounded Introduction',
 'Tokens, context windows, training cutoffs, and hallucinations in plain language.',
 'foundations', 'Level 1 · Foundations', 30, 0.8, 2, '{}'),

('PF03', 'Your Pathfinder Toolkit — Claude, ChatGPT & Cowork',
 'Tool landscape, when to use what, and responsible defaults.',
 'foundations', 'Level 1 · Foundations', 30, 0.8, 3, '{}'),

-- Level 2 — Tools
('PF04', 'Claude Chat — Your Daily AI Co-Pilot',
 'Projects, artifacts, file uploads, and knowing when to start fresh.',
 'tools', 'Level 2 · Tools', 30, 0.8, 4, '{}'),

('PF05', 'Claude Cowork — Your Pathfinder Workspace',
 'Desktop agent, connectors, skills, and the MCP registry.',
 'tools', 'Level 2 · Tools', 30, 0.8, 5, '{}'),

('PF06', 'Claude Code & Training Your Summit Partner on AI',
 'Claude Code overview plus a 30-minute train-the-trainer script.',
 'tools', 'Level 2 · Tools', 35, 0.8, 6, '{}'),

-- Level 3 — Prompting
('PF07', 'The CRAFT Framework — Prompts That Actually Work',
 'Context, Role, Audience, Format, Task. One framework for every brief.',
 'prompting', 'Level 3 · Prompting', 40, 0.8, 7, '{}'),

('PF08', 'Advanced Prompting — Examples, Rules, Chain-of-Thought',
 'Few-shot, system rules, step-by-step reasoning. Upgrade any prompt 10×.',
 'prompting', 'Level 3 · Prompting', 40, 0.8, 8, '{}'),

('PF09', 'AI Projects — Reusable Context for Your Summit Partners',
 'Persistent Projects per client. Set up context once and re-use.',
 'prompting', 'Level 3 · Prompting', 35, 0.8, 9, '{}'),

-- Level 4 — Workflows
('PF10', 'Partner Onboarding — Knowing Their World',
 'The first two weeks with a new Partner. Discovery calls, Partner Profile, day-one setup.',
 'workflows', 'Level 4 · Workflows', 45, 0.8, 10, '{}'),

('PF11', 'Daily Triage — Inbox, Calendar, Tasks',
 'The operating rhythm. Morning A/B/C/D triage, calendar protection, end-of-day close.',
 'workflows', 'Level 4 · Workflows', 45, 0.8, 11, '{}'),

('PF12', 'Meetings That Matter — Prep, Run, Follow-Up',
 '15-minute pre-briefings, extracting decisions, and the 2-hour follow-up rule.',
 'workflows', 'Level 4 · Workflows', 40, 0.8, 12, '{}'),

-- Level 5 — Excellence
('PF13', 'Deliverables in Your Partner''s Voice',
 'Voice capture, style guide, few-shot prompting for voice, and killing AI voice.',
 'excellence', 'Level 5 · Excellence', 40, 0.8, 13, '{}'),

('PF14', 'AI Safety & Partner Confidentiality',
 'Enterprise accounts, green/amber/red classification, redaction, and hallucination discipline.',
 'excellence', 'Level 5 · Excellence', 40, 0.8, 14, '{}'),

('PF15', 'Capstone — Your Pathfinder AI Playbook',
 'Ship a personal 10–15 page playbook. Principles, Partner template, prompt library.',
 'excellence', 'Level 5 · Excellence', 60, 0.8, 15, '{}')

ON CONFLICT (code) DO UPDATE SET
  title        = EXCLUDED.title,
  subtitle     = EXCLUDED.subtitle,
  level_key    = EXCLUDED.level_key,
  level_label  = EXCLUDED.level_label,
  duration_min = EXCLUDED.duration_min,
  pass_score   = EXCLUDED.pass_score,
  sort_order   = EXCLUDED.sort_order;
