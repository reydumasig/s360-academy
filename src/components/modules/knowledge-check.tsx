'use client'

import { useState } from 'react'
import { useRouter } from 'next/navigation'
import { Button } from '@/components/ui/button'

export interface KcQuestion {
  type: 'mcq' | 'open'
  prompt: string
  options?: string[]
}

interface KcResult {
  type: 'mcq' | 'open'
  correct: boolean
  explain: string | null
  model_answer: string | null
}

interface Props {
  moduleCode: string
  questions: KcQuestion[]
  alreadyCompleted: boolean
  previousScore: number | null
}

export default function KnowledgeCheck({ moduleCode, questions, alreadyCompleted, previousScore }: Props) {
  const router = useRouter()
  const [answers, setAnswers] = useState<(number | string)[]>(questions.map(() => ''))
  const [submitting, setSubmitting] = useState(false)
  const [results, setResults] = useState<KcResult[] | null>(null)
  const [score, setScore] = useState<number | null>(null)
  const [passed, setPassed] = useState<boolean | null>(null)
  const [error, setError] = useState<string | null>(null)

  const allAnswered = answers.every((a, i) => {
    if (questions[i].type === 'mcq') return a !== ''
    return String(a).trim().length > 0
  })

  async function handleSubmit() {
    setSubmitting(true)
    setError(null)
    try {
      const res = await fetch(`/api/modules/${moduleCode}/submit`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ answers }),
      })
      if (!res.ok) throw new Error('Submission failed')
      const data = await res.json()
      setResults(data.results)
      setScore(data.score)
      setPassed(data.passed)
      if (data.passed) router.refresh()
    } catch {
      setError('Something went wrong submitting your answers. Please try again.')
    } finally {
      setSubmitting(false)
    }
  }

  function handleRetry() {
    setAnswers(questions.map(() => ''))
    setResults(null)
    setScore(null)
    setPassed(null)
  }

  if (alreadyCompleted && passed === null) {
    return (
      <div className="bg-[#4CAF75]/10 border border-[#4CAF75]/25 rounded-xl px-6 py-5">
        <p className="text-[#4CAF75] font-semibold text-sm" style={{ fontFamily: 'Georgia, serif' }}>
          ✓ Module completed — {previousScore}%
        </p>
        <p className="text-[#8A93A8] text-xs mt-1">
          You can retake the knowledge check below to improve your score.
        </p>
        <button
          onClick={() => setPassed(null)}
          className="mt-3 text-xs text-[#2EA8BE] hover:text-[#1F7A8C] underline"
        >
          Retake knowledge check
        </button>
      </div>
    )
  }

  if (passed === true) {
    return (
      <div className="bg-[#4CAF75]/10 border border-[#4CAF75]/25 rounded-xl px-6 py-6 text-center">
        <p className="text-3xl mb-3">🎉</p>
        <h3 className="text-[#4CAF75] font-bold text-lg mb-1" style={{ fontFamily: 'Georgia, serif' }}>
          Module complete!
        </h3>
        <p className="text-[#C5CAD8] text-sm mb-4">
          You scored <span className="font-semibold text-[#4CAF75]">{score}%</span> — your certificate has been issued.
        </p>
        <Button
          onClick={() => router.push('/')}
          className="bg-[#1F7A8C] hover:bg-[#2EA8BE] text-white font-medium"
        >
          Back to Academy →
        </Button>
      </div>
    )
  }

  if (passed === false && results) {
    return (
      <div className="space-y-6">
        <div className="bg-[#E15A4C]/10 border border-[#E15A4C]/25 rounded-xl px-6 py-5">
          <p className="text-[#E15A4C] font-semibold text-sm" style={{ fontFamily: 'Georgia, serif' }}>
            Score: {score}% — not quite. Review the feedback below and try again.
          </p>
        </div>
        {results.map((result, i) => (
          <div key={i} className="bg-[#1C2030] border border-[#2A3044] rounded-xl p-5 space-y-2">
            <p className="text-[#F2F4F8] text-sm font-medium">{questions[i].prompt}</p>
            {result.type === 'mcq' && (
              <>
                <p className={`text-xs font-medium ${result.correct ? 'text-[#4CAF75]' : 'text-[#E15A4C]'}`}>
                  {result.correct ? '✓ Correct' : '✗ Incorrect'}
                </p>
                {result.explain && (
                  <p className="text-[#8A93A8] text-xs leading-relaxed">{result.explain}</p>
                )}
              </>
            )}
            {result.type === 'open' && result.model_answer && (
              <div className="bg-[#161922] rounded-lg p-3 text-xs text-[#C5CAD8] leading-relaxed">
                <span className="text-[#2EA8BE] font-medium block mb-1">Model answer:</span>
                {result.model_answer}
              </div>
            )}
          </div>
        ))}
        <Button
          onClick={handleRetry}
          className="bg-[#1F7A8C] hover:bg-[#2EA8BE] text-white font-medium"
        >
          Try again →
        </Button>
      </div>
    )
  }

  if (questions.length === 0) return null

  return (
    <div className="space-y-6">
      <div>
        <h2 className="text-xl font-semibold text-[#F2F4F8] mb-1" style={{ fontFamily: 'Georgia, serif' }}>
          Knowledge Check
        </h2>
        <p className="text-[#8A93A8] text-sm">
          Answer all questions to complete this module and earn your certificate.
        </p>
      </div>

      {questions.map((q, i) => (
        <div key={i} className="bg-[#1C2030] border border-[#2A3044] rounded-xl p-5 space-y-3">
          <p className="text-[#F2F4F8] text-sm font-medium leading-relaxed">
            <span className="text-[#8A93A8] font-mono mr-2">{i + 1}.</span>
            {q.prompt}
          </p>
          {q.type === 'mcq' && q.options && (
            <div className="space-y-2">
              {q.options.map((opt, j) => (
                <label key={j} className="flex items-start gap-3 cursor-pointer group">
                  <input
                    type="radio"
                    name={`q-${i}`}
                    value={j}
                    checked={answers[i] === j}
                    onChange={() => setAnswers((prev) => { const a = [...prev]; a[i] = j; return a })}
                    className="mt-0.5 accent-[#1F7A8C]"
                  />
                  <span className="text-[#C5CAD8] text-sm group-hover:text-[#F2F4F8] transition-colors">{opt}</span>
                </label>
              ))}
            </div>
          )}
          {q.type === 'open' && (
            <textarea
              value={String(answers[i])}
              onChange={(e) => setAnswers((prev) => { const a = [...prev]; a[i] = e.target.value; return a })}
              rows={3}
              placeholder="Type your answer here…"
              className="w-full bg-[#161922] border border-[#2A3044] rounded-lg px-3 py-2 text-sm text-[#F2F4F8] placeholder:text-[#8A93A8] focus:outline-none focus:ring-1 focus:ring-[#1F7A8C] resize-none"
            />
          )}
        </div>
      ))}

      {error && <p className="text-sm text-[#E15A4C]">{error}</p>}

      <Button
        onClick={handleSubmit}
        disabled={submitting || !allAnswered}
        className="w-full bg-[#1F7A8C] hover:bg-[#2EA8BE] text-white font-medium h-11"
      >
        {submitting ? 'Grading…' : 'Submit answers →'}
      </Button>
    </div>
  )
}
