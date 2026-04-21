#import "../../utils.typ"
#import utils.acrostiche: acr, acrfull, reset-acronym

== Decision-making


Everyday, humans and non-humans make hundreds of decisions, each of them leading to a choice between several possible alternatives. Some of these decisions are trivial: for example, choosing which socks to wear when dressing up. Others imply much higher stakes: for example, deciding to embark oneself on a PhD.

Decision-making is one of the main aspects of cognition. Its study spans such varied scientific fields as psychology, neuroscience, economics, statistics and po- litical science. Despite the immense variety of contexts and applications, most decisions share common elements including deliberation and commitment @goldNeuralBasisDecision2007. In the following chapters, we study decision-making from the conceptual, computational and neuronal points of view.

=== Conceptual overview

First of all, let's try to clearly define what we are talking about, disentangling key concepts along the way. A _decision_ can either be understood as a process, or as merely its outcome (the observable result). In this study, we retain the former approach and define a decision as a deliberative activity resulting in the commitment to one option over others. The observable result of a decision (the selected option) will be called the _choice_ associated with it. All decisions are instances of a _decision-making_ process, which describes the inner workings leading to a choice.

An analogy would be the weighting of available evidence by a jury (decision), adhering to a set of judicial rules and guidelines (decision-making) before settling on a verdict (choice),

The following chapters introduce several keys dimensions of decisions.

==== Perceptual decisions

Some decisions only involve the processing of sensory stimuli (visual, auditory, olfactory, tactile or gustative signals), most frequently for discrimination purposes. Examples of experimental scenarios associated to such _perceptual decisions_ are Stroop tasks (naming the ink color of a colored word with a mismatch between ink color and word), #acr("RDM") tasks (assessing the main motion of a dot cloud, @fig:rdm) or faint sound detection. For this family of decisions, the possible alternatives (options) are typically well-defined and mutually exclusive (e.g., ”sound present” vs. ”sound absent”).

#figure(
  image("images/random_dot_motion.png", width: 75%),
  caption: [
    Examples of Random Dot Motion tasks with various movement coherence. _(a)_ $"coherence" = 0$: dots are moving randomly. _(b)_ $"coherence" = 0.5$: half of dots are moving to the right. _(c)_ $"coherence" = 1$: all dots are moving to the right.
  ],
) <fig:rdm>

==== Value-based decisions

Other decisions require choosing between alternatives based on subjective pref- erences or expected rewards. Examples of experimental scenarios associated to such value-based decisions are Multi-Armed Bandit problems, in which a decision- maker iteratively selects one of multiple fixed choices (e.g., arms or actions) in order to maximize a cumulative reward.

TODO

==== Time course of a decision

All decisions are made under a form of time pressure @forstmannSequentialSamplingModels2016: one simply cannot take hours to ponder over his or her socks collection, or wait indefinitely before accepting a PhD offering. A decision takes place at the end of a deliberation phase, in which available information is acquired and processed by the decision-maker. Many decisions are based on information that unfolds over time: for example, tasting wine before recognizing its grape variety. Even when all information is immediately available (for example, a chessboard observed by a player before choosing his or her next move), it generally has to be treated sequentially, reflecting the inability of the decision-maker's cognitive system to process all information simultaneously. Thus, the sequential nature of the decision process is a fundamental property of biological nervous systems @forstmannSequentialSamplingModels2016.

More formally, a decision can be envisioned as the mapping from a stimulus to a response. Time between stimulus and response execution is called #acr("RT") @forstmannSequentialSamplingModels2016, @myersPracticalIntroductionUsing2022. It can be decomposed into three parts: the time required to encode the stimulus ($T_e$), the time to make a decision ($T_d$), and the time to execute the selected response ($T_r$) (@fig:rt). The encoding and motor response time are typically combined into a single parameter, $T_"er"$, representing _non-decision time_.  (@eq:rt).

$ "RT" = T_e + T_d + T_r = T_"er" + T_d $ <eq:rt>

#figure(
  image("images/myersPracticalIntroductionUsing2022_1.png", width: 75%),
  caption: [
    The Reaction Time is assumed to reflect the time required to encode the stimulus ($T_e$), the time to make a decision ($T_d$), and the time to execute the selected motor response ($T_r$). Adapted from @myersPracticalIntroductionUsing2022
  ],
) <fig:rt>

==== Speed-Accuracy Tradeoff

Another criterion for studying decisions is the possibility of objectively evaluating their outcome. Some decisions have correct or optimal answers, to which the chosen alternatives can be compared in order to compute evaluation metrics like accuracy. This is typically the case for perceptual decisions, for which the expected results are controlled by the experimenter. On the other hand, some value-based decisions cannot be objectively evaluated: for example, picking one’s favorite color.

For decisions whose outcome can be assessed, the balance between #acr("RT") and accuracy is called the #acr("SAT"). This ubiquitous aspect of decision-making has been a phenomenon of interest in behavioral science for a long time @heitzSpeedaccuracyTradeoffHistory2014. The #acr("SAT") is at least partially under the decision-maker’s control: a faster decisions can ne taken at the expense of an higher error rate, and vice-versa @ratcliffDiffusionDecisionModel2016. As such, one must not only consider accuracy and speed, but also the interaction between them when studying decisions @myersPracticalIntroductionUsing2022.

==== Uncertainty

=== Computational modeling

=== Neural basis
