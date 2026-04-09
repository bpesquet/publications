#let main-matter(body) = {
  set page(numbering: "1")
  counter(page).update(1)
  counter(heading).update(0)
  set heading(numbering: "I.1")
  body
}

#show: main-matter

#include "introduction.typ"
