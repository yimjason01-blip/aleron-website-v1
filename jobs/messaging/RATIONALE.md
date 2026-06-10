# RATIONALE: Messaging Rack

What changed versus the pitch deck and the macbook_78 figma landing, and why. Source material:
the canonical deck (`aleron-pitch-deck/index.html`), the figma curve frames (frame_2/3/4),
`macbook_78.png` full landing, and the binding rules in SHARED_CONTEXT and `meridian-landing/AGENTS.md`.

## What I kept verbatim (these were already right)

- **Hero: "Your best days are still ahead."** The brief named it the anchor and the deck and figma
  agree. No reason to touch it. I evolved only the subhead.
- **Curve stage headlines.** The four figma frames already carry strong, final lines ("The story
  of your future is written on top of this curve.", "It's your body's ability to do what you want
  in life.", "The slope is being written right now, quietly...", "The curve is not destiny.
  Aleron can help you plot a new trajectory."). I kept all four and just added the connective
  supporting copy and the band/zone proof labels around them.
- **The Tuesday-afternoon voice message testimonial.** Verbatim from the figma comp. The brief
  called it gold; it is. I gave it a dedicated section instead of leaving it floating above the
  stats, so it reads as the emotional payoff of the whole engine.
- **The experience steps** (fifteen-minute onboarding, the Invitae kit, Quest Elite bloodwork two
  ways, the physician-led plan) and all the panel detail (ApoB, Lp(a), 163-gene panel, ~3 weeks,
  5 domains). These are the specifics that defeat "generic concierge clinic," so I preserved them
  with units intact.
- **The proof stats** (63% / 12% / 4 in 10 / 35% / 1 in 5) and their source line. See note below.

## What I changed and why

1. **Hero subhead made concrete and human.** The deck subhead was "Physician-led longevity care,
   powered by AI and your genetic, lab, and wearable data." I kept that and added a second line,
   "One physician who sees the whole picture, and a plan for what matters next," because the
   single most distinctive thing about Aleron (one doctor, whole picture, a plan) was not in the
   first thing a visitor reads. "longevity care" alone is the generic-claim trap AGENTS.md warns
   against, so the added line does the specific work.

2. **Cut "longevity" as a standalone claim.** Per the rules against generic longevity claims, I
   reframed the promise around capability and capacity ("the part of the curve where life is still
   yours to run") rather than lifespan. The curve section already teaches this; the copy now
   matches it.

3. **Added a dedicated dual-path close.** The figma comp jumps from stats straight to the footer
   with no real conversion section, and only "Membership / Partnerships" links in the footer. The
   binding page-end pattern requires Apply for Membership (individuals, primary) plus a For
   Employers path (secondary). I authored Section 8 to satisfy this, with individuals visually
   dominant. Headline "Decide who holds the pen" ties the close back to the curve's "still
   unwritten" idea so the page lands where it started.

4. **Surfaced the price in the close.** The deck buried $3,500 to $4,200/yr inside an
   investor-facing comparison table. For the acquisition audience that number is the argument
   (the executive-health field runs $8,000 to $25,000+/yr), so I put it in the open at the point
   of decision. I did not import the full competitor table; that is deck/investor content and
   would clutter a consumer landing.

5. **Reordered proof to flow feeling then evidence.** Figma order was testimonial then stats. I
   kept that sequence but split them into two sections so the human moment gets its own screen and
   the stats read as a clean evidence rack rather than a sidebar to the quote.

6. **Folded the deck's investor slides out of the landing.** The competitive table, TAM, and
   market-validation tiles ("23 interviews", "96% / 9%") are pitch-deck material. I dropped the
   table entirely and demoted the 96%/9% interview stat to an optional supporting beat in Section
   7, because it is genuinely persuasive ("the money was never the barrier, clarity and time
   were") and it is real, but it should not crowd the clinical proof.

7. **CTA hygiene.** The figma hero button said "Demo." Per SHARED_CONTEXT the acquisition CTA is
   `Apply for Membership` and the header is `Log In`, never `Join`. Applied throughout.

8. **Tightened the engine section headline.** Figma: "Getting your Aleron MD results and care plan
   is easy." I changed "easy" to "straightforward" and added "No forty-page intake. No waiting
   room." "Easy" is an adjective claim; the no-intake / no-waiting-room line is the specific true
   thing that earns it.

## Numbers: what is real and what is flagged

All clinical and proof numbers below come from source material. **I invented none.**

- **Pricing $3,500 to $4,200/yr**, competitor pricing, panel sizes, ~3 week turnaround, 5 risk
  domains: from the deck.
- **Proof stats (63% / 12% / 4 in 10 / 35% / 1 in 5):** from the figma comp, and the comp carries
  an explicit source line, "Drawn from PREVENT (AHA 2023), CAC reclassification studies (MESA, CAC
  Consortium), and pharmacogenomics plus clinical-grade genetic-panel actionable yield in adult
  preventive populations." Because they are sourced to published literature, I treated them as
  real and reproduced the source line verbatim as required fine print. These are population-yield
  figures, not Aleron's own outcomes data, and the copy is worded accordingly ("members get a
  plan that...", not "Aleron reduced X").
- **96% / 9% / 23 interviews:** real, from the deck's market-validation slide.
- **Testimonial (J.L., member since 2025):** verbatim from the figma comp. Treated as a real
  member quote supplied by the source; not altered.

## One discrepancy to resolve before build

The Invitae panel is cited as **163 genes** in the deck's experience section and as **167 genes**
in the deck's competitive table. I used **163** throughout (the more detailed, member-facing
copy). Builders should confirm the correct count with the clinical team and make it consistent. I
did not split the difference or guess a third number.

## Rules check (all green)

- No em dashes in any copy line. Verified.
- No rounded-pill eyebrow tags; section labels are plain text / monospace heads only.
- Header CTA `Log In`, acquisition CTA `Apply for Membership`, no `Join`.
- Clinical values carry units / qualifiers (ApoB, Lp(a), 163-gene, HbA1c, hsCRP, etc.).
- Brand lane held: navy / bronze / rust / cream, square edges, restrained scroll-driven motion.
- Every headline is written to survive being read aloud, and to say a specific true thing.
