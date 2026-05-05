'use client'

export default function PrintButton() {
  return (
    <button
      onClick={() => window.print()}
      className="text-xs bg-[#1F7A8C] hover:bg-[#2EA8BE] text-white font-medium px-4 py-2 rounded-lg transition-colors"
    >
      Print / Save PDF
    </button>
  )
}
