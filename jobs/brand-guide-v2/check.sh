#!/usr/bin/env bash
# aleron MD brand verifier. Implements every [MECH] check from BRAND.md.
# Usage: bash check.sh <surface.html>
# Exit 0 = all checks pass. Nonzero = violations printed as rule ID plus offending line numbers.
# The em dash byte sequence is built from hex so this file never contains one itself.

set -u

if [ $# -lt 1 ] || [ ! -r "$1" ]; then
  echo "usage: bash check.sh <surface.html>" >&2
  exit 2
fi

SURFACE="$1"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
LANDING="$SCRIPT_DIR/../landing-loop/index.html"
EMDASH=$'\xe2\x80\x94'
FAILED=0

fail() { # fail <rule-id> <message> <offending lines, may be empty>
  FAILED=1
  echo "FAIL $1: $2"
  if [ -n "${3:-}" ]; then
    echo "$3" | sed 's/^/  line /'
  fi
}

# fail only when the grep output is non-empty
fail_if_found() { # fail_if_found <rule-id> <message> <grep output>
  if [ -n "$3" ]; then
    fail "$1" "$2" "$3"
  fi
}

# D4 [MECH]: no hex color outside the landing-loop palette (the canonical token source).
if [ -r "$LANDING" ]; then
  ROGUE=$(comm -23 \
    <(grep -oE '#[0-9A-Fa-f]{6}' "$SURFACE" | tr '[:lower:]' '[:upper:]' | sort -u) \
    <(grep -oE '#[0-9A-Fa-f]{6}' "$LANDING" | tr '[:lower:]' '[:upper:]' | sort -u))
  for HEX in $ROGUE; do
    LINES=$(grep -in "$HEX" "$SURFACE" | cut -d: -f1 | sort -nu | paste -sd, -)
    fail D4 "hex $HEX is not in the landing-loop palette" "$LINES"
  done
else
  echo "WARN D4: $LANDING not readable, palette check skipped" >&2
fi

# D5 [MECH]: border-radius declarations only 0 or absent. No pills.
# Matches declarations only (border-radius followed by a colon) so a prose
# mention of the property name, as in the D5 rule sentence itself, cannot trip it.
fail_if_found D5 "non-zero border-radius" \
  "$(grep -nE 'border-radius[[:space:]]*:' "$SURFACE" | grep -vE 'border-radius[[:space:]]*:[[:space:]]*0(px)?[[:space:]]*[;}"]')"

# D7 [MECH]: no em dashes.
fail_if_found D7 "em dash found" \
  "$(grep -n "$EMDASH" "$SURFACE")"

# D7 [MECH]: banned filler words, standalone, case-insensitive.
fail_if_found D7 "banned word (journey/unlock/empower/holistic/elevate)" \
  "$(grep -inE '\b(journey|unlock|empower|holistic|elevate)\b' "$SURFACE")"

# D7 [MECH]: clinical values carry units at every mention.
# Line-level check as written in BRAND.md, plus a per-mention check so a unit
# elsewhere on the line cannot excuse a bare value.
fail_if_found D7 "clinical value without unit" \
  "$(grep -nE '(Lp\(a\)|ApoB|hsCRP)[^0-9]{0,3}[0-9]' "$SURFACE" | grep -ivE 'nmol/L|mg/dL|mg/L')"
fail_if_found D7 "clinical value without unit at that mention" \
  "$(perl -ne 'while (/(?:Lp\(a\)|ApoB|hsCRP)[^0-9]{0,3}[0-9][0-9.,]*/g) { my $tail = substr($_, pos(), 15); print "$.: $&$tail\n" unless $tail =~ m{nmol/L|mg/dL|mg/L}i; }' "$SURFACE")"

# D8 [MECH]: Apply for Membership present, Log In present, banned CTA forms absent.
if [ "$(grep -c 'Apply for Membership' "$SURFACE")" -lt 1 ]; then
  fail D8 "'Apply for Membership' missing" ""
fi
if [ "$(grep -c 'Log In' "$SURFACE")" -lt 1 ]; then
  fail D8 "'Log In' missing" ""
fi
fail_if_found D8 "banned CTA form (Login/Sign In/Join/Sign Up)" \
  "$(grep -nE 'Login|Sign [Ii]n|\bJoin\b|Sign [Uu]p' "$SURFACE")"

# D9 [MECH]: on any surface that states the price, it is the exact string $4,200/yr.
if grep -q '\$4,200' "$SURFACE"; then
  if [ "$(grep -c '\$4,200/yr' "$SURFACE")" -lt 1 ]; then
    fail D9 "price stated but never as \$4,200/yr" ""
  fi
  fail_if_found D9 "\$4,200 without /yr" \
    "$(grep -n '\$4,200' "$SURFACE" | grep -v '/yr')"
fi

# D10 [MECH]: lowercase aleron lockup with superscript MD; no case-mixed lockup; no gradient-filled type.
if [ "$(grep -c 'aleron<sup' "$SURFACE")" -lt 1 ]; then
  fail D10 "no lowercase aleron<sup lockup markup" ""
fi
fail_if_found D10 "case-mixed lockup" \
  "$(grep -nE '(Aleron|ALERON)<sup' "$SURFACE")"
fail_if_found D10 "gradient fill on type" \
  "$(grep -inE 'background-clip:[[:space:]]*text' "$SURFACE")"

if [ "$FAILED" -eq 0 ]; then
  echo "PASS: $SURFACE clears every [MECH] check in BRAND.md"
  exit 0
fi
exit 1
