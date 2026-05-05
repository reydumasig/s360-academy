-- Sprint 3: Module content PF06–PF10

-- ─── PF06 ────────────────────────────────────────────────────────────────────
UPDATE public.modules SET content = $pf06${
  "overview_html": "<p>Claude Code is Anthropic's terminal-based coding agent. For Pathfinders, you do not need to be a developer to benefit from it — but you do need to understand what it does so you can help your Partners use it, explain its capabilities, and recognise when it is the right tool for a task.</p><p>The second half of this module is equally important: a 30-minute train-the-trainer framework for introducing AI tools to a Summit Partner who is not yet using them. One of the highest-value things a Pathfinder can do is help their Partner get real leverage from AI — and doing that well requires a structured approach.</p>",
  "outcomes": [
    "Explain what Claude Code does and when it is the right tool for a task",
    "Identify Partner tasks that Claude Code can accelerate (even without deep technical knowledge)",
    "Use the 30-minute train-the-trainer script to introduce AI to a new Partner",
    "Handle the most common Partner objections to AI adoption",
    "Set up a Partner's first Claude Project together in a live session"
  ],
  "topics": [
    {
      "title": "Claude Code — what it does and why it matters",
      "body": [
        "Claude Code is a terminal application that allows Claude to read, write, and execute code in your development environment. For technical Partners or Partners with technical teams, it is a significant productivity tool — capable of writing scripts, automating file operations, building integrations, and reviewing codebases.",
        "For non-technical Pathfinders, the key is to understand Claude Code well enough to (a) recognise when a Partner's problem could be solved with it, and (b) brief a technical contractor on how to use it effectively if the Partner needs that support.",
        "Common use cases Pathfinders encounter: a Partner wants to automate a repetitive spreadsheet task; a Partner's team needs a simple script to process data exports; a Partner wants to build a basic internal tool. In each case, Claude Code dramatically reduces the time and cost compared to traditional development."
      ],
      "example": "A Partner runs a weekly process that involves downloading a CSV from their CRM, filtering it, and uploading it to a reporting tool. Manually this takes 45 minutes. A Claude Code script that does it automatically takes about 20 minutes to build and runs in seconds thereafter. You do not need to write the script yourself — you need to identify the opportunity and connect the Partner to the right resource.",
      "pro_tip": "Even if you will not use Claude Code yourself, know the right prompts to describe a technical task. 'Write a Python script that...' followed by a clear description of the input, output, and any constraints will get a useful response from any LLM.",
      "watch_out": "Never run code on a Partner's systems without testing it first. Always review what a script does before executing it — even AI-generated code can have unintended side effects."
    },
    {
      "title": "The 30-minute Partner AI onboarding",
      "body": [
        "The most impactful thing many Pathfinders can do is not to use AI themselves — it is to help their Partner start using it. A Partner who adopts AI tools, even at a basic level, multiplies the leverage available across the entire relationship.",
        "The 30-minute onboarding is designed to take a Partner from zero to their first real AI win in a single session. It follows four phases: (1) ground the conversation in the Partner's specific pain points, not AI features; (2) demonstrate with a real task from the Partner's world; (3) set up their first Project together; (4) agree on two or three tasks they will try themselves before your next check-in.",
        "The key to success is keeping the session Partner-centric, not tool-centric. You are not giving a product demo — you are solving a problem they already have."
      ],
      "pro_tip": "Before the session, identify one task the Partner does regularly that is tedious and language-based. Use that as your demo task. Seeing AI solve their actual problem is worth more than any generic demonstration.",
      "watch_out": "Do not overwhelm Partners with features. One tool, one use case, one win. Complexity is the enemy of adoption."
    },
    {
      "title": "Handling Partner objections",
      "body": [
        "Three objections appear in almost every Partner AI conversation. The first is the time objection: 'I do not have time to learn a new tool.' The response: 'We are not adding a tool — we are replacing 20 minutes of [specific task] with 2 minutes. Let me show you right now.'",
        "The second is the quality objection: 'AI will not write the way I write.' The response: 'You are right — until we train it. Give me one email you wrote that you are proud of and I will show you how to use it as a template.'",
        "The third is the privacy objection: 'I do not want my information in some AI database.' The response: 'On our enterprise account, nothing you type is used to train the model. Your data stays private.' If they remain concerned, stick to non-sensitive tasks until trust is built."
      ],
      "watch_out": "Never dismiss a Partner's privacy concerns — they are legitimate. Acknowledge them, explain the enterprise safeguards, and start with low-sensitivity tasks. Trust is built through experience, not reassurance."
    }
  ],
  "walkthrough_intro": "The 30-minute Partner AI onboarding session — step by step.",
  "walkthrough": [
    { "title": "Before the session (5 min)", "body": "Identify one tedious, language-based task the Partner does regularly. Prepare a demo using that exact task. Open Claude and set up a skeleton Project with the Partner's name — you will fill it in together." },
    { "title": "Open with the problem (5 min)", "body": "Ask: 'What is the most repetitive writing or research task you do every week?' Let them describe it. This is your anchor. Everything in the session should connect back to this." },
    { "title": "Live demonstration (10 min)", "body": "Using their task (or your prepared demo if they struggle to name one), show Claude solving it in real time. Narrate what you are doing: 'I am giving it context about you first... now I am asking it to draft... notice how it matched your tone because I told it your preferences.'" },
    { "title": "Set up the Project together (10 min)", "body": "Open a new Claude Project with the Partner present. Ask them to describe themselves in their own words — you type the Project instructions as they speak. Upload one or two reference documents they use often. Run one task together using the new Project." },
    { "title": "Agree on next steps (5 min)", "body": "Ask: 'Which two tasks will you try before we speak next?' Write these down and share them. Follow up in your next check-in by asking how those tasks went." }
  ],
  "kc": {
    "pass_score": 0.8,
    "items": [
      {
        "type": "mcq",
        "prompt": "A Partner wants to automate a weekly data export and processing task. Which tool is most relevant?",
        "options": [
          "Claude Chat — good for any automation task",
          "Claude Code — can write and execute scripts to automate file and data workflows",
          "Claude Cowork — the only tool that can access files",
          "ChatGPT — better for technical tasks"
        ],
        "correct": 1,
        "explain": "Claude Code is specifically designed for code generation and execution. For automating file processing tasks, it is the appropriate tool — it can write, test, and run scripts directly."
      },
      {
        "type": "mcq",
        "prompt": "In the 30-minute Partner AI onboarding, what should you demonstrate first?",
        "options": [
          "All available AI tools and their features",
          "A generic AI demo that shows what is possible",
          "AI solving a specific task the Partner already does regularly",
          "The privacy and security settings of the enterprise account"
        ],
        "correct": 2,
        "explain": "The onboarding should be Partner-centric, not feature-centric. Demonstrating AI solving the Partner's actual problem creates immediate relevance and drives adoption."
      },
      {
        "type": "mcq",
        "prompt": "A Partner says 'AI will not write the way I write.' What is the best response?",
        "options": [
          "Agree and suggest they stick to manual writing",
          "Explain that Claude is better than human writers",
          "Give them one email they wrote and show them how to use it as a training example",
          "Tell them to practice prompting more and the quality will improve"
        ],
        "correct": 2,
        "explain": "The quality objection is answered by demonstration, not explanation. Using the Partner's own writing as a few-shot example shows concretely how AI can match their voice."
      },
      {
        "type": "mcq",
        "prompt": "What should you NEVER do with AI-generated code on a Partner's systems?",
        "options": [
          "Test it before running on live data",
          "Execute it without reviewing what it does first",
          "Ask Claude to explain what the code does",
          "Use it for repetitive data processing tasks"
        ],
        "correct": 1,
        "explain": "AI-generated code can have unintended side effects. Always review what a script does before executing it on any system — especially one belonging to or affecting a Partner."
      },
      {
        "type": "open",
        "prompt": "Write a 3-sentence pitch you would use to introduce AI tools to a Partner who has never used them. The pitch should connect to a real problem they have, not to AI features.",
        "answer": "Example: 'I have been looking at the two hours you spend every week preparing for the Monday leadership call — pulling numbers from three different places, formatting them, and writing the summary. I think we can get that down to 20 minutes, and the first time I show you it might actually be closer to 10. Can I take 30 minutes with you before next Monday to set it up?'"
      }
    ]
  },
  "further": [
    { "title": "Claude Code documentation", "url": "https://docs.anthropic.com/en/docs/claude-code/overview", "note": "Official guide to Claude Code capabilities and setup." }
  ]
}$pf06$::jsonb WHERE code = 'PF06';

-- ─── PF07 ────────────────────────────────────────────────────────────────────
UPDATE public.modules SET content = $pf07${
  "overview_html": "<p>Most AI frustrations come from prompts that are too vague, too short, or missing critical context. The CRAFT framework is a five-component structure that turns a mediocre prompt into a great one — and it works for every task, from a quick email draft to a complex strategic brief.</p><p>CRAFT stands for Context, Role, Audience, Format, Task. Spend the next 40 minutes learning it deeply. It is the single highest-leverage skill in the entire Academy.</p>",
  "outcomes": [
    "Define each of the five CRAFT components and explain why each matters",
    "Write a CRAFT prompt for any common Pathfinder task",
    "Identify which CRAFT components are missing from a weak prompt",
    "Apply CRAFT to improve an existing prompt you use regularly",
    "Evaluate the quality of a prompt before you send it"
  ],
  "topics": [
    {
      "title": "C — Context",
      "body": [
        "Context is the background information the AI needs to give you a relevant, accurate response. It answers the question: what does Claude need to know about the situation to respond well?",
        "Context includes: who the relevant parties are, what has happened so far, what constraints or preferences matter, and any relevant history. The more specific the context, the more specific the output.",
        "A common mistake is to assume Claude already knows the situation. It does not. Every prompt is a cold start unless you are working inside a Project that holds persistent context. Treat each prompt as if you are briefing a smart colleague who just joined the team today."
      ],
      "example": "Weak context: 'Write a follow-up email.' Strong context: 'I am an EA for Sarah Chen, CEO of a 50-person B2B SaaS company. She had a 30-minute call yesterday with Marcus Webb, a potential enterprise client. Marcus expressed interest but said his budget cycle does not open until Q4. Sarah wants to stay warm without being pushy.'",
      "pro_tip": "Keep a 'context clipboard' in your notes app — a short paragraph about each Partner you can paste as context at the start of any prompt. This halves your setup time.",
      "watch_out": "More context is usually better — but irrelevant context can confuse the model. Include what is necessary, not everything you know."
    },
    {
      "title": "R — Role",
      "body": [
        "Role tells Claude what persona or expertise to bring to the task. When you give Claude a role, it shifts its language, tone, assumptions, and level of detail to match that persona.",
        "For Pathfinder tasks, useful roles include: 'experienced executive assistant,' 'professional business writer,' 'senior project manager,' 'experienced researcher,' or even 'a critical reviewer looking for weaknesses.'",
        "Role is especially powerful for tasks that require a specific professional standard. Asking Claude to write 'as an experienced executive assistant who has worked with C-suite leaders for 15 years' produces output that feels more practiced and polished than a generic prompt."
      ],
      "example": "Prompt without role: 'Write a summary of this meeting.' With role: 'You are an experienced executive assistant known for concise, action-focused meeting summaries. Write a summary of this meeting.' The second prompt consistently produces tighter, more decision-oriented output.",
      "pro_tip": "Combine role with context for maximum effect. The role sets the expertise level; the context sets the situation. Together they narrow the output to exactly what you need."
    },
    {
      "title": "A — Audience",
      "body": [
        "Audience tells Claude who will read or receive the output. This is distinct from context — context is about the situation, audience is about the reader's needs, knowledge level, and expectations.",
        "Getting the audience right changes everything: the vocabulary level, the amount of background explanation, the formality of tone, and the appropriate call to action. Writing for a CEO is different from writing for a team member. Writing for a client is different from writing for a colleague.",
        "Be specific about the audience. 'Write for a business audience' is weak. 'Write for a CFO who is time-pressed, financially sophisticated, and sceptical of new initiatives' is strong — Claude can actually calibrate to that."
      ],
      "example": "Audience: 'The reader is Marcus Webb, VP of Finance at a 200-person manufacturing company. He is data-driven, direct, and has been burned by vendor overpromises. Write to earn his trust, not to impress him.'",
      "watch_out": "If you do not specify an audience, Claude defaults to a generic professional register that often reads as slightly too formal or too generic for the actual recipient."
    },
    {
      "title": "F — Format",
      "body": [
        "Format specifies the structure and length of the output. This is the component most people skip — and then they wonder why the output is not quite right.",
        "Format includes: length (short/medium/long, or specific word counts), structure (bullet points, numbered list, prose paragraphs, table, email format), tone (formal/informal/warm/direct), and any specific sections you need.",
        "When in doubt, specify a format that matches how the output will be used. If it will be pasted into an email, ask for email format. If it will be turned into a slide, ask for bullet points under clear headings."
      ],
      "example": "Format instruction: 'Write as a professional email of no more than 150 words. Use a warm but direct tone. Include: one sentence of context, the key message, one clear next step, and a polite close.'",
      "pro_tip": "The format component is also where you set constraints: 'do not use jargon,' 'avoid passive voice,' 'no em dashes,' 'do not start with I.' These small constraints significantly improve output quality."
    },
    {
      "title": "T — Task",
      "body": [
        "Task is the actual instruction — what you want Claude to do. It sounds obvious, but many prompts fail because the task is vague or implies multiple conflicting actions.",
        "A strong task instruction is specific and uses an action verb: draft, summarise, analyse, compare, extract, rewrite, translate, create, review. A weak task is ambiguous: 'help me with,' 'write something about,' 'look at this.'",
        "If the task has multiple parts, state them explicitly and in order. 'First X, then Y, finally Z' is clearer than embedding all three into a single complex sentence."
      ],
      "example": "Weak task: 'Can you help me with this report?' Strong task: 'Read this report and do three things: (1) summarise the key findings in five bullet points; (2) identify the three biggest risks; (3) draft a one-paragraph executive summary I can use in a cover email to the board.'",
      "watch_out": "If you ask Claude to do too many things in one prompt, it will do all of them at a lower quality than if you had asked for one thing at a time. For complex tasks, break them into sequential prompts."
    }
  ],
  "practice_intro": "Apply CRAFT to a real task.",
  "practice": [
    {
      "label": "Build a CRAFT prompt from scratch",
      "html": "<p>Choose a task you regularly do for a Partner. Write a full CRAFT prompt for it by explicitly labelling each component: <strong>Context:</strong> [background info] | <strong>Role:</strong> [persona] | <strong>Audience:</strong> [who reads this] | <strong>Format:</strong> [structure and length] | <strong>Task:</strong> [specific action verb + instruction]. Then paste it into Claude and compare the output to your usual prompt. Note the difference.</p>"
    },
    {
      "label": "Diagnose a weak prompt",
      "html": "<p>Take a prompt you have used recently that did not give you the output you wanted. Label which CRAFT components were present and which were missing. Rewrite it with all five components and run it again. Document what changed.</p>"
    }
  ],
  "kc": {
    "pass_score": 0.8,
    "items": [
      {
        "type": "mcq",
        "prompt": "What does the 'R' in CRAFT stand for and what does it do?",
        "options": [
          "Result — it tells Claude what output you expect",
          "Role — it assigns a persona or expertise level for Claude to adopt",
          "Review — it asks Claude to check its own output",
          "Request — it is another word for the task instruction"
        ],
        "correct": 1,
        "explain": "Role assigns Claude a persona or expertise level, which shapes its vocabulary, tone, and assumptions. It is distinct from the Task, which is the specific instruction."
      },
      {
        "type": "mcq",
        "prompt": "Which CRAFT component is most commonly skipped and leads to outputs that are too generic or the wrong length?",
        "options": [
          "Context",
          "Role",
          "Audience",
          "Format"
        ],
        "correct": 3,
        "explain": "Format is the most commonly skipped component. Without it, Claude defaults to a generic structure and length that often does not match how the output will actually be used."
      },
      {
        "type": "mcq",
        "prompt": "What is the difference between Context and Audience in a CRAFT prompt?",
        "options": [
          "They are the same thing described differently",
          "Context is about the situation; Audience is about who will read the output",
          "Context is for the AI; Audience is for the human reviewer",
          "Context comes after the task; Audience comes first"
        ],
        "correct": 1,
        "explain": "Context provides background about the situation — what has happened, who the parties are. Audience specifies who will receive the output, which determines tone, vocabulary, and level of explanation."
      },
      {
        "type": "mcq",
        "prompt": "You ask Claude to 'help me with this report' and the output is unfocused. Which CRAFT component is most obviously missing?",
        "options": [
          "Context",
          "Role",
          "Format",
          "Task"
        ],
        "correct": 3,
        "explain": "The task instruction is too vague — 'help me with' does not specify an action. A strong task uses a specific action verb: summarise, analyse, draft, extract. Without a clear task, Claude cannot focus its output."
      },
      {
        "type": "open",
        "prompt": "Write a complete CRAFT prompt for the following situation: Your Partner has just finished a difficult call with a client who is unhappy with project delays. Your Partner wants to send an email that acknowledges the concern, explains the new timeline, and keeps the relationship warm. Label each CRAFT component explicitly.",
        "answer": "Context: My Partner James is a consulting firm director. His client, Natalie Thornton (Marketing Director, GlobalTech), is frustrated about a two-week delay on the brand strategy deliverable. The delay was caused by a key team member being ill. The relationship with Natalie is 18 months old and generally strong. | Role: You are an experienced executive communications professional who specialises in managing client relationships through difficult moments. | Audience: Natalie Thornton, a senior client who values directness and action. She is frustrated but invested in the relationship. She needs to feel heard and to have clear next steps. | Format: A professional email of 150-200 words. Warm but direct tone. Three paragraphs: acknowledgment, explanation with new timeline, forward-looking close. No excuses, no over-apologising. | Task: Draft the email from James's perspective. It should acknowledge the delay sincerely, give the specific new deadline (three weeks from today), and close with a concrete next step."
      }
    ]
  },
  "further": [
    { "title": "Anthropic prompt engineering guide", "url": "https://docs.anthropic.com/en/docs/build-with-claude/prompt-engineering/overview", "note": "Official deep-dive into prompt construction from the people who built Claude." }
  ]
}$pf07$::jsonb WHERE code = 'PF07';

-- ─── PF08 ────────────────────────────────────────────────────────────────────
UPDATE public.modules SET content = $pf08${
  "overview_html": "<p>CRAFT (from PF07) gives you the foundation. Advanced prompting techniques give you the ceiling. The three techniques in this module — few-shot examples, system rules, and chain-of-thought reasoning — each reliably upgrade output quality for specific types of tasks. Together, they make a Pathfinder's prompts ten times more powerful than the average user's.</p><p>These are not tricks. They are techniques grounded in how language models process information. Understanding why they work helps you apply them correctly, not just follow a formula.</p>",
  "outcomes": [
    "Write effective few-shot prompts using examples from a Partner's real work",
    "Use system rules to set standing constraints that apply across a task",
    "Apply chain-of-thought reasoning to complex analytical or decision tasks",
    "Combine all three techniques with the CRAFT framework",
    "Identify which technique is most appropriate for a given task type"
  ],
  "topics": [
    {
      "title": "Few-shot prompting — teach by example",
      "body": [
        "A few-shot prompt provides the AI with examples of the desired output before asking it to produce the actual output. Instead of describing what you want, you show it. This is the most powerful technique for tasks that require a specific voice, format, or style.",
        "The pattern is: example one [input → output], example two [input → output], now do this [new input]. Claude learns the pattern from your examples and applies it to the new task — much more reliably than if you tried to describe the pattern in words.",
        "For Pathfinders, the most valuable application is voice matching. Give Claude two or three emails written by your Partner and it will begin to replicate their tone, sentence structure, and vocabulary in new drafts — far better than any description of their 'direct but warm' style."
      ],
      "example": "Few-shot voice prompt: 'Here are two emails Sarah has written recently. Study her tone and style. [Email 1]. [Email 2]. Now draft a new email in Sarah's exact voice for the following situation: [new situation].' The output will sound like Sarah, not like generic AI.",
      "pro_tip": "Use three examples when possible — two minimum. One example is not enough for the model to identify a pattern reliably. Five or more can start to constrain the model too narrowly.",
      "watch_out": "The examples you choose shape the output. If your examples are formal, the output will be formal. Choose examples that represent the style you want for the specific task, not just any examples from the Partner."
    },
    {
      "title": "System rules — standing constraints that never change",
      "body": [
        "System rules are standing instructions that apply to every response in a session or Project. They are different from per-prompt instructions because they are always in effect — you set them once and they shape every output until you change them.",
        "In Claude Projects, system rules live in the Project instructions. In a regular chat, you state them at the top of the conversation. Common system rules for Pathfinder work: 'Never use passive voice,' 'Always flag factual claims you are uncertain about with [verify],' 'Do not use the word leverage,' 'Lead with the key point, never bury it.'",
        "System rules are especially useful for Partners who have strong style preferences or who operate in regulated industries where certain words or phrases need to be avoided. Set the rules once; benefit from them on every output."
      ],
      "example": "System rules for a financial services Partner: 'Never make specific investment recommendations. Always use hedging language for forward-looking statements (e.g., \"may,\" \"could,\" \"is expected to\"). Flag any regulatory terms with [check compliance]. Keep all client communications to plain English — no jargon.'",
      "pro_tip": "Build a personal library of system rules that you apply by default for specific task types. Drafting rules, research rules, summarisation rules. Copy-paste the relevant set at the start of each relevant session."
    },
    {
      "title": "Chain-of-thought — unlock complex reasoning",
      "body": [
        "Chain-of-thought (CoT) prompting asks Claude to reason through a problem step by step before giving an answer. For simple tasks, this slows things down. For complex tasks — analysis, decisions, multi-step problems — it significantly improves accuracy and catches errors that would appear in a single-step response.",
        "The simplest CoT trigger is: 'Think through this step by step before giving your final answer.' This instruction alone can double the accuracy of complex reasoning tasks. You can also be more specific: 'First analyse the risks, then weigh them against the benefits, then give your recommendation.'",
        "CoT is most valuable for: analysing a complex proposal, working through a scheduling or logistics problem, reasoning about a multi-party negotiation, or evaluating a decision with multiple competing factors."
      ],
      "example": "Without CoT: 'Should Sarah accept this partnership offer?' → Claude gives a direct yes/no with limited reasoning. With CoT: 'Analyse this partnership offer step by step. First, identify the three main commercial terms. Second, assess each term against Sarah's stated priorities. Third, identify any red flags. Fourth, give a recommendation with the key condition for acceptance.' → Claude produces a structured analysis Sarah can actually use.",
      "pro_tip": "When you need a decision recommendation from Claude, always use CoT. The step-by-step structure forces the model to surface its reasoning, which makes it easier for you to spot where the logic breaks down.",
      "watch_out": "CoT produces longer responses. For simple tasks, it is overkill and wastes tokens. Reserve it for genuinely complex problems where the reasoning process matters."
    }
  ],
  "practice": [
    {
      "label": "Few-shot voice exercise",
      "html": "<p>Find two emails or messages written by a current or recent Partner. Paste them into Claude as few-shot examples. Then ask Claude to draft a new communication in that same voice for a situation relevant to that Partner. Compare the output to what you would get without the examples.</p>"
    },
    {
      "label": "Chain-of-thought decision",
      "html": "<p>Take a real decision or recommendation you recently had to make for a Partner. Prompt Claude with chain-of-thought instructions: 'Think through this step by step. First [X], then [Y], finally [Z]. Give your recommendation last.' Compare the quality of the analysis to a direct question.</p>"
    }
  ],
  "kc": {
    "pass_score": 0.8,
    "items": [
      {
        "type": "mcq",
        "prompt": "What is the primary purpose of few-shot prompting?",
        "options": [
          "To limit the length of Claude's responses",
          "To teach Claude a pattern or style by showing examples before the actual task",
          "To speed up Claude's response time",
          "To ask Claude multiple questions in one prompt"
        ],
        "correct": 1,
        "explain": "Few-shot prompting uses examples to teach Claude a desired pattern or style. It is more effective than describing the pattern in words, especially for tasks requiring specific voice or format."
      },
      {
        "type": "mcq",
        "prompt": "You want Claude to always flag uncertain facts and never use passive voice across an entire Partner Project. Where should you set these instructions?",
        "options": [
          "At the end of every individual prompt as a reminder",
          "In the Project instructions as system rules that apply to every conversation",
          "In a separate document that you paste in each time",
          "System rules are not supported in Claude"
        ],
        "correct": 1,
        "explain": "Project instructions act as system rules that apply across every conversation in the project. Setting standing constraints there means you never need to repeat them in individual prompts."
      },
      {
        "type": "mcq",
        "prompt": "For which task type is chain-of-thought prompting MOST valuable?",
        "options": [
          "Reformatting a bullet list into a paragraph",
          "Translating a short document from one language to another",
          "Analysing a complex business proposal and recommending whether to proceed",
          "Drafting a one-sentence email subject line"
        ],
        "correct": 2,
        "explain": "Chain-of-thought is most valuable for complex reasoning tasks where the steps of the analysis matter and errors can compound. Simple reformatting or translation tasks do not benefit from the overhead."
      },
      {
        "type": "mcq",
        "prompt": "How many examples is the recommended minimum for effective few-shot prompting?",
        "options": [
          "One is always enough",
          "Two minimum, three for best results",
          "At least ten examples are needed",
          "Examples are not necessary if the task description is clear"
        ],
        "correct": 1,
        "explain": "Two examples are the minimum to establish a pattern; three gives the model enough signal to reliably replicate it. One example is often insufficient for the model to identify what pattern you want."
      },
      {
        "type": "open",
        "prompt": "Describe a Pathfinder task where you would use all three techniques together: few-shot examples, system rules, and chain-of-thought. Write the structure of the prompt (you do not need to fill in all the content, just describe each component).",
        "answer": "Task: preparing a weekly executive briefing for a Partner. System rules (in Project instructions): 'Lead with the most important item. Use a maximum of three bullet points per section. Flag any factual claims with [verify]. Never use jargon.' Few-shot examples: paste the last two weekly briefings the Partner approved — these teach Claude the format, length, and level of detail expected. Chain-of-thought: 'Before writing the briefing, first identify the three most significant developments from this week. Then prioritise them by impact on the Partner's key objectives. Then draft the briefing in the format established by the examples.' The combination produces a briefing that matches the Partner's preferred format, follows the standing rules, and is grounded in a reasoned prioritisation of the week's events."
      }
    ]
  },
  "further": [
    { "title": "Anthropic — advanced prompt engineering", "url": "https://docs.anthropic.com/en/docs/build-with-claude/prompt-engineering/chain-of-thought", "note": "Technical deep-dive on chain-of-thought and other reasoning techniques." }
  ]
}$pf08$::jsonb WHERE code = 'PF08';

-- ─── PF09 ────────────────────────────────────────────────────────────────────
UPDATE public.modules SET content = $pf09${
  "overview_html": "<p>In PF04 you set up your first Claude Project. In this module, you will go deeper — learning how to architect a Project that serves as a genuine second brain for each Partner relationship. A well-built Project means Claude knows your Partner as well as you do before the first word of each conversation.</p><p>The difference between a good Project and a great Project is the depth and organisation of the context you maintain inside it. This module gives you the templates and principles to build Projects that compound in value over time.</p>",
  "outcomes": [
    "Build a complete Partner Project with all five context layers",
    "Write a Partner Profile that Claude can use to produce on-brand output immediately",
    "Organise reference documents inside a Project for easy retrieval",
    "Update and maintain Projects as Partner contexts evolve",
    "Use Projects to onboard a new Partner relationship from day one"
  ],
  "topics": [
    {
      "title": "The five context layers of a great Project",
      "body": [
        "A Partner Project is most useful when it is built in layers, each adding a different kind of context. The five layers are: (1) identity context — who the Partner is and what they do; (2) style context — how they communicate and what good looks like; (3) relationship context — the current state of the engagement and any ongoing priorities; (4) operational context — the tools, processes, and rhythms of their work; and (5) standing instructions — how you want Claude to behave when working on this Partner's tasks.",
        "Most Pathfinders build layers 1 and 2 but skip 3, 4, and 5. This is why they still need to provide a lot of context in each individual prompt. The more complete the Project, the less work each new conversation requires.",
        "Think of the Project as a living document that you update after every significant interaction with the Partner. After a strategy session, update layer 3. After a tool change, update layer 4. After you discover a formatting preference, update layer 2."
      ],
      "pro_tip": "Set a 5-minute 'Project update' in your calendar after every Partner call or meeting. Use this time to add any new context to the relevant layer before you forget it.",
      "watch_out": "Outdated context is worse than no context. If the Project says the Partner is preparing for a board meeting that happened three months ago, it will skew all your outputs. Keep it current."
    },
    {
      "title": "Writing the Partner Profile",
      "body": [
        "The Partner Profile is the most important document in any Project. It is the foundation that all five context layers build upon. A strong Partner Profile answers these questions: Who is this person professionally and personally (relevant to the work)? What do they care about most? How do they communicate — email, messages, calls, frequency? What does their ideal working relationship look like? What are their pet peeves?",
        "The Profile should be written in the second person, addressed to Claude directly: 'Sarah is...' or 'When working on tasks for Sarah, you should...' This makes it immediately actionable as context for Claude rather than reading like a biography.",
        "Include specific examples wherever possible. Not 'Sarah is direct' but 'Sarah leads every email with the most important point and uses short sentences. An example of her typical opening: [paste real example].' Specificity is what makes a Profile useful."
      ],
      "example": "Partner Profile extract: 'James Reyes is the MD of a 15-person executive search firm, Meridian Partners. He works long hours (typically 7am-8pm), communicates primarily by voice message and email, and prefers bullet points for anything over three items. He is currently preparing for a firm rebrand launching in Q3. His biggest frustration is other people's poor follow-through — always close with a clear next step and a deadline when drafting on his behalf. He will not read anything longer than one page unprompted.'",
      "watch_out": "Do not write the Profile from memory alone. Build it iteratively — start with what you know, then add specifics as you observe the Partner in action over the first few weeks."
    },
    {
      "title": "Reference documents and maintenance",
      "body": [
        "Beyond the Partner Profile, the most valuable documents to upload to a Project are: the Partner's company overview or pitch deck (for context on their business), a style guide or past writing samples (for voice matching), recurring meeting agendas (so Claude understands the rhythms), and any standing decision frameworks the Partner uses.",
        "Document organisation matters. Give each uploaded document a clear title that describes its purpose, not just its filename. 'James — company overview 2026' is more useful than 'Meridian_Pitch_v3_final.pdf' because Claude can reference it by the descriptive title in its responses.",
        "Projects require maintenance. Set a monthly reminder to review the Project context and update or remove anything that is no longer current. An outdated Project gives you false confidence — it feels like Claude knows the Partner when it actually knows a six-month-old version of them."
      ],
      "pro_tip": "When you notice Claude making an assumption that is slightly off, that is a signal to update the Project. Each correction you make permanently improves the outputs for every future conversation in that Project."
    }
  ],
  "walkthrough_intro": "Build a full five-layer Partner Project using this template.",
  "walkthrough": [
    { "title": "Layer 1 — Identity context", "body": "Write 3–5 sentences covering: name, title, company, industry, company size, and the Partner's primary professional focus. Include one sentence about their personal style in professional settings." },
    { "title": "Layer 2 — Style context", "body": "Write 3–5 sentences covering: preferred communication style, format preferences (bullets vs prose, short vs long), tone (formal/informal), and at least one specific example of their writing or communication you can paste in." },
    { "title": "Layer 3 — Relationship context", "body": "Write 3–5 sentences covering: current engagement priorities, any significant context for the next 4–6 weeks, the state of key relationships (clients, team members, stakeholders) that may come up in your work." },
    { "title": "Layer 4 — Operational context", "body": "Write 2–3 sentences covering: tools the Partner uses (calendar, CRM, project management), key recurring meetings, and any operational rhythms that affect how you work with them." },
    { "title": "Layer 5 — Standing instructions", "body": "Write 3–5 specific instructions for Claude: what to always do, what to never do, how to flag uncertainty, and any standing quality standards that apply to everything produced for this Partner." }
  ],
  "kc": {
    "pass_score": 0.8,
    "items": [
      {
        "type": "mcq",
        "prompt": "Which of the five Project context layers do most Pathfinders skip, leaving gaps in the context Claude has?",
        "options": [
          "Identity context and style context",
          "Relationship context, operational context, and standing instructions",
          "All five layers are commonly skipped",
          "Only the style context layer is commonly missed"
        ],
        "correct": 1,
        "explain": "Most Pathfinders build the identity and style layers but skip relationship context (current priorities), operational context (tools and rhythms), and standing instructions (how Claude should behave). These three layers are what make a Project truly powerful."
      },
      {
        "type": "mcq",
        "prompt": "Why is specificity critical in a Partner Profile?",
        "options": [
          "It makes the document longer and more comprehensive",
          "Specific examples allow Claude to replicate patterns, not just interpret vague descriptions",
          "It helps other Pathfinders understand the Partner",
          "Specific profiles are required by Summit 360 policy"
        ],
        "correct": 1,
        "explain": "Vague descriptions like 'direct communicator' require Claude to interpret them, often incorrectly. Specific examples — actual phrases, real sentences, concrete preferences — let Claude pattern-match to produce output that genuinely matches the Partner."
      },
      {
        "type": "mcq",
        "prompt": "What should you do when you notice Claude making a slightly off assumption about a Partner?",
        "options": [
          "Correct it in the current chat and move on",
          "Update the relevant Project context layer so the assumption is corrected permanently",
          "Start a new Project from scratch",
          "Accept it — Claude will learn over time automatically"
        ],
        "correct": 1,
        "explain": "Correcting the Project context permanently fixes the assumption for all future conversations. Correcting only in the chat helps once but does not improve the Project — the same error will reappear."
      },
      {
        "type": "mcq",
        "prompt": "How often should you review and update a Partner Project?",
        "options": [
          "Once when you first set it up — it should not need changes",
          "Only when a Partner specifically tells you something has changed",
          "Monthly at minimum, plus after any significant change in the Partner's situation",
          "Every day to keep it perfectly current"
        ],
        "correct": 2,
        "explain": "Monthly reviews plus trigger-based updates (after significant events) keep the Project current. Outdated context is actively misleading — it makes Claude confident about stale information."
      },
      {
        "type": "open",
        "prompt": "Write the Standing Instructions layer (Layer 5) for a Partner Project. Include at least four specific instructions that reflect how you want Claude to behave when producing any output for this Partner.",
        "answer": "Example Standing Instructions for a Partner Project: (1) Always lead with the most important point — never bury the key message. (2) Flag any factual claim you are not certain about with [verify] so I can check before sending. (3) When drafting communications on behalf of James, use short sentences and avoid passive voice — he speaks and writes in active, direct language. (4) For any email longer than three paragraphs, add a one-sentence TL;DR at the top. (5) Never make assumptions about third parties' positions or motivations — describe only what is stated in the context I have provided."
      }
    ]
  },
  "further": [
    { "title": "Building effective AI context documents", "url": "https://www.anthropic.com/research", "note": "Anthropic research on how context structure affects model performance." }
  ]
}$pf09$::jsonb WHERE code = 'PF09';

-- ─── PF10 ────────────────────────────────────────────────────────────────────
UPDATE public.modules SET content = $pf10${
  "overview_html": "<p>The first two weeks with a new Partner are the most valuable and the most fragile. The context you gather in this period shapes every task you will do for the next year. The AI tools you set up in this period either compound or constrain your leverage for the entire engagement.</p><p>This module gives you a structured approach to Partner onboarding — from the discovery call that surfaces what the Partner actually needs, to the Partner Profile that captures it, to the day-one setup that makes you immediately effective.</p>",
  "outcomes": [
    "Run a structured discovery call that surfaces the context AI needs to be useful",
    "Build a Partner Profile from discovery call notes in under 30 minutes",
    "Set up a fully configured Claude Project before the end of day one",
    "Identify the five highest-leverage tasks for a new Partner engagement",
    "Establish communication rhythms and norms in the first week"
  ],
  "topics": [
    {
      "title": "The discovery call — asking the right questions",
      "body": [
        "The discovery call is not an orientation — it is an intelligence-gathering session. Your goal is to leave the call with enough context to build a Partner Profile that makes Claude useful from day one. Most Pathfinders leave discovery calls with a task list. The best Pathfinders leave with a mental model of who the Partner is.",
        "The six question domains that matter most: (1) Role and responsibilities — what does the Partner own and what are the outcomes they are accountable for? (2) Communication style — how do they prefer to communicate, how quickly, in what format? (3) Current pain points — what is consuming time or energy that should not be? (4) Key relationships — who are the most important people in their world (clients, team, board) and what do those relationships require? (5) Operational rhythms — what are the recurring meetings, deadlines, and rituals of their work? (6) Preferences and pet peeves — what does excellent support look like to them and what has driven them crazy in the past?",
        "Use these domains as a mental framework, not as a script. Let the conversation flow but make sure you have answers to all six before the call ends."
      ],
      "example": "Discovery question: 'Can you walk me through a typical week — what are the things that reliably happen, and what are the things that tend to surprise you?' This single question surfaces both the operational rhythms (layer 4) and the stress points that AI can help address.",
      "pro_tip": "Take notes directly into your Claude Project draft during the call. By the time you hang up, you have the raw material for all five context layers ready to structure.",
      "watch_out": "Do not skip the pet peeves question. A Partner who has been frustrated by poor follow-through, or by an EA who over-communicated, will have those same frustrations with you unless you know to avoid them."
    },
    {
      "title": "Building the Partner Profile in 30 minutes",
      "body": [
        "Immediately after the discovery call, while the context is fresh, build the Partner Profile using the five-layer structure from PF09. You should be able to draft all five layers in 30 minutes using your notes.",
        "Start with a voice memo or rough notes if you did not type during the call — dictate everything you remember while driving, walking, or immediately at your desk. Claude can help you structure these raw notes into a Partner Profile: paste in your rough notes and ask 'Using these notes, write a Partner Profile structured with the following five layers: [list them].'",
        "Review the draft Profile against your notes and fill in any gaps. Flag anything you did not get from the call as [to confirm] — then follow up with a specific question in your first async communication with the Partner."
      ],
      "pro_tip": "Send the Partner a copy of their own Profile (or a cleaned-up version of the identity and style sections) as part of your day-one communication: 'I have put together a quick profile of how I plan to support you — let me know if I have got anything wrong.' Partners are almost always impressed and the corrections improve your context immediately.",
      "watch_out": "Do not wait until you have 'enough' information to build the Profile. Build it with what you have on day one and update it daily in the first week. An imperfect Profile that exists beats a perfect Profile that never gets written."
    },
    {
      "title": "Day-one setup",
      "body": [
        "Day one has three non-negotiable setup tasks. First: create the Claude Project with all five context layers — even if some are incomplete. Second: connect the relevant Cowork connectors (calendar, email, and any tools the Partner uses that have MCP connectors). Third: run your first real task using the Project to verify it produces on-brand output.",
        "The first real task should be something low-stakes but real — a draft of the confirmation email for your next meeting, a summary of the intake notes, or a quick research brief on a topic the Partner mentioned. This test tells you where the Project context needs strengthening.",
        "Identify the five highest-leverage tasks for the first month. These are typically: managing email triage, preparing meeting briefs, drafting routine communications, tracking action items, and researching Partners or companies before calls. For each one, build or adapt a prompt template that uses the Partner Project as context."
      ],
      "example": "First-day test prompt: 'Using everything you know about James from this Project, draft a brief email confirming our first weekly check-in call for Thursday at 9am. Keep it under 50 words, warm but efficient.' If the output sounds like James's EA wrote it, the Project is working. If it sounds generic, update the style layer.",
      "watch_out": "Setup without testing is not setup. Always run a test task before relying on the Project for anything that goes to the Partner or their network."
    }
  ],
  "walkthrough_intro": "Your first-week Partner onboarding workflow.",
  "walkthrough": [
    { "title": "Pre-call preparation (day -1)", "body": "Research the Partner online (LinkedIn, company website, recent news). Set up a blank Claude Project with their name. Prepare your six discovery domains as mental anchors for the call." },
    { "title": "Discovery call (day 1, AM)", "body": "Run the discovery call using the six question domains. Take notes directly into your Project draft. Record the call if the Partner consents — you can use Claude to transcribe and structure notes afterwards." },
    { "title": "Profile build (day 1, within 2 hours)", "body": "Structure your notes into the five-layer Partner Profile using Claude. Flag any gaps as [to confirm]. Upload any documents the Partner shared during or before the call." },
    { "title": "Project test (day 1, PM)", "body": "Run a test task using the Project. Evaluate the output. Update any context layers that produced off-brand results." },
    { "title": "First-week updates (days 2–5)", "body": "After every interaction with the Partner, add one new piece of context to the Project. By end of week one, the Project should be comprehensive enough that Claude outputs require minimal editing." }
  ],
  "kc": {
    "pass_score": 0.8,
    "items": [
      {
        "type": "mcq",
        "prompt": "What is the primary goal of a discovery call with a new Partner?",
        "options": [
          "To get a task list and start delivering immediately",
          "To gather the context needed to build a Partner Profile that makes Claude useful from day one",
          "To demonstrate your AI skills to the Partner",
          "To set up all the technical integrations"
        ],
        "correct": 1,
        "explain": "The discovery call is an intelligence-gathering session. The goal is to leave with a mental model of the Partner that can be converted into a comprehensive Project context — not just a list of tasks."
      },
      {
        "type": "mcq",
        "prompt": "A Partner mentioned in the discovery call that their previous EA used to CC them on every email. This is an example of which discovery domain?",
        "options": [
          "Role and responsibilities",
          "Key relationships",
          "Preferences and pet peeves",
          "Operational rhythms"
        ],
        "correct": 2,
        "explain": "Preferences and pet peeves capture what has frustrated the Partner in past support relationships. Knowing this allows you to avoid those frustrations before they happen."
      },
      {
        "type": "mcq",
        "prompt": "What should you do immediately after a discovery call?",
        "options": [
          "Wait until you have all the information before building the Partner Profile",
          "Build the Partner Profile within 2 hours while the context is fresh, flagging gaps",
          "Send the Partner a long list of follow-up questions",
          "Complete all five Academy modules before beginning any Partner work"
        ],
        "correct": 1,
        "explain": "Build the Profile immediately, with what you have, and flag gaps. An imperfect Profile built on day one compounds in value. Waiting for completeness means delayed effectiveness."
      },
      {
        "type": "mcq",
        "prompt": "Why should you run a test task on your Partner Project on day one?",
        "options": [
          "To show the Partner you have been working hard",
          "To verify the Project produces on-brand output and identify which context layers need strengthening",
          "Testing is not necessary if you followed the Profile template correctly",
          "To generate the first deliverable for the Partner"
        ],
        "correct": 1,
        "explain": "A test task validates whether the Project context is sufficient. If the output is generic or off-brand, you know immediately which layers need updating — before the Project is relied upon for real Partner deliverables."
      },
      {
        "type": "open",
        "prompt": "Write the six discovery call questions you would ask a new Partner to gather the context needed for all five Project layers. Each question should be open-ended and designed to surface specific, usable information.",
        "answer": "(1) Walk me through your role — what are the outcomes you are accountable for and what does an exceptional month look like for you? (2) How do you prefer to communicate — email, messages, calls — and what response time works for you? (3) What is consuming the most time or energy in your work right now that you wish you could hand off? (4) Who are the most important people in your professional world right now — clients, team, board — and what do those relationships need from you? (5) Walk me through a typical week — what recurs reliably and what tends to surprise you? (6) What does excellent EA support look like to you, and what has driven you crazy in the past?"
      }
    ]
  },
  "further": [
    { "title": "Summit 360 Partner Profile template", "url": "https://s360team.com/resources", "note": "The official Summit 360 Partner Profile document template." }
  ]
}$pf10$::jsonb WHERE code = 'PF10';
