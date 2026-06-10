# BRIEF: Aleron MD Brand Decision Guide (decision log + living guideline, merged)

## What you are building

ONE self-contained HTML page: `jobs/brand-decisions/brand-decisions.html`.
It is a brand decision log and a brand guideline merged: 10 decisions, each shown as
(a) the decision in one sentence, (b) reasoning in 1-2 sentences, (c) a LIVE DEMONSTRATION
rendered in the brand's own visual system using REAL Aleron content, and (d) where useful,
a "NOT THIS" violation example. The page must demonstrate the brand by being built in it.

This is an internal ratification artifact for Jason (founder). He approves by flipping
status flags. Make it beautiful enough to be the brand's reference for the next 6 months.

## Read these first (in order)

1. `loop/VISION.md` — the brand vision and verifier tests. North star. Quote its one-liner.
2. `jobs/landing-loop/index.html` — the current best landing surface. PREFER excerpting/adapting
   its real sections as demonstrations over inventing new examples.
3. `jobs/messaging/MESSAGING_RACK.md` — copy SOT. Use its real headlines in type demos.
4. `SHARED_CONTEXT.md` — house rules and asset paths.
5. `figma-snapshot/` — exported brand reference frames (heroes, textures, palette).
   Use hero_1..4 and texture PNGs as real imagery in demonstrations.
6. Brand thesis (quote it verbatim in D1): "The visual identity is not decoration. It is the
   embodiment of disciplined vitality." Source: the-meridian-project.com/brand.html. The feeling
   is 'future nostalgia'. Confidence not vanity. Expression not competition.

## The 10 decisions (status flags as given — render LOCKED vs PROPOSED visibly)

D1 [LOCKED] Brand thesis & attractor state. "I'm just getting started" as the buyer's takeaway.
   Anti-sterile, anti-vain. Future nostalgia: missing in advance a future you intend to have.
   Demo: the thesis set large in display type over a real hero image.

D2 [LOCKED] Imagery age band & magnetism test. Hero subjects read 45-60, mid-experience,
   golden-hour, visibly fitter than the viewer at "5 honest years of work" distance. The 70s are
   narrated (curve, copy) never cast. Reject both failure modes: weathered survivor AND airbrushed
   immortal. Demo: the runner hero crop annotated PASS; describe the two failure modes as
   labeled empty frames with text (do NOT generate failure imagery).

D3 [PROPOSED] Typography pairing. The deck and landing-loop use a serif display + sans body
   pairing (Source Serif 4 + Inter Tight lineage). Codify: serif for thesis/manifesto/section
   headlines, sans for body/labels/data. Headline names the job; body explains the path; labels
   locate the reader. Demo: real headlines from MESSAGING_RACK set in the pairing at 3 scales.
   Mark PROPOSED because the three landing permutations disagreed; Jason must ratify.

D4 [LOCKED] Palette & roles. Navy (authority, dark fields), bronze/gold (accent, wordmark MD),
   rust (signal/risk/eyebrow labels), cream (ground). Pull exact hex values from
   jobs/landing-loop/index.html CSS custom properties — do not invent new values. Demo: swatches
   WITH role captions, plus one real section excerpt showing all four in use.

D5 [PROPOSED] Block grammar. Square geometric color blocks (navy/rust) as compositional anchors
   on photography; squares everywhere; zero border-radius; no pills, no capsules, no glows.
   Blocks must earn a job (frame, anchor, label) — never decoration. Demo: hero with blocks
   annotated with what each block is doing; NOT-THIS: a pill-shaped tag rendered and crossed out.

D6 [PROPOSED] Photography treatment. Golden-hour warmth, motion or mid-experience, environment
   present (forest, ocean, road), never clinical settings, never posed-at-camera, never stock
   "happy senior". Tribes and singular experiences both valid. Demo: 2-3 figma-snapshot heroes
   captioned with what makes each pass.

D7 [LOCKED] Voice. Say the specific true thing. No adjectives doing the work of facts. No
   generic longevity filler (banned: best life, optimize your health, unlock, journey, empower,
   holistic). Clinical values always carry units. No em dashes ANYWHERE including this artifact.
   Demo: 3 before/after pairs - take real weak lines and show the brand rewrite.

D8 [LOCKED] CTA & lane rules. Acquisition CTA "Apply for Membership", header "Log In", never
   "Join". Dual close always: individual lane (navy card, price visible) + employer/broker lane
   (light card), visually distinct. Demo: excerpt the landing-loop close section.

D9 [LOCKED] Price presentation. $4,200/yr, stated plainly, "ALL IN. NO ADD-ON BILLING."
   Confidence not apology; price transparency is a premium signal. Demo: the price block from
   landing-loop close.

D10 [PROPOSED] Wordmark behavior. lowercase-a "aleron" + superscript bronze "MD" on navy/cream;
   never mixed-case "Aleron" in the lockup (prose may say Aleron MD); no glow, no fade, no
   recolor outside palette. Demo: the wordmark at 3 sizes on navy and on cream, plus misuse row
   (described in text, not rendered as images).

## Hard rules for this artifact itself

- No em dashes. Periods and commas.
- Square edges only, zero border-radius anywhere in the CSS.
- Self-contained: relative refs to ../../figma-snapshot/*.png are fine (same repo, deployed
  together). Google Fonts link for Source Serif 4 + Inter Tight is fine.
- Each decision section: D-number eyebrow (rust, small caps), status flag (LOCKED = navy solid
  square tag, PROPOSED = rust outlined square tag), decision sentence large, reasoning small,
  demonstration, optional NOT-THIS.
- Sticky or top table-of-contents listing D1-D10 with status, so Jason can scan ratification
  state in 5 seconds.
- Footer: "Brand decisions feed the design system. One-way arrow. This guide never specifies
  tokens." and the date.

## Verification (do all before finishing)

1. Render with headless Chrome at 1440 width, full height. Save as proof-brand-decisions.png
   in jobs/brand-decisions/.
2. grep the HTML for em dashes (must be 0), "Join" in visible copy (must be 0), border-radius
   values other than 0 (must be none).
3. Verify every <img> src resolves to an existing file.
4. Write RATIONALE.md: 10 lines, one per decision, noting where its demo content came from
   (which file/section), so Jason can audit provenance.
