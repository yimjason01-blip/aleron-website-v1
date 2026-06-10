# Aleron MD Website v1 — Shared Context (read first)

You are building toward the first public release of the Aleron MD website. Aleron MD is a premium, physician-led preventive medicine practice. Public-facing audience: prospective members (patients) primarily, employers/brokers secondarily.

## Source material (read-only, do not modify)

1. **Pitch deck (primary narrative + interaction reference):** `/Users/jasonyim/Projects/aleron-pitch-deck/index.html` (single-file deck, 2300 lines). This deck deliberately blends pitch deck, product demo, and website. Its scroll mechanics, curve visualization, and section interactions are the richness bar.
2. **Figma reference exports:** `/Users/jasonyim/Projects/aleron-website-v1/figma-snapshot/` — hero_1..4.png (hero visual language candidates), texture_1..5.png (texture studies), macbook_78.png (full landing design: hero "Your best days are still ahead.", curve section, carousel, testimonial, stats, footer), frame_2/3/4.png + slide_27.png (capability-curve slides: "Do Anything You Want" vs "Dependent On Others" zones, Intro/Capability/Hazards/Future nav).
3. **Design system production kit:** `/Users/jasonyim/Projects/meridian-landing/design-system/` — `tokens.css`, `components.css`, `patterns.css`, `MARKETING_DESIGN_SYSTEM.md`, `PROVENANCE.md`, assets/. This is the deployed token source of truth.
4. **Current live landing implementation:** `/Users/jasonyim/Projects/meridian-landing/figma-hero-shot.html` (layered hero with parallax, the current canonical landing language).
5. **Repo rules:** `/Users/jasonyim/Projects/meridian-landing/AGENTS.md` (writing + design rules — binding).

## Brand lane (binding)

- **Lowercase-a lane: navy/bronze/rust/cream.** Warm, quiet, premium, editorial. NOT the uppercase-A black/tan lane. Never mix lanes.
- Square edges. Border radius zero unless a source asset requires otherwise.
- Motion: meaningful and restrained. Scroll-driven storytelling yes; bounce/neon/decorative motion no.

## Hard writing rules (binding, check before finishing)

- NO em dashes (—) anywhere in user-facing prose. Use periods, commas, or restructure.
- NO rounded-pill eyebrow tags above headlines.
- Header CTA = `Log In`. Acquisition CTA = `Apply for Membership` (or `Apply`). NEVER `Join`.
- Clinical values always carry units (e.g. "Lp(a) 72 nmol/L", never "Lp(a) 72").
- Vanilla copy is a content problem, not a tone problem: say the specific true thing, not adjectives. Sell what the product enables, not that a tool exists. No generic longevity claims, no concierge-clinic filler that could fit any clinic.
- Physician-led, honest, casual-premium voice.

## Page-end conversion pattern (binding)

The end of the landing page must serve two audiences, like previous Aleron landings:
1. Individuals: Apply for Membership (primary).
2. Employers/brokers: a "For Employers" / contact path (secondary).

## Quality bar

- The site should feel like the pitch deck became a website: scroll-driven capability-curve storytelling, layered heroes, live-feeling modules. Mechanisms, not just words and pictures.
- Desktop-first but must not break on mobile widths.
- Self-contained static output (no build step). Relative asset paths. Deployable to GitHub Pages as-is.
- Verify your own output: open the HTML in headless Chrome if available, check for em dashes (`grep -c '—'` should be 0 in prose), check all asset paths resolve.
