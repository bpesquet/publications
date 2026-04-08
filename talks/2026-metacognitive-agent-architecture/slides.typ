#import "@preview/touying:0.6.1": *

#let main_title = [A cognitively plausible architecture for a metacognitive agent]
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

#components.adaptive-columns(outline(title: none, depth: 2, indent: 1em))

// = Literature review
= Decision-making, learning and confidence in natural cognition

== Decision-making as a sequential process

#pause

- A _decision_ is a deliberative process leading to a _choice_.

#pause

- Decision-makers need _time_ to collect and process informative cues.

#pause

- Decision-making is often modeled as an _accumulation-to-threshold_ process @goldNeuralBasisDecision2007.

#pause

- The balance between response time and choice accuracy (when available) is called the _Speed/Accuracy Trade-off_ @heitzSpeedaccuracyTradeoffHistory2014.

== Models of sequential decision-making

A popular model for binary decisions is the _Diffusion Decision Model_ @ratcliffDiffusionDecisionModel2008.

#figure(
  image("images/forstmannSequentialSamplingModels2016_1.png", width: 55%),
  caption: [Illustration of the DDM model @forstmannSequentialSamplingModels2016.],
)

---

In the DDM, evidence is accumulated through @ddm.

$ dif x = v dif t + s W $ <ddm>

- $x$: accumulated evidence.
- $v$: drift rate (speed of evidence accumulation).
- $dif t$: time unit.
- $W$: within-trial accumulation white noise.
- $s$: standard deviation of $W$.

---

Multi-alternative decisions are often modeled as a _race_ between accumulators, each one representing a possible choice.

#figure(
  image("images/race_model_example.gif", width: 41%),
  caption: [Illustration of a race model (#link("https://github.com/itsdfish/SequentialSamplingModels.jl")[Source]).],
)

== Learning and decision-making

#pause

- Decisions followed by _rewards_ produce _learning effects_.

#pause

- Joint models of decision-making combine evidence accumulation and Reinforcement Learning to account for these effects @mileticNewModelDecision2021.

---

Q-values adjusted through delta update rule (@delta_update_rule) are combined to drive accumulators (@rl_ddm) @fontanesiReinforcementLearningDiffusion2019.

$ Q_(i,t+1) = Q_(i,t) + alpha(r_t - Q_(i,t)) $ <delta_update_rule>
$ dif x = w(Q_(1,t) - Q_(2,t))dif t + s W $ <rl_ddm>

- $Q_(i,t)$: value representation of choice $i$ on trial $t$.
- $r_t$: reward received on trial $t$.
- $alpha in [0,1]$: learning rate. $w$: weighting factor.

== Confidence in decision-making

#pause

- _Uncertainty_ is inherent to all stages of neural computation @flemingMetacognitionConfidenceReview.

#pause

- Our brain might be able to manipulate uncertainties as _probability distributions_ @meynielConfidenceBayesianProbability2015.

#pause

- _Confidence_ quantifies the degree of _certainty_ associated with a decision.

#pause

- More formally, confidence can be defined as the _probability that a choice is correct given available evidence_ @pougetConfidenceCertaintyDistinct2016.

== Computing confidence in sequential decision-making

In _decisional focus models_, confidence is directly indexed by the state of evidence at the time of choice.

#figure(
  image("images/kepecsNeuralCorrelatesComputation2008_1.png", width: 36%),
  caption: [Computation of confidence based on the difference between accumulators at choice time @kepecsNeuralCorrelatesComputation2008.],
)

---

_Post-decisional focus models_ posit that evidence accumulation goes on after decision time to account for confidence.

#figure(
  image("images/pleskacTwostageDynamicSignal2010_1.png", width: 52%),
  caption: [Computation of confidence based on post-choice accumulation @pleskacTwostageDynamicSignal2010.],
)

== Confidence as a doorway to metacognition

#pause

- _Metacognition_ is the ability to monitor and regulate one's cognitive processes @flavellMetacognitionCognitiveMonitoring1979.
  - Example: should I study more or differently for an upcoming exam?

#pause

- As part of metacognitive monitoring, confidence judgments may inform the processes of _cognitive control_ @flemingHowMeasureMetacognition2014.

= Building a cognitively plausible metacognitive agent #emoji.construction

== Core ideas

#pause

- Give our agent the capacity to learn a set of _behavioral rules_.

#pause

- Model decision-making by choosing between the multiple possible rules through evidence accumulation.

#pause

- Use confidence to adjust the hyperparameters of decision (e.g. accumulation thresholds) as a first step towards metacognition.

== Perceptual task: Random Dot Motion discrimination

#slide[
  #figure(
    image("images/pesquetAlexandre2025_high_coherence.gif"),
    caption: [Evidence integration with high motion coherence @pesquetMetacognitiveAgentsIntegrating.],
  )
][
  #figure(
    image("images/pesquetAlexandre2025_low_coherence.gif"),
    caption: [Evidence integration with low motion coherence @pesquetMetacognitiveAgentsIntegrating.],
  )
]

== Value-based task: collaborative sorting

#figure(
  image("images/collabsort_0.2.4_demo.gif", width: 50%),
  caption: [Two agents involved in a cooperative pick-and-place task (#link("https://github.com/bpesquet/gym-collabsort")[Source]).],
)

= References

#slide[
  #set text(size: 14pt)

  #bibliography("./bibliography.bib", title: none)
]

// Creates a unwanted blank slide
// #set heading(outlined: false)

#set align(center + horizon)

*Thank you for your attention!*

Any questions? #emoji.face


