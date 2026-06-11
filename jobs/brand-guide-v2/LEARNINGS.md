# LEARNINGS

## T1 (iteration 1)
Wrote BRAND.md: 10 decisions, 68 lines, 6 MECH + 4 JUDG; ran every MECH check verbatim against ../landing-loop/index.html and all pass clean (no VIOLATIONS.md needed so far, T2 should confirm). Kept mono via flagged sub-decision D3a (job: uppercase wayfinding labels read as instrumentation, not voice).
Surprise: landing-loop is already fully compliant, zero em dashes, zero border-radius, no banned words, so the D4 hex check is defined as comm against landing-loop's own hex set (self-updating allowlist, run from jobs/brand-guide-v2/).
Advice for T2+: write the em dash grep as $'\xe2\x80\x94' so check.sh never contains a literal em dash itself. Keep '$4,200/yr' contiguous in index.html markup (never $4,200<small>/yr</small>, the D9 grep needs the unbroken string). For the T5 D8 violation pane, the banned four-letter verb cannot appear as plain text or check.sh fails index.html; render it with an HTML entity (e.g. J&#111;in) or describe it without spelling it.

## T2 (iteration 2)
Wrote check.sh (all 11 MECH sub-checks: D4 palette via comm against landing-loop, D5 radius, D7 em dash + banned words + units, D8 CTAs, D9 price, D10 lockup). landing-loop exits 0, so no VIOLATIONS.md; verified against a deliberately broken fixture that every check fires with line numbers, exit 1.
Surprise: BRAND.md's D7 unit check is line-level, so "Lp(a) 72 and ApoB 62 mg/dL" passed it; added a per-mention perl check (unit must appear within 15 chars after the value) since the BRIEF demands units on EVERY value.
Gotcha for T3+: shell functions setting flags must not be called inside a pipeline (subshell eats the flag); check.sh uses command substitution into fail_if_found instead. D8/D10 presence checks are unconditional, so index.html needs 'Log In', 'Apply for Membership', and an aleron<sup lockup from the scaffold onward.
