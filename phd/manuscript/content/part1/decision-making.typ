#import "../../utils.typ"
#import utils.acrostiche: acr, acrfull, acrpl, reset-acronym
#import utils.nth: nth
#import utils: flex-caption

== The decision process

Everyday, humans and non-humans make hundreds of decisions, each of them leading to a choice between several possible alternatives (options). Some of these decisions are trivial: for example, choosing which socks to wear when dressing up. Others imply much higher stakes: for example, deciding to embark oneself on a PhD.

Decision-making is one of the main aspects of cognition. Its study spans such varied scientific fields as psychology, neuroscience, economics, statistics and political science. Despite the immense variety of contexts and applications, most decisions share common elements including deliberation and commitment @goldNeuralBasisDecision2007. In the following chapters, we study decision-making from the conceptual, computational and neuronal points of view.

=== Conceptual overview

First of all, let's try to clearly define what we are talking about, disentangling key concepts along the way. A _decision_ can either be understood as a _process_, or as merely its _outcome_ (the observable result). In this study, we retain the former approach and define a decision as a deliberative process resulting in the commitment to one alternative (option) over others. The observable result of a decision (the selected option) will be called the _choice_ associated with it. All decisions are instances of a _decision-making_ process, which describes the inner workings leading to a choice. An analogy would be the weighting of available evidence by a jury (decision), adhering to a set of judicial rules and guidelines (decision-making) before settling on a verdict (choice),

The following subsections introduce several keys dimensions of decisions.

==== Perceptual decisions

Some decisions only involve the processing of sensory stimuli (visual, auditory, olfactory, tactile or gustative signals), without needing any abstract representation on top of them.

Examples of experimental scenarios associated to such _perceptual_ decisions are Stroop tasks (naming the ink color of a colored word with a mismatch between ink color and word), #acr("RDM") tasks (assessing the main motion of a dot cloud, @fig:rdm) or faint sound detection. For this family of decisions, the possible alternatives (options) are typically well-defined and mutually exclusive (e.g., ”sound present” vs. ”sound absent”).

#figure(
  image("images/random_dot_motion.png", width: 75%),
  caption: flex-caption(
    short: [Examples of Random Dot Motion tasks with various movement coherence.],
    long: [
      Examples of Random Dot Motion tasks with various movement coherence. _(a)_ $"coherence" = 0$: dots are moving randomly. _(b)_ $"coherence" = 0.5$: half of dots are moving to the right. _(c)_ $"coherence" = 1$: all dots are moving to the right.
    ],
  ),
) <fig:rdm>

==== Value-based decisions

Other decisions require choosing between alternatives based on personal preferences or expected rewards. In that case, there is not always an intrinsically correct choice (e.g. expressing a preference between several food items). At their core is the notion of _value_, the subjective worth or desirability of an outcome. These abstract representations are first assigned to the available options, then a choice is made by comparing values @padoa-schioppaOrbitofrontalCortexNeural2017.

Examples of experimental scenarios associated to such value-based decisions are #acr("MAB") or $k$-armed bandit problems, named by analogy to a casino slot machine with _k_ arms. Here, the decision-maker iteratively selects one of the multiple fixed options (e.g., arms or actions) in order to maximize a cumulative reward.

#figure(
  image("images/mileticNewModelDecision2021_1.png", width: 50%),
  caption: flex-caption(
    short: [Example of a two-armed bandit experimental task.],
    long: [
      Example of a two-armed bandit experimental task. Each trial starts with a fixation cross, followed by the presentation of the stimulus until a choice is made or allowed decision time is elapsed. The chosen option is briefly highlighted, then feedback based on probabilistic rewards is given to the subject. Adapted from @mileticNewModelDecision2021.
    ],
  ),
) <fig:mab>

==== Time course of a decision

All decisions are made under a form of time pressure @forstmannSequentialSamplingModels2016: one simply cannot take hours to ponder over his or her socks collection, or wait indefinitely before accepting a PhD offering. A choice takes place at the end of a deliberation phase, in which available information is acquired and processed by the decision-maker. Many decisions are based on information that unfolds over time: for example, tasting wine before recognizing its grape variety. Even when all information is immediately available (for example, a chessboard observed by a player before choosing his or her next move), it generally has to be treated sequentially, reflecting the inability of the decision-maker's cognitive system to process all information simultaneously. Thus, the sequential nature of the decision process is a fundamental property of biological nervous systems @forstmannSequentialSamplingModels2016.

More formally, a decision can be envisioned as the mapping from a stimulus to a response. Time between stimulus and response execution is called #acr("RT") @forstmannSequentialSamplingModels2016 @myersPracticalIntroductionUsing2022. It can be decomposed into three parts: the time required to encode the stimulus ($T_e$), the time to make a decision ($T_d$), and the time to execute the selected response ($T_r$) (@fig:rt). The encoding and motor response time are typically combined into a single parameter, $T_"er"$, representing _non-decision time_.  (@eq:rt).

$ "RT" = T_e + T_d + T_r = T_"er" + T_d $ <eq:rt>

#figure(
  image("images/myersPracticalIntroductionUsing2022_1.png", width: 75%),
  caption: flex-caption(
    short: [Decomposition of the Reaction Time associated with a decision.],
    long: [
      Decomposition of the Reaction Time associated with a decision. The RT is assumed to reflect the time required to encode the stimulus ($T_e$), the time to make a decision ($T_d$), and the time to execute the selected motor response ($T_r$). Adapted from @myersPracticalIntroductionUsing2022
    ],
  ),
) <fig:rt>

==== Speed-Accuracy Tradeoff <par:sat>

Another criterion for studying decisions is the possibility of objectively evaluating their outcome. Some decisions have correct or optimal answers, to which the chosen alternatives can be compared in order to compute evaluation metrics like _accuracy_. This is typically the case for perceptual decisions, for which the expected results are controlled by the experimenter. On the other hand, some value-based decisions do not have objectively good or bad answers: for example, picking one’s favorite color. In that case, prior knowledge about the decision-maker would be necessary for accuracy to be computed.

For decisions whose outcome can be assessed, the balance between #acr("RT") and accuracy is called the #acr("SAT"). It expresses a simple but unescapable fact: certainty takes time. Faster responses rely on potentially incomplete information and tend to be less accurate. On the contrary, integrating more evidence during the decision process generally improves accuracy but takes more time. This ubiquitous aspect of decision-making has been a phenomenon of interest in behavioral science for a long time @heitzSpeedaccuracyTradeoffHistory2014. The #acr("SAT") is at least partially under the decision-maker’s control: faster decisions can be prioritized at the expense of an higher error rate, and vice-versa @ratcliffDiffusionDecisionModel2016. As such, one must not only consider accuracy and speed, but also the interaction between them when studying decisions @myersPracticalIntroductionUsing2022.

==== Uncertainty

Uncertainty (or incertitude) is an inherent part of almost all decisions. Generally speaking, it characterizes situations involving changing, noisy or unknown information. In the narrower context of decision-making, uncertainty refers to the variability in the representation of information during a decision @mamassianConfidenceForcedChoiceOther2020. Sources of uncertainty are indeed multiple. For example, driving one’s car requires processing different visual, auditory and vestibular inputs in order to adapt to a continuous stream of not-so-predictable external events (a child or an animal crossing the street, the car in front of yours breaking suddenly, and so on) @pougetConfidenceCertaintyDistinct2016. Furthermore, uncertainty can arise from imperfections in external signals (e.g. bad image quality in a classification task) or from internal limitations in the abilities of the decision-maker (e.g. added noise when processing signals).

From the perspective of the decision-maker, uncertainty can be interpreted as a signal for adapting their behavior, according to the following dichotomy @yuUncertaintyNeuromodulationAttention2005 :

- _Expected_ uncertainty comes from known, irreducible stochasticity within a stable environment. This refers to situations in which the variability of outcomes complies with the model of the world used by the decision-maker (known likelihoods). This is closely related to the concept of _aleatoric_ uncertainty from the decision theory field (TODO: citation d-t?). For example, a subject observing a series of six-sided die rolls would expect each possible result to have a probability of around $1/6$.

- _Unexpected_ uncertainty, sometimes called _volatility_, arises when evidence signals a possible change in the environment. This refers to situations in which the variability of outcomes is no longer explained by the decision-maker's model (unknown likelihoods). Unexpected uncertainty should promote learning about the potentially new context. A parallel can be drawn with _epistemic_ uncertainty from decision theory (incomplete knowledge about the world which can in principle be reduced by gathering more information).  For example, results for a series of six-sided die rolls that diverge from the $1/6$ probability would contradict the hypothesis that the die is fair.

=== Computational modeling

One approach to understanding decision-making is through computational modeling. Many solutions have been proposed to describe the decision process @bogaczOptimalDecisionmakingTheories2007.

==== Binary decisions

Binary decisions have only two possible outcomes. As a first approach, the associated process can be modeled as a comparison between a quantity, hereafter named a #acr("DV")  @goldNeuralBasisDecision2007, and a threshold (or criterion). The #acr("DV") represents the integration into a single conceptual entity of all sources of information available to the decision-maker: external cues, called _evidence_ and denoted $e$, but also any prior beliefs and values that could bias its judgment. Depending on the context, the #acr("DV") can either be externally observable (e.g. the score in a test) or available only to the decision-maker (e.g. the feeling of familiarity associated with an item in a memory study). A decision is made if (or when) the #acr("DV") exceeds the threshold. This formalism is at the same time conceptually simple and biologically grounded, as we shall see later.

The following sections review several prominent models of binary decision-making.

===== Signal Detection Theory

#acr("SDT") is a framework for understanding decision-making in the presence of uncertainty. It provides a mathematical and conceptual foundation for analyzing the capacity of a decision-maker — biological or artificial — to discriminate _signal_ (meaningful information) from  _noise_. Originally developped in the mid-#nth(20) century to assess how faithfully a radar operator was able to disinguish incoming threats (signal) from random interferences or electronical artefacts (noise), #acr("SDT") has since been applied to many fields, including cognitive psychology @greenSignalDetectionTheory1966, clinical medicine, neuroscience, and machine learning.

#acr("SDT") is applicable to any binary decision task in which an observer must judge whether the signal was present or absent from a single piece of evidence. Examples include testing the ability of a subject to detect a short tone (signal) in a background of white noise, or to assess items as already seen (signal) or new (noise) during a memory recognition test. In this kind of binary decision task, called #acr("2AFC") in the context of experimental psychology, the response given by the decision-maker for each trial can be sorted in one of four categories (@tab:sdt_outcomes).

#figure(
  table(
    columns: 3,
    table.header([*Signal*], [*Observer response: "absent"*], [*Observer response: "present"*]),
    [Absent], [Correct Rejection (TN)], [False Alarm (FP)],
    [Present], [Miss (FN)], [Hit (TP)],
  ),
  caption: flex-caption(
    short: [Categorization of possible responses in a binary decision task.],
    long: [
      Categorization of possible responses in a binary decision task. Correct Rejection (True Negative): correctly identifying the absence of a signal. False Alarm (False Positive): incorrectly detecting a signal when it is absent. Miss (False Negative): failing to detect a signal when it is present. Hit (True Positive): correctly detecting a signal when it is present.
    ],
  ),
) <tab:sdt_outcomes>

#acr("SDT") assumes that the evidence $e$ obtained at each trial can be modeled as a single scalar value drawn from one of two probability distributions: a _noise distribution_ when the signal is absent and a _signal-plus-noise distribution_, or _signal distribution_, when it is present. These two distributions respectively describe the values that $e$ can attain in the absence/presence of signal. In the general case, the two distributions will overlap, reflecting the task difficulty. In the standard equal-variance Gaussian version of #acr("SDT"), both distributions are assumed to be normal with equal variance, differing only in their respective means $mu_"noise"$ and $mu_"signal"$. To make a choice, the decision-maker sets a criterion $lambda$ along the evidence axis, and compares the value of $e$ (used as the #acr("DV")) to it. If $e>lambda$, the decision-maker responds "signal present"; otherwise, it responds "signal absent" (@fig:sdt_dist).

Since the two distributions can be interpreted as likelihood functions for the evidence, an equivalent formulation of #acr("SDT") uses the likelihood ratio as the #acr("DV"). The numerator is the likelihood of obtaining a particular value of $e$ on a signal trial, and the denominator is the likelihood of obtaining the same value of $e$ on a noise trial (@eq:sdt_lr). The criterion $beta$ to which this #acr("DV") is compared is the likelihood ratio for the value of $e$ corresponding to the evidence criterion $lambda$ (@eq:sqt_beta).

$ "DV"(e) eq.triple P(e|"signal")/P(e|"noise") $ <eq:sdt_lr>

$ beta = P(e=lambda|"signal") / P(e=lambda|"noise") $ <eq:sqt_beta>

The probability of responding "present" on signal trials is called the _hit rate_ $H$ or #acr("TPR"). It corresponds to the proportion of the signal distribution that exceeds the evidence criterion $lambda$. The hit rate can be calculated (@eq:sdt_tpr) using the cumulative distribution function $Phi$, which computes the probability that a value fails below a _z-score_ (@eq:sdt_phi). Geometrically, the $Phi$ function determines the portion of the distribution that lies to the left of the z-score. Given a raw value $x$, the z-score or standard score $z$ measures how many standard deviations $x$ is from the mean of the distribution (@eq:sdt_z). Similarly, the probability of responding "present" on noise trials is called the _false alarm rate_ $"FA"$ or #acr("FPR"). It corresponds to the proportion of the noise distribution that exceeds the criterion $lambda$ (@eq:sdt_fpr). Both $H$  and $"FA"$ are areas under their respective normal curves.

$ Phi(z) = P(X<=z) $ <eq:sdt_phi>

$ z = (x-mu)/sigma $ <eq:sdt_z>

$ H = "TPR" = P(e>lambda|"signal") = 1 - Phi((lambda - mu_"signal")/sigma) $ <eq:sdt_tpr>

$ "FA" = "FPR" = P(e>lambda|"noise") = 1 - Phi((lambda - mu_"noise")/sigma) $ <eq:sdt_fpr>

#acr("SDT")’s main virtue is its ability to disentangle two factors in a decision process: the tendency towards responding yes regarless of the evidence, called _bias_, and the ability to distinguish signal from noise, called _sensitivity_. For example, industry quality-control inspectors often detect fewer faulty items as their work day progresses. SDT demonstrated that this declining hit rate usually results from a change in response bias rather than a declining sensitivity @stanislawCalculationSignalDetection1999.

Sensitivity is determined by the degree of overlap between the noise and signal distributions. One possible measure of sensitivity is $d′$, which corresponds to the distance between the means in standard deviation units. Two assumptions must be met for $d′$ to be a bias-free measure of sensibility: the noise and signal distributions must be normal (Gaussian) and have the same variance. It can be calculated using the inverse cumulative distribution function $Phi^(-1)$, which computes the standard score (_z-score_) associated to a probability (@eq:sdt_dprime).

$
  d' = (mu_"signal"-mu_"noise")/sigma = (u_"signal"-lambda)/sigma - (u_"noise"-lambda)/sigma = Phi^(-1)("H") - Phi^(-1)("FA")
$ <eq:sdt_dprime>

Bias is determined by the location of the criterion $lambda$ on the evidence axis. It can be quantified using either $beta$ (@eq:sqt_beta) or the distance $c$, measured in standard deviation units, between $lambda$ and the neutral point $N$ where distributions cross and neither response is favored (@eq:sdt_c). A lower or _liberal_ criterion ($beta<1$, $c<0$) biases the decision-maker towards "present" responses, while a higher or _conservative_ value ($beta>1$, $c>0$) has the opposite effect. An advantage of $c$ is that it is unaffected by changes in sensitivity, whereas $beta$ is not.

$ lambda = mu_"noise" - sigma Phi^(-1)("FA") $

$ N = (mu_"noise" + mu_"signal")/2 $

$
  c &= (lambda - N) / sigma = -Phi^(-1)("FA") - (mu_"signal" - mu_"noise")/ (2 sigma) = - (Phi^(-1)("H")+Phi^(-1)("FA"))/2
$ <eq:sdt_c>

#figure(
  image("images/stanislawCalculationSignalDetection1999_1.png", width: 80%),
  caption: flex-caption(
    short: [Signal Detection Theory: hypothetical probability density functions for the noise and signal distributions],
    long: [
      Signal Detection Theory: hypothetical probability density functions (likelihoods) for the noise distribution $cal(N)(mu_"noise", sigma^2)$ and the signal distribution $cal(N)(mu_"signal", sigma^2)$ of the evidence, measured in arbitrary units. A "present" response is made for trials in which the evidence, used as the Decision Variable, exceeds the criterion $lambda$ (shaded region of the two distributions). Here, $mu_"noise"=0$, $mu_"signal"=2$, $sigma=1$ and $lambda=0.5$. The _hit rate_ or True Positive Rate (the probability of responding "present" on signal trials) equals the proportion of the signal distribution that exceeds the criterion ($H=0.9332$). The _false alarm rate_ or False Positive Rate (the probability of responding "present" on noise trials) equals the proportion of the noise distribution that exceeds the criterion ($"FA" = 0.3085$). Both distributions are normal and of equal variance, so $d'$ is a bias-free measure of sensibility ($d' = 2$). Response bias can be quantified by either the likelihood ratio $beta$ at the criterion location ($beta = 0.1295/0.3521 = 0.37$), or the distance $c$ between the criterion and the neutral point ($c = −0.5$). Adapted from @stanislawCalculationSignalDetection1999.
    ],
  ),
) <fig:sdt_dist>

Another possible measure of sensibility uses the #acr("ROC") curve, which plots the True Positive Rate as a function of the False Positive Rate for all possible values of the criterion $lambda$. Computing the #acr("AUROC") is a non-parametric way to assess sensitivity independently of bias that is free from the equal-variance Gaussian assumptions needed for $d′$ to be bias-free.

#figure(
  image("images/michelConfidenceConsciousnessResearch2023_1.png", width: 70%),
  caption: flex-caption(
    short: [Signal Detection Theory: ROC curves for different sensitivities],
    long: [
      Signal Detection Theory: ROC curves connecting locations with constant $d′$. The major diagonal is called the “chance line” since the True Positive Rate and False Positive Rate are equal, meaning that the subject is performing at chance level. A conservative criterion decreases both TPR and FPR, and a liberal criterion increases them. Using the Area Under the ROC curve (AUROC) is a way to assess sensitivity independently of the decision criterion. Adapted from @michelConfidenceConsciousnessResearch2023.
    ],
  ),
) <fig:sdt_roc>

===== Sequential sampling

#acr("SDT") does not handle the dimension of decision time. Another class of decision-making models assume that the #acr("DV") is constructed from multiple pieces of evidence integrated over time. The process stops when a threshold is reached, which triggers the decision. This approach, called _sequential sampling_ or _sequential analysis_, allows studying the relationship between accuracy and the time needed to take a decision (@par:sat). Different approaches to sequential sampling coexist. Models differ according to the number of Decision Variables, and whether these are independent, correlated or subject to non-linear operations like decay or mutual inhibition (@fig:eam_family). Models belonging to this family are called #acrpl("SSM") or #acrpl("EAM").

#figure(
  image("images/ratcliffDiffusionDecisionModel2016_1.png", width: 100%),
  caption: flex-caption(
    short: [The sequential sampling model family],
    long: [The sequential sampling model family. Accumulator models, also known as race models, have several Decision Variables (typically one per possible alternative) and an absolute evidence response rule (one threshold for each DV). Random walk/diffusion models use a relative evidence rule: a decision is made as soon as the difference in integrated evidence reaches a predefined threshold. When there are two alternatives and the DVs are inversely correlated, a race model is equivalent to a random walk. Adapted from @ratcliffDiffusionDecisionModel2016.
    ],
  ),
) <fig:eam_family>

===== Sequential Probability Ratio Test

A well-known form of sequential sampling for binary decisions is the #acr("SPRT"). Like #acr("SDT"), #acr("SPRT") uses a single #acr("DV") based on the likelihood ratio of the two alternatives $h_1$ and $h_2$. But rather than deciding based on a single piece of evidence, #acr("SPRT") keeps accumulating until the decision criterion is met. Thus, it can be envisioned as applying #acr("SDT") repeateadly to a stream of evidence $e_1, e_2, ..., e_t$ (@eq:sprt).

$
  "DV"_t(e_1, e_2, ..., e_t) eq.triple log_e P(e_1, e_2, ..., e_t|h_1)/P(e_1, e_2, ..., e_t|h_2) = sum_(i=1)^t log_e P(e_i|h_1)/P(e_i|h_2) = sum_(i=1)^t w_i
$ <eq:sprt>

This running sum is compared to two fixed boundaries $A$ (upper) and $B$ (lower) with $B < 0 < A$. The process terminates and a decision is made the first time the cumulative log-likelihood ratio exits the interval $[B, A]$. With a desired false alarm rate $alpha$ (probability of choosing $h_1$ when $h_2$ is true) and a miss rate $beta$ (probability of choosing $h_2$ when $h_1$ is true), the boundaries $A$ and $B$ can be derived as follows (@eq:sprt_A, @eq:sprt_B).

$ A = log_e (1-beta)/alpha $ <eq:sprt_A>

$ B = log_e beta/(1-alpha) $  <eq:sprt_B>

Foe example, with $alpha=0.05$ and $beta = 0.1$, $A = log_e (1-0.1) / 0.05 = log_e 18 approx 2.89$. The process must accumulate a log-likelihood ratio of about $2.89$ before deciding in vavor of the $h_1$ alternative, which means the likelihood ratio must be greater or equal than $18$. Stricter error tolerance (smaller $alpha$) pushes $A$ higher, demanding more evidence before committing.

A core strength of #acr("SPRT") is that it achieves the fastest mean decision time for a given error rate @waldOptimumCharacterSequential1948. As an example (adapted from @goldNeuralBasisDecision2007), consider two coins placed in a bag: one is fair (50/50 chance of obtaining heads or tails when tossing it), the other not (60/40). One of the coins is drawn from the bag: is it a trick ($h_1$) or a fair ($h_2$) coin? And how many tosses are needed for this decision? To answer these questions, each toss result $e_i$ is converted to a weight of evidence $w_i$ defined by @eq:sprt_coin.

$
  forall i in [1,t], w_i := cases(
    log_e P(e="heads"|h_1)/P(e="heads"|h_2) = log_e 0.6/0.5 approx 0.182 "if" text("toss gives \"head\""),
    log_e P(e="tails"|h_1)/P(e="tails"|h_2) = log_e 0.4/0.5 approx -0.223 "if" text("toss gives \"tails\""),
  )
$ <eq:sprt_coin>

With the previously defined error rates, the minimum number of tosses needed to decide that the coin is a trick one with a false positive rate lower than 5% would be $2.89/0.182 approx 16$.

===== Diffusion Decision Model

==== Multi-alternative decisions

=== Neural basis


