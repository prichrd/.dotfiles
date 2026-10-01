---
name: skill-editor
description: Create a new Claude Code skill or edit an existing one (SKILL.md + supporting files) so it triggers on the right prompts, stays lean, and gives actionable steps. Aligns on what "done" means first, grades the skill against a rubric, fixes failures, and logs lessons for next time. Use when asked to write, create, scaffold, improve, tighten, refactor, or fix triggering of a skill, when a skill "never fires" / "fires too often", or to fold a skill's memory.md corrections back into it. Not for editing CLAUDE.md/AGENTS.md, general docs, or running an existing skill.
user-invocable: true
allowed-tools: Read, Write, Edit, Glob, Grep, Bash, AskUserQuestion
---

# skill-editor — Create or Edit a Skill

Input: skill name/path + intent (new skill, what's wrong with an existing one, or "evolve" to fold in memory).
Output: skill dir passing every check in `eval.md`, plus a scorecard.

## Skill contract

Every `prichrd` skill lives in `~/.dotfiles/claude/.claude/skills/prichrd/skills/<name>/` and has exactly these four files:

| File | Purpose |
|---|---|
| `SKILL.md` | Frontmatter + numbered steps. First step loads `memory.md`; second-to-last step grades the run against `eval.md` and shows the scorecard; last step logs corrections to it. |
| `eval.md` | Numbered binary checks (`E1`, `E2`, …). A run succeeds **iff every check PASSes**. No scores, no "partially". |
| `example.md` | One worked run: input → key decisions → output → scorecard. Doubles as the template for shape and tone. |
| `memory.md` | Append-only log of user corrections: one line per day, `YYYY-MM-DD: <≤3 sentences>`. Drives future evolutions. |

Always edit under `~/.dotfiles` (the source of truth), never through `~/.claude/skills/` — it's stowed with `--no-folding`, so new files only appear there after a restow.

## Step 1 — Load memory
Read this skill's `memory.md`. Apply every lesson logged after the last "Folded" entry. If the target skill exists, read its `memory.md` too.

## Step 2 — Locate the skill
- Kebab-case name, no `prichrd:` prefix in the dir or `name:` field.
- New: confirm the name doesn't already exist. Existing: read all four files; note any that are missing.

## Step 3 — Align on done
Before writing, state in 3–5 bullets: what the skill does, when it should trigger, when it should *not*, and what its output is. Ask (AskUserQuestion) only if trigger scope or output is genuinely ambiguous; otherwise state assumptions and proceed.

## Step 4 — Baseline (edit / evolve only)
Grade the current skill against `eval.md` (T/L/A/M checks) and record the FAILs. In evolve mode, take every `memory.md` lesson after the last "Folded" entry and decide for each: fold into `SKILL.md`, turn into an `eval.md` check, or drop (say why).

## Step 5 — Write
- `SKILL.md`: description says *what* + *when* + *when not*, with trigger words a user would actually type. Body is imperative steps, each actionable. No background prose the model already knows. Second-to-last step: "Grade every check in `eval.md` and show the scorecard" (one line per check ID: `PASS`/`FAIL` + evidence, then `Result: PASS|FAIL (n/N)`).
- `eval.md`: every check is binary, observable from the run's output or files, and names how to verify it. Derive checks from Step 3's "done".
- `example.md`: one realistic run, short.
- `memory.md`: new skills start with just the `# <name> — Memory` heading. Never edit or delete past days.

## Step 6 — Grade and fix
Grade the target skill against every check in this skill's `eval.md`. Fix every FAIL and re-grade until all PASS. Show the scorecard in the format defined at the end of `eval.md`.

## Step 7 — Log corrections
If the user corrected anything during this run (wrong assumption, rejected wording, missed step, a FAIL you caused), log them in **this skill's** `memory.md` as one line, `YYYY-MM-DD: <≤3 sentences>`. If today already has a line, rewrite only that line to cover both, still ≤3 sentences; never touch earlier days. In evolve mode, also log what was folded ("Folded lessons through YYYY-MM-DD into …"). If there were no corrections, write nothing and say "memory: no corrections".

## Done when
- Every check in `eval.md` PASSes, scorecard shown.
- `memory.md` updated or explicitly skipped.
- Final reply: skill path, scorecard, files changed, next step for the user (restow with `cd ~/.dotfiles && stow --no-folding claude`, `/reload-plugins`, try `/prichrd:<name>`).
