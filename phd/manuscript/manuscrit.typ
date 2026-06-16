#import "utils.typ": back-matter, front-matter, main-matter, template

#show: template.with(
  title: "TBD thesis title",
  author: "Baptiste Pesquet",
)

// ---------- FRONT ----------
#show: front-matter

#include "front/cover.typ"
#include "front/abstract.typ"
#include "front/acknowledgements.typ"
#include "front/toc.typ"
#include "front/glossary.typ"
#include "front/acronyms.typ"
#include "front/notation.typ"

// ---------- MAIN ----------
#show: main-matter

#include "main/introduction.typ"
#include "main/litterature-review.typ"
#include "main/contributions.typ"
#include "main/conclusion.typ"

// ---------- BACK ----------
#show: back-matter

#include "back/appendices.typ"
// TODO: sort biblio alphabetically
#bibliography("back/bibliography.bib")
