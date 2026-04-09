#let front-matter(body) = {
  set page(numbering: "i")
  counter(page).update(1)
  set heading(numbering: none)

  body
}

#show: front-matter

#include "cover.typ"
#pagebreak()

// Do not include abstract and akwnoledgements in the ToC
#set heading(outlined: false)

#include "abstract.typ"
#pagebreak()

#include "acknowledgements.typ"
#pagebreak()

// ToC
#outline(
  title: "Contents",
  indent: auto,
  depth: 3,
)
#pagebreak()
#outline(
  title: "List of Figures",
  target: figure.where(kind: image),
)
#pagebreak()
#outline(
  title: "List of Tables",
  target: figure.where(kind: table),
)
#pagebreak()
