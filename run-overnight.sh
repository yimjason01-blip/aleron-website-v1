#!/bin/bash
# Aleron website v1 overnight runner. Stage 1: brand guide + messaging (parallel).
# Stage 2: three landing permutations (parallel), reading stage 1 outputs.
export PATH="$HOME/.hermes/node/bin:/opt/homebrew/bin:$PATH"
ROOT="$HOME/Projects/aleron-website-v1"
LOG="$ROOT/run-logs"; mkdir -p "$LOG"

run_job () {
  local name="$1"; local dir="$2"; local turns="$3"
  echo "[$(date +%H:%M:%S)] START $name"
  ( cd "$dir" && claude -p "Read BRIEF.md in this directory and complete the job fully. Work autonomously to completion." \
      --model claude-fable-5 \
      --dangerously-skip-permissions \
      --max-turns "$turns" \
      --output-format json \
      > "$LOG/$name.json" 2> "$LOG/$name.err" )
  local rc=$?
  echo "[$(date +%H:%M:%S)] DONE $name rc=$rc subtype=$(python3 -c "import json;print(json.load(open('$LOG/$name.json')).get('subtype','?'))" 2>/dev/null)"
  return $rc
}

retry_job () { # retry once on failure (quota contention with other agent)
  local name="$1"; local dir="$2"; local turns="$3"
  run_job "$name" "$dir" "$turns" || { echo "[$(date +%H:%M:%S)] RETRY $name in 10m"; sleep 600; run_job "$name" "$dir" "$turns"; }
}

echo "=== STAGE 1 $(date) ==="
retry_job brand-guide "$ROOT/jobs/brand-guide" 60 &
P1=$!
sleep 90  # stagger launches
retry_job messaging "$ROOT/jobs/messaging" 50 &
P2=$!
wait $P1 $P2

# Gate: stage 2 needs stage 1 outputs
if [ ! -f "$ROOT/jobs/brand-guide/brand-guide.html" ] || [ ! -f "$ROOT/jobs/messaging/MESSAGING_RACK.md" ]; then
  echo "STAGE 1 INCOMPLETE — aborting stage 2"; ls -la "$ROOT/jobs/brand-guide" "$ROOT/jobs/messaging"; exit 1
fi

echo "=== STAGE 2 $(date) ==="
retry_job landing-a "$ROOT/jobs/landing-a" 80 &
PA=$!
sleep 120
retry_job landing-b "$ROOT/jobs/landing-b" 90 &
PB=$!
sleep 120
retry_job landing-c "$ROOT/jobs/landing-c" 80 &
PC=$!
wait $PA $PB $PC

echo "=== COMPLETE $(date) ==="
ls -la "$ROOT"/jobs/*/
