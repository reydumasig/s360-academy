/**
 * Run this once to apply schema + seed to Supabase.
 * Usage: node scripts/migrate.mjs
 * Requires: NEXT_PUBLIC_SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY in .env.local
 */
import { readFileSync } from 'fs'
import { resolve, dirname } from 'path'
import { fileURLToPath } from 'url'

const __dirname = dirname(fileURLToPath(import.meta.url))

// Load env from .env.local manually
const envFile = readFileSync(resolve(__dirname, '../.env.local'), 'utf8')
const env = Object.fromEntries(
  envFile.split('\n')
    .filter(line => line && !line.startsWith('#'))
    .map(line => line.split('=').map(p => p.trim()))
    .filter(([k]) => k)
)

const SUPABASE_URL = env['NEXT_PUBLIC_SUPABASE_URL']
const SERVICE_ROLE_KEY = env['SUPABASE_SERVICE_ROLE_KEY']

if (!SUPABASE_URL || !SERVICE_ROLE_KEY) {
  console.error('Missing NEXT_PUBLIC_SUPABASE_URL or SUPABASE_SERVICE_ROLE_KEY in .env.local')
  process.exit(1)
}

async function runSQL(sql, label) {
  console.log(`\nRunning: ${label}...`)
  const res = await fetch(`${SUPABASE_URL}/rest/v1/rpc/exec_sql`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'apikey': SERVICE_ROLE_KEY,
      'Authorization': `Bearer ${SERVICE_ROLE_KEY}`,
    },
    body: JSON.stringify({ sql }),
  })

  if (!res.ok) {
    const body = await res.text()
    // exec_sql RPC doesn't exist yet — fall through to manual instructions
    if (body.includes('exec_sql') || body.includes('404') || res.status === 404) {
      return false
    }
    console.error(`Error in ${label}:`, body)
    return false
  }

  console.log(`✓ ${label} applied`)
  return true
}

const migrations = [
  { file: '../supabase/migrations/20260505000001_initial_schema.sql', label: 'Initial schema' },
  { file: '../supabase/migrations/20260505000002_seed_modules.sql',   label: 'Seed modules' },
]

let allOk = true
for (const { file, label } of migrations) {
  const sql = readFileSync(resolve(__dirname, file), 'utf8')
  const ok = await runSQL(sql, label)
  if (!ok) { allOk = false; break }
}

if (!allOk) {
  console.log('\n────────────────────────────────────────────')
  console.log('Automatic migration could not run.')
  console.log('Please run these SQL files manually in your Supabase SQL editor:')
  console.log('  https://supabase.com/dashboard/project/dcawisbjbhjzjqqwzdcq/sql/new')
  console.log('')
  migrations.forEach(({ file }) => console.log(`  • supabase/migrations/${file.split('/').pop()}`))
  console.log('\nPaste each file in order and click Run.')
  console.log('────────────────────────────────────────────')
}
