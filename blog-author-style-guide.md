# Style guide for drafting and editing in Chris's voice

Read this before writing or revising prose for the Commons-Hub pattern document
([`governance/commons-hub-pattern.md`](governance/commons-hub-pattern.md)) or any other
blog-style piece in this repo. It was distilled from one long editing session and Chris's
saved feedback notes, so treat it as a working draft: when Chris's edits contradict it,
Chris wins and this file gets updated.

## How to use this file

When you draft, write a candidate, show it in chat, and wait for approval before touching
the file. When Chris rewrites your draft, compare his version with yours and figure out
which of the patterns below explains the difference. Those diffs are the best evidence of
what he wants.

## The voice

**Arc: problem, then exploration, then payoff.** Sections walk the reader from a problem
through the search for an answer to a payoff, usually ending on a hopeful turn. Dead ends
are fair game. The resilience section is the model: threat, then a real case study, then
the defenses that would have held.

**Linkage between beats.** Reuse a phrase as a hinge so one paragraph hands off to the next.
"Tilt the scales" (later "stack the deck") carried the Overview from the AI stakes to the
Autistici/Inventati takedown. When a bridge feels abrupt, look for the phrase the previous
paragraph ended on and pick it up. Flow matters as much as correctness.

**Concrete over abstract.** Plain, physical wording wins. If a label doesn't explain itself
in one read, replace it. Prefer the noun or verb a reader can picture.

**Conversational and opinionated.** First person, italics for stress (_way_ worse, _our_
collective), parenthetical asides, the occasional rhetorical jab ("Learn to code!"), and
light self-deprecating humor at the end of a hard section. Opinions are fine; say them
directly.

**Calibrated claims.** A sentence must not promise more than the body delivers. Check that
every "we later examine…" is actually examined. Hedges, disclaimers and "not legal advice"
go where they belong and nowhere else.

**Prose first.** Bullets are a last resort. Explain code and diagrams line by line in prose.

## Words and constructions to avoid

- "load-bearing" and other metaphors reused as a tic. Vary word choice.
- "honestly", "the honest version is…" and similar trust-me framing. State the point.
- Ending a sentence on "it" or another weak pronoun. End on a concrete word.
- Labels like "structural edges" that need explaining. Name the thing itself.
- Stacking two different metaphors in one passage. Pick one and extend it.
- Made-up nouns (for example "stackage"). If a real phrase exists, use it.

## Before-and-after examples from Chris's edits

| I drafted | Chris preferred | Why |
|---|---|---|
| "Three structural edges…" | Name each advantage on its own terms | The label needed its own explanation |
| "…attacks like it." | "…survive a takedown of its own." | Ends on a concrete noun |
| "…make any confident forecast… impossible" | "…are shaping the next dominant mode of production" | The body never argued the forecast claim |
| A bridge paragraph with a new label | Lead with "tilt the scales", then a concrete case | Reuse the reader's last image |
| "…power holding most of the cards" | "…entrenched power playing a stacked hand" | Names the actor, keeps the card image |

## Mechanics

- Keep lines under 100 characters. Long URLs and table rows are the only exceptions.
- Link every file, term and source the first time it appears. Local files get relative
  Markdown links.
- Headings use sentence case. Capitalize the first word, acronyms (DNS, DAO, DAI, AI),
  proper nouns, and the document's defined terms (Commons, Satellite, Board).
- Pick one bold-versus-italic rule per passage for defined terms and apply it to every
  mention.
- Numbered walkthroughs of a diagram's flows use circled digits (①②③ and so on) in both the
  diagram's edge labels and the prose that walks through them. Never plain "1", "(1)" or
  "1." for these. Circled digits keep the label visually distinct from the text around
  it and let the prose cite an arrow by number. Ordinary ordered lists (a list of
  criteria, steps a reader performs) stay as Markdown `1.` lists. Circled digits run to ⑳;
  past that, group the flows or restructure the diagram. Examples: Appendix A.4, the ESOP
  flow diagram, and the fund-flows diagram in
  [`governance/commons-hub-pattern.md`](governance/commons-hub-pattern.md).
- Large diagrams (anything that GitHub's fixed-height diagram viewer would crop, roughly
  taller than 2:1) are rendered to PNG and embedded inline, with a click-through to an SVG
  of the same diagram (sharp at any zoom). The Mermaid
  source stays tracked as a separate asset in
  [`governance/diagrams/`](governance/diagrams/) and is re-rendered with
  [`governance/diagrams/render-diagrams.mjs`](governance/diagrams/render-diagrams.mjs).
  Small diagrams (like the ESOP flow) stay as inline Mermaid blocks. In the large
  diagrams' edge labels, wrap each circled digit as
  `<b style='font-size:2.3em'>①</b>` so the numbers stay readable at page width; this only
  works because the diagram is a rendered image, not native Mermaid on GitHub.
- Chris marks instructions for the assistant inline as `[[ request ]]`. Act on them and
  remove the marker once done.
- Sources and hedges: give a source URL for any factual claim and say "requires
  confirmation" when unsure. Flag legal and tax points as needing counsel.

## Workflow

- Propose first, edit after approval. Show the exact text in chat.
- Keep changes small and separable. When a session accumulates unrelated edits, stage only
  the hunks that belong to the commit.
- Run a diff and markdown-rule review before every commit, and check that the table of
  contents still matches the headings.
- Commit on the main branch with a Conventional Commits prefix that fits the change. Stop
  at the local commit and hand over the push command.
- Do not widen scope. If you notice a nearby problem, mention it and let Chris decide.
- Ask a question only when the answer changes what you do next. Otherwise state the
  default you chose and proceed.
