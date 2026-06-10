# Landing Permutation C, "Editorial Practice": Rationale

## What this is

`index.html` implements the full MESSAGING_RACK.md spine, sections 1 through 9, with the brand
guide applied, in the premium-practice register the brief asks for: photographic, human-first,
serif-led editorial moments, quiet confident proof. Tokens are inlined verbatim from the brand
guide (which inlines `tokens.css`); nothing is forked or recolored. Square edges throughout, no
pill eyebrows (mono numbered labels), one reveal per element then rest.

## Key choices

**Typography.** The brand guide assigns Source Serif 4 to testimonials and editorial pull quotes,
and Inter Tight to headlines. To get "serif-led editorial moments" without breaking that contract,
all structural headlines stay Inter Tight, while the serif carries every lede, the figure
captions (italic, "Figure 01." grammar), the interview pull quote in Proof, the testimonial, and
the voice-note caption. The serif is the page's connective tissue rather than its skeleton.

**Hero that breathes.** Split editorial hero: copy on page-white left, large photography right.
Two slides (runner, then surfer, per the rack) cross-fade on a slow 9 second cadence with a 16
second ken-burns settle (scale 1.08 to 1.0), dot controls, square navy and rust blocks anchoring
the frame per the layered-hero grammar. No parallax. The split layout also keeps the photos near
their native resolution instead of stretching them full-bleed at 1440.

**The curve as an inline figure.** One drawing, drawn once into view, like a chart in a good
journal article: white plate, fine grid, the six functional bands as mono axis labels, both zone
labels, and all three trajectories in a single composition. The unprevented line (rust-to-navy
gradient) draws first over 2.4s, the Serious Life Event marker and dashed ghost line appear, then
the bronze lifted line draws with its Stronger Golden Years marker. Stage 1's headline is the
section head; stages 2 through 4 run as three editorial entries below the figure with their rack
copy verbatim. The optional "See how Aleron reads your curve" link is included.

**Experience as a stepped reveal.** Four alternating photo-and-copy rows, each image revealed
with a one-shot clip-path wipe, no carousel, no auto-advance. All rack proofs are present: the
eight-name connect wall (set typographically), 163 genes / ~3 weeks, the full five-group Elite
panel marker list, 5 domains / 1 plan, and the Live visit / Async split. Quiet inline Apply link
closes the section.

**The Tuesday voice message.** Section 6 pairs the verbatim quote (full warm-fade panel, serif,
no avatar, per the rack) with an interactive voice-note card: play/pause button, sender and
timestamp meta, 48-bar waveform, and a 0:47 message that "plays" in real time, progress sweeping
the waveform rust as the timer runs. Visual simulation only, no audio, as the brief allows.

**Proof and close.** Stat rack counts up once on entry, source line verbatim as fine print, and
the optional member-interview stat is used as the second proof beat (it is the most editorial
paragraph in the rack). The close is the binding dual-path pattern: individual panel dominant
with the price in the open, employer panel quieter with an outline CTA, competitor pricing
restated in prose fine print, and the rain photograph above as the emotional payoff image.

## Deviations, with reasons

1. **No Conditioning / Lifestyle / Underlying Risk sliders.** The rack's mechanism note calls the
   slider trio the most important interactive element, but this permutation's brief explicitly
   mandates "a beautifully drawn inline figure that animates once into view (single elegant draw,
   not scrollytelling)." Where the two conflicted I followed the brief, which governs this
   permutation's mechanisms. The figure still carries every proof element from all four stages.
   If a reviewer wants the sliders back, they would sit below the figure without disturbing it.
2. **No scroll-driven four-stage redraw and no parallax hero carousel.** Same reason; those are
   the deck-transplant mechanisms of the other permutations.
3. **Signals tableau is typographic, not isometric objects.** The rack describes the deck's
   isometric-object tableau. On this page the four streams are a ruled four-column plate on
   grid paper (the "measured, not guessed" cue kept as the section background). The isometric
   illustration language read as tech-deck, not editorial practice. The stream descriptions pull
   only named, real specifics from elsewhere in the rack.
4. **Connect wall is set in type, not logos.** Source assets contain only six of the eight brand
   marks (no Apple Watch, Fitbit, or Eight Sleep files). A mixed wall of real SVGs and faked
   substitutes would read worse than a uniform typographic wall, so all eight names are set as
   mono tiles.
5. **Headline choices.** Hero and curve stage 1 use the PRIMARY headlines, as the rack
   recommends.
6. **Voice-note sender is "Your Aleron physician."** Inventing a named doctor felt like a claim;
   the rack names no physician.

## Photography notes and gaps

Used: hero-runner and surfer (hero, per rack), exp-01 through exp-04 (the four steps), exp-05
(continuous care), hero-rain (close). All are the warm-graded, mid-life, product-accurate set
from `/Users/jasonyim/Projects/meridian-landing/assets/`. No gray boxes anywhere. Gaps: there is
no imaging/clinical photograph in sources (the Signals section is typographic partly for this
reason), and the surfer frame is portrait-orientation, so at very wide hero sizes it upscales
somewhat; the runner frame leads to soften this.

## Technical

- Self-contained except `assets/` (relative paths) and Google Fonts, the same single external
  dependency the brand guide takes. No build step.
- All motion is once-per-element IntersectionObserver work; `prefers-reduced-motion` degrades
  every mechanism (hero static on slide 1, curve pre-drawn, counters at final values).
- `overflow-x: clip` plus a fluid waveform keep 390px widths clean.
- Proof screenshots were rendered with reduced motion forced so the once-only animations show
  their final states; the animated draw was verified separately mid-flight. The mobile proof was
  rendered through a 390px iframe because headless Chrome on this machine enforces a minimum
  window width that silently widens layout at 390.

## Open questions

1. **Log In destination.** No app URL exists in the inputs, so `Log In` is a dead link. Needs the
   real auth URL before launch.
2. **Apply path.** `Apply for Membership` and `For Employers` currently route to
   `apply@aleronmd.com` mailtos (the only contact surface in the rack). If an application form
   exists, swap the hrefs.
3. **Sliders.** Confirm the no-sliders call above is the intended reading of brief vs rack for
   this permutation.
4. **Footer "MD + AI" link.** The rack's Explore column lists it; it currently anchors to the
   continuous-care section, the closest content on a one-page site.
