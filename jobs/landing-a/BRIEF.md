# Job 3A — Landing Permutation A: "Faithful Evolution"

Read `../SHARED_CONTEXT.md` first. Then read the finished upstream artifacts:
- Brand guide: `../brand-guide/brand-guide.html` and `../brand-guide/RATIONALE.md`
- Messaging rack: `../messaging/MESSAGING_RACK.md`

These are binding inputs. Implement the messaging rack with the brand guide applied.

## Concept

The closest permutation to the existing direction: the macbook_78.png Figma landing design and the live `figma-hero-shot.html` layered hero, upgraded with the new messaging rack and deck-grade interactions. If Jason shipped tomorrow, this is the safe-but-rich choice.

## Distinctive mechanisms (required)

- Layered photographic hero with geometric block planes and subtle scroll parallax (study `figma-hero-shot.html` for the working pattern — reuse its mechanics, not necessarily its exact assets).
- Scroll-driven capability curve section: the curve draws/progresses as the user scrolls through Intro → Capability → Hazards → Future beats (study the pitch deck's curve implementation in `/Users/jasonyim/Projects/aleron-pitch-deck/index.html` and adapt it).
- Experience carousel (onboarding → results → care plan) with real-feeling product frames.

## Output

`index.html` in THIS directory (`jobs/landing-a/`), self-contained except for an `assets/` subfolder (copy what you need from figma-snapshot and the design-system assets; relative paths only). No build step.

## Verify before finishing

- Open in headless Chrome; screenshot full page to `proof-desktop.png` (1440w) and `proof-mobile.png` (390w).
- Zero em dashes in prose; CTAs are `Log In` / `Apply for Membership`; dual-path close present.
- All asset paths resolve (no 404s in console).
- Write `RATIONALE.md`: choices made, deviations from the rack, open questions.
