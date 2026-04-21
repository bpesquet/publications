#import "utils.typ"
#import utils: front-matter, main-matter, template

#show: template.with(
  title: "My thesis title",
  author: "Baptiste Pesquet",
)

// ---------- FRONT ----------
#show: front-matter

#include "content/cover.typ"
#include "content/abstract.typ"
#include "content/acknowledgements.typ"
#include "content/toc.typ"
#include "content/glossary.typ"
#include "content/acronyms.typ"

// ---------- MAIN ----------
#show: main-matter

#include "content/introduction.typ"
#include "content/part1.typ"
#include "content/part2.typ"
#include "content/conclusion.typ"

// ---------- BACK ----------

#bibliography("content/bibliography.bib")
