# brainstorm — Evals

Every check is binary: PASS or FAIL. A run succeeds **iff every check PASSes**.

| ID | Check | How |
|---|---|---|
| B1 | Every provided context source was read and summarized before any solution was proposed | transcript: "what I see" summary precedes first proposal |
| B2 | Each bounce turn asks ≤3 questions | count `?`-questions per turn |
| B3 | The Shared understanding block was shown after every user answer, with all 8 fields | transcript |
| B4 | The loop ended only on the user's explicit done/yes | quote the user's line |
| B5 | Every acceptance criterion in the brief is testable (observable pass/fail), or the user ended early and the brief marks it *untestable* | read each criterion |
| B6 | Open questions are empty or each is marked *deferred* (or the user ended early and they're listed as open) | read section |
| B7 | Repo conventions were searched (CLAUDE.md/AGENTS.md/CONTRIBUTING + doc dirs) before proposing a path, and the finding was stated | transcript |
| B8 | Path and structure were confirmed by the user before writing | quote confirmation |
| B9 | The written file exists at the confirmed path and follows the confirmed structure | `ls` + headings match |
| B10 | Affected areas cite real paths when a repo was given | `ls` each cited path |
| B11 | Nothing was implemented or committed | `git status` shows only the brief |
| B12 | Corrections were logged in `memory.md`, or the reply says "memory: no corrections" | `git diff memory.md` + reply |

## Scorecard format

```
B1 PASS  read api/ + README, summary before turn 2
B5 FAIL  "fast enough" → rewritten "p95 < 200ms" → PASS
...
Result: PASS (12/12)
```
