# skill-editor — Evals

Every check is binary: PASS or FAIL. A run succeeds **iff every check PASSes**.
`$DIR` is the target skill's dir under `~/.dotfiles/claude/.claude/skills/prichrd/skills/`.

## T — Trigger accuracy

| ID | Check | How |
|---|---|---|
| T1 | `name` is kebab-case and equals dir name | read frontmatter, `basename "$DIR"` |
| T2 | `description` states what the skill does in its first sentence | read first sentence |
| T3 | `description` lists concrete trigger phrases a user would actually type | point to ≥2 quoted or verbatim phrases |
| T4 | `description` states when *not* to use it, naming the nearest neighbouring task | point to the "Not for …" clause |
| T5 | `description` is ≤ 1024 chars and `name` ≤ 64 chars | `wc -c` on each field |

## L — Lean + progressive disclosure

| ID | Check | How |
|---|---|---|
| L1 | `$DIR` contains `SKILL.md`, `eval.md`, `example.md`, `memory.md` | `ls "$DIR"` |
| L2 | `SKILL.md` is ≤ 150 lines | `wc -l "$DIR/SKILL.md"` |
| L3 | `SKILL.md` has no background prose the model already knows (every paragraph changes behaviour) | read; for each paragraph, name the behaviour it changes |
| L4 | Long templates, examples and reference material live in supporting files, not inline in `SKILL.md` | no code block in `SKILL.md` > 15 lines |
| L5 | Every supporting file is referenced from `SKILL.md`, and every referenced file exists | `ls "$DIR"` vs. filenames grepped from `SKILL.md` |

## A — Actionable steps

| ID | Check | How |
|---|---|---|
| A1 | `SKILL.md` body is numbered steps (`## Step N — …`) | `grep '^## Step' "$DIR/SKILL.md"` |
| A2 | Every step contains at least one imperative instruction with a concrete action (read, run, write, ask, …) | read each step |
| A3 | `SKILL.md` has a "Done when" section that requires every `eval.md` check to PASS | `grep -A3 'Done when'` |
| A4 | Every `eval.md` check has an ID, a PASS/FAIL-answerable statement (no scores, ranges, "mostly"), and a How | read each row |
| A5 | `eval.md` states the success rule: the run succeeds iff every check PASSes | `grep iff "$DIR/eval.md"` |
| A6 | `example.md` shows one complete run: input, output, and a scorecard against `eval.md` | read |
| A7 | `SKILL.md` has a step, right before the memory step, that grades every `eval.md` check and shows the scorecard (one line per check ID with PASS/FAIL + evidence, then `Result:`) in the final reply | read second-to-last step |

## M — Memory

| ID | Check | How |
|---|---|---|
| M1 | The first step of `SKILL.md` reads `memory.md` and applies lessons logged after the last "Folded" entry | read Step 1 |
| M2 | The last step of `SKILL.md` logs corrections as one line per day (rewriting only today's line), or says "memory: no corrections" | read last step |
| M3 | `memory.md` is a `# <name> — Memory` heading followed only by lines matching `^YYYY-MM-DD: `, one per date, each ≤3 sentences | `grep -v` the pattern; `cut -d: -f1 \| uniq -d` is empty |
| M4 | No past day's line was changed or deleted | `git diff "$DIR/memory.md"` touches only today's line |
| M5 | This run's corrections (if any) were appended to skill-editor's own `memory.md`; otherwise the reply says "memory: no corrections" | `git diff` of skill-editor's `memory.md` + final reply |

## Scorecard format

One line per check, grouped by category, fixes shown inline, overall result last:

```
T1 PASS  name = commit-msg
T4 FAIL  no "Not for" clause → added → PASS
...
M5 PASS  memory: no corrections
Result: PASS (22/22)
```

`Result: PASS` only when every line is PASS. Otherwise `Result: FAIL (n/22)` and list the failing IDs.
