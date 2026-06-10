#!/bin/bash
# Stage 2 only: three landing permutations. Quota-aware: on session-limit, waits until reset.
export PATH="$HOME/.hermes/node/bin:/opt/homebrew/bin:$PATH"
ROOT="$HOME/Projects/aleron-website-v1"
LOG="$ROOT/run-logs"; mkdir -p "$LOG"

limited () { # returns 0 if result file shows session limit
  python3 -c "
import json,sys
try: d=json.load(open('$LOG/$1.json'))
except Exception: sys.exit(1)
sys.exit(0 if 'session limit' in d.get('result','') else 1)"
}

run_job () {
  local name="$1"; local dir="$2"; local turns="$3"
  local attempt=1
  while [ $attempt -le 4 ]; do
    echo "[$(date +%H:%M:%S)] START $name attempt=$attempt"
    ( cd "$dir" && claude -p "Read BRIEF.md in this directory and complete the job fully. Work autonomously to completion. Also write RATIONALE.md if the brief requires it." \
        --model claude-fable-5 --dangerously-skip-permissions --max-turns "$turns" --output-format json \
        > "$LOG/$name.json" 2> "$LOG/$name.err" )
    if limited "$name"; then
      echo "[$(date +%H:%M:%S)] $name hit session limit; sleeping 45m"
      sleep 2700
    else
      echo "[$(date +%H:%M:%S)] DONE $name subtype=$(python3 -c "import json;print(json.load(open('$LOG/$name.json')).get('subtype','?'))" 2>/dev/null)"
      return 0
    fi
    attempt=$((attempt+1))
  done
  echo "[$(date +%H:%M:%S)] GIVE UP $name"
  return 1
}

echo "=== STAGE 2 RELAUNCH $(date) ==="
run_job landing-a "$ROOT/jobs/landing-a" 80 &
PA=$!
sleep 120
run_job landing-b "$ROOT/jobs/landing-b" 90 &
PB=$!
sleep 120
run_job landing-c "$ROOT/jobs/landing-c" 80 &
PC=$!
wait $PA $PB $PC

# Backfill brand-guide RATIONALE.md if missing
if [ ! -f "$ROOT/jobs/brand-guide/RATIONALE.md" ]; then
  ( cd "$ROOT/jobs/brand-guide" && claude -p "brand-guide.html in this directory is complete. Read it and BRIEF.md, then write the missing RATIONALE.md summarizing key decisions and open questions for Jason. Do not modify brand-guide.html." \
      --model claude-fable-5 --dangerously-skip-permissions --max-turns 15 --output-format json \
      > "$LOG/brand-guide-rationale.json" 2>&1 )
fi

echo "=== COMPLETE $(date) ==="
ls -la "$ROOT"/jobs/*/
