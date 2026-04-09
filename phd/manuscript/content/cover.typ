// No page numbering on cover
#set page(numbering: none)

#align(center + horizon)[
  #text(3em)[#context document.title]
  #v(1em)
  // document.author comes as an array
  #text(2em)[#context document.author.at(0)]
]
