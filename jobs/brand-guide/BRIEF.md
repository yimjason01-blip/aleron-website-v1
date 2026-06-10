# Job 1 — Brand Guideline (BRAND_GUIDE)

Read `../SHARED_CONTEXT.md` first, then all source material it lists.

## Deliverable

A single self-contained `brand-guide.html` in THIS directory (`jobs/brand-guide/`): a rendered, scrollable brand guideline document that crystallizes Aleron MD's marketing direction. This is an identity document, not a component library (the design system at `/Users/jasonyim/Projects/meridian-landing/design-system/` already owns tokens/components — do not duplicate or contradict it; reference it).

## Required sections

1. **Brand essence** — what Aleron MD is in one paragraph, and what it is not. Category definition before product (premium physician-led preventive medicine; the capability curve is the brand's central idea).
2. **The central idea** — the capability/quality-of-life curve as narrative spine: "your future is written on top of this curve." How every marketing surface relates back to it.
3. **Voice & tone** — with 4-6 paired examples: "We say X / We never say Y." Honest, specific, physician-led, casual-premium. Encode the writing rules from SHARED_CONTEXT.
4. **Visual identity** — lowercase-a lane: wordmark usage, the navy/bronze/rust/cream palette with hex values pulled from `tokens.css` (cite the token names), square-edge grammar, photography direction (human, editorial, diverse, large/tight crops, product-accurate), texture usage (reference the texture studies in figma-snapshot).
5. **Typography** — pulled from the design system, with marketing-context guidance (headline scale, measure, hierarchy).
6. **Motion & interaction principles** — the deck-demo-website blend: scroll-driven storytelling, layered/parallax heroes, restrained meaningful motion. What's allowed, what's banned.
7. **Audience grammar** — how copy shifts between prospective members vs employers/brokers without changing the brand.
8. **Do / Don't gallery** — concrete, at least 6 items, each grounded in a real rule (no Join, no pills, no em dashes, no lane mixing, no generic longevity claims, units on clinical values).

## Style of the artifact itself

The brand guide must practice what it preaches: built with the design system tokens (import or inline them), lowercase-a lane, square edges, editorial layout. Copy figma-snapshot images you reference into `assets/` locally with relative paths.

## Verify before finishing

- Zero em dashes in prose.
- All image paths resolve.
- Render check in headless Chrome (screenshot to `proof.png`) if available.
- Write a short `RATIONALE.md` summarizing key decisions you made and any open questions for Jason.
