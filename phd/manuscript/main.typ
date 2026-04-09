#import "utils.typ"
#import utils: front-matter, main-matter, template
#import utils.acrostiche: print-index

#show: template.with(
  title: "My thesis title",
  author: "Baptiste Pesquet",
)

#include "content/acronyms.typ"

// ---------- FRONT ----------
#show: front-matter

#include "content/cover.typ"
#pagebreak()

#include "content/abstract.typ"
#pagebreak()

#include "content/acknowledgements.typ"
#pagebreak()

// ToC
#outline(
  title: "Contents",
  indent: auto,
  depth: 3,
)
#pagebreak()

// Figures
#outline(
  title: "Figures",
  target: figure.where(kind: image),
)
#pagebreak()

// Tables
#outline(
  title: "Tables",
  target: figure.where(kind: table),
)
#pagebreak()

#include "content/glossary.typ"
#pagebreak()

// Acronyms
#print-index(
  title: "Acronyms",
  outlined: false,
  row-gutter: 1em,
  clickable: true,
)

// ---------- MAIN ----------
#show: main-matter

#include "content/introduction.typ"

