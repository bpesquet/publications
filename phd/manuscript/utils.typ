#import "@preview/acrostiche:0.7.0"
#import "@preview/nth:1.0.1"

// Add the possibility of defining shorter captions for outlines.
// See https://github.com/typst/typst/issues/1295 for discussion
#let in-outline = state("in-outline", false)
#let flex-caption(
  short: none,
  long: none,
) = context {
  if in-outline.get() {
    short
  } else {
    long
  }
}

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
  show outline: it => {
    // Add the possibility of defining shorter captions for outlines.
    // See https://github.com/typst/typst/issues/1295 for discussion
    in-outline.update(true)
    it
    in-outline.update(false)
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
  set math.equation(numbering: "(1)")
  body
}
