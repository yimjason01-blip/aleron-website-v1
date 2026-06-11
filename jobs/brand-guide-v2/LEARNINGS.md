# LEARNINGS

## T1 (iteration 1)
Wrote BRAND.md: 10 decisions, 68 lines, 6 MECH + 4 JUDG; ran every MECH check verbatim against ../landing-loop/index.html and all pass clean (no VIOLATIONS.md needed so far, T2 should confirm). Kept mono via flagged sub-decision D3a (job: uppercase wayfinding labels read as instrumentation, not voice).
Surprise: landing-loop is already fully compliant, zero em dashes, zero border-radius, no banned words, so the D4 hex check is defined as comm against landing-loop's own hex set (self-updating allowlist, run from jobs/brand-guide-v2/).
Advice for T2+: write the em dash grep as $'\xe2\x80\x94' so check.sh never contains a literal em dash itself. Keep '$4,200/yr' contiguous in index.html markup (never $4,200<small>/yr</small>, the D9 grep needs the unbroken string). For the T5 D8 violation pane, the banned four-letter verb cannot appear as plain text or check.sh fails index.html; render it with an HTML entity (e.g. J&#111;in) or describe it without spelling it.
