#import "../utils.typ"
#import utils.acrostiche: init-acronyms, print-index

// Init acronym list.
// Must be called before any reference to acronyms
//  => include before content
#init-acronyms((
  "RDM": "Random Dot Motion",
  "RT": "Reaction Time",
  "SAT": "Speed-Accuracy Tradeoff",
))

// Acronyms
#print-index(
  title: "Acronyms",
  outlined: false,
  row-gutter: 1em,
  clickable: true,
)
