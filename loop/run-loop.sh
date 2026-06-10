#!/bin/bash
# Aleron landing loop runner — fresh-context agent per iteration.
# Usage: ./loop/run-loop.sh [codex|claude] [max_iterations]
# Agent picks next passes:false task from loop/tasks.json, implements, verifies, commits, marks done.

set -u
cd "$(dirname "$0")/.."
AGENT="${1:-codex}"
MAX_ITER="${2:-10}"
mkdir -p run-logs loop

PROMPT_TEMPLATE='You are one iteration of a continuous coding loop on the Aleron MD landing page.

READ FIRST (in order):
1. loop/VISION.md  (the brand vision and verifier tests; this is the north star)
2. loop/tasks.json (the task list)
3. loop/LEARNINGS.md if it exists (notes from prior iterations)
4. SHARED_CONTEXT.md (house rules and asset paths)

YOUR JOB THIS ITERATION:
- Find the FIRST task in loop/tasks.json with "passes": false.
- Implement ONLY that task in jobs/landing-loop/index.html (CSS/JS/HTML in that file or its assets dir).
- VERIFY against every criterion listed for the task. Use headless Chrome for visual criteria:
  "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --headless --disable-gpu --window-size=1440,900 --virtual-time-budget=8000 --screenshot=loop/verify-TASKID.png jobs/landing-loop/index.html
  Use --run-all-compositor-stages-before-draw for animation states. For JS assertions use --dump-dom or node.
- Mechanical checks you must always run before declaring done:
  * grep -c -- "—" jobs/landing-loop/index.html   (must be 0)
  * grep -ci "join" on visible copy (must be 0 for CTAs)
  * grep for border-radius values that create pills (no fully-rounded interactive elements)
- If ALL criteria pass: set "passes": true for that task in loop/tasks.json, then:
  git add jobs/landing-loop loop/tasks.json loop/LEARNINGS.md && git commit -m "loop(TASKID): <task title>"
- Append 2-4 lines to loop/LEARNINGS.md: what you did, anything surprising, advice for the next iteration.
- If you CANNOT make a criterion pass after honest attempts, do NOT mark it passing. Append the blocker to loop/LEARNINGS.md under "## BLOCKED TASKID" and exit. Never fake a pass.
- Touch ONLY this task. Do not refactor, do not fix other tasks, do not edit other jobs/ directories.
- If every task already has "passes": true, print ALL_TASKS_COMPLETE and exit without changes.'

for i in $(seq 1 "$MAX_ITER"); do
  # Stop condition
  REMAINING=$(python3 -c "import json; print(sum(1 for t in json.load(open('loop/tasks.json'))['tasks'] if not t['passes']))")
  if [ "$REMAINING" -eq 0 ]; then
    echo "[loop] All tasks complete after $((i-1)) iterations."
    break
  fi
  echo "[loop] Iteration $i — $REMAINING task(s) remaining — agent: $AGENT — $(date '+%H:%M:%S')"

  if [ "$AGENT" = "claude" ]; then
    claude -p "$PROMPT_TEMPLATE" --model claude-fable-5 --dangerously-skip-permissions --max-turns 80 \
      > "run-logs/loop-iter-$i.json" 2>&1
    if grep -q "session limit" "run-logs/loop-iter-$i.json"; then
      echo "[loop] Claude session limit hit. Stopping. Resume later with: ./loop/run-loop.sh claude"
      break
    fi
  else
    codex exec --yolo "$PROMPT_TEMPLATE" > "run-logs/loop-iter-$i.log" 2>&1
  fi

  AFTER=$(python3 -c "import json; print(sum(1 for t in json.load(open('loop/tasks.json'))['tasks'] if not t['passes']))")
  echo "[loop] Iteration $i done. Remaining: $AFTER (was $REMAINING)"
  # Two consecutive no-progress iterations = stop (blocked)
  if [ "$AFTER" -eq "$REMAINING" ]; then
    NOPROG=$((${NOPROG:-0}+1))
    if [ "$NOPROG" -ge 2 ]; then
      echo "[loop] No progress for 2 iterations. Stopping; see loop/LEARNINGS.md for blockers."
      break
    fi
  else
    NOPROG=0
  fi
done

echo "[loop] Final state:"
python3 -c "import json; [print(' ', t['id'], 'PASS' if t['passes'] else 'open', '-', t['title']) for t in json.load(open('loop/tasks.json'))['tasks']]"
