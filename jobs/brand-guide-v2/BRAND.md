# aleron MD BRAND CONTRACT

Ten decisions, one rule each, one check each. This file is the contract every aleron surface is audited against.
[MECH] checks are shell commands, run from jobs/brand-guide-v2/ with the surface HTML file as "$1". Any output is a fail unless the check states otherwise.
[JUDG] checks are the exact question to put to a vision model alongside a full-page render. The required answer is yes.
LOCKED is binding now. PROPOSED is binding until Jason ratifies or rejects it; nobody else flips a flag.
Brand decisions feed the design system, one-way arrow. This contract states rules and bans; it never specifies tokens.

## D1 / LOCKED / [JUDG]

RULE: The brand sells one belief, that you might be just getting started, and every surface embodies disciplined vitality.
CHECK: Ask: "Does this surface read as confident, disciplined, forward-looking vitality, not fear of dying and not airbrushed immortality, and would a 50-year-old executive think 'that is me in ten years, and I am behind on getting there'?"
CHANGES-WHEN: Aleron's positioning leaves prevention-first medicine, and only then.

## D2 / LOCKED / [JUDG]

RULE: Hero subjects read 45 to 60, mid-experience, golden hour, visibly fitter than the viewer at five honest years of work, not a different species.
CHECK: Ask: "Does every hero subject read as age 45 to 60, caught mid-activity rather than posed at the camera, in warm low-angle light, and fit in a way five honest years of work could reach, neither weathered survivor nor airbrushed immortal?"
CHANGES-WHEN: Member research shows buyers anchor to a different decade; the band follows the buyer and never moves past 60.

## D3 / PROPOSED / [JUDG]

RULE: Serif carries the thesis and headlines, sans carries body and data, and mono earns exactly one job, short uppercase wayfinding labels.
SUB-DECISION D3a, FLAGGED, PROPOSED: the mono face stays because wayfinding labels must read as instrumentation, not voice; if that argument fails ratification, sans takes labels and the third face is cut.
CHECK: Ask: "Are all display and section headlines set in the serif face, all paragraphs in the sans face, and does the mono face appear only in short uppercase wayfinding labels such as step numbers, eyebrows, and data captions?"
CHANGES-WHEN: Jason ratifies; reopens only if live testing shows serif headlines underperform sans on the landing page.

## D4 / LOCKED / [MECH]

RULE: Four colors, four jobs: navy is authority, bronze is accent, rust is signal, cream is ground, and no fifth color enters.
CHECK: comm -23 <(grep -oE '#[0-9A-Fa-f]{6}' "$1" | tr '[:lower:]' '[:upper:]' | sort -u) <(grep -oE '#[0-9A-Fa-f]{6}' ../landing-loop/index.html | tr '[:lower:]' '[:upper:]' | sort -u)
CHANGES-WHEN: A full rebrand, never a season, a feature, or a partner.

## D5 / PROPOSED / [MECH]

RULE: Square geometry only: zero border-radius, no pills, and every block earns one of three jobs, frame, anchor, or label.
CHECK: grep -n 'border-radius' "$1" | grep -vE 'border-radius:[[:space:]]*0(px)?[[:space:]]*[;}"]'
CHANGES-WHEN: A source asset physically requires a radius; nothing else reopens this.

## D6 / PROPOSED / [JUDG]

RULE: Photography is golden-hour warm, motion or mid-experience, environment present, never clinical, never posed at camera, never stock happy senior.
CHECK: Ask: "Is every photograph in warm golden-hour light, showing motion or mid-experience with the environment doing half the work, with no clinic, no lab coat, no exam room, and no subject smiling at the camera?"
CHANGES-WHEN: Licensed assets cannot meet golden hour at production quality; the treatment bends before the age band does.

## D7 / LOCKED / [MECH]

RULE: Say the specific true thing: no adjectives doing the work of facts, no em dashes, and clinical values carry units at every mention.
CHECK: grep -n $'\xe2\x80\x94' "$1"; grep -inE '\b(journey|unlock|empower|holistic|elevate)\b' "$1"; grep -nE '(Lp\(a\)|ApoB|hsCRP)[^0-9]{0,3}[0-9]' "$1" | grep -ivE 'nmol/L|mg/dL|mg/L'
CHANGES-WHEN: Never; new filler words are appended to the banned list as the market invents them.

## D8 / LOCKED / [MECH]

RULE: Acquisition says Apply for Membership, the header says Log In, and every page closes with both lanes, individual dominant.
CHECK: grep -c 'Apply for Membership' "$1" returns 1 or more; grep -c 'Log In' "$1" returns 1 or more; grep -nE 'Login|Sign [Ii]n|\bJoin\b|Sign [Uu]p' "$1" returns nothing.
CHANGES-WHEN: The practice stops admitting in waves; application language follows admission reality.

## D9 / LOCKED / [MECH]

RULE: The price is $4,200/yr, stated plainly, all in, no add-on billing, never hidden behind a call.
CHECK: grep -c '\$4,200/yr' "$1" returns 1 or more on any surface that states the price; grep -n '\$4,200' "$1" | grep -v '/yr' returns nothing.
CHANGES-WHEN: The actual price changes; the presentation rules survive any number.

## D10 / PROPOSED / [MECH]

RULE: The lockup is lowercase aleron with a superscript bronze MD, on navy or cream only, with no glow, gradient, or recolor.
CHECK: grep -c 'aleron<sup' "$1" returns 1 or more; grep -nE '(Aleron|ALERON)<sup' "$1" returns nothing; grep -inE 'background-clip:[[:space:]]*text' "$1" returns nothing.
CHANGES-WHEN: Jason ratifies; reopens only if a trademark conflict forces a redraw.
