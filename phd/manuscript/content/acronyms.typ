#import "../utils.typ"
#import utils.acrostiche: init-acronyms, print-index

// Init acronym list.
// Must be called before any reference to acronyms
//  => include before content
#init-acronyms((
  "EAM": "Evidence Accumulation Model",
  "DDM": "Diffusion Decision Model",
))

// Acronyms
#print-index(
  title: "Acronyms",
  outlined: false,
  row-gutter: 1em,
  clickable: true,
)
