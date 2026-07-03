import type { Metadata } from 'next'
import { Inter } from 'next/font/google'
import './globals.css'

const inter = Inter({
  subsets: ['latin'],
  variable: '--font-inter',
  display: 'swap',
})

export const metadata: Metadata = {
  title: 'Pathfinder AI Academy | Summit 360',
  description: 'Master AI tools and amplify your impact as a Summit 360 Pathfinder.',
  icons: {
    icon: '/logo.png',
    apple: '/logo.png',
  },
}

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en" className={`${inter.variable} h-full`}>
      <body className="min-h-full flex flex-col relative">
        {/* Fixed mountain background */}
        <div
          className="fixed inset-0 -z-10 bg-cover bg-center bg-no-repeat"
          style={{ backgroundImage: "url('/bg.jpg')" }}
        />
        {/* Dark overlay — keeps text readable */}
        <div className="fixed inset-0 -z-10 bg-[#0F1115]/80" />
        {children}
      </body>
    </html>
  )
}
