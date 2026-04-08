#set document(title: [A Fluid Dynamic Model for Glacier Flow])
#set page(
  paper: "a4",
  header: align(
    right + horizon,
    // Retrieve the document
    // element's title property.
    context document.title,
  ),
  numbering: "1",
  columns: 2,
)
#set par(justify: true)
#set text(
  font: "Libertinus Serif",
  size: 11pt,
)
#set heading(numbering: "1.")
#set math.equation(numbering: "(1)")

#show title: set text(size: 17pt)
#show title: set align(center)
#show title: set block(below: 1.2em)

#show heading.where(level: 1): set align(center)
#show heading.where(level: 1): set text(size: 13pt, weight: "regular")
#show heading.where(level: 1): smallcaps

#show heading.where(level: 2): set text(
  size: 11pt,
  weight: "regular",
  style: "italic",
)
#show heading.where(level: 2): it => {
  it.body + [.]
}

#place(
  top + center,
  float: true,
  scope: "parent",
  clearance: 2em,
)[

  #title()

  #grid(
    columns: (1fr, 1fr),
    align(center)[
      Therese Tungsten \
      Artos Institute \
      #link("mailto:tung@artos.edu")
    ],
    align(center)[
      Dr. John Doe \
      Artos Institute \
      #link("mailto:doe@artos.edu")
    ],
  )

  #par(justify: false)[
    *Abstract* \
    #lorem(80)
  ]
]

= Introduction

#lorem(250)

== Motivation

#lorem(140)

== Problem Statement

#lorem(50)

= Related Work

#lorem(200)
