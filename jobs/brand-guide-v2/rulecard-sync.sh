#!/usr/bin/env bash
# Proves every RULE sentence in BRAND.md appears byte-identical in the proof sheet.
# Usage: bash rulecard-sync.sh [page.html]   (default: index.html next to this script)
# Exit 0 = every rule byte-present and exactly 10 rules found. Nonzero otherwise.

set -u

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
BRAND="$SCRIPT_DIR/BRAND.md"
PAGE="${1:-$SCRIPT_DIR/index.html}"

if [ ! -r "$BRAND" ] || [ ! -r "$PAGE" ]; then
  echo "usage: bash rulecard-sync.sh [page.html] (needs readable BRAND.md and page)" >&2
  exit 2
fi

FAILED=0
COUNT=0
CURRENT_ID="?"

while IFS= read -r LINE; do
  case "$LINE" in
    "## D"*)
      CURRENT_ID="$(printf '%s' "$LINE" | sed 's/^## //; s/ .*//')"
      ;;
    "RULE: "*)
      COUNT=$((COUNT + 1))
      RULE="${LINE#RULE: }"
      if grep -qF -- "$RULE" "$PAGE"; then
        echo "ok   $CURRENT_ID"
      else
        FAILED=1
        echo "FAIL $CURRENT_ID: rule sentence not byte-present in $PAGE:"
        echo "  $RULE"
      fi
      ;;
  esac
done < "$BRAND"

if [ "$COUNT" -ne 10 ]; then
  FAILED=1
  echo "FAIL RULECARD-SYNC: expected 10 RULE lines in BRAND.md, found $COUNT"
fi

if [ "$FAILED" -eq 0 ]; then
  echo "PASS RULECARD-SYNC: all $COUNT BRAND.md rules byte-present in $PAGE"
  exit 0
fi
exit 1
