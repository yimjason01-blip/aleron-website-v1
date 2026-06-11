# BRAND DECISIONS GUIDE — DEFINITIVE REBUILD

You are building the canonical brand decisions guide for aleron MD. This artifact has two readers and must serve both at the highest standard:

1. **Loop verifier agents** that will cite BRAND.md when auditing every future aleron surface. They need rules as atomic, citable, mechanically-checkable assertions.
2. **Humans** (founder, future designers, agency partners) who need judgment transferred through rendered evidence, not prose. The genre's defining failure is specimen-as-illustration-of-prose. You will build specimen-as-argument: a reader who ignores every word of body copy must still absorb all 10 rules from the rendered surfaces alone.

## The pattern you are correcting
The previous version (`../brand-decisions/brand-decisions.html`, read it first) describes its rules in ~1,000 words of narration, then attaches specimens as illustrations. That is backwards. In this rebuild:
- The **headline IS the rule** — one line, display scale, verbatim from BRAND.md.
- The **specimen IS the argument** — a real aleron surface where the rule is visibly doing compositional or verbal work, with numbered annotations (≤12 words each) pointing at exactly where the rule lives.
- The **violation pane IS the teaching** — the same surface with the rule broken, struck treatment, one caption line. Do/don't pairs are the fastest transfer of judgment that exists.
- **Prose has exactly two legitimate jobs**: edge cases the specimen cannot show, and what would change the decision. Max 2 lines per decision. Anything restating what the specimen shows is a defect.

## Source material (read all before writing anything)
- `../brand-decisions/brand-decisions.html` — the 10 decisions, their statuses, and existing specimens worth carrying forward
- `../landing-loop/index.html` — the live canonical surface; ALL hex values, typefaces, and spacing come verbatim from its CSS custom properties; specimens should be real sections lifted/adapted from it
- `../../SHARED_CONTEXT.md` — house rules and asset references
- `../brand-decisions/RATIONALE.md` — decision rationale from the previous build

## The 10 decisions (statuses carry over exactly)
D1 thesis/attractor state (LOCKED), D2 imagery age band + magnetism test (LOCKED), D3 typography pairing (PROPOSED), D4 color roles (LOCKED), D5 block grammar (PROPOSED), D6 photography treatment (PROPOSED), D7 voice (LOCKED), D8 CTA + lane rules (LOCKED), D9 price presentation (LOCKED), D10 wordmark behavior (PROPOSED).

Pull the rule lines from the existing guide's headlines. Two known defects in D3 you must fix, not carry forward: (a) it smuggles in a third typeface (mono for labels) without arguing for it — either argue for the mono in one explicit line with its job, or cut it and let sans carry labels; make the choice visible as a flagged sub-decision inside D3; (b) any undefined jargon like "surgeon test" must be either defined in one line or deleted.

## Deliverables

### 1. BRAND.md — the verifier contract
- 10 decisions. Each entry: `ID / STATUS / RULE (one testable sentence) / CHECK (concrete method) / CHANGES-WHEN (one line)`.
- Tag every rule `[MECH]` (grep/script-checkable) or `[JUDG]` (vision-checkable, with the exact question a vision model should be asked).
- ≤120 lines. No strategy essay. D1's thesis line IS its rule.

### 2. index.html — the proof sheet
- **Rule card first**: one screen, all 10 rules as single lines with square LOCKED/PROPOSED tags. The 5-second skim layer. No prose.
- **One spread per decision**: rule headline (verbatim byte-match to BRAND.md), in-context specimen with numbered annotations, violation pane (struck, square treatment), caption strip ≤2 lines (edge case + change condition only).
- **Verbal decisions get the most room.** D7: weak/strong rewrite grid, 5 pairs — weak examples modeled on real longevity-market copy patterns (vague "optimize your healthspan journey" filler), strong versions saying the specific true thing with clinical units (Lp(a) 72 nmol/L, ApoB 62 mg/dL — units on EVERY value, no exceptions). D8: both lane cards fully rendered with live buttons (individual on navy with $4,200/yr visible + Apply for Membership; employer/broker on light with For Employers). D9: price card rendered with competitor anchor (Human Longevity $8,000–$98,000/yr, Fountain Life from $15,000/yr) — write these WITHOUT em dashes (use "to": $8,000 to $98,000/yr).
- **D10 wordmark**: lockup rendered at 3 sizes on navy and on cream, plus violation row (mixed case, glow, gradient fill, off-palette recolor — each struck with one-line caption).
- **Self-demonstrating**: the page must pass every rule it states. It is built in the four colors, the approved faces, square blocks, and the voice. The page is the first surface check.sh verifies.
- ≤500 visible words outside rendered specimens (specimen copy is content, not narration).
- Photography: reuse existing treated assets already in this repo (`../brand-decisions/` and `../landing-loop/` image refs). Do not source or generate new images.

### 3. check.sh — the verifier harness
- Implements every [MECH] check from BRAND.md against any HTML file passed as `$1`.
- Checks include at minimum: em dash count = 0; `border-radius` values only 0/absent; banned words (journey, unlock, empower, holistic, elevate) = 0 case-insensitive as standalone words; "Apply for Membership" present on acquisition surfaces; "Log In" exact (never "Login"/"Sign In"); "$4,200/yr" exact; lowercase `aleron` in lockup markup; clinical-value-unit check (any Lp(a)/ApoB/hsCRP mention must be followed by a unit).
- Exit 0 = pass; nonzero = print violated rule IDs with line numbers.
- Run it against `index.html` (must pass) AND `../landing-loop/index.html`. If landing-loop fails any check, DO NOT edit landing-loop — write the violations to `VIOLATIONS.md` with rule IDs and line numbers.

### 4. RULECARD-SYNC check
- Script or inline check proving every rule headline in index.html byte-matches its BRAND.md rule line. No drift between contract and proof sheet, ever.

## Hard constraints (violating any of these is a failed build)
- No em dashes anywhere in any file, including this guide's own prose, captions, and specimen copy. Use commas, periods, or "to".
- No border-radius other than 0. No pill/badge/capsule shapes. Status tags are square.
- "Apply for Membership" (never Join/Sign Up), "Log In" (never Login/Sign In), "$4,200/yr".
- Lowercase `aleron` with superscript bronze MD in every lockup. Prose may say "Aleron MD"; the lockup may not mix case.
- Every clinical value carries its unit at every mention.
- Invent NOTHING: no new hex values, no new typefaces, no new spacing tokens. Everything verbatim from landing-loop CSS custom properties. The brand guide never specifies design-system tokens (brand → design system is a one-way arrow; this guide states rules and bans, the DS owns tokens).
- Premium editorial composition: navy/bronze/rust/cream, square geometry, generous whitespace. No glow, no gradient fills in type or marks.

## Quality bar for the visual work
This page will be reviewed by a founder with a designer's eye who critiques composition first. Spreads must have deliberate vertical rhythm, aligned annotation systems, and specimen croppings that look art-directed rather than pasted. The violation panes must be visually quieter than the correct specimens (the wrong thing never gets the hero treatment). If a spread looks like a slide from a template, redo it.

## Validation protocol (run all, in order, before declaring done)
1. `bash check.sh index.html` → exit 0
2. `bash check.sh ../landing-loop/index.html` → exit 0 or VIOLATIONS.md written
3. Rule-card sync check → pass
4. Word count outside specimens ≤500 → pass (script it)
5. Render full-page screenshot at 1440px wide via headless Chrome (`/Applications/Google Chrome.app/Contents/MacOS/Google Chrome --headless --screenshot=proof.png --window-size=1440,18000 index.html` or equivalent), then LOOK at it. Verify: rule card fits one screen; every decision has specimen + violation; annotations point at real features; no overlapping text; no broken images.
6. Fix anything the screenshot reveals, re-render, re-verify. Do not declare done on a screenshot you haven't examined after your last edit.

Never fake a pass. If a check fails and you cannot fix it, say so explicitly in your final report.
