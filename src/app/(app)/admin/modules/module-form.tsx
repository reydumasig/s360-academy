'use client'

import { useState } from 'react'
import { useRouter } from 'next/navigation'

const LEVEL_OPTIONS = [
  { key: 'foundations', label: 'Level 1 — Foundations' },
  { key: 'tools',       label: 'Level 2 — Tools' },
  { key: 'prompting',   label: 'Level 3 — Prompting' },
  { key: 'workflows',   label: 'Level 4 — Workflows' },
  { key: 'excellence',  label: 'Level 5 — Excellence' },
]

const CONTENT_TEMPLATE = {
  overview_html: "<p>Module overview goes here.</p>",
  outcomes: ["Outcome 1", "Outcome 2", "Outcome 3"],
  topics: [
    {
      title: "Topic Title",
      body: ["Paragraph one.", "Paragraph two."],
      example: "Example text here.",
      pro_tip: "Pro tip here.",
      watch_out: "Watch out for this."
    }
  ],
  walkthrough_intro: "Let's walk through this step by step.",
  walkthrough: [
    { title: "Step 1", body: "Step description." }
  ],
  practice_intro: "Try these exercises.",
  practice: [
    { label: "Exercise 1", html: "<p>Exercise description.</p>" }
  ],
  kc: {
    pass_score: 0.7,
    items: [
      {
        type: "mcq",
        prompt: "Question here?",
        options: ["Option A", "Option B", "Option C", "Option D"],
        correct: 0,
        explain: "Explanation of the correct answer."
      },
      {
        type: "open",
        prompt: "Open-ended question here?",
        answer: "Model answer here."
      }
    ]
  },
  further: [
    { title: "Resource Title", url: "https://example.com", note: "Brief description." }
  ]
}

interface Props {
  mode: 'new' | 'edit'
  initialValues?: {
    code?: string
    title?: string
    subtitle?: string
    level_key?: string
    level_label?: string
    duration_min?: number
    pass_score?: number
    sort_order?: number
    content?: object
  }
}

export default function ModuleForm({ mode, initialValues = {} }: Props) {
  const router = useRouter()
  const [saving, setSaving] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [jsonError, setJsonError] = useState<string | null>(null)

  const [code, setCode] = useState(initialValues.code ?? '')
  const [title, setTitle] = useState(initialValues.title ?? '')
  const [subtitle, setSubtitle] = useState(initialValues.subtitle ?? '')
  const [levelKey, setLevelKey] = useState(initialValues.level_key ?? 'foundations')
  const [levelLabel, setLevelLabel] = useState(initialValues.level_label ?? '')
  const [durationMin, setDurationMin] = useState(String(initialValues.duration_min ?? 30))
  const [passScore, setPassScore] = useState(String(initialValues.pass_score ?? 0.7))
  const [sortOrder, setSortOrder] = useState(String(initialValues.sort_order ?? ''))
  const [contentJson, setContentJson] = useState(
    initialValues.content
      ? JSON.stringify(initialValues.content, null, 2)
      : JSON.stringify(CONTENT_TEMPLATE, null, 2)
  )

  function validateJson(val: string) {
    try { JSON.parse(val); setJsonError(null); return true }
    catch (e) { setJsonError((e as Error).message); return false }
  }

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault()
    if (!validateJson(contentJson)) return
    setSaving(true)
    setError(null)

    const payload = {
      code, title, subtitle, level_key: levelKey, level_label: levelLabel,
      duration_min: Number(durationMin), pass_score: Number(passScore),
      sort_order: Number(sortOrder), content: JSON.parse(contentJson),
    }

    const url = mode === 'new' ? '/api/admin/modules' : `/api/admin/modules/${initialValues.code}`
    const method = mode === 'new' ? 'POST' : 'PUT'

    const res = await fetch(url, {
      method,
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(payload),
    })
    const data = await res.json()
    setSaving(false)

    if (!res.ok) { setError(data.error ?? 'Something went wrong'); return }
    router.push('/admin/modules')
    router.refresh()
  }

  return (
    <form onSubmit={handleSubmit} className="space-y-6 max-w-3xl">
      {error && (
        <div className="bg-[#D3594C]/10 border border-[#D3594C]/30 rounded-lg px-4 py-3 text-sm text-[#FF7A6A]">
          {error}
        </div>
      )}

      {/* Basic fields */}
      <div className="bg-[#1C2030] border border-[#2A3044] rounded-xl p-6 space-y-5">
        <h3 className="text-[#F2F4F8] font-semibold text-sm">Module Details</h3>

        <div className="grid grid-cols-2 gap-4">
          <Field label="Code" hint="e.g. PF16">
            <input
              value={code}
              onChange={e => setCode(e.target.value.toUpperCase())}
              disabled={mode === 'edit'}
              placeholder="PF16"
              className="input-base disabled:opacity-50 disabled:cursor-not-allowed"
              required
            />
          </Field>
          <Field label="Sort Order" hint="Position in the curriculum">
            <input
              type="number"
              value={sortOrder}
              onChange={e => setSortOrder(e.target.value)}
              placeholder="16"
              className="input-base"
              required
            />
          </Field>
        </div>

        <Field label="Title">
          <input
            value={title}
            onChange={e => setTitle(e.target.value)}
            placeholder="Module title"
            className="input-base"
            required
          />
        </Field>

        <Field label="Subtitle">
          <input
            value={subtitle}
            onChange={e => setSubtitle(e.target.value)}
            placeholder="One-line subtitle shown on module card"
            className="input-base"
          />
        </Field>

        <div className="grid grid-cols-2 gap-4">
          <Field label="Level">
            <select
              value={levelKey}
              onChange={e => {
                const opt = LEVEL_OPTIONS.find(o => o.key === e.target.value)
                setLevelKey(e.target.value)
                if (opt) setLevelLabel(opt.label)
              }}
              className="input-base"
            >
              {LEVEL_OPTIONS.map(o => (
                <option key={o.key} value={o.key}>{o.label}</option>
              ))}
            </select>
          </Field>
          <Field label="Level Label" hint="Override auto-filled label if needed">
            <input
              value={levelLabel}
              onChange={e => setLevelLabel(e.target.value)}
              placeholder="Level 1 — Foundations"
              className="input-base"
            />
          </Field>
        </div>

        <div className="grid grid-cols-2 gap-4">
          <Field label="Duration (minutes)">
            <input
              type="number"
              value={durationMin}
              onChange={e => setDurationMin(e.target.value)}
              placeholder="30"
              min={1}
              className="input-base"
              required
            />
          </Field>
          <Field label="Pass Score" hint="0–1, e.g. 0.7 = 70%">
            <input
              type="number"
              value={passScore}
              onChange={e => setPassScore(e.target.value)}
              placeholder="0.7"
              min={0}
              max={1}
              step={0.05}
              className="input-base"
              required
            />
          </Field>
        </div>
      </div>

      {/* Content JSON editor */}
      <div className="bg-[#1C2030] border border-[#2A3044] rounded-xl p-6 space-y-3">
        <div className="flex items-center justify-between">
          <div>
            <h3 className="text-[#F2F4F8] font-semibold text-sm">Content (JSON)</h3>
            <p className="text-xs text-[#8A93A8] mt-0.5">overview_html, outcomes, topics, walkthrough, practice, kc, further</p>
          </div>
          <button
            type="button"
            onClick={() => setContentJson(JSON.stringify(CONTENT_TEMPLATE, null, 2))}
            className="text-xs text-[#1F7A8C] hover:text-[#2EA8BE] transition-colors"
          >
            Load template
          </button>
        </div>

        <textarea
          value={contentJson}
          onChange={e => { setContentJson(e.target.value); validateJson(e.target.value) }}
          rows={24}
          spellCheck={false}
          className="w-full bg-[#0F1115] border border-[#2A3044] rounded-lg px-4 py-3 font-mono text-xs text-[#C5CAD8] focus:outline-none focus:border-[#1F7A8C] resize-y"
        />
        {jsonError && (
          <p className="text-xs text-[#FF7A6A]">JSON error: {jsonError}</p>
        )}
      </div>

      {/* Actions */}
      <div className="flex items-center gap-3">
        <button
          type="submit"
          disabled={saving || !!jsonError}
          className="bg-[#1F7A8C] hover:bg-[#2EA8BE] disabled:opacity-50 disabled:cursor-not-allowed text-white font-semibold px-6 py-2.5 rounded-lg text-sm transition-colors"
        >
          {saving ? 'Saving…' : mode === 'new' ? 'Create module' : 'Save changes'}
        </button>
        <button
          type="button"
          onClick={() => router.push('/admin/modules')}
          className="text-sm text-[#8A93A8] hover:text-[#C5CAD8] transition-colors"
        >
          Cancel
        </button>
      </div>

      <style>{`
        .input-base {
          width: 100%;
          background: #0F1115;
          border: 1px solid #2A3044;
          border-radius: 8px;
          padding: 8px 12px;
          font-size: 14px;
          color: #F2F4F8;
          outline: none;
        }
        .input-base:focus { border-color: #1F7A8C; }
        .input-base option { background: #1C2030; }
      `}</style>
    </form>
  )
}

function Field({ label, hint, children }: { label: string; hint?: string; children: React.ReactNode }) {
  return (
    <div>
      <div className="flex items-baseline gap-2 mb-1.5">
        <label className="text-xs font-medium text-[#C5CAD8]">{label}</label>
        {hint && <span className="text-[10px] text-[#8A93A8]">{hint}</span>}
      </div>
      {children}
    </div>
  )
}
