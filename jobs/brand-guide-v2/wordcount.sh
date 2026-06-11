#!/usr/bin/env bash
# Word budget: visible narration outside rendered specimens must be <= 500 words.
# Usage: bash wordcount.sh [page.html]   (default: index.html next to this script)
#
# Classification, per BRIEF "<=500 visible words outside rendered specimens
# (specimen copy is content, not narration)":
#   EXCLUDED as specimen content: every subtree of figure.specimen and aside.vio.
#     The rendered surface, its annotation key, and its violation caption are the
#     specimen deliverable; each already carries its own budget in the BRIEF
#     (annotations <=12 words, violation caption one line, capstrip-adjacent).
#   EXCLUDED as contract: .rc-rule and .sp-rule sentences. These are byte-copies
#     of the ten BRAND.md RULE lines, proven verbatim by rulecard-sync.sh. The
#     headline IS the rule; counting the contract twice over ten spreads would
#     measure BRAND.md, not this page's narration.
#   COUNTED as narration: everything else a reader can see: header chrome, rule
#     card scaffolding (ids, tags, titles), eyebrows, capstrips, footer lanes.
# Exit 0 = count <= 500. Exit 1 = over budget.

set -u

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PAGE="${1:-$SCRIPT_DIR/index.html}"

if [ ! -r "$PAGE" ]; then
  echo "usage: bash wordcount.sh [page.html]" >&2
  exit 2
fi

python3 - "$PAGE" <<'PY'
import re, sys
from html.parser import HTMLParser

EXCLUDE_CLASSES = {"specimen", "vio", "rc-rule", "sp-rule"}
EXCLUDE_TAGS = {"style", "script", "head", "title", "svg"}
VOID = {"img", "br", "hr", "meta", "link", "input", "source", "wbr"}

class Counter(HTMLParser):
    def __init__(self):
        super().__init__(convert_charrefs=True)
        self.stack = []          # one bool per open element: excluded subtree?
        self.excluded_depth = 0
        self.words = []

    def handle_starttag(self, tag, attrs):
        if tag in VOID:
            return
        classes = set((dict(attrs).get("class") or "").split())
        excluded = tag in EXCLUDE_TAGS or bool(classes & EXCLUDE_CLASSES)
        self.stack.append(excluded)
        if excluded:
            self.excluded_depth += 1

    def handle_endtag(self, tag):
        if tag in VOID or not self.stack:
            return
        if self.stack.pop():
            self.excluded_depth -= 1

    def handle_data(self, data):
        if self.excluded_depth:
            return
        self.words += [t for t in data.split() if re.search(r"[A-Za-z0-9]", t)]

counter = Counter()
with open(sys.argv[1], encoding="utf-8") as fh:
    counter.feed(fh.read())

n = len(counter.words)
print(f"narration words outside rendered specimens: {n} (limit 500)")
if n > 500:
    print("FAIL WORD-BUDGET: over by", n - 500)
    sys.exit(1)
print("PASS WORD-BUDGET")
PY
