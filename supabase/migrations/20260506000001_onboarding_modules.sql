-- S360 Pathfinder New Hire Onboarding — 6 modules (OB01–OB06)
-- sort_order -5 to 0 so all OB modules sit before PF01 (sort_order 1)
-- PF01 is automatically locked until OB06 is complete (isUnlocked uses sort_order)

-- 1. Extend the level_key check constraint to include 'onboarding'
ALTER TABLE public.modules DROP CONSTRAINT IF EXISTS modules_level_key_check;
ALTER TABLE public.modules ADD CONSTRAINT modules_level_key_check
  CHECK (level_key IN ('onboarding','foundations','tools','prompting','workflows','excellence'));

-- 2. Insert OB01–OB06
INSERT INTO public.modules (code, title, subtitle, level_key, level_label, duration_min, pass_score, sort_order, content) VALUES

('OB01', 'Who We Are — The S360 Story', 'Mission, vision, values, and the five departments', 'onboarding', 'Onboarding', 15, 0.6, -5, $ob01${
  "overview_html": "<p>Summit 360 Solutions was built on a single founding principle: the best professionals in the world deserve the environment they need to thrive. This module covers who we are, what we stand for, and why you were chosen to be part of it.</p>",
  "outcomes": [
    "Understand S360's mission, vision, and founding principles",
    "Know the four S360 values (I-A-C-E) and what each means in practice",
    "Identify the five S360 departments and what each one does"
  ],
  "topics": [
    {
      "title": "A Message From Our Founder",
      "body": [
        "Summit 360 Solutions was built on a single founding principle: the best professionals in the world deserve the environment they need to thrive. We built S360 to solve one thing — elite talent placement for the world's most ambitious businesses.",
        "You are not here to fill a seat. You are here because we believe in what you can do when the right environment, the right support, and the right challenge come together. That is what S360 was built to give you."
      ]
    },
    {
      "title": "Our Mission & Vision",
      "body": [
        "Mission: To deliver and develop excellence by thoughtfully connecting exceptional professionals with Summit Partners — at the highest possible standard.",
        "Vision: To be the gold standard in intelligent talent solutions — where every Pathfinder is placed, genuinely supported, continuously developed, and set up to grow beyond execution into true partner-level impact."
      ]
    },
    {
      "title": "Our Values — I.A.C.E.",
      "body": [
        "Integrity — Do the right thing, even when no one is watching. Honesty and ethical behaviour are non-negotiable at S360.",
        "Accountability — Own your outcomes — the wins and the misses. Pathfinders don't pass blame. They communicate, fix, and move forward.",
        "Collaboration — Make the people around you better. Share freely. You are embedded in a team — your contribution extends beyond your job description.",
        "Excellence — Never settle. Every output should carry your best. Excellence is not a special effort — it is your standard."
      ],
      "pro_tip": "I.A.C.E. is not just a values statement — these are the traits your Trailblazer will observe and evaluate throughout your engagement."
    },
    {
      "title": "The S360 Ecosystem — Five Departments",
      "body": [
        "Marketing — Builds the S360 brand, attracts clients and talent, and communicates what we stand for.",
        "Sales — Develops relationships with Summit Partners, identifies opportunities, and drives our client pipeline.",
        "Recruitment — Sources, interviews, and places Pathfinders. Your first S360 touchpoint.",
        "Technology — Builds and maintains the systems, automations, and AI infrastructure that power S360.",
        "Trailblazement — Your ongoing support. Manages the Pathfinder–Summit Partner relationship from Day 1 through your engagement."
      ],
      "watch_out": "Trailblazement is not HR — it is your primary support structure. Always go to your Trailblazer first for day-to-day matters."
    }
  ],
  "kc": {
    "pass_score": 0.6,
    "items": [
      {
        "type": "mcq",
        "prompt": "What is Summit 360 Solutions' primary mission?",
        "options": [
          "To provide the lowest-cost staffing solutions globally",
          "To deliver and develop excellence by connecting exceptional professionals with Summit Partners",
          "To build AI tools for the enterprise market",
          "To train entry-level workers for offshore roles"
        ],
        "correct": 1,
        "explain": "The mission is to deliver and develop excellence by connecting exceptional professionals with Summit Partners at the highest possible standard."
      },
      {
        "type": "mcq",
        "prompt": "Which of the four S360 values describes owning your outcomes — the wins and the misses?",
        "options": ["Integrity", "Collaboration", "Accountability", "Excellence"],
        "correct": 2,
        "explain": "Accountability means owning outcomes without passing blame — communicating, fixing, and moving forward."
      },
      {
        "type": "mcq",
        "prompt": "Which S360 department manages the Pathfinder–Summit Partner relationship from Day 1?",
        "options": ["Marketing", "Recruitment", "Technology", "Trailblazement"],
        "correct": 3,
        "explain": "Trailblazement provides ongoing support and manages the Pathfinder–Summit Partner relationship throughout your engagement."
      },
      {
        "type": "mcq",
        "prompt": "S360's vision describes becoming the gold standard in what?",
        "options": ["Offshore outsourcing", "Intelligent talent solutions", "Digital marketing", "Corporate training"],
        "correct": 1,
        "explain": "The vision is to be the gold standard in intelligent talent solutions where every Pathfinder is placed, genuinely supported, and set up to grow."
      },
      {
        "type": "mcq",
        "prompt": "According to the founder's message, why were you hired at S360?",
        "options": [
          "To fill a vacant seat quickly",
          "To prove what is possible when exceptional people receive the right environment and support",
          "To reduce costs for Summit Partners",
          "To train and then be placed independently"
        ],
        "correct": 1,
        "explain": "The founder states: 'You are not here to fill a seat — you are here because we believe in what you can do when the right environment and support come together.'"
      }
    ]
  }
}$ob01$),

('OB02', 'Your Identity as a Pathfinder', 'The six traits, the Pathfinder mindset, and how you are measured', 'onboarding', 'Onboarding', 15, 0.6, -4, $ob02${
  "overview_html": "<p>Being a Pathfinder is not a job title — it is a standard of performance. This module defines the six traits that every Pathfinder is expected to embody and explains the mindset that separates great professionals from order-takers.</p>",
  "outcomes": [
    "Define what a Pathfinder is and why the title carries a standard",
    "Name and apply the six Pathfinder traits in real work situations",
    "Distinguish Pathfinder mindset from order-taker mindset across key scenarios"
  ],
  "topics": [
    {
      "title": "What Is a Pathfinder?",
      "body": [
        "Path·find·er (n.) An elite professional embedded within a Summit Partner — who doesn't just do the work, but elevates the environment they work in.",
        "These are not aspirational traits — they are why you were hired. They are also how your Trailblazer will evaluate your growth."
      ]
    },
    {
      "title": "The Six Pathfinder Traits",
      "body": [
        "01 High Autonomy — You own your work fully. You assess the situation, make a call, and act — without waiting to be told what to do next.",
        "02 Independence — You manage your time, priorities, and output without someone standing over your shoulder. You are trusted by design.",
        "03 Ambiguity Tolerance — Things won't always be clearly defined. You don't freeze — you lean in, adapt, and find a path forward.",
        "04 Process Auditor — You observe how things work. You spot inefficiencies and gaps — and you flag or fix them. Not because you're asked to, but because you see them.",
        "05 Collaborative Partner — You are embedded in a team. You contribute beyond your job description and make the people around you better.",
        "06 Anticipates Needs — The best Pathfinders are three steps ahead. They don't wait to be asked — they see what's coming and prepare for it."
      ],
      "pro_tip": "Your Trailblazer evaluates you against these six traits at every milestone review. They are the lens through which your performance is measured."
    },
    {
      "title": "Pathfinder Mindset vs. Order-Taker Mindset",
      "body": [
        "Order-takers wait to be told what to do. Pathfinders assess what is needed and act proactively.",
        "Order-takers do exactly what was asked — no more. Pathfinders identify improvements without being asked.",
        "Order-takers struggle when the path is not clear. Pathfinders lean in when instructions are ambiguous.",
        "Order-takers complete tasks then wait. Pathfinders complete tasks and anticipate the next one.",
        "Order-takers communicate when asked. Pathfinders communicate before problems escalate.",
        "Order-takers build compliance. Pathfinders build trust through reliability and initiative."
      ],
      "watch_out": "Pathfinders are not measured by task completion — they are measured by impact, initiative, and growth."
    }
  ],
  "kc": {
    "pass_score": 0.6,
    "items": [
      {
        "type": "mcq",
        "prompt": "A new task arrives in your inbox but the instructions are vague. As a Pathfinder, you should:",
        "options": [
          "Wait for your Trailblazer to clarify before doing anything",
          "Ignore it until a deadline is set",
          "Lean in, apply your best judgment, act, and communicate what you have done",
          "Mark it as blocked and move on to other tasks"
        ],
        "correct": 2,
        "explain": "Ambiguity Tolerance means you don't freeze — you lean in, adapt, and find a path forward, then communicate what you've done."
      },
      {
        "type": "mcq",
        "prompt": "Which of the six Pathfinder traits describes spotting inefficiencies and fixing them without being asked?",
        "options": ["High Autonomy", "Process Auditor", "Anticipates Needs", "Collaborative Partner"],
        "correct": 1,
        "explain": "The Process Auditor trait means you observe how things work, spot gaps, and act on them proactively — not because you're asked to, but because you see them."
      },
      {
        "type": "mcq",
        "prompt": "The Pathfinder mindset prioritises which of the following over task completion?",
        "options": [
          "Following exact instructions",
          "Waiting for detailed briefs",
          "Impact, initiative, and growth",
          "Minimising risk by asking frequent questions"
        ],
        "correct": 2,
        "explain": "Pathfinders are explicitly measured by impact, initiative, and growth — not just completing assigned tasks."
      },
      {
        "type": "mcq",
        "prompt": "Your executive hasn't asked you about tomorrow's board meeting prep. A Pathfinder would:",
        "options": [
          "Wait for the executive to request materials the morning of the meeting",
          "Prepare an agenda, confirm the meeting link, and send prep materials the day before",
          "Ask the executive if prep is needed",
          "Handle other tasks since the executive hasn't flagged it as urgent"
        ],
        "correct": 1,
        "explain": "Anticipating Needs means being three steps ahead — preparing for what's coming without being asked."
      },
      {
        "type": "mcq",
        "prompt": "What does the Order-Taker mindset do when instructions are unclear?",
        "options": [
          "Acts proactively and communicates what was done",
          "Asks thoughtful questions then proceeds independently",
          "Struggles and waits for the path to be defined",
          "Flags the ambiguity to the team and proposes a solution"
        ],
        "correct": 2,
        "explain": "The Order-Taker mindset struggles when the path isn't clear — unlike Pathfinders who lean in and adapt."
      }
    ]
  }
}$ob02$),

('OB03', 'Your Support Network & Communication', 'Escalation structure, communication channels, and response standards', 'onboarding', 'Onboarding', 10, 0.6, -3, $ob03${
  "overview_html": "<p>You are never alone at S360. Knowing your support structure and the right communication channels sets you up to move fast and stay connected. There is always a clear path for every type of question or concern.</p>",
  "outcomes": [
    "Know your three-tier support structure and when to use each level",
    "Understand the purpose and standards for each communication channel",
    "Apply the correct escalation path for different types of issues"
  ],
  "topics": [
    {
      "title": "Your Support Structure",
      "body": [
        "1st — Your Trailblazer. Day-to-day questions, blockers, updates, and milestone reviews (Day 7, 30, 60, 90). Your first contact for everything. Respond within the same business day. Escalation response within same day on Slack.",
        "2nd — Trailblazement Director. Escalate unresolved issues, engagement concerns, or obstacles your Trailblazer cannot resolve. Second line of support.",
        "3rd — HR & Operations. Payroll, contract questions, policy matters, and sensitive HR concerns. Contact: hr@s360team.com · ops@s360team.com"
      ],
      "watch_out": "Always start with your Trailblazer. Going directly to HR or the Director for issues your Trailblazer can handle bypasses the support structure and slows resolution."
    },
    {
      "title": "Communication Channels & Standards",
      "body": [
        "Slack — Daily Communication. Primary internal channel for all day-to-day updates, questions, and urgent messages. Join #pathfinders and #general on Day 1. DM your Trailblazer directly for anything urgent. Respond within 4 business hours. Set your status to Away or Do Not Disturb when unavailable.",
        "Google Meet — Video Calls & Check-ins. All scheduled check-ins, milestone reviews (Day 7, 30, 60, 90), and team meetings. Camera on is the standard — no exceptions. Test your audio and video before the first meeting.",
        "Email — Formal / Internal Only. For formal internal communications or when explicitly required. Urgent queries always go to Slack first — do not wait for email if something is time-sensitive."
      ],
      "pro_tip": "If in doubt about which channel to use: Slack first for speed, Google Meet for structured check-ins, Email only when formally required."
    }
  ],
  "kc": {
    "pass_score": 0.6,
    "items": [
      {
        "type": "mcq",
        "prompt": "A Pathfinder should respond to Slack messages within:",
        "options": ["24 hours", "4 business hours", "1 business day", "2 hours at all times"],
        "correct": 1,
        "explain": "The standard is a response within 4 business hours. Pathfinders must set their status to Away or DND when unavailable."
      },
      {
        "type": "mcq",
        "prompt": "Your engagement has a concern that your Trailblazer cannot resolve. Who is your next point of escalation?",
        "options": ["HR & Operations directly", "The Summit Partner", "The Trailblazement Director", "The CEO"],
        "correct": 2,
        "explain": "The Trailblazement Director is the second line of support for unresolved engagement concerns."
      },
      {
        "type": "mcq",
        "prompt": "Which communication channel is used for ALL scheduled milestone reviews (Day 7, 30, 60, 90)?",
        "options": ["Slack DM", "Email", "Google Meet (camera on)", "WhatsApp"],
        "correct": 2,
        "explain": "All check-ins and milestone reviews happen on Google Meet with camera on as the standard — no exceptions."
      },
      {
        "type": "mcq",
        "prompt": "If you have an urgent payroll question, where should you direct it first?",
        "options": [
          "Email to hr@s360team.com immediately",
          "Raise it in the #pathfinders Slack channel publicly",
          "Slack your Trailblazer directly, then follow up with HR as needed",
          "Wait for the next scheduled check-in"
        ],
        "correct": 2,
        "explain": "Urgent matters always go to Slack first. HR email is for formal or non-urgent payroll and contract queries."
      }
    ]
  }
}$ob03$),

('OB04', 'Your First 7 Days — Setting the Foundation', 'Day-by-day guide for your first week at S360', 'onboarding', 'Onboarding', 15, 0.6, -2, $ob04${
  "overview_html": "<p>Your first 7 days are not about proving yourself — they are about observing, connecting, and setting the foundation for everything that follows. Resist the urge to show off. Deep observation leads to better contribution.</p>",
  "outcomes": [
    "Know exactly what to do on each day of your first week",
    "Understand the purpose of the Day 7 milestone check-in",
    "Identify the non-negotiable tasks that begin from Day 1"
  ],
  "topics": [
    {
      "title": "Day 1 — Orientation, Not Output",
      "body": [
        "Complete logins: Slack, Monday.com, Harvest, Deel, and Google Meet.",
        "Attend your orientation call with your Trailblazer.",
        "Read your Monday.com onboarding board — it is live and waiting for you.",
        "Complete your Deel profile if not yet done.",
        "Observe everything. Ask how things work. Do not rush to contribute yet."
      ],
      "pro_tip": "Day 1 is about orientation, not output. The fastest path to contribution is deep observation first."
    },
    {
      "title": "Days 2–3 — Active Learning",
      "body": [
        "Begin AI Academy Module 1 (due by end of Week 1).",
        "Shadow your Trailblazer on client workflows.",
        "Ask two meaningful questions per day — not surface questions.",
        "Update your Monday.com board by end of each day.",
        "Listen more than you speak. You are in intake mode."
      ]
    },
    {
      "title": "Days 4–6 — Start Contributing",
      "body": [
        "Log Harvest daily — every hour, correct project code.",
        "Own your first assigned task end-to-end.",
        "Deliver small tasks at high quality with clear communication.",
        "Your Trailblazer is monitoring your Monday.com board between check-ins."
      ],
      "watch_out": "Logging Harvest daily is non-negotiable from Day 4 onwards. Late or missing timesheets delay payroll — yours and others."
    },
    {
      "title": "Day 7 — Reflect & Prepare",
      "body": [
        "Prepare your questions and observations for the Day 7 check-in.",
        "Note gaps, wins, and anything you need support on.",
        "Your Day 7 check-in is a structured milestone — come prepared.",
        "Complete AI Academy Module 1 before or at the Day 7 review."
      ],
      "pro_tip": "The Day 7 check-in is your first formal milestone review. Your Trailblazer will review your progress against the Day 1–7 plan on your Monday.com board. Come prepared with questions, observations, and your AI Academy Module 1 completion."
    }
  ],
  "kc": {
    "pass_score": 0.6,
    "items": [
      {
        "type": "mcq",
        "prompt": "What is the primary purpose of Day 1 in your first week at S360?",
        "options": [
          "Deliver your first client-facing output",
          "Complete all tool logins and attend your orientation call — observe everything",
          "Start your first assigned project to demonstrate capability",
          "Shadow the recruitment team to understand client requirements"
        ],
        "correct": 1,
        "explain": "Day 1 is orientation, not output. The focus is completing logins, attending the orientation call, and observing everything."
      },
      {
        "type": "mcq",
        "prompt": "Which AI Academy module is due by the end of your first week?",
        "options": [
          "Module 2 — AI for Business",
          "Module 4 — Compliance & Ethics",
          "Module 1 — AI Foundations",
          "Module 3 — AI for Client Delivery"
        ],
        "correct": 2,
        "explain": "AI Academy Module 1 (AI Foundations) must be completed by end of Week 1 and is a non-negotiable onboarding milestone."
      },
      {
        "type": "mcq",
        "prompt": "During Days 2–3, what is the recommended mindset?",
        "options": [
          "Deliver three major tasks to make an impression",
          "Challenge existing processes and propose improvements immediately",
          "Listen more than you speak — you are in intake mode, shadowing and asking two meaningful questions per day",
          "Work independently without asking questions to demonstrate autonomy"
        ],
        "correct": 2,
        "explain": "Days 2-3 are active learning: listening more than speaking, shadowing, and asking two meaningful questions per day."
      },
      {
        "type": "mcq",
        "prompt": "What happens at the Day 7 check-in?",
        "options": [
          "You receive your salary review",
          "It is an informal chat — no formal preparation required",
          "A structured milestone review with your Trailblazer covering your first week progress",
          "You begin your first client-facing project assignment"
        ],
        "correct": 2,
        "explain": "Day 7 is a formal milestone review. You must come prepared with questions, observations, and Module 1 completion."
      },
      {
        "type": "mcq",
        "prompt": "Which of the following is a NON-NEGOTIABLE daily task from Day 4 onwards?",
        "options": [
          "Posting a status update in #general",
          "Logging every hour in Harvest with the correct project code",
          "Attending a daily team standup",
          "Sending an email summary to your Trailblazer"
        ],
        "correct": 1,
        "explain": "Logging Harvest daily — every hour to the correct project code — is non-negotiable. Late or missing timesheets delay payroll."
      }
    ]
  }
}$ob04$),

('OB05', 'Your Tools & Technology', 'The six Pathfinder tools — setup, standards, and daily use', 'onboarding', 'Onboarding', 20, 0.6, -1, $ob05${
  "overview_html": "<p>Your full tool credentials will be sent to your registered email before your start date. Your onboarding session will walk through each tool in depth. These six tools are how S360 operates — you must be fluent in all of them.</p>",
  "outcomes": [
    "Know the purpose and daily use standard for each of the six Pathfinder tools",
    "Understand the Harvest timesheet submission requirement",
    "Apply the correct approach when using Claude (AI) for client-facing work"
  ],
  "topics": [
    {
      "title": "Monday.com — Project Management Hub",
      "body": [
        "Your onboarding board is live before Day 1. Update every task row daily.",
        "Log in → go to My Workspace → find 'Onboarding — [Your Name]'. Each column = milestone. Each row = action item.",
        "Mark tasks Done as you complete them. Your Trailblazer monitors this between check-ins — it replaces status meetings."
      ],
      "pro_tip": "Your Monday.com board is your daily communication with your Trailblazer. An out-of-date board signals disengagement."
    },
    {
      "title": "Harvest — Time Tracking",
      "body": [
        "Log every hour to the correct project code — no batching at end of week.",
        "Log in → click Track Time → select project and task type → use the timer or enter hours manually → add a brief note.",
        "Submit your timesheet every Friday by 5PM. Late submissions delay payroll. Non-negotiable."
      ],
      "watch_out": "Never batch your hours at the end of the week. Log in real-time or same day. Incorrect project codes create billing errors for Summit Partners."
    },
    {
      "title": "Deel — Payroll & Contracts",
      "body": [
        "Complete your profile within 48 hours of receiving your invite.",
        "Log in via email invite → set password → complete personal profile and tax info → add bank account for payment → e-sign contract.",
        "Download the Deel app. Payroll cannot be processed without a complete profile."
      ]
    },
    {
      "title": "Slack — Daily Communication",
      "body": [
        "Primary channel for all internal communication. Join #pathfinders and #general on Day 1.",
        "Respond within 4 business hours. Set status when away or unavailable.",
        "DM your Trailblazer directly for urgent matters."
      ]
    },
    {
      "title": "Claude (AI) — AI Productivity Tool",
      "body": [
        "Your professional AI tool for business and client work. Use it for drafting, summarising, researching, and preparing deliverables.",
        "Always review before submitting — AI is a first draft, not a final answer.",
        "Use S360-approved accounts only. Never paste passwords or credentials."
      ],
      "watch_out": "Never paste client-sensitive information, passwords, or credentials into any AI tool. This violates both S360 security standards and Summit Partner confidentiality."
    },
    {
      "title": "AI Academy — Mandatory Training",
      "body": [
        "Structured learning programme for all Pathfinders.",
        "Module 1 due Week 1. Modules 2–4 follow at Day 30, 60, and 90 milestones.",
        "Track progress on your Monday.com board. Certificates issued on completion of each module."
      ]
    }
  ],
  "kc": {
    "pass_score": 0.6,
    "items": [
      {
        "type": "mcq",
        "prompt": "Which S360 tool is your primary project management hub and must be updated daily?",
        "options": ["Harvest", "Deel", "Monday.com", "Slack"],
        "correct": 2,
        "explain": "Monday.com is your project management hub. Your Trailblazer monitors your board between check-ins — it replaces status meetings."
      },
      {
        "type": "mcq",
        "prompt": "When must Harvest timesheets be submitted each week?",
        "options": [
          "By Monday 9AM for the previous week",
          "Every Friday by 5PM — no batching",
          "Within 48 hours of completing each task",
          "At the end of each month"
        ],
        "correct": 1,
        "explain": "Timesheets must be submitted every Friday by 5PM. Late submissions delay payroll. No batching at end of week."
      },
      {
        "type": "mcq",
        "prompt": "Which tool holds your employment contract, payroll details, and bank account information?",
        "options": ["Monday.com", "Harvest", "Claude", "Deel"],
        "correct": 3,
        "explain": "Deel is the payroll and contracts platform. You must complete your profile within 48 hours of receiving your invite."
      },
      {
        "type": "mcq",
        "prompt": "When using Claude (AI) to draft a client deliverable, which of the following is the correct approach?",
        "options": [
          "Send the AI output directly — it is professionally formatted and accurate",
          "Use Claude to generate a first draft, then review, edit, and fact-check before submitting",
          "Inform the client that the document was AI-generated before sharing",
          "Only use AI for internal documents — never for client-facing work"
        ],
        "correct": 1,
        "explain": "AI is a first draft, not a final answer. Always review before submitting. Client-facing AI use is encouraged but requires human review."
      },
      {
        "type": "mcq",
        "prompt": "AI Academy Module 1 must be completed by:",
        "options": [
          "End of Day 30",
          "End of your first month",
          "End of Week 1",
          "Before your first client meeting"
        ],
        "correct": 2,
        "explain": "Module 1 (AI Foundations) is due by end of Week 1 and is a non-negotiable onboarding milestone."
      }
    ]
  }
}$ob05$),

('OB06', 'Your Journey: 90 Days, Standards & Security', 'Your 90-day roadmap, AI guardrails, and security non-negotiables', 'onboarding', 'Onboarding', 15, 0.6, 0, $ob06${
  "overview_html": "<p>Your full roadmap lives on Monday.com — your Trailblazer sets it up before Day 1. This module covers the three phases of your first 90 days, how to use AI professionally at S360, and the security standards that are non-negotiable.</p>",
  "outcomes": [
    "Know the three phases of your 90-day roadmap and what each phase requires",
    "Apply S360's AI usage guidelines including what is and is not permitted",
    "Understand the four security non-negotiables and the consequences of breach"
  ],
  "topics": [
    {
      "title": "Your 90-Day Roadmap",
      "body": [
        "LEARN — Foundation (Days 1–30): Complete all onboarding setup and tool access. Finish AI Academy Module 1 by end of Week 1. Shadow your Trailblazer on all client workflows. Day 30 check-in: first milestone review.",
        "CONTRIBUTE — Ownership (Days 31–60): Own core recurring tasks fully. Deliver first client-facing work. Begin AI Academy Module 2. Day 60 check-in: structured performance review.",
        "ELEVATE — Performance (Days 61–90): Own full engagement scope. Deliver documented client impact. Complete AI Academy Modules 3 & 4. Day 90 review: path-forward discussion."
      ],
      "pro_tip": "Your full roadmap lives on Monday.com. Use it daily — your Trailblazer monitors it between check-ins."
    },
    {
      "title": "AI at Work — Your Professional Edge",
      "body": [
        "At S360, AI is a professional tool — not a restricted one. You are encouraged to use it for both business and client work.",
        "Encouraged uses: Drafting emails, reports, and client presentations. Researching industries, competitors, and trends. Preparing agendas, briefings, and meeting prep. Analysing client data and identifying patterns. Summarising long documents and research.",
        "Guardrails — always apply: Review before submitting — AI is a first draft, not a final answer. Be transparent about AI's role where relevant. Use S360-approved accounts only. Never paste passwords, credentials, or client-sensitive data."
      ],
      "watch_out": "Pasting client credentials, confidential data, or passwords into any AI tool is a security violation. It can result in immediate termination."
    },
    {
      "title": "Security Standards — Non-Negotiables",
      "body": [
        "Confidentiality — What you see at your Summit Partner site stays there. Full stop. Breaches mean immediate termination.",
        "Passwords & 2FA — Strong, unique passwords for all tools. Enable two-factor authentication wherever available.",
        "Device & Network — Use approved or secured devices for client work. Avoid public Wi-Fi. Lock your screen when stepping away.",
        "Incident Reporting — Spot a security gap? Report it to hr@s360team.com immediately. No delay, no exception."
      ],
      "watch_out": "Confidentiality is absolute. What you see at your Summit Partner site stays there — this applies even after your engagement ends."
    }
  ],
  "kc": {
    "pass_score": 0.6,
    "items": [
      {
        "type": "mcq",
        "prompt": "During Days 31–60, a Pathfinder is expected to be in which phase?",
        "options": [
          "Learn — Foundation & Orientation",
          "Contribute — Ownership & Initiative",
          "Elevate — Performance & Integration",
          "Deploy — Full client independence"
        ],
        "correct": 1,
        "explain": "Days 31-60 is the Contribute phase: owning core tasks, delivering client-facing work, and completing AI Academy Module 2."
      },
      {
        "type": "mcq",
        "prompt": "Which of the following is NOT an approved use of AI at S360?",
        "options": [
          "Drafting a client presentation for executive review",
          "Summarising a 20-page industry report before a client meeting",
          "Pasting a client's confidential credentials into Claude to troubleshoot access",
          "Researching a prospect's company background before a call"
        ],
        "correct": 2,
        "explain": "Never paste passwords, credentials, or client-sensitive data into any AI tool. This violates security and confidentiality standards."
      },
      {
        "type": "mcq",
        "prompt": "A Pathfinder spots a potential security vulnerability in a client system. The correct immediate action is:",
        "options": [
          "Investigate and try to fix it independently before reporting",
          "Report it to hr@s360team.com immediately — no delay",
          "Mention it at the next weekly check-in",
          "Ask the Summit Partner whether it needs escalating"
        ],
        "correct": 1,
        "explain": "Security incidents must be reported to hr@s360team.com immediately. No delay, no exception."
      },
      {
        "type": "mcq",
        "prompt": "Which milestone review includes a 'path-forward discussion' about your future with S360?",
        "options": ["Day 7", "Day 30", "Day 60", "Day 90"],
        "correct": 3,
        "explain": "Day 90 is the path-forward discussion — reviewing your performance and discussing the future direction of your engagement."
      },
      {
        "type": "mcq",
        "prompt": "What is the S360 confidentiality policy regarding Summit Partner information?",
        "options": [
          "You may share non-sensitive information with trusted colleagues",
          "You may share information internally within S360 for operational purposes",
          "What you see at your Summit Partner site stays there — breaches mean immediate termination",
          "Client information can be shared with your Trailblazer for performance discussions"
        ],
        "correct": 2,
        "explain": "Confidentiality is absolute: what you see at your Summit Partner site stays there. Breaches mean immediate termination."
      }
    ]
  }
}$ob06$)

ON CONFLICT (code) DO NOTHING;
