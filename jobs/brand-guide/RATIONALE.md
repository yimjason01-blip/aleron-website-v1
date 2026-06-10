# RATIONALE — Job 1, Brand Guideline

Decisions made while building `brand-guide.html`, and the open questions that need Jason's call. The guide itself is final-rendered and self-contained; nothing here blocks shipping it as v1.

## Key decisions

**1. Tokens inlined verbatim, not linked.** The full `:root` block from `meridian-landing/design-system/tokens.css` is copied into the file's `<style>` head, clearly marked as consumed (not forked). This keeps the deliverable a single portable HTML file that renders anywhere. Trade-off: if tokens.css changes, the guide drifts until the block is re-pasted. The footer names tokens.css as the source of truth to make the dependency explicit.

**2. The guide practices its own rules.** Square edges throughout (`--amd-radius-none`), mono numbered eyebrows instead of pill tags, 68ch body measure, navy/cream/paper section rhythm, reveal-once IntersectionObserver motion with a full `prefers-reduced-motion` static fallback, and zero em dashes in prose. The one em dash in the document is inside the Do/Don't gallery as the explicit counterexample, rendered via HTML entity so the verification grep stays clean.

**3. The capability curve is a live inline SVG, not an image.** The brief's central-idea section is built as an animated SVG that draws itself once on first view: a baseline curve in the rust-to-navy gradient, a dashed bronze "higher trajectory under aleron care" line, square endpoint markers, and the DO ANYTHING YOU WANT / DEPENDENT ON OTHERS zone bands over an age axis (40 to 90). This makes the brand's central idea demonstrate the motion principles in the same breath. The three figma curve exports (`assets/curve-capability.png`, `curve-hazards.png`, `curve-future.png`) were copied locally as reference but are not embedded; the SVG replaces them.

**4. Palette: "the core four" required picking canonical tokens.** tokens.css carries several variants per hue. I chose:
- Navy → `--amd-color-navy` #1E2A4A (over `navy-figma` #2C3240 and `hero-blue` #414C6A)
- Bronze → `--amd-color-gold-reference` #CD9453 (over `text-accent-on-dark` #D9A765 and `warning` #B8792E)
- Rust → `--amd-color-rust` #B9562A (over `rust-figma` #A2653B and `rust-reference` #A35520)
- Cream → `--amd-color-surface-cream` #EFEAE0

The variants appear in a secondary "supporting surfaces and accents" strip so they are documented without competing. Domain data-viz colors are called out as member-app-only, never marketing chrome.

**5. Voice section is six binding pairs, each with a "why".** They encode the SHARED_CONTEXT rules: sell the plan not the report, name real markers with units, show concrete steps over experience adjectives, make claims a physician would sign, no concierge filler, and tie every benefit back to the curve. Punctuation, CTA naming, and clinical-units rules get their own callout row beneath.

**6. CTA doctrine rendered as real buttons.** `Apply for Membership` (primary) and `Log In` (ghost) appear as live square-edge specimens. The employer path is labeled **For Employers** as a quiet ghost button; the audience section closes with the "two doors, one curve, never a Join button" rule.

**7. The lockup specimen is built in CSS, not an image.** No lockup asset existed in the snapshot, so the icon-plus-wordmark card is constructed from the `--amd-logo-icon-fade` tile and Inter Tight type, with clear-space guidance (one a-height) in the caption.

## Verification done

- Em-dash sweep: zero in prose (the single gallery counterexample is intentional and entity-encoded).
- All 10 referenced image paths resolve to files in `assets/`.
- Headless Chrome render check completed; `proof.png` captured at the root of this directory.

## Open questions for Jason

1. **Canonical bronze.** I used `--amd-color-gold-reference` #CD9453 as "Bronze" in the core four. If the brand's bronze is actually `--amd-color-text-accent-on-dark` #D9A765 (the gold used for MD in the dark wordmark), say the word and the swatch grid swaps.
2. **Employer CTA label.** "For Employers" is my coinage for the secondary door. Confirm the exact label (alternatives: "For Employers & Brokers", "Talk to Us").
3. **Clinical example values.** The guide repeats `Lp(a) 72 nmol/L`, `ApoB 88 mg/dL`, `hsCRP 0.8 mg/L`, and "a 163-gene panel" as specimen copy. Confirm these are the approved illustrative values, since they will get copied verbatim by anyone using the guide.
4. **One voice line reads slightly stiff.** "The Elite panel includes the ApoB and Lp(a) 72 nmol/L markers most physicals miss" bends grammar to fit a unit in. Happy to tighten in v1.1 if you agree.
5. **Unused curve exports.** The three curve PNGs in `assets/` are superseded by the inline SVG. Keep them as reference material, or delete to slim the directory?
6. **Wordmark format.** The wordmarks are small raster PNGs from the snapshot. For a long-lived identity document, vector (SVG) wordmarks would be sharper at print and zoom. Worth sourcing?
7. **Where this lives.** The guide currently sits in `jobs/brand-guide/`. If it becomes the canonical identity doc, it probably belongs alongside (not inside) the design system at `meridian-landing/design-system/`, with a link from the system's README.
