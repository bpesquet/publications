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
  show heading.where(level: 1): it => {
    // Start top headings on new page.
    // FIXME: `pagebreak(to: "even")` wrongly shows the header and page number.
    // https://github.com/typst/typst/issues/2722
    pagebreak()
    it
  }
  body
}

#let front-matter(body) = {
  set page(numbering: "i")
  counter(page).update(1)
  set heading(numbering: none, outlined: false)
  // Add space between heading and content
  show heading.where(level: 1): it => {
    it
    v(6%, weak: true)
  }
  body
}

#let main-matter(body) = {
  set page(numbering: "1")
  counter(page).update(1)
  counter(heading).update(0)
  set heading(numbering: "I.1", outlined: true)
  // Add space between heading and content
  show heading.where(level: 1): it => {
    it
    v(12%, weak: true)
  }
  body
}
