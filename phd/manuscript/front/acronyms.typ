#import "../utils.typ"
#import utils.acrostiche: init-acronyms, print-index

// Init acronym list.
// Must be called before any reference to acronyms
//  => include before content
#init-acronyms((
  "ALBA": "Advantage Linear Ballistic Accumulator",
  "AUROC": "Area Under the ROC curve",
  "aDDM": "Attentional Diffusion Decision Model",
  "DDM": "Diffusion Decision Model a.k.a. Drift Diffusion Model",
  "dlPFC": "dorsolateral prefrontal cortex",
  "dmPFC": "dorsomedial prefrontal cortex",
  "EAM": "Evidence Accumulation Model",
  "FPR": "False Positive Rate",
  "LBA": "Linear Ballistic Accumulator",
  "LCA": "Leaky Competing Accumulator",
  "MAB": "Multi-Armed Bandit",
  "MSPRT": "Multihypothesis Sequential Probability Ratio Test",
  "OFC": "orbitofrontal cortex",
  "PFC": "prefrontal cortex",
  "RDM": "Random Dot Motion",
  "ROC": "Receiver Operating Characteristic",
  "RT": "Reaction Time",
  "SAT": "Speed-Accuracy Tradeoff",
  "SDT": "Signal Detection Theory",
  "SPRT": "Sequential Probability Ratio Test",
  "SSM": "Sequential Sampling Model",
  "TPR": "True Positive Rate",
  "vlPFC": "ventrolateral prefrontal cortex",
  "vmPFC": "ventromedial prefrontal cortex",
))

// Acronyms
#print-index(
  title: "Acronyms",
  outlined: false,
  row-gutter: 1em,
  clickable: true,
)
