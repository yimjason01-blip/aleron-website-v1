# Job 3C — Landing Permutation C: "Editorial Practice"

Read `../SHARED_CONTEXT.md` first. Then read the finished upstream artifacts:
- Brand guide: `../brand-guide/brand-guide.html` and `../brand-guide/RATIONALE.md`
- Messaging rack: `../messaging/MESSAGING_RACK.md`

These are binding inputs. Implement the messaging rack with the brand guide applied.

## Concept

The premium-practice permutation: editorial, photographic, human-first. Reads like the website of the best physician practice you've ever seen rather than a tech product. Large tight human photography, generous whitespace, serif-led editorial typography moments, the curve and engine presented as quiet confident proof rather than spectacle. Closest in spirit to a Mayo-meets-magazine treatment, in the lowercase-a lane.

## Distinctive mechanisms (still required — this is not a static brochure)

- Rich but restrained motion: images and text reveal on scroll with editorial pacing; a hero that breathes (slow ken-burns or layered fade, not parallax theatrics).
- The capability curve appears as a beautifully drawn inline figure that animates once into view (single elegant draw, not scrollytelling).
- The "Tuesday voice message from your doctor" moment gets a dedicated interactive treatment: e.g. a play-button voice-note card UI (visual simulation is fine; no real audio required).
- Experience section as an elegant stepped reveal rather than a carousel.

## Photography

Use the human photography available in source assets (figma-snapshot heroes, `/Users/jasonyim/Projects/meridian-landing/assets/`, deck assets). Product-accurate, diverse, large/tight crops per the brand guide. Do not generate placeholder gray boxes; if an ideal photo doesn't exist in sources, choose the best available and note the gap in RATIONALE.md.

## Output

`index.html` in THIS directory (`jobs/landing-c/`), self-contained except `assets/` (relative paths). No build step.

## Verify before finishing

- Headless Chrome: `proof-desktop.png` (1440w full page) + `proof-mobile.png` (390w).
- Zero em dashes; `Log In` / `Apply for Membership`; dual-path close present.
- Write `RATIONALE.md`: choices, deviations, open questions.
