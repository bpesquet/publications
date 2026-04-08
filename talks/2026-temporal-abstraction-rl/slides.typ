#import "@preview/touying:0.6.1": *

#let main_title = [Temporal abstraction in Reinforcement Learning]
#let main_author = [#link("https://www.bpesquet.fr")[Baptiste Pesquet]]

#import themes.simple: *
#show: simple-theme.with(
  aspect-ratio: "16-9",
  footer: [#main_title],
  // Uncomment the following line to obtain an animation-free version
  config-common(handout: true),
)

#set math.equation(numbering: "(1)")
#show figure.caption: set text(size: 16pt)

#title-slide[
  // Institution logos
  #place(
    bottom + left,
    dx: 10mm,
    link("https://www.inria.fr")[#image("../images/inria_logo.jpg", width: 15%)],
  )
  #place(
    bottom + center,
    link("https://inria.fr/fr/mnemosyne")[#image("../images/mnemosyne_logo.png", width: 15%)],
  )
  #place(
    bottom + right,
    dx: -10mm,
    link("https://ensc.bordeaux-inp.fr")[#image("../images/ensc_logo.jpg", width: 15%)],
  )

  #title[
    #main_title
  ]

  #v(1em)

  #main_author

  #datetime.today().display("[month repr:long] [day], [year repr:full]")
  // Hard value for event date
  // #datetime(year: 2026, month: 01, day: 06).display("[month repr:long] [day], [year repr:full]")
]

== Outline <touying:hidden>

#show outline: set text(size: 20pt)

#components.adaptive-columns(outline(title: none, depth: 1, indent: 1em))

= The reinforcement learning (MDP) framework

== Example

== Formalism

== Optimality

== Algorithms

=== Value iteration

=== Q-Learning

=== Actor/critic

= The options framework for RL

== Formalism

== Algorithms

=== Option/critic

= Other approaches

== Goal-conditioned RL

== Autotelic RL

= References
