# Landing Permutation B: Rationale

The deck becomes the site. One continuous scroll, full-viewport chapters, the capability curve as the structural spine.

## Choices

**Chapter architecture.** The page reads as nine chapters in the messaging rack's exact order: Promise (hero), The Curve (scrolly), Your Curve (live module), Signals, The Engine, Ongoing, the human moment, Proof, the dual-path close, footer. A fixed right-edge rail in JetBrains Mono shows the chapters and the active one gets the navy-block highlight from the figma frames. While the visitor is inside the curve chapter, the rail expands in place to nest the four stage labels (Intro / Capability / Hazards / Future), so the frame_2..4 rail and the page-level progress UI are one mechanism, not two competing ones. The rail flips to light text over dark chapters and hides below 1180px.

**The sticky curve (the core mechanism).** A 520vh section pins a full-viewport stage. Scroll progress drives a continuous stage float 0..3; the SVG curve geometry is resampled and morphed every frame between three trajectories (baseline, hazard, future), so the line visibly bends rather than swapping images. Stage 1 draws the line in via dash offset. Stage 2 fades in the functional bands (Endurance athlete down to Needs help) and the Do Anything You Want / Dependent On Others zones. Stage 3 morphs to the event drop with the Serious Life Event card and the dashed ghost of where the line would have gone. Stage 4 morphs to the lifted trajectory with the Stronger Golden Years marker above the dashed default. Headlines crossfade in a fixed slot with position driven by the same float. The geometry is an abstract capability scale (no fake units on the teaching chart); real units live in the live module.

**Curve math.** Adapted from the deck/QoL tool rather than transplanted: a logistic decline for the baseline, an exponential-recovery event drop clamped monotone (capability never rises with age, same honesty rule as the source), and the future curve as a time-shifted baseline (you do not get a different body, you get more years at each level).

**Live module.** "Now move it yourself," directly after the scrolly so teach-then-touch is one beat. It is a simplified self-contained adaptation of the QoL three-slider tool: the same TEMPLATES, conditioning interpolation, baseCapacity, and effectiveRisk math, with the two-event fork system collapsed to one combined "serious event" whose age and probability slide with effective risk. Real axis with units (VO2max mL/kg/min), the six lived-capability bands, the average-American dashed reference, presets, and a readout (years above the independence floor, event likelihood). No link out; it is all inline.

**Hero.** The deck's four-plane layered carousel (runner, surfer) with the dot transition grammar and a mild scroll drift on the block plane. Changed `object-fit` from the deck's `fill` to `cover` with `height: max(100svh, 16:9 height)` so the first chapter is truly full-viewport at common desktop sizes instead of letterboxing at 1440x900.

**Conversion close.** Two square panels on warm paper, individual panel larger with the filled `Apply for Membership`, employer panel outline `For Employers`, price stated in the open. No countdowns, no urgency theater beyond the true "opens in waves" line.

**Performance.** All animation is transform/opacity except the SVG path `d` morph, which is inherent to the mechanism and cheap (61 sample points, only re-rendered when stage float moves more than 0.002). All scroll work goes through passive listeners plus requestAnimationFrame ticking, gated by IntersectionObservers so the scrolly, signals parallax, and carousel timers only run in view. Hero planes are the heaviest assets (copied from the deck); the second slide lazy-loads.

**Mobile (intentional degrade).** Below 860px the sticky scrolly is `display:none` and a stacked variant renders instead: the same four headlines and copy with static SVG snapshots of each stage, drawn by the same render function. Sticky-pinning at phone heights is where scrolly jank lives, and the brief explicitly allows a clean static stack. The chapter rail hides, the close panels stack individual-first, the hero gains a scrim for copy legibility, and the live module chart scrolls horizontally like the source tool.

**prefers-reduced-motion.** The scrolly flattens to static stacked headlines, draw-ins complete instantly, reveals and count-ups render final state, carousels stop auto-advancing.

## Deviations

- **"Connects with" wall is set as text, not logos.** The deck's asset library has SVG logos for only 5 of the 8 named devices (no Apple Watch, Fitbit, or Eight Sleep). A mixed logo/text wall reads broken, so the whole wall is quiet mono text. Swap to logos when the full set exists.
- **Footer gradient runs navy-to-rust at 160deg** rather than reusing `--amd-reference-warm-fade` (rust-to-navy, 180deg). The rack asks for a "navy-to-rust gradient field"; the testimonial uses the token fade verbatim, and running the footer the opposite direction keeps the two dark gradient moments from reading identical back to back.
- **Curve chapter ages run 30..90.** The rack's stage 1 copy says "from age 30 to 90" while the figma frames show 40..90. The copy is binding, so 30 wins.
- **Optional interview stat is included** (96% / 9%, from the rack's "use only if a second proof beat is wanted") as a quiet serif block under the sticky proof headline. It earns its place by setting up "decide who holds the pen"; cut it if the proof chapter feels long.
- **Brand reads "Aleron" in running prose and `aleron MD` in the wordmark**, per the rack convention; headline copy is verbatim from the rack with zero edits.
- **The engine carousel images come from the deck's photo library** (`exp-0*.jpg`); steps 03 and 04 use the split-image pairs as specified.

## Open questions

- **Log In destination.** There is no login URL in scope, so `Log In` anchors to the close section. Needs the real member-portal URL before launch.
- **For Employers path.** Currently `mailto:partners@aleronmd.com`. The rack says "links to a contact / partnerships path"; if a partnerships page ships, point it there. Note the source QoL tool used `partners@the-meridian-project.com`; I normalized to the aleronmd.com domain, worth confirming.
- **Hero plane weight.** The two slides total ~5.6MB of PNG. Fine on broadband, heavy on cellular. Recompressing the planes to WebP (or serving the surfer slide on interaction only) is the single biggest performance win available.
- **Live module model honesty.** The simplified one-event fork keeps the spirit of the QoL tool but is not the same model (no cancer/CV split, no vitality coloring, no cognitive window). If clinical review has signed off only on the original tool's framing, the simplification should get a pass too; the disclaimer line under the module flags it as a teaching tool.
- **Scrolly length.** 520vh gives each stage a comfortable dwell at 900px viewports. If user testing says the curve chapter drags, 420vh is the floor before stage transitions start feeling rushed.
