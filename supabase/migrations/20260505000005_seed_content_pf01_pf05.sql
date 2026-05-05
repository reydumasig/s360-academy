-- Sprint 3: Module content PF01–PF05
-- Run in Supabase SQL editor after migration 000004.

-- ─── PF01 ────────────────────────────────────────────────────────────────────
UPDATE public.modules SET content = $pf01${
  "overview_html": "<p>AI is the most powerful amplifier ever handed to a knowledge worker — and that is exactly the problem. An amplifier does not change the signal; it makes it louder. If your judgment is sharp, AI makes you ten times sharper. If your judgment is weak, AI makes your mistakes ten times faster and with ten times more confidence.</p><p>The Pathfinder's job has always been to extend a Summit Partner's capacity. That job has not changed. What has changed is that you now have access to tools that can draft, research, summarise, translate, and plan at machine speed. Your value is no longer in the doing of those tasks — it is in knowing <em>which</em> tasks to do, <em>how</em> to frame them, and <em>whether the output is right</em>.</p><p>This module sets the mental model for everything that follows. Treat AI as a capable but unsupervised junior who never gets tired, never gets bored, and occasionally makes things up. Your job is to direct, review, and take responsibility for every output that leaves your name.</p>",
  "outcomes": [
    "Explain why AI amplifies judgment rather than replacing it",
    "Describe the Pathfinder's evolving role in an AI-enabled team",
    "Identify the three failure modes when Pathfinders over-delegate to AI",
    "Apply the 'director mindset' to any AI-assisted task",
    "Articulate the Pathfinder Promise in your own words"
  ],
  "topics": [
    {
      "title": "The Amplifier Principle",
      "body": [
        "Large language models do not think. They predict. Given everything you have typed, they calculate the most statistically likely next word — millions of times per second. When the training data for a topic is rich and accurate, the predictions are remarkable. When it is sparse or skewed, the output is confidently wrong.",
        "This means the quality of AI output is directly proportional to the quality of the input you provide and the quality of the judgment you apply to the output. A Pathfinder who understands the Partner's business, communication style, and priorities will always get better results than one who pastes a generic prompt and accepts the first response.",
        "Think of it this way: a calculator amplifies arithmetic skill. A person who does not understand maths will use a calculator to get wrong answers faster. AI is the same — only the stakes are much higher."
      ],
      "example": "A Pathfinder asks Claude to draft a follow-up email after a Partner's sales call. Without context, Claude writes a polished but generic email. With the call notes, the Partner's tone of voice, and the prospect's specific objection pasted in, Claude drafts something the Partner could send unchanged. Same tool. Completely different outcome. The difference is judgment about what context to provide.",
      "pro_tip": "Before running any AI task, ask yourself: what does a smart human need to know to do this well? That is exactly what you need to give the AI.",
      "watch_out": "Never let AI make decisions that carry your name without you reviewing them first. Speed is not an excuse. A wrong email sent fast is worse than a right email sent slow."
    },
    {
      "title": "The Director Mindset",
      "body": [
        "The most effective Pathfinders think of themselves as directors, not typists. A director knows the goal, casts the right tool for the job, gives clear instructions, reviews the output critically, and takes responsibility for the final product.",
        "This is a mindset shift from 'I will use AI to do my work' to 'I will direct AI to produce drafts that I will review and own.' The distinction sounds subtle but it changes everything — how you prompt, how you review, and how you communicate AI-assisted work to your Partner.",
        "Directors do not abdicate. They delegate with precision and verify with care. Your Partner does not care whether something was written by a human or a machine. They care whether it is accurate, on-brand, and serves their goals."
      ],
      "example": "Compare two approaches. Pathfinder A pastes a raw request and sends the first output to the Partner. Pathfinder B reads the output, spots an error in the proposed timeline, corrects it, adjusts the tone to match the Partner's style, and then sends it. Pathfinder B looks like a superstar. Both used the same AI.",
      "pro_tip": "Build a personal review checklist: facts correct, tone on-brand, action items clear, nothing confidential exposed. Run every AI-assisted output through it before it leaves your screen.",
      "watch_out": "The 'director' frame can slip into the 'reviewer of everything' trap — where you spend more time reviewing AI output than you would have spent doing the task. Know which tasks AI speeds up versus which tasks it actually slows you down on."
    },
    {
      "title": "The Three Over-Delegation Failure Modes",
      "body": [
        "Experience with Pathfinders reveals three recurring failure modes when AI is over-used without judgment.",
        "The first is Hallucination Laundering — AI invents a fact, the Pathfinder does not verify it, and it reaches the Partner as gospel. This is most dangerous with dates, statistics, names, and URLs. Always verify claims against primary sources.",
        "The second is Voice Erosion — the more a Pathfinder delegates writing to AI, the more the Partner's communications start to sound like AI. Partners notice. Over time, trust erodes. Your job is to keep the Partner's voice human, even when AI is doing the drafting.",
        "The third is Context Leak — pasting sensitive Partner information (financial data, personal details, legal matters) into a consumer AI tool without understanding the privacy implications. We cover this fully in PF14, but the principle starts here."
      ],
      "watch_out": "If you find yourself copying AI output directly without reading it, you have crossed from director into rubber-stamp. That is where mistakes happen and where trust breaks down."
    }
  ],
  "walkthrough_intro": "Use this five-step check before submitting any AI-assisted work to your Partner.",
  "walkthrough": [
    { "title": "State the goal clearly", "body": "In one sentence: what does this output need to achieve? If you cannot state the goal, you are not ready to prompt." },
    { "title": "Provide rich context", "body": "Paste in the Partner's background, the relevant prior communication, the specific constraints, and any examples of what 'good' looks like." },
    { "title": "Review the output critically", "body": "Read it as if you wrote it yourself. Would you be comfortable with your name on it? Are all facts verifiable? Is the tone right?" },
    { "title": "Edit before sending", "body": "At minimum, adjust one thing. This forces you to engage with the output rather than rubber-stamp it." },
    { "title": "Take responsibility", "body": "Do not say 'AI wrote this.' You wrote it. AI was your tool. Own it." }
  ],
  "practice_intro": "Complete both exercises before moving to the knowledge check.",
  "practice": [
    {
      "label": "Exercise 1 — Spot the amplification gap",
      "html": "<p>Think of the last three tasks you completed for a Partner. For each one, ask: <em>if I had used AI without any context, how wrong could the output have been?</em> Write a one-sentence answer for each. This builds your instinct for where AI needs the most direction.</p>"
    },
    {
      "label": "Exercise 2 — Write your Pathfinder Promise",
      "html": "<p>In 2–3 sentences, write your personal version of the Pathfinder Promise — the commitment you make to your Partner about how you will use AI on their behalf. Include what you will always do (review, verify, protect their voice) and what you will never do (send unreviewed output, share confidential data). You will refine this in PF15.</p>"
    }
  ],
  "kc": {
    "pass_score": 0.8,
    "items": [
      {
        "type": "mcq",
        "prompt": "According to the Amplifier Principle, what determines the quality of AI output?",
        "options": [
          "The speed of the AI model being used",
          "The quality of the input provided and the judgment applied to the output",
          "The number of words in the prompt",
          "Whether the task is creative or analytical"
        ],
        "correct": 1,
        "explain": "The Amplifier Principle states that AI output quality is directly proportional to the quality of input and the judgment applied. The model's speed or prompt length are secondary factors."
      },
      {
        "type": "mcq",
        "prompt": "Which of the following best describes the 'director mindset'?",
        "options": [
          "Using AI to complete tasks without human review to save time",
          "Directing AI to produce drafts, then reviewing and owning the final output",
          "Letting AI make all decisions and presenting its output unchanged",
          "Only using AI for creative tasks, not analytical ones"
        ],
        "correct": 1,
        "explain": "The director mindset means treating AI as a tool you direct — giving precise instructions, reviewing critically, and taking full responsibility for what goes out."
      },
      {
        "type": "mcq",
        "prompt": "What is 'Hallucination Laundering'?",
        "options": [
          "Using AI to clean up poorly written drafts",
          "Asking AI to generate multiple versions of the same content",
          "Passing an AI-invented fact to your Partner without verifying it",
          "Using AI to summarise long documents"
        ],
        "correct": 2,
        "explain": "Hallucination Laundering is when AI invents a fact (hallucination) and a Pathfinder passes it on without verification, effectively 'laundering' the error through to the Partner."
      },
      {
        "type": "mcq",
        "prompt": "Which data types are MOST at risk from hallucination and require mandatory verification?",
        "options": [
          "General advice and creative suggestions",
          "Dates, statistics, names, and URLs",
          "Formatting and structural recommendations",
          "Tone and style guidance"
        ],
        "correct": 1,
        "explain": "Dates, statistics, names, and URLs are factual claims that AI frequently gets wrong with high confidence. Always verify these against primary sources before they reach your Partner."
      },
      {
        "type": "open",
        "prompt": "In your own words, explain why AI amplifies judgment rather than replacing it, and give one example of how weak judgment could lead to a bad outcome when using AI.",
        "answer": "AI amplifies because it executes whatever direction it receives — it cannot independently assess whether the direction is correct or appropriate for the situation. Weak judgment leads to bad outcomes because the AI will confidently produce output based on poor inputs. Example: a Pathfinder who does not understand the Partner's relationship with a client might prompt Claude for a 'professional follow-up email' after a difficult call, and Claude would produce a polished but tone-deaf message that damages the relationship — executed at full speed and perfect grammar."
      }
    ]
  },
  "further": [
    { "title": "Anthropic's model card for Claude", "url": "https://www.anthropic.com/claude", "note": "Understand capabilities and limitations directly from the source." },
    { "title": "Ethan Mollick — Co-Intelligence (book)", "url": "https://www.oneusefulthing.org", "note": "The best framework for thinking about humans working alongside AI." }
  ]
}$pf01$::jsonb WHERE code = 'PF01';

-- ─── PF02 ────────────────────────────────────────────────────────────────────
UPDATE public.modules SET content = $pf02${
  "overview_html": "<p>You do not need to understand the engineering behind AI to use it well — but you do need a working mental model of how it behaves. Without one, you will be surprised by its failures in ways that feel random. With one, you can predict where it will struggle and compensate accordingly.</p><p>This module gives you the grounded introduction that most AI training skips. We cover tokens, context windows, training cutoffs, and hallucinations — not as academic concepts, but as practical constraints you will bump into every week.</p>",
  "outcomes": [
    "Explain in plain language how a large language model generates text",
    "Define 'token' and describe how token limits affect your work",
    "Describe what a context window is and how to work within its limits",
    "Explain training cutoffs and when they matter",
    "Identify the three most common hallucination triggers and how to reduce them"
  ],
  "topics": [
    {
      "title": "Tokens — the unit of AI thinking",
      "body": [
        "AI models do not process words — they process tokens. A token is roughly three to four characters, so a word like 'meeting' is one token, but 'uncharacteristically' might be three. Every character you type costs tokens. Every character the AI generates costs tokens. Every document you upload costs tokens.",
        "Why does this matter? Because every AI model has a maximum token budget — the context window. Once you hit the limit, the model either stops or starts forgetting the earliest parts of the conversation. A Pathfinder who pastes a 50-page PDF, writes a long system prompt, and asks for a detailed output may find that the model loses the beginning of the document by the end.",
        "Practical implication: be deliberate about what you paste. Summaries beat full documents. Excerpts beat full transcripts. The best prompt is the most focused prompt."
      ],
      "example": "You are preparing a Partner briefing from a 40-page board report. Instead of uploading the whole PDF and asking 'summarise this,' extract the three sections that are relevant to your Partner's role and paste only those. You get a sharper output and preserve token budget for follow-up questions.",
      "pro_tip": "For long documents, first ask AI to identify the most relevant sections, then do a second pass asking it to work only within those sections. Two focused prompts beat one unfocused one.",
      "watch_out": "Claude and other models do not tell you when they have lost context — they just start generating less accurate output. If an answer feels off, start a fresh chat with a tighter prompt."
    },
    {
      "title": "Training Cutoffs — what AI does not know",
      "body": [
        "AI models are trained on a snapshot of the internet up to a certain date. After that date, they know nothing unless you tell them. Claude's training data has a cutoff — typically 6 to 18 months behind the current date — which means anything that happened after that cutoff is invisible to the model.",
        "This is critical for Pathfinders. If you ask Claude about a company's current leadership, a recently passed regulation, a live event, or today's exchange rate, you will get either a confident wrong answer (hallucination) or a refusal. Neither helps your Partner.",
        "The solution is simple: treat AI as a knowledgeable colleague who has been off the grid for a year. Bring them up to speed by pasting in the relevant current information before asking your question."
      ],
      "example": "A Partner asks you to draft a response to a news story about their industry from last week. If you just ask Claude to comment on the story, it has no idea what you are talking about. Paste the article first, then ask for the response. Claude now has the context it needs.",
      "pro_tip": "Any prompt involving current events, prices, regulations, or personnel should include the relevant source material inline. Never assume Claude knows what happened recently.",
      "watch_out": "Claude sometimes estimates or extrapolates when it does not have current data. The output sounds confident. Verify anything time-sensitive against a live source."
    },
    {
      "title": "Hallucinations — why AI makes things up",
      "body": [
        "A hallucination is when an AI model generates a plausible-sounding but factually incorrect statement. The model is not lying — it has no concept of truth or falsity. It is generating the statistically most likely next token. When the correct answer is well-represented in training data, it gets it right. When it is not, it fills in the gap with what sounds right.",
        "Hallucinations are most common in three situations: (1) specific factual claims like statistics, dates, citations, and names; (2) niche topics that are under-represented in training data; and (3) tasks that require the model to reason about information it was never trained on.",
        "The professional response to hallucination risk is not to distrust AI — it is to build verification habits. Treat every factual claim in AI output as a hypothesis to be confirmed, not a fact to be published."
      ],
      "example": "You ask Claude to find the CEO of a mid-sized company your Partner is meeting next week. Claude confidently names someone. You send it to your Partner. At the meeting, the Partner discovers that person left two years ago. This is a hallucination failure — and it damages your credibility.",
      "pro_tip": "Use AI for tasks where a wrong answer is obviously wrong (drafting, brainstorming, formatting) and double-check AI output for tasks where a wrong answer sounds right (facts, names, figures).",
      "watch_out": "Confidence in tone is not a signal of accuracy. AI can be wrong and sound completely certain. The more specific the claim, the more it needs verification."
    }
  ],
  "kc": {
    "pass_score": 0.8,
    "items": [
      {
        "type": "mcq",
        "prompt": "What is a 'token' in the context of AI language models?",
        "options": [
          "A full sentence processed by the model",
          "A roughly 3–4 character unit that models use to process text",
          "An authentication key for the AI API",
          "A single word in the input prompt"
        ],
        "correct": 1,
        "explain": "Tokens are the fundamental unit AI models process — roughly 3–4 characters each. Understanding tokens helps you manage context window limits effectively."
      },
      {
        "type": "mcq",
        "prompt": "A Partner asks you to summarise a regulation that was updated last month. What is the safest approach?",
        "options": [
          "Ask Claude directly — it has up-to-date regulatory knowledge",
          "Find the updated regulation text online and paste it into your prompt",
          "Ask Claude to estimate based on the previous version",
          "Skip using AI for this task entirely"
        ],
        "correct": 1,
        "explain": "Training cutoffs mean AI does not know about recent changes. Always paste in the source material for anything time-sensitive rather than assuming the model knows."
      },
      {
        "type": "mcq",
        "prompt": "Which of the following is MOST likely to trigger an AI hallucination?",
        "options": [
          "Asking AI to reformat a bulleted list",
          "Asking AI to draft an email in a professional tone",
          "Asking AI for the specific revenue figure of a private company",
          "Asking AI to brainstorm five names for a new project"
        ],
        "correct": 2,
        "explain": "Specific factual claims about things like private company financials are hallucination hotspots — the data is not well-represented in training data, so the model fills in a plausible-sounding number."
      },
      {
        "type": "mcq",
        "prompt": "Your chat with Claude has grown very long and the responses are starting to feel less accurate. What should you do?",
        "options": [
          "Keep going — Claude remembers everything in the chat history",
          "Ask Claude to try harder",
          "Start a fresh chat with a tighter, more focused prompt",
          "Upgrade to a paid plan for more memory"
        ],
        "correct": 2,
        "explain": "When a conversation exceeds the context window, early context is lost and output quality drops. Starting fresh with a focused prompt resets the context and typically improves results."
      },
      {
        "type": "open",
        "prompt": "Describe a real or realistic scenario where a training cutoff could cause a problem for a Pathfinder, and explain how you would prevent it.",
        "answer": "Example: A Pathfinder is asked to research a potential vendor their Partner is considering. They ask Claude about the company's current products and pricing. Claude confidently describes the product line based on training data that is 12 months old — but the company has since pivoted and no longer offers the service the Partner needs. The Partner wastes time on a call that goes nowhere. Prevention: before asking Claude about any company, paste in recent information from the company's own website, a recent news article, or their LinkedIn page. This grounds the AI's response in current reality."
      }
    ]
  },
  "further": [
    { "title": "3Blue1Brown — But what is a GPT? (YouTube)", "url": "https://www.youtube.com/watch?v=wjZofJX0v4M", "note": "The clearest visual explanation of how transformers work — no maths required." },
    { "title": "Anthropic — Claude's character", "url": "https://www.anthropic.com/claude/character", "note": "Understand how Claude is trained to behave and where its limits are." }
  ]
}$pf02$::jsonb WHERE code = 'PF02';

-- ─── PF03 ────────────────────────────────────────────────────────────────────
UPDATE public.modules SET content = $pf03${
  "overview_html": "<p>Summit 360 Pathfinders have access to three primary AI platforms: Claude (from Anthropic), ChatGPT (from OpenAI), and Claude Cowork (the agentic desktop environment). Each has different strengths, different privacy implications, and different appropriate uses. Knowing when to use which tool is one of the highest-leverage skills you can develop.</p><p>This module gives you a practical framework for tool selection plus the responsible defaults that protect you, your Partner, and Summit 360 from the risks that come with powerful tools.</p>",
  "outcomes": [
    "Compare Claude and ChatGPT across the dimensions that matter for Pathfinder work",
    "Explain what makes Claude Cowork different from Claude Chat",
    "Apply the tool-selection framework to common Pathfinder tasks",
    "Describe the responsible defaults for handling Partner data in AI tools",
    "Identify which tool to use for sensitive versus non-sensitive tasks"
  ],
  "topics": [
    {
      "title": "Claude — your default tool",
      "body": [
        "Claude is your primary tool for the majority of Pathfinder work. It excels at long-context tasks (it can hold significantly more text than most competitors), nuanced writing that requires a consistent tone, careful reasoning through complex decisions, and tasks where following precise instructions matters.",
        "Claude is also the tool with the clearest enterprise privacy commitments when used through an enterprise account. On the enterprise plan, your conversations are not used to train the model. For sensitive Partner work — anything involving client data, financial information, or strategic planning — enterprise Claude is the appropriate tool.",
        "Summit 360 Pathfinders should default to Claude for: drafting Partner communications, summarising long documents, preparing meeting briefs, and any task requiring nuanced judgment about tone or sensitivity."
      ],
      "pro_tip": "Use Claude Projects (covered in PF09) to maintain persistent context per Partner. This is one of Claude's most powerful features for ongoing client relationships.",
      "watch_out": "Claude on a free or personal consumer account does not have the same privacy guarantees as enterprise Claude. Never put sensitive Partner data into a personal account."
    },
    {
      "title": "ChatGPT — when to reach for it",
      "body": [
        "ChatGPT (from OpenAI) is the other major tool in your toolkit. It is excellent for tasks that benefit from its plugin ecosystem, for code generation in some contexts, and for users who are more familiar with its interface from personal use.",
        "For Pathfinder work, ChatGPT is most useful when a Partner specifically uses or prefers it (so you need to understand it to support them), or when a specific GPT or plugin exists that solves a narrow problem particularly well.",
        "The key principle: do not use ChatGPT on a personal or free account for Partner data. If your Partner has an enterprise ChatGPT account, that is the appropriate context. Otherwise, default to Claude."
      ],
      "watch_out": "Free tier ChatGPT conversations can be used to improve OpenAI models. Never paste Partner confidential data into a personal ChatGPT account."
    },
    {
      "title": "Claude Cowork — agentic AI for Pathfinders",
      "body": [
        "Claude Cowork is a desktop application that allows Claude to take actions on your computer — opening files, browsing the web, running searches, connecting to other apps via the MCP (Model Context Protocol) registry. This is 'agentic AI' — AI that acts, not just answers.",
        "For Pathfinders, Cowork unlocks workflows that would otherwise require manual multi-step processes. You can ask Claude to research a topic and compile the results into a document, to search your email for a specific thread and summarise it, or to prepare a briefing by pulling from multiple connected sources.",
        "Cowork requires more careful oversight than Claude Chat because it takes real actions. Before running any agentic workflow, be explicit about what you want the outcome to look like and review what the agent did before using its output."
      ],
      "pro_tip": "Start with simple Cowork workflows — one or two steps — before building complex multi-step automations. Build trust in the tool incrementally.",
      "watch_out": "Cowork can access files and apps on your computer. Be thoughtful about what connectors you authorise and what data you allow it to access. Less access is safer."
    },
    {
      "title": "Responsible defaults",
      "body": [
        "Regardless of which tool you use, three defaults should never change. First: always use your Summit 360 work email or enterprise account, not personal accounts, for any work-related AI use. Second: classify information before pasting it — green (general knowledge, non-sensitive) is fine for any tool; amber (Partner-specific but not confidential) should use enterprise tools; red (financial, legal, personal data) should never enter a consumer AI tool. Third: review before sending — every AI output that reaches a Partner or their stakeholders carries your name.",
        "These defaults are not restrictions — they are the baseline that allows Summit 360 to use AI at scale without accumulating risk."
      ],
      "example": "You need to draft an email from your Partner to their bank about an account query. This involves financial information — red classification. You draft the email yourself (or use enterprise Claude with verified privacy settings), not free-tier ChatGPT.",
      "watch_out": "The convenience of a free tool is never worth the privacy risk of exposing Partner data. When in doubt, use enterprise Claude or draft manually."
    }
  ],
  "kc": {
    "pass_score": 0.8,
    "items": [
      {
        "type": "mcq",
        "prompt": "Which tool should be your default for most Pathfinder writing and research tasks?",
        "options": [
          "ChatGPT free tier — it is the most widely used",
          "Claude on an enterprise account — best privacy and long-context capability",
          "Claude Cowork — it can take actions automatically",
          "Any tool the Partner personally prefers"
        ],
        "correct": 1,
        "explain": "Claude on an enterprise account is the default recommendation — it offers strong privacy guarantees (no training on your data), superior long-context handling, and nuanced instruction-following."
      },
      {
        "type": "mcq",
        "prompt": "A Partner asks you to draft a message to their accountant about a tax matter. Which classification does this fall under and what does that mean for tool selection?",
        "options": [
          "Green — use any tool freely",
          "Amber — use enterprise tools only",
          "Red — never enter into any consumer AI tool",
          "It depends on the Partner's preference"
        ],
        "correct": 2,
        "explain": "Financial and legal matters are red classification. They should never be entered into consumer AI tools, regardless of Partner preference, to protect both the Partner and Summit 360."
      },
      {
        "type": "mcq",
        "prompt": "What is the key difference between Claude Chat and Claude Cowork?",
        "options": [
          "Claude Chat costs more than Cowork",
          "Cowork can take actions on your computer; Chat only generates text responses",
          "Chat is for writing tasks; Cowork is only for coding tasks",
          "Cowork is a mobile app; Chat is desktop only"
        ],
        "correct": 1,
        "explain": "Cowork is an agentic environment where Claude can take real actions — opening files, browsing the web, running workflows. Chat is conversational and text-based only."
      },
      {
        "type": "mcq",
        "prompt": "When is it appropriate to use ChatGPT for Partner work?",
        "options": [
          "Never — always use Claude",
          "When you have a free ChatGPT account and need a quick answer",
          "When a Partner has an enterprise ChatGPT account or specifically uses it and you need to support them",
          "For all creative tasks since ChatGPT is better at creativity"
        ],
        "correct": 2,
        "explain": "ChatGPT is appropriate for Partner work when the Partner has an enterprise account (privacy protected) or when you need to support a Partner who uses it. Never use personal/free accounts for Partner data."
      },
      {
        "type": "open",
        "prompt": "Describe how you would handle the following situation: Your Partner asks you to use AI to research a competitor company and prepare a 1-page brief. Walk through your tool choice, what you would and would not paste in, and how you would review the output.",
        "answer": "Tool choice: Claude (enterprise account) since this is Partner work involving potentially strategic information. What to paste in: publicly available information about the competitor — their website, recent press releases, LinkedIn profile. What not to paste in: your Partner's confidential strategy documents, their financial targets, or internal notes about why they are researching this competitor (amber/red). Review: verify any specific facts (founding date, revenue, headcount) against primary sources — these are hallucination-prone. Check that the brief is neutral and factual, not accidentally editorialising. Ensure the format matches what the Partner will find useful."
      }
    ]
  },
  "further": [
    { "title": "Anthropic enterprise privacy policy", "url": "https://www.anthropic.com/privacy", "note": "Understand exactly what enterprise Claude does and does not do with your data." },
    { "title": "Model Context Protocol (MCP) overview", "url": "https://www.anthropic.com/news/model-context-protocol", "note": "The technical standard behind Claude Cowork's connector ecosystem." }
  ]
}$pf03$::jsonb WHERE code = 'PF03';

-- ─── PF04 ────────────────────────────────────────────────────────────────────
UPDATE public.modules SET content = $pf04${
  "overview_html": "<p>Claude Chat is the interface most Pathfinders use daily. Understanding its features — not just the chat box — is the difference between using Claude as a capable search engine and using it as a genuine productivity multiplier.</p><p>This module covers the three features that unlock the most value for Pathfinder work: Projects (persistent context), Artifacts (structured outputs), and file uploads. We also cover the most important discipline: knowing when to start a fresh conversation versus continuing an existing one.</p>",
  "outcomes": [
    "Set up and use Claude Projects to maintain persistent context per Partner",
    "Use Artifacts to generate structured, reusable outputs",
    "Upload and interrogate documents, spreadsheets, and images effectively",
    "Decide when to start a fresh chat versus continue an existing conversation",
    "Build a Claude Chat workflow that reduces repetitive context-setting"
  ],
  "topics": [
    {
      "title": "Projects — persistent context that remembers",
      "body": [
        "A Claude Project is a persistent workspace that maintains context across multiple conversations. Instead of re-pasting your Partner's background, communication style, and preferences at the start of every chat, you set it up once in a Project and it is available in every conversation within that project.",
        "For Pathfinders, the ideal setup is one Project per Partner. The project instructions should include: the Partner's name and role, their company and industry, their communication style and preferences, recurring contexts (e.g., they are preparing for a board meeting every quarter), and any standing instructions for how you want Claude to behave (e.g., 'always flag when you are uncertain about a fact').",
        "Projects also allow you to upload reference documents — the Partner Profile, the company overview, a style guide — that Claude can reference in every conversation without you re-uploading them each time."
      ],
      "example": "Partner Profile for a Project: 'Sarah Chen is the CEO of a 50-person B2B SaaS company. She communicates in a direct, data-driven style. She prefers bullet points over paragraphs. She has a board meeting every second Tuesday. When drafting communications for Sarah, always match her direct tone and lead with the key point. Flag any factual claims you are uncertain about.'",
      "pro_tip": "Start each new Partner engagement by building their Claude Project before you write your first draft. Twenty minutes of setup saves hours across the engagement.",
      "watch_out": "Projects are only as good as what you put in them. If the Partner Profile is vague or outdated, the outputs will be too. Review and update Project instructions after any significant change in the Partner's situation."
    },
    {
      "title": "Artifacts — outputs you can actually use",
      "body": [
        "An Artifact is a structured output that Claude renders separately from the chat — a document, a table, a piece of code, a presentation outline. Unlike raw chat responses, Artifacts can be directly copied, downloaded, or (in Claude's interface) edited inline.",
        "For Pathfinders, Artifacts are most useful for deliverables that need to be polished before they go to the Partner: email drafts, meeting agendas, briefing documents, weekly summaries. Ask Claude to produce these as Artifacts explicitly — it changes how the output is formatted and makes it easier to work with.",
        "When requesting an Artifact, be specific about the format: 'Create a document Artifact with a title, three sections, and a bullet-point action list at the end.' The more specific the format instruction, the more usable the output."
      ],
      "pro_tip": "After generating an Artifact, ask Claude to review it from the Partner's perspective: 'Does this match Sarah's direct communication style? What would she want changed?' This catches style issues before they reach the Partner.",
      "watch_out": "Artifacts can look polished and final even when the content is wrong. Do not let the professional formatting reduce your critical review. Content first, format second."
    },
    {
      "title": "File uploads — bringing documents into the conversation",
      "body": [
        "Claude can read PDFs, Word documents, spreadsheets, images, and many other file types. This turns Claude into a powerful document analyst — you can upload a 40-page report and ask specific questions, upload a spreadsheet and ask for the key trends, or upload a competitor's website screenshot and ask for a comparison.",
        "Effective file uploads are targeted. Do not upload a 200-page document and ask Claude to 'tell me everything important.' Instead, upload the document and ask a specific question: 'What does this document say about the Q3 targets?' or 'What are the three biggest risks mentioned in this report?'",
        "Images can also be uploaded — useful for reviewing mockups, interpreting charts and diagrams, or asking Claude to describe what is in a screenshot."
      ],
      "example": "Your Partner sends you a 30-page partnership proposal to review before their call tomorrow. Upload it to Claude and ask: 'Identify the three most important commercial terms in this proposal and flag any clauses that seem unusual or that my Partner should clarify before signing.' You get a focused brief in 90 seconds.",
      "watch_out": "Check your account's privacy settings before uploading sensitive documents. Enterprise accounts have data retention policies that protect Partner confidentiality. Personal accounts may not."
    },
    {
      "title": "When to start fresh",
      "body": [
        "Long conversations degrade. As a chat session grows, Claude's attention to earlier messages weakens and subtle inconsistencies creep in. There is a practical rule of thumb: if a conversation has moved beyond its original purpose, or if you are getting outputs that feel slightly off compared to earlier in the chat, start a fresh conversation.",
        "Signs it is time to start fresh: you are asking about a completely different topic than you started with; the responses are getting shorter or more generic; you notice the model has lost track of an instruction you gave earlier in the chat.",
        "Starting fresh does not mean losing context. Use Projects to store persistent context so that every new conversation starts with the right foundation."
      ],
      "pro_tip": "One conversation, one purpose. Use fresh chats for different tasks even within the same Partner Project. Mixing topics in a single chat is the number one cause of degraded output quality."
    }
  ],
  "walkthrough_intro": "Set up your first Partner Project using these steps.",
  "walkthrough": [
    { "title": "Open Claude and go to Projects", "body": "In the Claude interface, find the Projects section in the left sidebar. Click 'New Project' and name it after your Partner (e.g., 'Sarah Chen — Acme Corp')." },
    { "title": "Write the Project instructions", "body": "In the project settings, write a Partner Profile that includes: full name and role, company/industry, communication style (2–3 specific adjectives with examples), preferences (bullet points vs prose, short vs detailed), standing tasks (recurring meetings, regular deliverables), and a note to flag uncertain facts." },
    { "title": "Upload reference documents", "body": "Upload any documents Claude should always have available: the Partner Profile document, a style guide, a company one-pager. These persist across all conversations in the project." },
    { "title": "Test with a real task", "body": "Start a new conversation within the project and give Claude a real task. Does the output already match the Partner's style without extra instructions? Adjust the project instructions until it does." },
    { "title": "Maintain and update", "body": "After any significant change in the Partner's situation, update the project instructions. Treat the Project as a living document of who the Partner is and what they need." }
  ],
  "kc": {
    "pass_score": 0.8,
    "items": [
      {
        "type": "mcq",
        "prompt": "What is the main purpose of Claude Projects for Pathfinders?",
        "options": [
          "To store all your chat history in one place",
          "To maintain persistent Partner context so you do not have to re-paste it in every conversation",
          "To collaborate with other Pathfinders on the same task",
          "To access Claude's more advanced models"
        ],
        "correct": 1,
        "explain": "Projects store persistent context — Partner Profiles, preferences, and reference documents — so every conversation in the project starts with the right foundation without manual re-setup."
      },
      {
        "type": "mcq",
        "prompt": "When should you start a fresh Claude conversation instead of continuing an existing one?",
        "options": [
          "After every single message to ensure maximum accuracy",
          "Only when you switch to a different Partner",
          "When the conversation has moved beyond its original purpose or outputs feel off",
          "Fresh conversations are never better than continuing"
        ],
        "correct": 2,
        "explain": "Long, topic-mixing conversations degrade as earlier context fades. Starting fresh — within a Project so context is preserved — typically improves output quality when a chat has drifted."
      },
      {
        "type": "mcq",
        "prompt": "What makes Artifacts useful compared to a regular chat response?",
        "options": [
          "Artifacts are always more accurate than chat responses",
          "Artifacts are structured outputs that can be copied, downloaded, or edited inline",
          "Artifacts use a more powerful AI model",
          "Artifacts are automatically sent to the Partner"
        ],
        "correct": 1,
        "explain": "Artifacts are separately rendered structured outputs — easier to copy, download, and work with as polished deliverables compared to inline chat responses."
      },
      {
        "type": "mcq",
        "prompt": "You upload a 60-page annual report and ask Claude to 'tell me everything important.' What is a better approach?",
        "options": [
          "This is the correct approach — let Claude decide what is important",
          "Upload the document and ask a specific question about what your Partner needs from it",
          "Do not use AI for long documents — summarise it manually",
          "Ask Claude to summarise every page individually"
        ],
        "correct": 1,
        "explain": "Specific questions produce focused, useful answers. Vague prompts like 'tell me everything important' produce generic summaries that may miss what actually matters to your Partner."
      },
      {
        "type": "open",
        "prompt": "Write the Project instructions you would set up for a Partner you currently work with (or a realistic hypothetical Partner). Include their name, role, communication style, preferences, and any standing instructions for Claude.",
        "answer": "Example: 'James Reyes is the Managing Director of a 15-person executive search firm. He communicates in a concise, high-signal style — no filler, lead with the point, use data where available. He prefers bullet points for action items but short paragraphs for narrative context. He has a weekly partner call every Monday at 9am and a monthly client review every last Friday. When drafting on James's behalf: mirror his direct tone, never use passive voice, always include a clear next step at the end of any communication. Flag any factual claim you are not certain of so I can verify before sending.'"
      }
    ]
  },
  "further": [
    { "title": "Anthropic — Getting started with Projects", "url": "https://support.anthropic.com/en/articles/9517075-what-are-projects", "note": "Official guide to setting up and using Claude Projects." }
  ]
}$pf04$::jsonb WHERE code = 'PF04';

-- ─── PF05 ────────────────────────────────────────────────────────────────────
UPDATE public.modules SET content = $pf05${
  "overview_html": "<p>Claude Cowork is where AI moves from answering questions to taking actions. It is a desktop application that allows Claude to interact with files on your computer, browse the web, connect to third-party apps, and execute multi-step workflows autonomously. For Pathfinders, it represents a step-change in what is possible in a working day.</p><p>This module covers the Cowork interface, how to use connectors and skills, and — critically — how to supervise agentic AI responsibly. More power requires more oversight, and Cowork is no exception.</p>",
  "outcomes": [
    "Navigate the Claude Cowork desktop interface confidently",
    "Set up and use at least two connectors relevant to Pathfinder work",
    "Design a simple multi-step agentic workflow",
    "Apply the supervision framework to any Cowork task",
    "Identify tasks that are suitable (and unsuitable) for agentic automation"
  ],
  "topics": [
    {
      "title": "What Cowork does that Chat cannot",
      "body": [
        "Claude Chat is a conversation — you give input, Claude gives output, you use it. Claude Cowork is an agent — you give a goal, Claude takes steps to achieve it, and you supervise the process. This distinction matters because agentic AI can take real actions: creating files, sending requests to connected apps, browsing live websites, and executing sequences of tasks without you being involved in each step.",
        "For Pathfinders, the highest-value Cowork use cases are research workflows (find, read, and synthesise information from multiple sources), document workflows (take input from one format and produce output in another), and preparation workflows (pull context from email, calendar, and notes to prepare a briefing automatically).",
        "The key question before using Cowork for any task is: if this goes slightly wrong, what happens? Low-stakes tasks (drafting, researching) are great for Cowork. High-stakes tasks (sending communications on behalf of a Partner, making purchases) require careful setup and explicit review steps."
      ],
      "pro_tip": "Start every new Cowork workflow by describing the desired outcome, not the steps. Let Claude plan the steps and then review the plan before it executes.",
      "watch_out": "Cowork can access your file system. Only grant file access to folders relevant to the task and review what it creates or modifies before using the output."
    },
    {
      "title": "Connectors and the MCP registry",
      "body": [
        "Connectors are integrations that allow Claude to interact with external applications — your email, calendar, project management tools, cloud storage, and more. They are built on the Model Context Protocol (MCP) standard, an open protocol that allows any developer to build a Claude connector.",
        "The MCP registry is a catalogue of available connectors. For Pathfinders, the most relevant connectors are typically: Google Workspace (Gmail, Calendar, Drive), Notion or similar tools the Partner uses, and any CRM or project management tool in the Partner's stack.",
        "Setting up a connector takes a few minutes and dramatically expands what Cowork can do. With Gmail connected, Claude can search your inbox and summarise threads. With Calendar connected, it can see your Partner's schedule and build briefings around upcoming meetings automatically."
      ],
      "example": "A Pathfinder connects Claude Cowork to Gmail and Calendar. Every Monday morning, they run a workflow: 'Review emails from the last 48 hours, identify any that need Partner attention this week, cross-reference with the calendar, and produce a Monday briefing.' What used to take 45 minutes now takes 5.",
      "watch_out": "Only connect apps where you have authorisation to do so. Do not connect a Partner's personal accounts without explicit permission. Treat connected app access with the same care as account credentials."
    },
    {
      "title": "Supervising agentic workflows",
      "body": [
        "Agentic AI needs a different supervision model than conversational AI. With Chat, every step is visible — you prompt, Claude responds, you evaluate. With Cowork, Claude may take multiple steps before you see any output. This means errors can compound before you catch them.",
        "The supervision framework for Cowork has four components. First: define the desired outcome clearly before starting. Second: review the plan before execution — most Cowork tasks will show you the proposed steps before running them. Third: review the output critically before using it. Fourth: for any workflow that touches real systems (email, calendar, files), run a test on a low-stakes example first.",
        "Think of agentic supervision like supervising a capable contractor. You do not watch every keystroke, but you check in at the key milestones and review the final product before it leaves the building."
      ],
      "pro_tip": "For any new Cowork workflow, run it once in a 'dry run' mode — describe the task and ask Claude to tell you what it would do step by step, without actually doing it. Review the steps before authorising the full run.",
      "watch_out": "Do not run unreviewed agentic workflows on behalf of Partners. An autonomous error that reaches a Partner's client or vendor is much harder to fix than a manual one."
    }
  ],
  "walkthrough_intro": "Set up your first Cowork connector and run a simple workflow.",
  "walkthrough": [
    { "title": "Install Claude Cowork", "body": "Download the Cowork desktop app from anthropic.com and sign in with your Summit 360 enterprise account." },
    { "title": "Open the connector settings", "body": "Navigate to Settings > Connectors. Review the available integrations and identify one that is immediately relevant to your daily work (typically Gmail or Google Calendar)." },
    { "title": "Authorise a connector", "body": "Click 'Connect' on your chosen integration and follow the OAuth authorisation flow. Grant only the permissions the workflow requires — read-only is safer than read-write for initial setup." },
    { "title": "Test with a simple task", "body": "Ask Claude a question that uses the connector: 'What meetings do I have tomorrow and what do I need to prepare for each?' Review the response for accuracy." },
    { "title": "Build a repeatable workflow", "body": "Once the simple test works, design a repeatable workflow you can run weekly — such as a Monday morning briefing from email and calendar data. Document the prompt you use so you can refine it over time." }
  ],
  "kc": {
    "pass_score": 0.8,
    "items": [
      {
        "type": "mcq",
        "prompt": "What is the key difference between Claude Chat and Claude Cowork?",
        "options": [
          "Cowork is faster than Chat",
          "Chat is for writing; Cowork is only for coding",
          "Cowork can take actions across connected apps and files; Chat only generates text responses",
          "Cowork requires a special account that Chat does not"
        ],
        "correct": 2,
        "explain": "Cowork is an agentic environment where Claude executes multi-step workflows and takes real actions through connectors. Chat is a conversational interface that generates text responses."
      },
      {
        "type": "mcq",
        "prompt": "What is the MCP registry?",
        "options": [
          "A list of approved AI prompts for Pathfinders",
          "A catalogue of connectors built on the Model Context Protocol standard",
          "A database of Partner contact information",
          "A version history of Claude model updates"
        ],
        "correct": 1,
        "explain": "The MCP (Model Context Protocol) registry is a catalogue of integrations that allow Claude Cowork to connect with external applications like email, calendar, and project management tools."
      },
      {
        "type": "mcq",
        "prompt": "Before running a new agentic Cowork workflow on a real task, what should you do?",
        "options": [
          "Run it immediately — Cowork is designed to be autonomous",
          "Ask Claude to describe the steps it would take before authorising execution",
          "Connect as many apps as possible first to give Claude full context",
          "Only run it once you have completed all 15 Academy modules"
        ],
        "correct": 1,
        "explain": "Reviewing the proposed steps before execution — a 'dry run' — is the key supervision practice for agentic workflows. Errors in a plan are much easier to catch before execution than after."
      },
      {
        "type": "mcq",
        "prompt": "Which of the following tasks is LEAST suitable for unsupervised Cowork automation?",
        "options": [
          "Summarising emails from the last 48 hours",
          "Researching a company before a Partner meeting",
          "Sending a communication on behalf of a Partner to their client",
          "Compiling a weekly progress summary from project notes"
        ],
        "correct": 2,
        "explain": "Sending communications on behalf of a Partner is high-stakes and irreversible. It requires explicit review and approval before execution — it should never run autonomously without a human review step."
      },
      {
        "type": "open",
        "prompt": "Design a Cowork workflow that would save you significant time in your current Partner work. Describe the goal, the connectors you would need, the steps Claude would take, and how you would supervise it.",
        "answer": "Example: Weekly briefing workflow. Goal: every Friday afternoon, produce a summary of the week's key developments for the Partner to review over the weekend. Connectors needed: Gmail (read access), Google Calendar (read access), Google Drive (read access to notes folder). Steps Claude would take: (1) scan inbox for emails marked important or from key contacts this week; (2) review calendar for meetings that occurred and extract any notes; (3) check the shared Drive folder for any documents created or modified this week; (4) compile a structured briefing: wins, open items, upcoming priorities for next week. Supervision: review the draft briefing before sending to the Partner; verify any specific facts it references; adjust tone to match Partner preferences."
      }
    ]
  },
  "further": [
    { "title": "Anthropic — Claude Cowork overview", "url": "https://www.anthropic.com/claude/cowork", "note": "Official documentation for Cowork features and setup." },
    { "title": "MCP protocol specification", "url": "https://modelcontextprotocol.io", "note": "For technically curious Pathfinders who want to understand how connectors are built." }
  ]
}$pf05$::jsonb WHERE code = 'PF05';
