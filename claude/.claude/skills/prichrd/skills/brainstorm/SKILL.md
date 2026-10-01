---
name: brainstorm
description: Brainstorm an idea with the user until both sides share a clear, written understanding that an agent could implement from, then write it to a confirmed location. Accepts repositories, directories, files, URLs or loose notes as context. Use when asked to "brainstorm", "think through", "bounce ideas", "shape this idea", "spec this out with me", or "help me figure out what to build". Not for implementing the result, producing a step-by-step code plan (use plan mode), or editing skills (use skill-editor).
user-invocable: true
allowed-tools: Read, Write, Edit, Glob, Grep, Bash, WebFetch, AskUserQuestion
---

# brainstorm — Converge on a Shared Understanding

Input: an idea (any shape) + optional context sources (repos, dirs, files, URLs).
Output: a brief written to a user-confirmed path, plus a scorecard against `eval.md`.

## Step 1 — Load memory
Read `memory.md`. Apply every lesson logged after the last "Folded" entry.

## Step 2 — Ingest context
For each source given: read its README, CLAUDE.md/AGENTS.md, top-level layout, and the files the idea touches. Skim only — read deeper when a question needs it. Fetch URLs. Then reply with a ≤5-line "what I see" summary and stop for corrections; don't propose solutions yet.

## Step 3 — Bounce
Loop until Step 4's exit condition holds:
1. Ask the 1–3 questions that most reduce ambiguity right now. Prefer concrete options over open questions ("A or B?" with a recommendation). Use AskUserQuestion when options are discrete.
2. Push back when an answer conflicts with the code, earlier answers, or the stated goal — name the conflict.
3. After each answer, update and show the **Shared understanding** block (keep it tight, overwrite, never append history):
   - Goal · Users/caller · Scope · Non-goals · Constraints · Affected areas (paths) · Acceptance criteria · Open questions
4. Read more of the codebase whenever an answer depends on how it works today; cite paths.

Never decide something on the user's behalf silently — record it as an assumption in the block and flag it.

## Step 4 — Check convergence
Exit the loop when **either**:
- The user says it's done ("that's it", "good enough", "write it"), or
- Every field is filled, every acceptance criterion is testable, and Open questions is empty or each item is marked *deferred* with an owner.

When the second condition first holds, say so and ask: "I think this is implementable — write it up, or keep going?" Don't exit without the user's yes.

## Step 5 — Propose where to write
Look for an enforced structure in the target repo, in this order: CLAUDE.md/AGENTS.md/CONTRIBUTING instructions; existing dirs like `docs/rfcs/`, `docs/adr/`, `docs/design/`, `specs/`, `proposals/`, `.plans/`; their templates (`0000-template.md`, numbering, front-matter). 
- Found: propose the exact path and follow that template and numbering.
- Not found / no repo: propose a path (default `docs/briefs/YYYY-MM-DD-<slug>.md`, or scratchpad if outside a repo) and the default structure: Context · Goal · Scope · Non-goals · Constraints · Design notes · Affected areas · Acceptance criteria · Open/deferred questions · Suggested first agent task.
Ask the user to confirm or change path and structure before writing.

## Step 6 — Write
Write the brief at the confirmed path from the final Shared understanding block. Keep the user's terminology. Don't commit. Show the path and a 3-line summary.

## Step 7 — Grade
Grade every check in `eval.md` and show the scorecard: one line per check (`B1 PASS <evidence>`), then `Result: PASS (n/N)` or `Result: FAIL (n/N)` with failing IDs. Fix what can be fixed in the brief and re-grade.

## Step 8 — Log corrections
If the user corrected the process (not the idea itself) — wrong question style, wrong location, premature exit — log it in `memory.md` as one line, `YYYY-MM-DD: <≤3 sentences>`; if today has a line, rewrite only that line. Otherwise say "memory: no corrections".

## Done when
- Every check in `eval.md` PASSes, scorecard shown.
- Brief written at the confirmed path (or the user ended without wanting one, stated explicitly).
- `memory.md` updated or explicitly skipped.

See `example.md` for the expected shape and tone.
