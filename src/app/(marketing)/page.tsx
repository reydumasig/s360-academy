import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import Link from 'next/link'
import Image from 'next/image'

const LEVELS = [
  {
    label: 'Foundations',
    color: '#1F7A8C',
    modules: ['AI Literacy & Mindset', 'Understanding LLMs', 'Prompt Fundamentals'],
  },
  {
    label: 'Tools',
    color: '#2EA8BE',
    modules: ['ChatGPT & Claude', 'AI-Powered Research', 'Writing with AI'],
  },
  {
    label: 'Prompting',
    color: '#4CAF75',
    modules: ['Advanced Prompting', 'Chain-of-Thought', 'System Prompts'],
  },
  {
    label: 'Workflows',
    color: '#E7C36A',
    modules: ['Automating Workflows', 'AI in Sales & CX', 'Data & Reporting'],
  },
  {
    label: 'Excellence',
    color: '#E15A4C',
    modules: ['AI Strategy', 'Ethics & Risk', 'Pathfinder Capstone'],
  },
]

const OUTCOMES = [
  { icon: '🧠', text: 'Think clearly about where AI helps and where human judgement is irreplaceable' },
  { icon: '⚡', text: 'Operate 2–3× faster on research, writing, and reporting tasks' },
  { icon: '🎯', text: 'Write prompts that get precise, reliable output the first time' },
  { icon: '🔄', text: 'Design repeatable AI-assisted workflows for your role' },
  { icon: '🏆', text: 'Earn a verified certificate for each of the 15 modules you complete' },
]

export default async function LandingPage() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (user) redirect('/modules')

  return (
    <div className="min-h-screen text-[#F2F4F8]" style={{ fontFamily: 'system-ui, sans-serif' }}>

      {/* ── Nav ── */}
      <header className="border-b border-[#2A3044] bg-[#161922]/80 backdrop-blur sticky top-0 z-50">
        <div className="max-w-6xl mx-auto px-6 h-14 flex items-center justify-between">
          <Image src="/logo.png" alt="Summit 360" width={48} height={20} className="object-contain" />
          <Link
            href="/login"
            className="text-sm font-medium text-[#1F7A8C] hover:text-[#2EA8BE] transition-colors"
          >
            Sign in →
          </Link>
        </div>
      </header>

      {/* ── Hero ── */}
      <section className="max-w-4xl mx-auto px-6 pt-24 pb-20 text-center">
        <div className="flex justify-center mb-8">
          <Image src="/logo.png" alt="Summit 360" width={100} height={40} className="object-contain opacity-90" />
        </div>
        <p className="text-xs font-semibold text-[#1F7A8C] uppercase tracking-[0.25em] mb-4">
          Pathfinder AI Academy
        </p>
        <h1
          className="text-5xl sm:text-6xl font-bold leading-tight mb-6"
          style={{ fontFamily: 'Georgia, serif' }}
        >
          Judgement first.<br />
          <span className="text-[#1F7A8C]">AI as amplifier.</span>
        </h1>
        <p className="text-lg text-[#8A93A8] max-w-xl mx-auto mb-10 leading-relaxed">
          A 15-module curriculum that turns Summit 360 team members into confident, effective AI practitioners — without losing the human edge that defines great client work.
        </p>
        <Link
          href="/login"
          className="inline-block bg-[#1F7A8C] hover:bg-[#2EA8BE] text-white font-semibold px-8 py-4 rounded-xl text-sm transition-colors"
        >
          Start your Pathfinder journey →
        </Link>
        <p className="mt-4 text-xs text-[#8A93A8]">Restricted to @s360team.com accounts</p>
      </section>

      {/* ── Outcomes ── */}
      <section className="max-w-3xl mx-auto px-6 pb-24">
        <h2
          className="text-2xl font-bold text-center mb-10 text-[#F2F4F8]"
          style={{ fontFamily: 'Georgia, serif' }}
        >
          What you will walk away with
        </h2>
        <div className="space-y-4">
          {OUTCOMES.map((o) => (
            <div key={o.text} className="flex items-start gap-4 bg-[#1C2030] border border-[#2A3044] rounded-xl px-5 py-4">
              <span className="text-xl shrink-0 mt-0.5">{o.icon}</span>
              <p className="text-[#C5CAD8] text-sm leading-relaxed">{o.text}</p>
            </div>
          ))}
        </div>
      </section>

      {/* ── Curriculum ── */}
      <section className="max-w-5xl mx-auto px-6 pb-24">
        <p className="text-xs font-semibold text-[#1F7A8C] uppercase tracking-[0.25em] text-center mb-2">
          Curriculum
        </p>
        <h2
          className="text-2xl font-bold text-center mb-10"
          style={{ fontFamily: 'Georgia, serif' }}
        >
          15 modules across 5 levels
        </h2>
        <div className="grid sm:grid-cols-2 lg:grid-cols-3 gap-4">
          {LEVELS.map((level, li) => (
            <div
              key={level.label}
              className="bg-[#1C2030] border border-[#2A3044] rounded-xl p-5"
            >
              <div className="flex items-center gap-2 mb-3">
                <span
                  className="text-[10px] font-bold uppercase tracking-widest px-2 py-0.5 rounded"
                  style={{ background: level.color + '22', color: level.color }}
                >
                  Level {li + 1}
                </span>
                <span className="text-[#F2F4F8] font-semibold text-sm">{level.label}</span>
              </div>
              <ul className="space-y-1.5">
                {level.modules.map((m, mi) => (
                  <li key={m} className="flex items-center gap-2 text-xs text-[#8A93A8]">
                    <span className="font-mono text-[10px] text-[#2A3044] shrink-0">
                      PF{String(li * 3 + mi + 1).padStart(2, '0')}
                    </span>
                    {m}
                  </li>
                ))}
              </ul>
            </div>
          ))}
          {/* Certificate card */}
          <div className="bg-[#1C2030] border border-[#E7C36A]/30 rounded-xl p-5 flex flex-col justify-center">
            <p className="text-[#E7C36A] text-2xl mb-2">🎓</p>
            <p className="text-[#F2F4F8] font-semibold text-sm mb-1" style={{ fontFamily: 'Georgia, serif' }}>
              Earn a certificate for every module
            </p>
            <p className="text-xs text-[#8A93A8] leading-relaxed">
              Pass the knowledge check and receive a verified S360 certificate — 15 available in total.
            </p>
          </div>
        </div>
      </section>

      {/* ── How it works ── */}
      <section className="max-w-3xl mx-auto px-6 pb-24">
        <h2
          className="text-2xl font-bold text-center mb-10"
          style={{ fontFamily: 'Georgia, serif' }}
        >
          How it works
        </h2>
        <div className="grid sm:grid-cols-3 gap-4 text-center">
          {[
            { step: '01', title: 'Read', body: 'Work through the module content at your own pace — concepts, examples, and pro tips.' },
            { step: '02', title: 'Apply', body: 'Each module includes real practice prompts and scenarios from S360 client work.' },
            { step: '03', title: 'Certify', body: 'Pass the knowledge check to earn your certificate and unlock the next module.' },
          ].map((s) => (
            <div key={s.step} className="bg-[#1C2030] border border-[#2A3044] rounded-xl p-5">
              <p className="font-mono text-xs text-[#1F7A8C] mb-2">{s.step}</p>
              <p className="font-semibold text-[#F2F4F8] mb-2" style={{ fontFamily: 'Georgia, serif' }}>{s.title}</p>
              <p className="text-xs text-[#8A93A8] leading-relaxed">{s.body}</p>
            </div>
          ))}
        </div>
      </section>

      {/* ── CTA ── */}
      <section className="max-w-2xl mx-auto px-6 pb-28 text-center">
        <div className="bg-[#1C2030] border border-[#1F7A8C]/30 rounded-2xl px-8 py-12">
          <p className="text-xs font-semibold text-[#1F7A8C] uppercase tracking-widest mb-3">Ready to begin?</p>
          <h2
            className="text-3xl font-bold mb-4"
            style={{ fontFamily: 'Georgia, serif' }}
          >
            Become a Pathfinder.
          </h2>
          <p className="text-[#8A93A8] text-sm mb-8 max-w-sm mx-auto leading-relaxed">
            Sign in with your Summit 360 Google account and start Module 1 in under two minutes.
          </p>
          <Link
            href="/login"
            className="inline-block bg-[#1F7A8C] hover:bg-[#2EA8BE] text-white font-semibold px-8 py-4 rounded-xl text-sm transition-colors"
          >
            Sign in with Google →
          </Link>
        </div>
      </section>

      {/* ── Footer ── */}
      <footer className="border-t border-[#2A3044] bg-[#161922]/80 backdrop-blur">
        <div className="max-w-6xl mx-auto px-6 h-14 flex items-center justify-between">
          <div className="flex items-center gap-3">
            <Image src="/logo.png" alt="Summit 360" width={48} height={20} className="object-contain opacity-60" />
            <span className="text-[#8A93A8] text-xs">Pathfinder AI Academy</span>
          </div>
          <div className="flex items-center gap-2">
            <span className="text-[10px] font-semibold uppercase tracking-widest text-[#2A3044]">Built by</span>
            <span className="text-xs text-[#8A93A8]">Rey Dumasig</span>
          </div>
        </div>
      </footer>

    </div>
  )
}
