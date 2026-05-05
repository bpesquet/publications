#import "../utils.typ"
#import utils.acrostiche: init-acronyms, print-index

// Init acronym list.
// Must be called before any reference to acronyms
//  => include before content
#init-acronyms((
  "2AFC": "Two-Alternative Forced Choice",
  "DV": "Decision Variable",
  "MAB": "Multi-Armed Bandit",
  "RDM": "Random Dot Motion",
  "RT": "Reaction Time",
  "SAT": "Speed-Accuracy Tradeoff",
  "SDT": "Signal Detection Theory",
  "SPRT": "Single Probability Ratio Test",
))

// Acronyms
#print-index(
  title: "Acronyms",
  outlined: false,
  row-gutter: 1em,
  clickable: true,
)
