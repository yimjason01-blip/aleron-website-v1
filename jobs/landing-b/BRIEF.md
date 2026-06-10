# Job 3B — Landing Permutation B: "The Deck Becomes the Site"

Read `../SHARED_CONTEXT.md` first. Then read the finished upstream artifacts:
- Brand guide: `../brand-guide/brand-guide.html` and `../brand-guide/RATIONALE.md`
- Messaging rack: `../messaging/MESSAGING_RACK.md`

These are binding inputs. Implement the messaging rack with the brand guide applied.

## Concept

Lean hardest into Jason's stated intent: blend pitch deck, demo, and website into one continuous scroll experience. The page is a guided narrative: full-viewport chapters, scrollytelling, the capability curve as a persistent visual spine that transforms between chapters. Think NYT/Pudding-grade scroll storytelling in the Aleron lowercase-a lane.

## Distinctive mechanisms (required)

- Sticky/pinned capability curve that evolves across multiple scroll chapters (zones appear, hazards strike the curve, the Aleron intervention bends it). Adapt the deck's curve logic from `/Users/jasonyim/Projects/aleron-pitch-deck/index.html`.
- Chapter progression UI (quiet progress indication, e.g. Intro / Capability / Hazards / Future rail like frame_2..4.png in figma-snapshot).
- At least one "live module": an embedded interactive element the visitor can manipulate (e.g. a simplified age/trajectory slider in the spirit of the QoL tool at `/Users/jasonyim/Projects/qol-three-slider/aleron.html` — study it, build a simpler self-contained version, do not link out).
- Conversion close still grounded and calm: the storytelling ends, the dual-path close (Apply / For Employers) is a quiet confident section, not a hard sell.

## Output

`index.html` in THIS directory (`jobs/landing-b/`), self-contained except `assets/` (relative paths). No build step. Performance matters: no jank on scroll (use transform/opacity, IntersectionObserver, requestAnimationFrame).

## Verify before finishing

- Headless Chrome: screenshot at several scroll positions to `proof-1.png` ... `proof-4.png` (1440w) plus `proof-mobile.png` (390w). On mobile, scrollytelling may degrade to stacked static sections; that's acceptable but must be intentional and clean.
- Zero em dashes; `Log In` / `Apply for Membership`; dual-path close present.
- Write `RATIONALE.md`: choices, deviations, open questions.
