#import "../utils.typ"
#import utils.acrostiche: init-acronyms, print-index

// Init acronym list.
// Must be called before any reference to acronyms
//  => include before content
#init-acronyms((
  "2AFC": "Two-Alternative Forced Choice",
  "AUROC": "Area Under the ROC curve",
  "DV": "Decision Variable",
  "EAM": "Evidence Accumulation Model",
  "FPR": "False Positive Rate",
  "MAB": "Multi-Armed Bandit",
  "RDM": "Random Dot Motion",
  "ROC": "Receiver Operating Characteristic",
  "RT": "Reaction Time",
  "SAT": "Speed-Accuracy Tradeoff",
  "SDT": "Signal Detection Theory",
  "SPRT": "Sequential Probability Ratio Test",
  "SSM": "Sequential Sampling Model",
  "TPR": "True Positive Rate",
))

// Acronyms
#print-index(
  title: "Acronyms",
  outlined: false,
  row-gutter: 1em,
  clickable: true,
)
