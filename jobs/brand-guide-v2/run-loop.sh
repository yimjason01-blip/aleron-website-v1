#!/bin/bash
# Brand guide v2 loop runner — fresh-context Claude Code iteration per task.
# Usage: ./jobs/brand-guide-v2/run-loop.sh [max_iterations]
set -u
cd "$(dirname "$0")/../.."
MAX_ITER="${1:-10}"
CLAUDE=/Users/jasonyim/.hermes/node/bin/claude
DIR=jobs/brand-guide-v2
mkdir -p run-logs

PROMPT='You are one iteration of a continuous build loop producing the aleron MD brand decisions guide.

READ FIRST, in order, completely:
1. jobs/brand-guide-v2/BRIEF.md          (the full specification; this is the contract)
2. jobs/brand-guide-v2/tasks.json        (the task list)
3. jobs/brand-guide-v2/LEARNINGS.md      (if it exists; notes from prior iterations)
4. SHARED_CONTEXT.md                     (house rules and asset paths)
5. jobs/brand-decisions/brand-decisions.html and jobs/landing-loop/index.html (source material)

YOUR JOB THIS ITERATION:
- Find the FIRST task in jobs/brand-guide-v2/tasks.json with "passes": false.
- Implement ONLY that task. All outputs live in jobs/brand-guide-v2/.
- VERIFY against EVERY criterion listed for the task, literally, one by one. For visual criteria render with:
  "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --headless --disable-gpu --window-size=1440,16000 --virtual-time-budget=8000 --screenshot=jobs/brand-guide-v2/verify-TASKID.png jobs/brand-guide-v2/index.html
  and EXAMINE the screenshot with your Read tool before judging it.
- Mechanical floor that must hold in every file you touch: zero em dashes, border-radius only 0 or absent, no pill shapes, "Apply for Membership", "Log In", "$4,200/yr", clinical values always carry units.
- If ALL criteria pass: set "passes": true for that task, then:
  git add jobs/brand-guide-v2 && git commit -m "brand-v2(TASKID): <task title>"
- Append 2-4 lines to jobs/brand-guide-v2/LEARNINGS.md: what you did, anything surprising, advice for the next iteration.
- If you CANNOT make a criterion pass after honest attempts, do NOT mark it passing. Append the blocker under "## BLOCKED TASKID" in LEARNINGS.md and exit. Never fake a pass.
- Touch ONLY this task. Never edit jobs/landing-loop/ or jobs/brand-decisions/ (read-only sources).
- If every task has "passes": true, print ALL_TASKS_COMPLETE and exit without changes.'

for i in $(seq 1 "$MAX_ITER"); do
  REMAINING=$(python3 -c "import json; print(sum(1 for t in json.load(open('$DIR/tasks.json'))['tasks'] if not t['passes']))")
  if [ "$REMAINING" -eq 0 ]; then
    echo "[loop] All tasks complete after $((i-1)) iterations."
    break
  fi
  echo "[loop] Iteration $i — $REMAINING task(s) remaining — $(date '+%H:%M:%S')"
  "$CLAUDE" -p "$PROMPT" --model claude-fable-5 --dangerously-skip-permissions --max-turns 100 \
    > "run-logs/brand-v2-iter-$i.json" 2>&1
  if grep -q "session limit" "run-logs/brand-v2-iter-$i.json"; then
    echo "[loop] Claude session limit hit. Stopping. Resume with: $DIR/run-loop.sh"
    break
  fi
  AFTER=$(python3 -c "import json; print(sum(1 for t in json.load(open('$DIR/tasks.json'))['tasks'] if not t['passes']))")
  echo "[loop] Iteration $i done. Remaining: $AFTER (was $REMAINING)"
  if [ "$AFTER" -eq "$REMAINING" ]; then
    NOPROG=$((${NOPROG:-0}+1))
    [ "$NOPROG" -ge 2 ] && { echo "[loop] No progress for 2 iterations. Stopping; see $DIR/LEARNINGS.md."; break; }
  else
    NOPROG=0
  fi
done

echo "[loop] Final state:"
python3 -c "import json; [print(' ', t['id'], 'PASS' if t['passes'] else 'open', '-', t['title']) for t in json.load(open('$DIR/tasks.json'))['tasks']]"
