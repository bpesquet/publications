#import "@preview/touying:0.6.1": *

#let main_title = [Typst, a new tool for writing scientific documents]
#let main_author = [#link("https://www.bpesquet.fr")[Baptiste Pesquet]]

#import themes.simple: *
#show: simple-theme.with(
  aspect-ratio: "16-9",
  footer: [#main_title],
  // Uncomment the following line to obtain an animation-free version
  config-common(handout: true),
)

#set math.equation(numbering: "(1)")
#show figure.caption: set text(size: 16pt)

#title-slide[
  // Institution logos
  #place(
    bottom + left,
    dx: 10mm,
    link("https://www.inria.fr")[#image("../images/inria_logo.jpg", width: 15%)],
  )
  #place(
    bottom + center,
    link("https://inria.fr/fr/mnemosyne")[#image("../images/mnemosyne_logo.png", width: 15%)],
  )
  #place(
    bottom + right,
    dx: -10mm,
    link("https://ensc.bordeaux-inp.fr")[#image("../images/ensc_logo.jpg", width: 15%)],
  )

  #title[
    #main_title
  ]

  #v(1em)

  #main_author

  #datetime.today().display("[month repr:long] [day], [year repr:full]")
  // Hard value for event date
  // #datetime(year: 2026, month: 01, day: 06).display("[month repr:long] [day], [year repr:full]")
]

== Outline <touying:hidden>

#show outline: set text(size: 20pt)

#components.adaptive-columns(outline(title: none, depth: 2, indent: 1em))

= Why Typst?

== Scientists: text is all you need #emoji.face

- For centuries, _text_ has been the dominant medium for communicating scientific ideas.
- Main usages:
  - Publishing results through articles and reports.
  - Exchanging information with colleagues
- Why?
  - Universal
  - Precise
  - Easy to index, search and archivate

== What's in a scientific document

- Textual content
- Annotated figures
- Mathematical equations
- Algorithms
- Citations and bibliographies
- Footnotes
- And more!

== The king on the hill: (La)TeX

- #link("https://en.wikipedia.org/wiki/TeX")[TeX] is a typesetting system created en 1978 by #link("https://en.wikipedia.org/wiki/Donald_Knuth")[Donald Knuth].

- #link("https://en.wikipedia.org/wiki/LaTeX")[LaTeX] is a set of macros designed in 1984 by #link("https://en.wikipedia.org/wiki/Leslie_Lamport")[Leslie Lamport] to facilitate the usage of TeX.
  - Current version: LaTeX2e (1994)
  - LaTeX3 is in development since 1989

- Separate content from rendering, purely text-based, #link("https://en.wikipedia.org/wiki/LaTeX_Project_Public_License")[free software licence], rich ecosystem.

- Gold standard for authoring and publishing scientific material.

== The new kid on the block: Typst

- #link("https://grokipedia.com/page/Typst")[Typst] is a new technology stack for creating scientific documents.
  - First public release: 2023
- Provides:
  - An #link("https://en.wikipedia.org/wiki/Apache_License")[open source] #link("https://github.com/typst/typst")[CLI compiler].
  - A #link("https://typst.app")[collaborative online editor] similar in spirit to LaTeX's #link("https://www.overleaf.com/")[Overleaf].

= Features

== Principles and syntax

- Designed to be "as powerful as LaTeX while being much easier to learn and use".
- Based on the #link("https://en.wikipedia.org/wiki/Markdown")[Markdown] syntax.
- Three syntactical modes:
  - markup (the default)
  - math
  - code (for scripting)
- Compiler built in #link("https://rust-lang.org/")[Rust].

== Demo time! #emoji.glasses

- Examples:
  - Syntax basics [#link("https://github.com/bpesquet/publications//blob/main/talks/2026-typst-intro/demos/basics.typ")[source] | #link("https://github.com/bpesquet/publications//blob/main/talks/2026-typst-intro/demos/basics.pdf")[result]]
  - Math [#link("https://github.com/bpesquet/publications//blob/main/talks/2026-typst-intro/demos/math.typ")[source] | #link("https://github.com/bpesquet/publications//blob/main/talks/2026-typst-intro/demos/math.pdf")[result]]
  - Article draft [#link("https://github.com/bpesquet/publications//blob/main/talks/2026-typst-intro/demos/article.typ")[source] | #link("https://github.com/bpesquet/publications//blob/main/talks/2026-typst-intro/demos/article.pdf")[result]]
  - Slideshow (this doc!) [#link("https://github.com/bpesquet/publications//blob/main/talks/2026-typst-intro/slides.typ")[source]]. Uses #link("https://touying-typ.github.io/")[Touying]
- See the #link("https://typst.app/docs/tutorial/")[official tutorial] for more details.

= Should you use Typst?

== Pros

- Syntax clarity
- Speed!
- No need for complex package management
- User-friendly error messages
- Growing #link("https://typst.app/universe/")[ecosystem] (themes, extensions, etc)
- Positive returns by early adopters

== Cons

- Format not accepted by conferences and journals #emoji.noentry
  - Should change #link("https://typst.app/blog/2025/typst-at-ijimai")[sooner] or later
- Tiny community compared to LaTeX's
  - Less support and resources
  - Need for home-made customization in some scenarios
- Uncertainty about the project's future (#link("https://typst.app/docs/roadmap/")[planned roadmap])

#set align(center + horizon)

= <touying:hidden>

*Thank you for your attention!*

Any questions? #emoji.face
