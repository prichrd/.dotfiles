# skill-editor — Example

## Input

> Create a skill `commit-msg` that writes a conventional commit message from the staged diff.

## Step 3 — Done

- Does: reads `git diff --staged`, proposes one conventional-commit message (`type(scope): subject` + body).
- Triggers: "write a commit message", "commit this", "conventional commit".
- Not for: committing unstaged work, rewriting history, PR descriptions.
- Output: the message in a code block plus an E1–E3 scorecard; commits only if the user says so.

## Output files

`~/.dotfiles/claude/.claude/skills/prichrd/skills/commit-msg/`

**SKILL.md**
```markdown
---
name: commit-msg
description: Write a conventional commit message from the staged diff. Use when asked to "write a commit message", "commit this", or for a conventional commit. Not for unstaged changes, history rewrites, or PR descriptions.
allowed-tools: Bash, Read
---

# commit-msg

## Step 1 — Load memory
Read `memory.md`; apply every lesson after the last "Folded" entry.

## Step 2 — Read the diff
Run `git diff --staged`. If empty, stop and say so.

## Step 3 — Write the message
Match the shape in `example.md`: `type(scope): subject` (≤72 chars, imperative), blank line, body explaining *why*.

## Step 4 — Grade
Grade every check in `eval.md` and show the scorecard: one line per check (`E1 PASS <evidence>`), then `Result: PASS (n/N)` or `Result: FAIL (n/N)` with failing IDs.

## Step 5 — Log corrections
Log user corrections in `memory.md` as one line, `YYYY-MM-DD: <≤3 sentences>` (rewrite today's line if it exists), or say "memory: no corrections".

## Done when
Every check in `eval.md` PASSes.
```

**eval.md**
```markdown
# commit-msg — Evals

A run succeeds iff every check PASSes.

- **E1** Subject matches `^(feat|fix|docs|refactor|test|chore)(\(.+\))?: .{1,72}$`. *Verify:* regex.
- **E2** Subject is imperative ("add", not "added"). *Verify:* first word.
- **E3** No commit was created without explicit user approval. *Verify:* transcript.
```

**memory.md** (after a few runs)
```markdown
# commit-msg — Memory

2026-10-02: User wanted the scope taken from the top-level dir, not the file name.
2026-10-05: Subject said "Added" — keep it imperative. User also rejected bodies longer than 3 lines.
```

**example.md** — one short run of `commit-msg` with its E-scorecard.

## Scorecard

```
T1 PASS  name = commit-msg
T2 PASS  "Write a conventional commit message…"
T3 PASS  "write a commit message", "commit this"
T4 FAIL  no "Not for" clause → added → PASS
T5 PASS  212 / 9 chars
L1 PASS  four files present
L2 PASS  31 lines
L3 PASS  every paragraph is an instruction
L4 PASS  no code block in SKILL.md
L5 PASS  eval.md, example.md, memory.md referenced
A1 PASS  5 steps
A2 PASS  read / run / write / grade / append
A3 PASS  Done when → eval.md
A4 PASS  E1–E3 binary with verify
A5 PASS  success rule stated
A6 PASS  example has input/output/scorecard
A7 PASS  Step 4 grades eval.md, shows scorecard
M1 PASS  Step 1 loads memory
M2 PASS  Step 5 logs corrections
M3 PASS  heading + one dated line per day
M4 PASS  new file, nothing deleted
M5 PASS  memory: no corrections
Result: PASS (22/22)
```

Next: `cd ~/.dotfiles && stow --no-folding claude`, `/reload-plugins`, try `/prichrd:commit-msg`.
