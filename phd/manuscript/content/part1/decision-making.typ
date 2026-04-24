#import "../../utils.typ"
#import utils.acrostiche: acr, acrfull, reset-acronym

== Decision-making


Everyday, humans and non-humans make hundreds of decisions, each of them leading to a choice between several possible alternatives. Some of these decisions are trivial: for example, choosing which socks to wear when dressing up. Others imply much higher stakes: for example, deciding to embark oneself on a PhD.

Decision-making is one of the main aspects of cognition. Its study spans such varied scientific fields as psychology, neuroscience, economics, statistics and po- litical science. Despite the immense variety of contexts and applications, most decisions share common elements including deliberation and commitment @goldNeuralBasisDecision2007. In the following chapters, we study decision-making from the conceptual, computational and neuronal points of view.

=== Conceptual overview

First of all, let's try to clearly define what we are talking about, disentangling key concepts along the way. A _decision_ can either be understood as a process, or as merely its outcome (the observable result). In this study, we retain the former approach and define a decision as a deliberative activity resulting in the commitment to one option over others. The observable result of a decision (the selected option) will be called the _choice_ associated with it. All decisions are instances of a _decision-making_ process, which describes the inner workings leading to a choice. An analogy would be the weighting of available evidence by a jury (decision), adhering to a set of judicial rules and guidelines (decision-making) before settling on a verdict (choice),

The following chapters introduce several keys dimensions of decisions.

==== Perceptual decisions

Some decisions only involve the processing of sensory stimuli (visual, auditory, olfactory, tactile or gustative signals), without needing any abstract representation on top of them.

Examples of experimental scenarios associated to such _perceptual_ decisions are Stroop tasks (naming the ink color of a colored word with a mismatch between ink color and word), #acr("RDM") tasks (assessing the main motion of a dot cloud, @fig:rdm) or faint sound detection. For this family of decisions, the possible alternatives (options) are typically well-defined and mutually exclusive (e.g., ”sound present” vs. ”sound absent”).

#figure(
  image("images/random_dot_motion.png", width: 75%),
  caption: [
    Examples of Random Dot Motion tasks with various movement coherence. _(a)_ $"coherence" = 0$: dots are moving randomly. _(b)_ $"coherence" = 0.5$: half of dots are moving to the right. _(c)_ $"coherence" = 1$: all dots are moving to the right.
  ],
) <fig:rdm>

==== Value-based decisions

Other decisions require choosing between alternatives based on personal preferences or expected rewards. In that case, there is not always an intrinsically correct choice (e.g. expriming a preference between several food items). At their core is the notion of _value_, the subjective worth or desirability of an outcome. These abstract representations are first assigned to the available options, then a choice is made by comparing values @padoa-schioppaOrbitofrontalCortexNeural2017.

Examples of experimental scenarios associated to such value-based decisions are #acr("MAB") or $k$-armed bandit problems, named by analogy to a casino slot machine with _k_ arms. Here, the decision-maker iteratively selects one of the multiple fixed options (e.g., arms or actions) in order to maximize a cumulative reward.

#figure(
  image("images/mileticNewModelDecision2021_1.png", width: 50%),
  caption: [
    Example of a two-armed bandit experimental task. Each trial starts with a fixation cross, followed by the presentation of the stimulus until a choice is made or allowed decision time is elapsed. The chosen option is briefly highlighted, then feedback based on probabilistic rewards is given to the subject. Adapted from @mileticNewModelDecision2021.
  ],
) <fig:mab>

==== Time course of a decision

All decisions are made under a form of time pressure @forstmannSequentialSamplingModels2016: one simply cannot take hours to ponder over his or her socks collection, or wait indefinitely before accepting a PhD offering. A choice takes place at the end of a deliberation phase, in which available information is acquired and processed by the decision-maker. Many decisions are based on information that unfolds over time: for example, tasting wine before recognizing its grape variety. Even when all information is immediately available (for example, a chessboard observed by a player before choosing his or her next move), it generally has to be treated sequentially, reflecting the inability of the decision-maker's cognitive system to process all information simultaneously. Thus, the sequential nature of the decision process is a fundamental property of biological nervous systems @forstmannSequentialSamplingModels2016.

More formally, a decision can be envisioned as the mapping from a stimulus to a response. Time between stimulus and response execution is called #acr("RT") @forstmannSequentialSamplingModels2016 @myersPracticalIntroductionUsing2022. It can be decomposed into three parts: the time required to encode the stimulus ($T_e$), the time to make a decision ($T_d$), and the time to execute the selected response ($T_r$) (@fig:rt). The encoding and motor response time are typically combined into a single parameter, $T_"er"$, representing _non-decision time_.  (@eq:rt).

$ "RT" = T_e + T_d + T_r = T_"er" + T_d $ <eq:rt>

#figure(
  image("images/myersPracticalIntroductionUsing2022_1.png", width: 75%),
  caption: [
    Decomposition of the Reaction Time associated with a decision. The RT is assumed to reflect the time required to encode the stimulus ($T_e$), the time to make a decision ($T_d$), and the time to execute the selected motor response ($T_r$). Adapted from @myersPracticalIntroductionUsing2022
  ],
) <fig:rt>

==== Speed-Accuracy Tradeoff

Another criterion for studying decisions is the possibility of objectively evaluating their outcome. Some decisions have correct or optimal answers, to which the chosen alternatives can be compared in order to compute evaluation metrics like _accuracy_. This is typically the case for perceptual decisions, for which the expected results are controlled by the experimenter. On the other hand, some value-based decisions cannot be objectively evaluated: for example, picking one’s favorite color.

For decisions whose outcome can be assessed, the balance between #acr("RT") and accuracy is called the #acr("SAT"). This ubiquitous aspect of decision-making has been a phenomenon of interest in behavioral science for a long time @heitzSpeedaccuracyTradeoffHistory2014. The #acr("SAT") is at least partially under the decision-maker’s control: a faster decisions can ne taken at the expense of an higher error rate, and vice-versa @ratcliffDiffusionDecisionModel2016. As such, one must not only consider accuracy and speed, but also the interaction between them when studying decisions @myersPracticalIntroductionUsing2022.

==== Uncertainty

Uncertainty (or incertitude) is an inherent part of almost all decisions. Generally speaking, it characterizes situations involving imperfect, noisy or unknown information. In the narrower context of decision-making, uncertainty refers to the variability in the representation of information during a decision @mamassianConfidenceForcedChoiceOther2020. Sources of uncertainty are indeed multiple. For example, driving one’s car requires processing different visual, auditory and vestibular inputs in order to adapt to a continuous stream of not-so-predictable external events (a child or an animal crossing the street, the car in front of yours breaking suddenly, and so on) @pougetConfidenceCertaintyDistinct2016. Furthermore, uncertainty can arise from imperfections in external signals (e.g. bad image qualaity in a classification task) or from internal limitations in the abilities of the decision-maker (e.g. added noise when processing signals).

Decision theory classifies uncertainty into three different forms:

- _Aleatoric_ uncertainty, representing "known unknowns" - the irreductible randomness of the world. This refers to situations involving a defined space of outcomes with known likelihoods. For example, when throwing a standard 6-sided dice you have no way of predicting on which face it will land. The $1/6$ probability is not ignorance but an accurate description of the random nature of the action.
- _Epistemic_ uncertainty, representing "knowable unknowns" - incomplete knowledge about the world which can in principle be reduced by gathering more information. This refers to situations involving a defined space of outcomes with unknown likelihoods. For example, a geologist deciding whether to drill at a given site is limited by the precision of his data and by his own (lack of) knowledge regarding geological foundations.
- _Knightian_ uncertainty, representing "unknowable unknowns" - when the world itself eludes the decision-maker's mental framework for grasping it. This refers to situations in which the space of outcomes itself is unknown. For example, the first major losses linked to subprimes in 2007 made the predictive models used by economical agents for portfolio management obsolete, creating a risk-averse environment that fueled the crisis.

=== Computational modeling

=== Neural basis
