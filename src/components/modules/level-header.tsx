interface LevelHeaderProps {
  label: string
  description: string
}

export default function LevelHeader({ label, description }: LevelHeaderProps) {
  const [levelPart, namePart] = label.split(' — ')
  return (
    <div className="flex items-start gap-4 mb-5">
      <div className="shrink-0 w-9 h-9 rounded-full bg-[#1F7A8C]/20 border border-[#1F7A8C]/40 flex items-center justify-center">
        <span className="text-[#2EA8BE] text-xs font-bold">
          {levelPart.replace('Level ', '')}
        </span>
      </div>
      <div>
        <h2
          className="text-lg font-semibold text-[#F2F4F8]"
          style={{ fontFamily: 'Georgia, serif' }}
        >
          {namePart}
        </h2>
        <p className="text-sm text-[#8A93A8]">{description}</p>
      </div>
    </div>
  )
}
