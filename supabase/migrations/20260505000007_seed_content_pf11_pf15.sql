-- Sprint 3: Module content PF11–PF15

-- ─── PF11 ────────────────────────────────────────────────────────────────────
UPDATE public.modules SET content = $pf11${
  "overview_html": "<p>An EA who triages poorly costs their Partner hours every day — not in dramatic failures, but in the slow accumulation of misrouted attention. The wrong email opened first, the wrong meeting accepted, the wrong task labelled urgent. AI can help, but only if the triage system it operates within is sound.</p><p>This module gives you the operating rhythm that the best Pathfinders use: a morning A/B/C/D email sort, a calendar protection framework, and an end-of-day close that prevents things from falling through the cracks.</p>",
  "outcomes": [
    "Apply the A/B/C/D triage system to categorise any email or task",
    "Use AI to process an inbox triage in under 15 minutes each morning",
    "Identify and protect high-value time blocks on a Partner's calendar",
    "Run an end-of-day close that surfaces open items and prepares tomorrow",
    "Build AI-assisted triage prompts for your specific Partner's inbox patterns"
  ],
  "topics": [
    {
      "title": "The A/B/C/D triage system",
      "body": [
        "Every item in a Partner's inbox or task list belongs in one of four categories. A: requires Partner decision or action today. B: requires Partner attention this week. C: requires action but not from the Partner — you handle it. D: delete, archive, or defer indefinitely.",
        "The power of this system is in category C — the items you handle without involving the Partner at all. Most Partners are surprised by how many emails fall into C once an experienced Pathfinder takes over. Routine vendor queries, scheduling requests, administrative confirmations, newsletter subscriptions, and most FYI messages are all C.",
        "AI accelerates triage by scanning the inbox and pre-sorting. With a well-configured Cowork workflow or a Claude prompt that includes the Partner's email patterns, you can go from a 200-email inbox to a sorted A/B/C/D list in under 15 minutes."
      ],
      "example": "Morning triage prompt: 'Review the following email subjects and senders from the last 24 hours. Categorise each as: A (Partner decision today), B (Partner attention this week), C (I handle), or D (delete/archive). Context about this Partner: [paste Partner Profile excerpt]. Here are the emails: [paste subject + sender list].' Claude produces a sorted list you verify and action.",
      "pro_tip": "Build a 'C library' — a list of the email categories you always handle without involving the Partner. Paste it into the triage prompt. Claude will use it to correctly route similar emails automatically.",
      "watch_out": "Never downgrade an A to a C without being certain. When in doubt, surface to the Partner. The cost of missing a Partner A is much higher than the cost of showing them a false alarm."
    },
    {
      "title": "Calendar protection",
      "body": [
        "A Partner's calendar is their most non-renewable resource. An unprotected calendar fills with low-value meetings, leaving no time for deep work, recovery, or strategic thinking. Calendar protection is one of the most valuable things a Pathfinder can do — and AI makes it much easier to enforce.",
        "The five calendar protection rules: (1) Deep work blocks (minimum 90 minutes, 2–3 per week) are sacred — nothing gets scheduled in them without explicit Partner approval. (2) No back-to-back external meetings — always a 15-minute buffer between calls. (3) Fridays after 2pm are protected for Partner preparation, reflection, or early finish. (4) All meeting requests should be evaluated against the Partner's priority list before accepting. (5) Any meeting without a clear agenda gets a clarifying question before accepting.",
        "With Cowork connected to Calendar, you can set up a weekly workflow that reviews all incoming meeting requests and flags any that violate these rules for your review."
      ],
      "pro_tip": "Ask the Partner explicitly: 'What does your ideal week look like?' Then protect that shape against the entropy of meeting requests. Most Partners have never been asked this question and are deeply grateful when someone enforces the answer.",
      "watch_out": "Calendar protection requires Partner buy-in. If you decline meetings without a clear mandate, you create friction. Get explicit agreement on the rules before enforcing them."
    },
    {
      "title": "The end-of-day close",
      "body": [
        "The end-of-day close is a 10-minute ritual that prevents open items from falling through the cracks and prepares both you and the Partner for tomorrow. It has three parts: (1) scan open items from today — anything that was promised or started but not completed; (2) verify tomorrow's calendar — are all meetings briefed, all prep done, all logistics confirmed; (3) send a brief end-of-day summary to the Partner if they have asked for one.",
        "AI can assist with all three parts. A Cowork workflow can scan your task manager and email for open items, cross-reference tomorrow's calendar, and draft a close-of-day summary for your review.",
        "The close-of-day summary should be brief — three to five bullets maximum. What was completed today, what is open, and what needs Partner attention tomorrow. It is not a status report; it is a handshake that keeps communication clear."
      ],
      "example": "End-of-day summary format: 'Done today: [2–3 bullets]. Still open: [1–2 bullets with owner and next step]. Tomorrow: [most important 2–3 items from calendar + any prep needed]. Flag for your attention: [only include if there is something the Partner needs to know or decide].'",
      "pro_tip": "Send the end-of-day summary at a consistent time. Partners develop a rhythm around it — they know when to expect it and it becomes part of their closing ritual too."
    }
  ],
  "kc": {
    "pass_score": 0.8,
    "items": [
      {
        "type": "mcq",
        "prompt": "In the A/B/C/D triage system, what does category C mean?",
        "options": [
          "Critical — Partner must address today",
          "Calendar — schedule a meeting about it",
          "The Pathfinder handles it without involving the Partner",
          "Close — archive or delete"
        ],
        "correct": 2,
        "explain": "C items require action but not from the Partner. These are the items a skilled Pathfinder handles independently — routine queries, scheduling, administrative confirmations. The larger the C category, the more value a Pathfinder is creating."
      },
      {
        "type": "mcq",
        "prompt": "A new meeting request arrives for a 60-minute strategy call with a vendor on the same day as the Partner's weekly deep work block. What should you do?",
        "options": [
          "Accept it — strategy calls are always important",
          "Decline immediately without informing the Partner",
          "Flag it to the Partner with the conflict noted and ask for guidance",
          "Accept it and cancel the deep work block"
        ],
        "correct": 2,
        "explain": "Deep work blocks are protected, but overriding a Partner's schedule without consultation is overstepping. Flag the conflict and ask — do not decide unilaterally. Only decline automatically if you have explicit standing authority to protect that time."
      },
      {
        "type": "mcq",
        "prompt": "What is the primary purpose of the end-of-day close?",
        "options": [
          "To demonstrate productivity to the Partner",
          "To prevent open items from falling through the cracks and prepare tomorrow",
          "To file all completed tasks for the record",
          "To schedule the next day's meetings"
        ],
        "correct": 1,
        "explain": "The end-of-day close is a systems ritual — it surfaces open items, verifies tomorrow's preparation, and maintains clear communication. Its purpose is operational continuity, not performance reporting."
      },
      {
        "type": "mcq",
        "prompt": "You are building a triage prompt for your Partner's inbox. What should you include to make the A/B/C/D categorisation most accurate?",
        "options": [
          "The full text of every email for Claude to read",
          "A C library of email categories you always handle, plus relevant Partner Profile context",
          "Only the email subjects — senders are not relevant",
          "The Partner's calendar so Claude can prioritise based on upcoming meetings"
        ],
        "correct": 1,
        "explain": "A C library plus Partner Profile context gives Claude the standing rules and Partner-specific patterns to sort accurately. Full email text is often unnecessary and consumes tokens; subjects and senders are usually sufficient for initial triage."
      },
      {
        "type": "open",
        "prompt": "Design the end-of-day close workflow for a Partner you work with. Describe the format of the summary, what you would include and exclude, and how AI would help you prepare it.",
        "answer": "Format: A brief message sent at 5:30pm each working day. Maximum five bullets. Sections: Done (2–3 bullets on what was completed), Open (anything that was started but not finished, with next step), Tomorrow (top 2–3 calendar items and any prep needed), and Flag (only when there is something requiring Partner decision or awareness). Exclusions: routine tasks that the Partner does not need to know about; anything that is fully handled with no follow-on. AI assistance: use a Cowork workflow connected to task manager and email to scan open items and draft the summary; review and edit before sending. The goal is for the Partner to read it in 60 seconds and feel confident nothing is falling through the cracks."
      }
    ]
  }
}$pf11$::jsonb WHERE code = 'PF11';

-- ─── PF12 ────────────────────────────────────────────────────────────────────
UPDATE public.modules SET content = $pf12${
  "overview_html": "<p>Meetings are where a Partner's strategy either accelerates or stalls. A well-prepared Partner walks in with context, walks out with decisions, and follows up before the momentum dies. A poorly supported Partner walks in unprepared, leaves with unclear actions, and loses the thread within 48 hours. The Pathfinder controls all three phases.</p><p>This module covers the 15-minute pre-briefing, how to extract decisions and actions during a meeting, and the 2-hour follow-up rule that keeps commitments alive.</p>",
  "outcomes": [
    "Produce a sharp 15-minute pre-briefing for any meeting type",
    "Extract key decisions and action items from a meeting transcript or notes",
    "Draft and send a follow-up within 2 hours of a meeting ending",
    "Use AI to turn rough meeting notes into a structured record in under 10 minutes",
    "Build templates for the Partner's three most common meeting types"
  ],
  "topics": [
    {
      "title": "The 15-minute pre-briefing",
      "body": [
        "A pre-briefing is a one-page document the Partner reads in the 15 minutes before a meeting. It answers three questions: Who is in this meeting and what matters about them? What does the Partner need to achieve in this meeting? What does the Partner need to know to walk in confident?",
        "The briefing should be exactly as long as the Partner will actually read — for most Partners this is one page, maximum. Use the Partner's preferred format (bullets or short paragraphs). Lead with the most important thing: the objective or decision to be made.",
        "AI dramatically accelerates pre-briefing preparation. With the meeting participants identified, you can ask Claude to research each person (from LinkedIn and company websites, pasted in), summarise the history of the relationship, identify the most likely agenda items, and suggest talking points — all in a single prompt."
      ],
      "example": "Pre-briefing prompt: 'Prepare a one-page meeting briefing for James, who is meeting with [Name], [Title] at [Company] in 15 minutes. Objective: explore a potential partnership. Background on [Company]: [pasted from website]. Previous interactions: [paste any prior email context]. Briefing format: 3 bullets on who they are, 2 bullets on what James wants to achieve, 3 bullets on context James should have, 1 bullet on suggested opening.'",
      "pro_tip": "Build a briefing template for each of the Partner's top three meeting types (client calls, internal team meetings, external partnerships). Reusing the template saves setup time and ensures consistency.",
      "watch_out": "A briefing that is too long does not get read. If your Partner consistently skips the pre-briefing, it is too long or not actionable enough. Ask them what format would make them read it every time."
    },
    {
      "title": "During the meeting — capturing what matters",
      "body": [
        "If you are in the meeting (as note-taker or support), your job is to capture three things: decisions made, actions agreed (with owner and deadline), and key context that will matter later (relationship dynamics, concerns raised, new information that changes the picture).",
        "If you are not in the meeting, the Partner should send you notes or a recording shortly after. Many Partners now record calls — with consent — and Cowork can transcribe and structure these automatically.",
        "The biggest note-taking mistake is capturing what was said rather than what was decided. A 90-minute meeting may only produce three real decisions and five actions. Those eight items are the only things that matter for follow-up."
      ],
      "pro_tip": "During the meeting, keep a live 'decisions + actions' list separate from your general notes. At the end, read it back to the room: 'Just to confirm, we have agreed to X, Y, Z, and [Name] will do [action] by [date].' This surfaces any misalignments before people leave.",
      "watch_out": "Transcription AI (including Claude) is not always accurate with proper nouns, industry terms, or fast speakers. Always review a transcription against your memory or the recording before treating it as the record."
    },
    {
      "title": "The 2-hour follow-up rule",
      "body": [
        "The 2-hour rule is simple: every meeting that produced commitments gets a follow-up sent within 2 hours. Not tomorrow. Not end of week. Within 2 hours, while the context is still fresh for everyone in the room.",
        "A meeting follow-up has three components: a brief summary of what was discussed (2–3 sentences), a clear list of actions with owners and deadlines, and any attachments or next steps mentioned in the meeting.",
        "AI makes the 2-hour rule achievable even on busy days. Immediately after the meeting, paste in your decisions + actions list and ask Claude to draft the follow-up email using the Partner's voice and the format appropriate for the audience. You review and send."
      ],
      "example": "Follow-up prompt: 'Using James's communication style (direct, bullet-point oriented, always includes a clear next step), draft a meeting follow-up email to the three attendees of this call. Meeting purpose: [X]. Decisions made: [list]. Actions: [list with owners and deadlines]. Keep it under 150 words.'",
      "pro_tip": "If there were no decisions or actions, the follow-up is still valuable: a one-sentence summary that confirms what was discussed maintains the relationship and creates a written record.",
      "watch_out": "The 2-hour rule breaks down when Pathfinders wait for the perfect follow-up. A good follow-up sent in 2 hours beats a perfect one sent in 48 hours. Speed signals professionalism."
    }
  ],
  "kc": {
    "pass_score": 0.8,
    "items": [
      {
        "type": "mcq",
        "prompt": "What are the three questions a pre-briefing should answer?",
        "options": [
          "What is the meeting agenda, how long is the meeting, where is it held",
          "Who is in the meeting and what matters about them, what does the Partner need to achieve, what does the Partner need to know",
          "What happened last time, what was agreed, what needs to change",
          "Who called the meeting, what is the budget, what are the risks"
        ],
        "correct": 1,
        "explain": "The three pre-briefing questions orient the Partner on people, objective, and context — the three things that determine whether they walk in confident or underprepared."
      },
      {
        "type": "mcq",
        "prompt": "You are taking notes in a 90-minute strategy meeting. What should be your primary focus?",
        "options": [
          "Capturing a verbatim transcript of everything said",
          "Capturing decisions made and actions agreed with owners and deadlines",
          "Writing a narrative summary of the discussion themes",
          "Recording the meeting for later review"
        ],
        "correct": 1,
        "explain": "Decisions and actions are what drive work forward. Everything else is context. A 90-minute meeting may produce only three decisions and five actions — those eight items are the outputs that matter."
      },
      {
        "type": "mcq",
        "prompt": "When should a meeting follow-up be sent?",
        "options": [
          "By end of the working day",
          "Within 24 hours",
          "Within 2 hours of the meeting ending",
          "At the start of the next working day"
        ],
        "correct": 2,
        "explain": "The 2-hour rule exists because context fades fast. A follow-up sent within 2 hours maintains momentum, demonstrates professionalism, and catches any misalignments while they are easy to correct."
      },
      {
        "type": "mcq",
        "prompt": "Your Partner skips the pre-briefing you prepare every week. What is the most likely cause?",
        "options": [
          "The Partner does not value preparation",
          "The briefing is too long or not in the format the Partner finds actionable",
          "Pre-briefings are not useful for experienced executives",
          "You are sending it too early"
        ],
        "correct": 1,
        "explain": "If a Partner consistently does not use a tool, the tool is not designed for them. Ask what format they would actually read. Length is almost always the first issue — most Partners need one page maximum."
      },
      {
        "type": "open",
        "prompt": "A Partner just finished a 1-hour call with three potential investors. You have the following rough notes: 'Investor 1 interested but cautious on valuation. Investor 2 wants more detail on unit economics. Investor 3 enthusiastic, mentioned follow-up call next week. Action: send deck to all three. Action: James to prepare unit economics slide by Friday. Action: confirm call with Investor 3 for Wednesday.' Draft the follow-up email using these notes.",
        "answer": "Subject: Thank you + next steps — [Partner Company] investor calls. Dear [Investor 1], [Investor 2], [Investor 3], Thank you all for your time today — it was a valuable conversation and we appreciated your questions. Following our discussion, here are the agreed next steps: (1) We will send the updated pitch deck to all three of you by end of today. (2) We are preparing an expanded unit economics slide — this will be ready by Friday and we will follow up with it then. (3) [Investor 3] — we will reach out separately to confirm a follow-up call for Wednesday. Please do not hesitate to reach out in the meantime if you have questions. [James's signature]"
      }
    ]
  }
}$pf12$::jsonb WHERE code = 'PF12';

-- ─── PF13 ────────────────────────────────────────────────────────────────────
UPDATE public.modules SET content = $pf13${
  "overview_html": "<p>The single most common complaint Partners have about AI-assisted drafts is that they do not sound like them. The writing is professional, grammatically correct, and utterly generic. It sounds like the AI wrote it — because it did, without being given enough of the Partner's voice to work with.</p><p>This module gives you the voice capture system that eliminates this problem. You will learn to analyse a Partner's voice, codify it, use it as few-shot training material, and build prompts that produce drafts that need minimal editing before they go out under the Partner's name.</p>",
  "outcomes": [
    "Analyse a Partner's writing and extract five specific voice characteristics",
    "Build a voice style guide for a Partner",
    "Use few-shot examples to train Claude to match a Partner's voice",
    "Identify and remove AI voice patterns from any draft",
    "Produce a communication that the Partner sends unchanged"
  ],
  "topics": [
    {
      "title": "Voice capture — analysing what makes a Partner's writing theirs",
      "body": [
        "Every person's professional writing has fingerprints. The challenge is moving from vague impressions ('she is direct') to specific, replicable patterns that AI can use ('she never uses the word I in her subject lines, she leads with the key point in sentence one, her average sentence is 12 words, she uses em dashes to add context rather than commas').",
        "The voice analysis process: gather 8–10 examples of the Partner's writing that they consider good (emails, messages, LinkedIn posts, documents). Read them for patterns across five dimensions: sentence length and rhythm, vocabulary choices (formal/informal, industry-specific, personal phrases), structural patterns (how they open, close, transition), tonal register (warm/cool, authoritative/collaborative), and what they notably avoid.",
        "Document these patterns in the Project as the Style Guide layer. Update it whenever you notice a new pattern or the Partner explicitly corrects a draft — corrections are the most precise signal about what their voice is and is not."
      ],
      "example": "Voice analysis for a Partner: 'James leads every email with the key ask or point — never with pleasantries. He uses short sentences (average 10–12 words). He favours active verbs: prefers \"we will\" over \"it has been decided to.\" He ends action-oriented emails with a specific deadline, not a vague \"soon\" or \"shortly.\" He never uses the word \"leverage\" or \"synergy.\" He almost never uses exclamation marks.'",
      "pro_tip": "Ask the Partner to forward you 3–5 emails they are proud of. These are the gold-standard examples to anchor your few-shot prompts. Emails they dislike from others are equally useful — they reveal what to avoid.",
      "watch_out": "Voice varies by context. The Partner's voice in a client email is different from their voice in an internal team message. Build separate few-shot libraries for each major context type."
    },
    {
      "title": "The few-shot voice prompt",
      "body": [
        "Once you have captured the Partner's voice patterns and have 3–5 example pieces, you can use them as few-shot training material in a prompt. The structure is: (1) brief description of the Partner's voice characteristics; (2) two or three example pieces labelled as 'examples of [Partner's] style'; (3) the specific task and context; (4) explicit instruction to match the demonstrated style.",
        "The key instruction at the end of the prompt is: 'Write in the style demonstrated by the examples above. Do not add warmth, formality, or structure that is not present in those examples. Do not start with greetings or pleasantries unless the examples do.' This prevents Claude from reverting to its default professional register.",
        "After generating the draft, run a quick voice check: does the opening match? Is the sentence rhythm similar? Are there any words or phrases that appear in your draft but never in the Partner's real writing? These are the edits to make before sending."
      ],
      "example": "Few-shot voice prompt structure: 'Here are three examples of how [Partner] writes emails. Study the sentence length, openings, tone, and structure — especially what is absent as much as what is present. [Example 1] [Example 2] [Example 3]. Now write an email from [Partner] to [Recipient] about [Situation]. Match the style exactly.'",
      "watch_out": "Three examples are a minimum for reliable voice matching. With only one example, Claude tends to over-apply a single feature of the writing (e.g., short sentences) while missing others (e.g., specific vocabulary choices)."
    },
    {
      "title": "Killing AI voice — the patterns to eliminate",
      "body": [
        "AI-generated text has tells. Partners, clients, and sophisticated readers notice them even if they cannot articulate exactly what feels off. Learning to spot and eliminate these patterns is as important as building the voice prompt in the first place.",
        "The most common AI voice patterns: opening with 'Certainly!' or 'Absolutely!'; using 'leverage' as a verb; writing in overly balanced structures ('on one hand... on the other hand'); excessive use of em dashes; starting too many sentences with 'It is' or 'There is'; phrasing like 'I hope this email finds you well'; concluding with 'I hope this helps!' or 'Please do not hesitate to reach out.'",
        "Build a personal elimination list for each Partner — phrases and patterns that never appear in their writing and should never appear in output drafted on their behalf. Add this to the Project Standing Instructions as a negative examples list."
      ],
      "pro_tip": "After generating any draft, ask Claude to review it: 'Read this draft and identify any phrases or patterns that sound like AI rather than [Partner's name]. List them and suggest replacements.' This self-review step catches the most obvious AI voice patterns before you do a manual review.",
      "watch_out": "Some Partners have told you they do not mind AI voice. Respect this — but note that their clients and counterparties may notice even if they do not. The standard is not Partner approval; it is whether a sophisticated reader would notice."
    }
  ],
  "kc": {
    "pass_score": 0.8,
    "items": [
      {
        "type": "mcq",
        "prompt": "Why is 'she is direct' an insufficient voice characteristic for an AI prompt?",
        "options": [
          "It is too positive — you need negative examples too",
          "It is too vague for AI to act on; specific patterns like sentence length and opening structure are needed",
          "Directness is too common to be a useful differentiator",
          "AI cannot replicate directness — it always adds warmth"
        ],
        "correct": 1,
        "explain": "Vague descriptions require Claude to interpret them, often defaulting to a generic version. Specific, measurable patterns — sentence length, vocabulary choices, structural habits — give Claude something to actually replicate."
      },
      {
        "type": "mcq",
        "prompt": "Which of the following is MOST useful as a few-shot voice example?",
        "options": [
          "An email the Partner received and replied to briefly",
          "A LinkedIn post the Partner approved but had heavily edited",
          "An email the Partner wrote unprompted and considers one of their best",
          "A template email the Partner uses for routine responses"
        ],
        "correct": 2,
        "explain": "The gold-standard few-shot example is writing the Partner created unprompted and considers good — it represents their authentic voice at its best, with no external influence on the style."
      },
      {
        "type": "mcq",
        "prompt": "Which phrase is a classic AI voice tell that should be on every Partner's elimination list?",
        "options": [
          "Best regards",
          "I hope this email finds you well",
          "Please see below",
          "Looking forward to speaking"
        ],
        "correct": 1,
        "explain": "'I hope this email finds you well' is one of the most distinctive AI voice patterns — it is common in AI output but rarely written by busy executives who get to the point immediately. It signals AI authorship to sophisticated readers."
      },
      {
        "type": "mcq",
        "prompt": "A Partner corrects a draft you produced, changing three specific phrases. What should you do with these corrections?",
        "options": [
          "Note them for this specific draft only",
          "Add them to the Partner Profile as voice corrections and update the Style Guide",
          "Ask the Partner to explain why they changed them",
          "Corrections do not need to be documented — just remember them"
        ],
        "correct": 1,
        "explain": "Corrections are the most precise signal about the Partner's voice — they show exactly what they would not say. Documenting them in the Project Style Guide permanently improves every future draft."
      },
      {
        "type": "open",
        "prompt": "Find three emails written by your current Partner (or write three realistic examples for a hypothetical Partner). Analyse them for five specific voice characteristics. Then write the voice instructions you would add to their Claude Project.",
        "answer": "Example voice analysis: (1) Sentence length: averages 10–14 words; rarely writes sentences over 20 words. (2) Openings: leads with the point or the ask in sentence one — never with pleasantries or context-setting. (3) Vocabulary: prefers plain English over business jargon; uses 'can' not 'would be able to', 'think' not 'believe'. (4) Tone: professional but warm without being effusive; uses first names naturally; one occasional informal phrase per email keeps it human. (5) What is absent: no exclamation marks, no 'Absolutely!', no passive voice, no 'I just wanted to...'. Voice instructions for Project: 'When drafting emails for [Partner], start with the key point in sentence one. Use short sentences (target 10–14 words). Use plain English — avoid jargon. No exclamation marks. No passive voice. Do not start with pleasantries or greetings unless responding to them.'"}
    ]
  }
}$pf13$::jsonb WHERE code = 'PF13';

-- ─── PF14 ────────────────────────────────────────────────────────────────────
UPDATE public.modules SET content = $pf14${
  "overview_html": "<p>AI tools handle information with a different risk profile than email or documents. When you paste a client's financial data into an AI chat, you are making a decision with legal, contractual, and ethical implications — even if it takes three seconds and feels like a minor convenience. This module gives you the framework to make those decisions correctly, every time.</p><p>We cover the green/amber/red classification system, enterprise account requirements, the specific rules around hallucination in high-stakes contexts, and the personal discipline habits that protect you and your Partners over the long term.</p>",
  "outcomes": [
    "Apply the green/amber/red classification system to any piece of Partner information",
    "Explain the enterprise account requirement and when it applies",
    "Identify the three high-stakes hallucination scenarios and apply the verification discipline",
    "Describe the redaction process for amber and red information",
    "Build personal AI safety habits that protect you in every engagement"
  ],
  "topics": [
    {
      "title": "The green/amber/red classification system",
      "body": [
        "Every piece of information you handle as a Pathfinder falls into one of three categories. Green: publicly available information, general knowledge, or non-sensitive business context. This can be used in any AI tool without restriction. Examples: a company's public description, industry background, general advice on formatting or communication.",
        "Amber: Partner-specific information that is not public, but is not highly sensitive. This should only be used in enterprise AI accounts with verified privacy policies. Examples: the Partner's internal priorities, information about client relationships (without specific financial details), operational processes, internal meeting notes.",
        "Red: highly sensitive information where a data breach could cause real harm. This should never be entered into any AI tool — it should be handled manually or through specifically approved secure systems. Examples: financial accounts, health or personal data, legal documents under privilege, passwords and credentials, information covered by an NDA."
      ],
      "example": "You are preparing a briefing for a Partner's meeting with their bank. The meeting topic (amber — Partner-specific), the Partner's company overview (green — public), the specific account numbers and balances being discussed (red — never in AI). Use AI to draft the briefing structure and agenda, but manually add or handle any red information yourself.",
      "pro_tip": "When in doubt, classify up — treat amber as red until you can confirm the privacy settings of the tool you are using. The cost of over-caution is a slightly slower workflow. The cost of under-caution could be a data breach.",
      "watch_out": "Aggregated amber information can become red. Multiple individually non-sensitive facts about a client (size, location, revenue range, key contacts) combined in a single prompt can create a detailed profile that is sensitive in aggregate."
    },
    {
      "title": "Enterprise accounts — why they matter",
      "body": [
        "Consumer AI accounts (free-tier Claude, personal ChatGPT) typically use conversation data to improve their models. This means information you enter may be used in future training and may be accessible to the provider for model improvement purposes. For personal use, this is a reasonable tradeoff. For Partner data, it is unacceptable.",
        "Enterprise accounts change this equation. On Anthropic's enterprise plan, conversations are not used to train the model, data retention policies are explicit and shorter, and there are contractual protections (a Data Processing Agreement) that cover your organisation's liability.",
        "The rule is simple: any AI work involving amber or red information must use an enterprise account with a signed DPA. Summit 360 has enterprise accounts — use them. If you are ever in a situation where you want to use a personal account for convenience, ask yourself whether you would be comfortable if the Partner saw exactly what you entered. If not, do not enter it."
      ],
      "watch_out": "Enterprise accounts do not make red information safe to use in AI. They make amber information safe. Red information — financial details, credentials, health data, legally privileged documents — stays red regardless of account type."
    },
    {
      "title": "Hallucination discipline in high-stakes contexts",
      "body": [
        "In low-stakes contexts (drafting brainstorming, general research), a hallucination is an annoyance you catch in review. In high-stakes contexts — legal advice, financial figures, medical information, contractual details, compliance requirements — a hallucination that passes your review can have serious consequences.",
        "The three high-stakes hallucination scenarios for Pathfinders: (1) Regulatory and legal claims — AI confidently states a regulatory requirement that does not exist or has changed. Always verify legal and compliance claims against primary sources. (2) Financial figures — AI generates or extrapolates financial data that is not accurate. Never use AI-generated numbers in financial communications without primary source verification. (3) Third-party attributions — AI attributes quotes, statements, or positions to real people that they never said. Verify any specific quotes or cited positions before including them in Partner communications.",
        "The verification discipline: for any claim in an AI output that falls into one of these three categories, treat it as a hypothesis to verify, not a fact to use. Find the primary source. If you cannot find a primary source, remove the claim or flag it clearly."
      ],
      "pro_tip": "Add this instruction to every Project that involves high-stakes content: 'For any regulatory, legal, or financial claim in your output, add [verify] at the end of the sentence. This flags items that require primary source verification before use.'",
      "watch_out": "The most dangerous hallucinations are the ones that are almost right. A figure that is slightly wrong, a regulation that nearly applies, a quote that sounds like something that person would say — these pass casual review because they feel plausible. Slow down for the verify flags."
    }
  ],
  "kc": {
    "pass_score": 0.8,
    "items": [
      {
        "type": "mcq",
        "prompt": "A Partner asks you to use AI to draft a letter to their lawyer about a legal dispute. The letter references a specific contract clause. How should you classify this task?",
        "options": [
          "Green — legal correspondence is a standard business activity",
          "Amber — use enterprise account only",
          "Red — legally privileged content should not be entered into any AI tool",
          "It depends on how sensitive the clause is"
        ],
        "correct": 2,
        "explain": "Legally privileged documents and active legal disputes are red classification. This content should not be entered into any AI tool — draft the letter manually or handle through a specifically approved secure system."
      },
      {
        "type": "mcq",
        "prompt": "What is the difference between an enterprise AI account and a consumer account that makes enterprise mandatory for amber information?",
        "options": [
          "Enterprise accounts have more powerful AI models",
          "Enterprise accounts do not use conversation data for model training and have contractual data protections",
          "Enterprise accounts are faster and have better uptime",
          "Consumer accounts are fine for amber information — the enterprise account only matters for red"
        ],
        "correct": 1,
        "explain": "The key enterprise account protections are: no conversation data used for training, explicit data retention policies, and a signed Data Processing Agreement. These protections are what make amber information appropriate for enterprise AI use."
      },
      {
        "type": "mcq",
        "prompt": "AI outputs a specific regulatory requirement that seems relevant to your Partner's compliance question. What should you do?",
        "options": [
          "Use it — Claude is trained on extensive legal and regulatory sources",
          "Use it if it sounds right based on your general knowledge",
          "Treat it as a hypothesis and verify it against the primary regulatory source before using it",
          "Ask Claude to confirm it is correct with a follow-up prompt"
        ],
        "correct": 2,
        "explain": "Regulatory claims are a high-stakes hallucination scenario. Always verify against the primary source (the actual regulation, official guidance, or a qualified professional). A follow-up Claude prompt asking if it is correct is not verification — Claude cannot verify its own hallucinations."
      },
      {
        "type": "mcq",
        "prompt": "Which of the following represents 'aggregation making amber into red'?",
        "options": [
          "Using green information in an enterprise account",
          "Combining a client's name, revenue estimate, location, and key personnel into a single AI prompt",
          "Uploading a public annual report to Claude",
          "Using AI to draft a client proposal based on a public brief"
        ],
        "correct": 1,
        "explain": "Individually, each piece of client information might be amber or even green. Combined, they create a detailed client profile that is sensitive in aggregate — it could identify a specific deal, a commercial relationship, or internal information that was never meant to be shared."
      },
      {
        "type": "open",
        "prompt": "Describe your personal AI safety protocol as a Pathfinder. How will you classify information before using AI, what tools will you use for each category, and what verification steps will you take for high-stakes content?",
        "answer": "Classification: before any AI task, identify the most sensitive piece of information involved and classify the whole task at that level. Green: any tool, including personal accounts for truly non-sensitive tasks. Amber: enterprise Claude only, with conversation privacy confirmed. Red: no AI tool — handle manually or through approved secure systems. Tool selection: default to Summit 360 enterprise Claude for all work-related AI. Never use personal accounts for Partner work, regardless of convenience. Verification protocol: for any AI output that includes regulatory, legal, or financial claims, add a [verify] review step before the output leaves my screen. For each [verify] item, find the primary source. If no primary source can be found, remove or explicitly flag the claim. For drafts going to external parties, run a final voice check and a hallucination check before sending."
      }
    ]
  }
}$pf14$::jsonb WHERE code = 'PF14';

-- ─── PF15 ────────────────────────────────────────────────────────────────────
UPDATE public.modules SET content = $pf15${
  "overview_html": "<p>You have completed 14 modules. You now have a mental model, a toolkit, and a set of skills that most EAs and VAs in the world do not have. The Capstone module asks you to do one thing: make it yours.</p><p>The Pathfinder AI Playbook is a 10–15 page personal document that captures your AI principles, your Partner template, and your prompt library. It is the document you would give to someone who is taking over your role. It is also the document you refer back to whenever a new engagement starts, whenever you face an unfamiliar AI task, or whenever you need to explain how you work to a new Partner.</p><p>You have 60 minutes. Build it.</p>",
  "outcomes": [
    "Write your personal AI principles — the beliefs that guide how you use AI in every engagement",
    "Build a Partner onboarding template that uses everything from PF10",
    "Compile a prompt library of your 10 most useful prompts",
    "Document your triage and daily rhythm system from PF11",
    "Complete and submit your Pathfinder AI Playbook"
  ],
  "topics": [
    {
      "title": "Section 1 — Your AI principles (1–2 pages)",
      "body": [
        "Principles are not rules — they are beliefs that guide decisions in situations you have not encountered before. A rule tells you what to do in known situations. A principle tells you how to think in unknown ones.",
        "Your AI principles should cover: your view on the relationship between AI and judgment (from PF01); your commitments around data privacy and classification (from PF14); your standards for review and ownership of AI-assisted work; and how you will handle situations where AI produces something you are uncertain about.",
        "Write these in the first person. They are yours. A principle written as 'Pathfinders should...' is an obligation. A principle written as 'I believe...' or 'I commit to...' is an identity statement. The latter is much more durable."
      ],
      "example": "Example principle: 'I believe AI amplifies my judgment, not replaces it. Every output that reaches a Partner or their network carries my name, regardless of how it was produced. I take full responsibility for everything I send.'",
      "pro_tip": "Write your principles before your tools section. Principles shape how you use tools. If you start with tools, your playbook becomes a manual — useful but not durable. If you start with principles, your playbook becomes a compass."
    },
    {
      "title": "Section 2 — Partner onboarding template (3–4 pages)",
      "body": [
        "This section is a reusable template for starting any new Partner engagement. It should include: the discovery call question framework (from PF10), the Partner Profile template with all five layers (from PF09), the day-one setup checklist (from PF10), and the first-week update rhythm.",
        "Make it specific enough to use — not a description of what you would do, but the actual documents and prompts. The discovery call questions should be written out. The Partner Profile template should have the headings and example text filled in. The setup checklist should have checkboxes.",
        "This is the section you will update most over time as you refine your onboarding process with each new engagement."
      ],
      "watch_out": "Do not over-engineer the template. A template you actually use beats a perfect one you never open. Start with what you have from this course and refine it after your next onboarding."
    },
    {
      "title": "Section 3 — Your prompt library (4–6 pages)",
      "body": [
        "A prompt library is a collection of your best, tested prompts — the ones that reliably produce useful output. It is organised by task type and includes notes on when to use each prompt, what inputs it needs, and any important caveats.",
        "The minimum prompt library for a Pathfinder should include: an email triage prompt, a pre-meeting briefing prompt, a meeting follow-up prompt, a voice-matched draft prompt, a research brief prompt, an end-of-day summary prompt, and a general CRAFT-structured prompt template.",
        "For each prompt, include: the prompt text (with placeholders for variable content), the task type it is designed for, what inputs you need to prepare, and the expected output format. Prompts without notes become hard to use after 3 months."
      ],
      "pro_tip": "Your prompt library is a living document. Add a new prompt every time you write one that produces an excellent result. Review and prune it quarterly — prompts that no longer work or that you never use should be removed or updated."
    },
    {
      "title": "Section 4 — Your daily rhythm (2–3 pages)",
      "body": [
        "Document the operating system you built in PF11: your morning triage process (with the A/B/C/D system and the AI prompt you use), your calendar protection rules (the five rules from PF11 plus any Partner-specific additions), and your end-of-day close format.",
        "This section serves two purposes. First, it is a personal reference when your rhythm gets disrupted (post-holiday, new Partner, high-intensity week). Second, it is what you share with a Partner who asks how you work — it builds confidence and sets clear expectations.",
        "Be honest about what your rhythm actually is, not what you aspire to. A realistic rhythm you follow is worth ten ideal ones you abandon after two days."
      ]
    }
  ],
  "walkthrough_intro": "Build your Playbook in four passes — one section at a time.",
  "walkthrough": [
    { "title": "Pass 1 — Principles (15 min)", "body": "Open a blank document. Write the heading 'My AI Principles.' Write five principles in the first person, drawing on what resonated most from PF01, PF03, and PF14. Do not edit — write a rough draft first." },
    { "title": "Pass 2 — Partner template (15 min)", "body": "Add the Partner onboarding template section. Copy in your best discovery call questions, the five-layer Profile structure, and your day-one checklist. Fill in any examples from a real or practice Partner." },
    { "title": "Pass 3 — Prompt library (20 min)", "body": "Add your prompt library. Start with the seven minimum prompts. For each one, write the prompt text with placeholders, the task type, required inputs, and expected output. These should be prompts you have actually tested." },
    { "title": "Pass 4 — Daily rhythm (10 min)", "body": "Add your daily rhythm section. Write your morning triage process, your calendar protection rules, and your end-of-day close format. Be specific and honest about what you actually do." },
    { "title": "Final review", "body": "Read the Playbook from the top. Is it specific enough to be useful? Would someone new to your role understand how you work? Are the prompts actually tested? Make final adjustments and save it somewhere you will find it." }
  ],
  "practice": [
    {
      "label": "Playbook first draft",
      "html": "<p>Use Claude to help you build the first draft. Start with this prompt: <em>'I am building a Pathfinder AI Playbook — a personal document capturing my AI principles, Partner onboarding template, prompt library, and daily rhythm. I have completed 14 modules of the Summit 360 AI Academy. Help me build Section 1: My AI Principles. Ask me three questions to surface what I believe about AI and judgment, then draft five principles in my voice based on my answers.'</em> Then repeat the process for each section.</p>"
    }
  ],
  "kc": {
    "pass_score": 0.8,
    "items": [
      {
        "type": "mcq",
        "prompt": "What is the difference between a rule and a principle?",
        "options": [
          "Rules are more important than principles",
          "A rule guides known situations; a principle guides thinking in unknown ones",
          "Principles are optional; rules are mandatory",
          "Rules are personal; principles are shared by the whole organisation"
        ],
        "correct": 1,
        "explain": "Principles guide judgment in novel situations — they are durable because they address the 'how to think' rather than the 'what to do.' Rules become outdated as situations change; principles remain relevant."
      },
      {
        "type": "mcq",
        "prompt": "Why should you write your AI principles before the tools section of your Playbook?",
        "options": [
          "Principles are shorter and easier to write",
          "Principles shape how you use tools — leading with tools produces a manual, not a compass",
          "The tools section requires partner information that takes longer to gather",
          "There is no particular reason — the order does not matter"
        ],
        "correct": 1,
        "explain": "Principles define your approach to AI and shape every tool decision. Writing them first grounds the rest of the Playbook in your values. Starting with tools produces a feature list that quickly becomes outdated."
      },
      {
        "type": "mcq",
        "prompt": "How should you approach your prompt library — what makes it useful over time?",
        "options": [
          "Add every prompt you ever write — more is better",
          "Include only prompts you have actually tested, with notes on inputs and expected outputs, reviewed quarterly",
          "Keep it to five prompts maximum to avoid complexity",
          "Copy prompts from AI prompt libraries online rather than building your own"
        ],
        "correct": 1,
        "explain": "A useful prompt library contains tested prompts with context on when and how to use them. Untested prompts, prompts without notes, and prompts you never use make the library harder to use, not more useful."
      },
      {
        "type": "mcq",
        "prompt": "What is the primary audience for your Pathfinder AI Playbook?",
        "options": [
          "Your Summit 360 manager, for performance review purposes",
          "Future Partners, to impress them with your systems",
          "Your future self — the document you refer back to in new engagements or challenging situations",
          "The Summit 360 Academy, to be used as training material"
        ],
        "correct": 2,
        "explain": "The Playbook is primarily a personal reference tool — the document you consult when starting a new engagement, facing an unfamiliar task, or needing to explain your approach. Its durability depends on how honest and specific it is about how you actually work."
      },
      {
        "type": "open",
        "prompt": "Write your five AI principles. Each should be in the first person, specific enough to guide a real decision, and reflect something you genuinely believe based on what you have learned in this Academy.",
        "answer": "Example principles: (1) I believe AI amplifies my judgment — not replaces it. Every output that reaches a Partner carries my name and my accountability. (2) I commit to classifying information before every AI task. Nothing amber or red goes into a consumer account. When in doubt, I classify up. (3) I treat every factual claim in AI output as a hypothesis until I verify it against a primary source. Speed does not justify risk for high-stakes content. (4) I build Partner context deliberately — before I ask AI to help with a Partner task, I ask whether I have given it enough context to do the task well. If not, I build it first. (5) I own my craft. AI is my most capable tool, but the quality of my work is determined by the quality of my judgment, not the capability of the model I use."
      }
    ]
  },
  "further": [
    { "title": "Ethan Mollick — One Useful Thing", "url": "https://www.oneusefulthing.org", "note": "Weekly AI insights from a Wharton professor — the best ongoing source for practical AI thinking." },
    { "title": "Anthropic — Responsible AI use", "url": "https://www.anthropic.com/responsible-disclosure-policy", "note": "Anthropic's published approach to AI safety — useful context for your principles section." }
  ]
}$pf15$::jsonb WHERE code = 'PF15';
