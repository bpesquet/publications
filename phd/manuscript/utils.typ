#import "@preview/acrostiche:0.7.0"

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

#let front-matter(body) = {
  set page(numbering: "i")
  counter(page).update(1)
  set heading(numbering: none, outlined: false)

  body
}

#let main-matter(body) = {
  set page(numbering: "1")
  counter(page).update(1)
  counter(heading).update(0)
  set heading(numbering: "I.1", outlined: true)
  body
}
