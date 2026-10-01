# brainstorm — Example

## Input
> /prichrd:brainstorm I want rate limiting on our public API. Context: ~/code/shop-api

## Step 2 — What I see
- Express app, routes in `src/routes/`, auth middleware `src/mw/auth.ts`.
- Redis already used for sessions (`src/lib/redis.ts`).
- No rate limiting today; CLAUDE.md says design docs go in `docs/rfcs/NNNN-slug.md`.
Anything wrong or missing?

## Step 3 — A bounce turn
> 1. Limit per API key or per IP? I'd go per key, IP fallback for anonymous routes.
> 2. On limit: 429 with `Retry-After`, or queue? Recommend 429.

User: "per key, 429. Also exempt /health."

**Shared understanding**
- Goal: protect public API from abusive clients
- Users/caller: third-party API-key holders
- Scope: all `/v1/*` routes; per-key, IP fallback
- Non-goals: billing tiers, `/health`
- Constraints: reuse existing Redis
- Affected areas: `src/mw/`, `src/lib/redis.ts`, `src/app.ts`
- Acceptance criteria: 101st req/min per key → 429 + `Retry-After`; `/health` never limited
- Open questions: limit value per tier? *(deferred — product, after launch)*

## Step 4–5
> I think this is implementable — write it up, or keep going?

User: "write it". Found `docs/rfcs/0000-template.md`, last RFC `0011`.
> Propose `docs/rfcs/0012-api-rate-limiting.md` using the RFC template. OK?

User: "yes".

## Output
`docs/rfcs/0012-api-rate-limiting.md` written; not committed.

## Scorecard
```
B1 PASS  README, CLAUDE.md, src/ read; summary before first question
B2 PASS  max 2 questions per turn
B3 PASS  block shown after each of 3 answers, 8 fields
B4 PASS  user: "write it"
B5 PASS  both criteria observable via HTTP
B6 PASS  1 open question, deferred
B7 PASS  CLAUDE.md → docs/rfcs/ convention
B8 PASS  user: "yes"
B9 PASS  file exists, RFC template headings
B10 PASS src/mw/, src/lib/redis.ts, src/app.ts exist
B11 PASS git status: only the RFC
B12 PASS memory: no corrections
Result: PASS (12/12)
```
