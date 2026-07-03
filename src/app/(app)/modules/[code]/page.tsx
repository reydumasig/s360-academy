import { createClient } from '@/lib/supabase/server'
import { redirect, notFound } from 'next/navigation'
import Link from 'next/link'
import { isUnlocked } from '@/lib/modules'
import KnowledgeCheck from '@/components/modules/knowledge-check'
import type { ModuleWithProgress, ModuleContentSchema } from '@/types'
import type { Module } from '@/types/database'

interface PageProps {
  params: Promise<{ code: string }>
}

type ProgressRow = { module_code: string; completed_at: string | null; score: number | null }

export default async function ModulePage({ params }: PageProps) {
  const { code } = await params
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/login')

  const [{ data: moduleRaw }, { data: allModulesRaw }, { data: progressRaw }] = await Promise.all([
    supabase.from('modules').select('*').eq('code', code).single(),
    supabase.from('modules').select('code,sort_order').order('sort_order'),
    supabase.from('module_progress').select('module_code,completed_at,score').eq('learner_id', user.id),
  ])

  if (!moduleRaw) notFound()
  const moduleData = moduleRaw as Module
  const allProgress = (progressRaw ?? []) as ProgressRow[]
  const progressMap = new Map(allProgress.map((p) => [p.module_code, p]))

  // Build full module list for isUnlocked using DB sort_order (covers OB + PF codes)
  const allModules: ModuleWithProgress[] = (allModulesRaw ?? []).map((m) => {
    const p = progressMap.get(m.code)
    return {
      code: m.code, title: '', subtitle: '', level_key: '', level_label: '',
      duration_min: 0, sort_order: m.sort_order,
      started: !!p,
      completed: !!p?.completed_at,
      score: p?.score ?? null,
      unlocked: false,
    }
  })

  if (!isUnlocked(code, allModules)) redirect('/modules')

  // Mark module as started (no-op if already exists)
  await supabase.from('module_progress').upsert(
    { learner_id: user.id, module_code: code },
    { onConflict: 'learner_id,module_code', ignoreDuplicates: true }
  )

  const myProgress = progressMap.get(code)
  const isCompleted = !!myProgress?.completed_at
  const content = moduleData.content as unknown as ModuleContentSchema
  const hasContent = content && Object.keys(content).length > 0

  // Strip correct answers before passing to client
  const kcQuestions = (content?.kc?.items ?? []).map((item) => {
    if (item.type === 'mcq') {
      return { type: 'mcq' as const, prompt: item.prompt, options: item.options }
    }
    return { type: 'open' as const, prompt: item.prompt }
  })

  return (
    <div className="max-w-3xl mx-auto px-4 sm:px-6 py-10">

      {/* Back link */}
      <Link href="/modules" className="inline-flex items-center gap-1.5 text-xs text-[#8A93A8] hover:text-[#C5CAD8] mb-8 transition-colors">
        ← Back to Academy
      </Link>

      {/* Module header */}
      <header className="mb-10">
        <p className="text-xs text-[#1F7A8C] font-medium uppercase tracking-wider mb-1.5">
          {moduleData.level_label} · {code}
        </p>
        <h1
          className="text-3xl font-bold text-[#F2F4F8] mb-3"
          style={{ fontFamily: 'Georgia, serif' }}
        >
          {moduleData.title}
        </h1>
        <p className="text-[#8A93A8] leading-relaxed">{moduleData.subtitle}</p>
        <div className="flex items-center gap-4 mt-3 text-xs text-[#8A93A8]">
          <span>{moduleData.duration_min} min</span>
          {isCompleted && (
            <span className="text-[#4CAF75]">✓ Completed · {myProgress?.score}%</span>
          )}
        </div>
      </header>

      {!hasContent ? (
        <div className="bg-[#1C2030] border border-[#2A3044] rounded-xl p-8 text-center">
          <p className="text-[#8A93A8] text-sm">
            Content for this module is being prepared. Check back soon.
          </p>
        </div>
      ) : (
        <div className="space-y-12">

          {/* Overview */}
          {content.overview_html && (
            <section>
              <h2 className="text-xl font-semibold text-[#F2F4F8] mb-4" style={{ fontFamily: 'Georgia, serif' }}>
                Overview
              </h2>
              <div
                className="text-[#C5CAD8] leading-relaxed space-y-3"
                dangerouslySetInnerHTML={{ __html: content.overview_html }}
              />
            </section>
          )}

          {/* Learning outcomes */}
          {content.outcomes && content.outcomes.length > 0 && (
            <section>
              <h2 className="text-xl font-semibold text-[#F2F4F8] mb-4" style={{ fontFamily: 'Georgia, serif' }}>
                What you&apos;ll learn
              </h2>
              <ul className="space-y-2">
                {content.outcomes.map((outcome, i) => (
                  <li key={i} className="flex items-start gap-2.5 text-sm text-[#C5CAD8]">
                    <span className="text-[#1F7A8C] mt-0.5 shrink-0">✓</span>
                    {outcome}
                  </li>
                ))}
              </ul>
            </section>
          )}

          {/* Topics */}
          {content.topics && content.topics.length > 0 && (
            <section>
              <h2 className="text-xl font-semibold text-[#F2F4F8] mb-6" style={{ fontFamily: 'Georgia, serif' }}>
                Core concepts
              </h2>
              <div className="space-y-8">
                {content.topics.map((topic, i) => (
                  <div key={i} className="border-l-2 border-[#1F7A8C]/40 pl-5">
                    <h3 className="text-[#F2F4F8] font-semibold text-base mb-3">{topic.title}</h3>
                    <div className="space-y-2">
                      {topic.body.map((para, j) => (
                        <p key={j} className="text-[#C5CAD8] text-sm leading-relaxed">{para}</p>
                      ))}
                    </div>
                    {topic.example && (
                      <div className="mt-4 bg-[#161922] border border-[#2A3044] rounded-lg p-4">
                        <p className="text-[10px] text-[#1F7A8C] font-medium uppercase tracking-wider mb-2">Example</p>
                        <p className="text-[#C5CAD8] text-sm leading-relaxed">{topic.example}</p>
                      </div>
                    )}
                    {topic.pro_tip && (
                      <div className="mt-3 bg-[#1F7A8C]/8 border border-[#1F7A8C]/20 rounded-lg p-4">
                        <p className="text-[10px] text-[#2EA8BE] font-medium uppercase tracking-wider mb-1">Pro tip</p>
                        <p className="text-[#C5CAD8] text-sm leading-relaxed">{topic.pro_tip}</p>
                      </div>
                    )}
                    {topic.watch_out && (
                      <div className="mt-3 bg-[#E7C36A]/8 border border-[#E7C36A]/20 rounded-lg p-4">
                        <p className="text-[10px] text-[#E7C36A] font-medium uppercase tracking-wider mb-1">Watch out</p>
                        <p className="text-[#C5CAD8] text-sm leading-relaxed">{topic.watch_out}</p>
                      </div>
                    )}
                  </div>
                ))}
              </div>
            </section>
          )}

          {/* Walkthrough */}
          {content.walkthrough && content.walkthrough.length > 0 && (
            <section>
              <h2 className="text-xl font-semibold text-[#F2F4F8] mb-2" style={{ fontFamily: 'Georgia, serif' }}>
                Step-by-step walkthrough
              </h2>
              {content.walkthrough_intro && (
                <p className="text-[#8A93A8] text-sm mb-6">{content.walkthrough_intro}</p>
              )}
              <ol className="space-y-4">
                {content.walkthrough.map((step, i) => (
                  <li key={i} className="flex gap-4">
                    <span className="shrink-0 w-7 h-7 rounded-full bg-[#1F7A8C]/20 border border-[#1F7A8C]/40 flex items-center justify-center text-xs font-semibold text-[#2EA8BE]">
                      {i + 1}
                    </span>
                    <div className="pt-0.5">
                      <p className="text-[#F2F4F8] text-sm font-medium mb-1">{step.title}</p>
                      <p className="text-[#8A93A8] text-sm leading-relaxed">{step.body}</p>
                    </div>
                  </li>
                ))}
              </ol>
            </section>
          )}

          {/* Practice */}
          {content.practice && content.practice.length > 0 && (
            <section>
              <h2 className="text-xl font-semibold text-[#F2F4F8] mb-2" style={{ fontFamily: 'Georgia, serif' }}>
                Practice exercises
              </h2>
              {content.practice_intro && (
                <p className="text-[#8A93A8] text-sm mb-6">{content.practice_intro}</p>
              )}
              <div className="space-y-4">
                {content.practice.map((item, i) => (
                  <div key={i} className="bg-[#1C2030] border border-[#2A3044] rounded-xl p-5">
                    <p className="text-xs text-[#2EA8BE] font-medium uppercase tracking-wider mb-2">{item.label}</p>
                    <div
                      className="text-[#C5CAD8] text-sm leading-relaxed"
                      dangerouslySetInnerHTML={{ __html: item.html }}
                    />
                  </div>
                ))}
              </div>
            </section>
          )}

          {/* Further reading */}
          {content.further && content.further.length > 0 && (
            <section>
              <h2 className="text-xl font-semibold text-[#F2F4F8] mb-4" style={{ fontFamily: 'Georgia, serif' }}>
                Further reading
              </h2>
              <ul className="space-y-3">
                {content.further.map((item, i) => (
                  <li key={i} className="flex items-start gap-3">
                    <span className="text-[#1F7A8C] mt-0.5 shrink-0">→</span>
                    <div>
                      <a
                        href={item.url}
                        target="_blank"
                        rel="noopener noreferrer"
                        className="text-[#2EA8BE] hover:text-[#1F7A8C] text-sm font-medium underline-offset-2 hover:underline transition-colors"
                      >
                        {item.title}
                      </a>
                      {item.note && <p className="text-[#8A93A8] text-xs mt-0.5">{item.note}</p>}
                    </div>
                  </li>
                ))}
              </ul>
            </section>
          )}

          {/* Divider */}
          <div className="border-t border-[#2A3044]" />

          {/* Knowledge check */}
          <section>
            <KnowledgeCheck
              moduleCode={code}
              questions={kcQuestions}
              alreadyCompleted={isCompleted}
              previousScore={myProgress?.score ?? null}
            />
          </section>

        </div>
      )}
    </div>
  )
}
