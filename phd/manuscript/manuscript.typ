#let template(
  title: [Your Title],
  author: "Author",
  date: none,
  body,
) = {
  set document(
    title: title,
    author: author,
    date: if date != none { date } else { auto },
  )

  set page(
    paper: "a4",
    numbering: "1",
    number-align: right,
  )

  body
}

#show: template.with(
  title: "My thesis title",
  author: "Baptiste Pesquet",
)

#include "front/front.typ"
#include "content/content.typ"
