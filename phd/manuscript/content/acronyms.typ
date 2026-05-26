#import "../utils.typ"
#import utils.acrostiche: init-acronyms, print-index

// Init acronym list.
// Must be called before any reference to acronyms
//  => include before content
#init-acronyms((
  "2AFC": "Two-Alternative Forced Choice",
  "ALBA": "Advantage Linear Ballistic Accumulator",
  "AUROC": "Area Under the ROC curve",
  "aDDM": "Attentional Diffusion Decision Model",
  "DDM": "Diffusion Decision Model (a.k.a. Drift Diffusion Model)",
  "DV": "Decision Variable",
  "EAM": "Evidence Accumulation Model",
  "FPR": "False Positive Rate",
  "LBA": "Linear Ballistic Accumulator",
  "MAB": "Multi-Armed Bandit",
  "MSPRT": "Multihypothesis Sequential Probability Ratio Test",
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
