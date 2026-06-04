#import "../../utils.typ"
#import utils.acrostiche: acr, acrfull, acrpl, reset-acronym
#import utils.nth: nth
#import utils: flex-caption

== The decision process

Every day, humans and non-humans make hundreds of decisions, each of them leading to a choice between several possible alternatives (options). Some of these decisions are trivial: for example, choosing which socks to wear when dressing up. Others imply much higher stakes: for example, deciding whether to pursue a PhD..

Decision-making is one of the main aspects of cognition. Its study spans such varied scientific fields as psychology, neuroscience, economics, statistics and political science. Despite the immense variety of contexts and applications, most decisions share common elements including deliberation and commitment @goldNeuralBasisDecision2007. In the following chapters, we study decision-making from the conceptual, computational and neural perspectives.

=== Conceptual overview

First of all, let us try to clearly define what we are talking about, disentangling key concepts along the way. A _decision_ can either be understood as a _process_, or as merely its _outcome_ (the observable result). In this study, we retain the former approach and define a decision as a deliberative process resulting in the commitment to one alternative (option) over others. The observable result of a decision (the selected option) will be called the _choice_ associated with it. All decisions are instances of a _decision-making_ process, which describes the inner workings leading to a choice. An analogy would be the weighting of available evidence by a jury (decision), adhering to a set of judicial rules and guidelines (decision-making) before settling on a verdict (choice).

The following subsections introduce several key dimensions of decisions.

==== Perceptual decisions

Some decisions only involve the processing of sensory stimuli (visual, auditory, olfactory, tactile or gustative signals), without needing any abstract representation on top of them.

Examples of experimental scenarios associated with such _perceptual_ decisions are Stroop tasks (naming the ink color of a colored word with a mismatch between ink color and word), #acr("RDM") tasks (assessing the main motion of a dot cloud, @fig:rdm) or faint sound detection. For this family of decisions, the possible alternatives (options) are typically well-defined and mutually exclusive (e.g., "sound present" vs. "sound absent").

#figure(
  image("images/pesquetRDM.png", width: 75%),
  caption: flex-caption(
    short: [Examples of Random Dot Motion tasks with various movement coherence.],
    long: [
      Examples of Random Dot Motion tasks with various movement coherence. _(a)_ $"coherence" = 0$: dots are moving randomly. _(b)_ $"coherence" = 0.5$: half of dots are moving to the right. _(c)_ $"coherence" = 1$: all dots are moving to the right.
    ],
  ),
) <fig:rdm>

==== Value-based decisions

Other decisions require choosing between alternatives based on personal preferences or expected rewards. In that case, there is not always an intrinsically correct choice (e.g. expressing a preference between several food items). At their core is the notion of _value_, the subjective worth or desirability of an outcome. These abstract representations are first assigned to the available options, then a choice is made by comparing values @padoa-schioppaOrbitofrontalCortexNeural2017.

Examples of experimental scenarios associated with such value-based decisions are #acr("MAB") or $k$-armed bandit problems, named by analogy to a casino slot machine with _k_ arms. Here, the decision-maker iteratively selects one of the multiple fixed options (e.g., arms or actions) in order to maximize a cumulative reward.

#figure(
  image("images/mileticNewModelDecision2021_1.png", width: 50%),
  caption: flex-caption(
    short: [Example of a two-armed bandit experimental task.],
    long: [
      Example of a two-armed bandit experimental task. Each trial starts with a fixation cross, followed by the presentation of the stimulus until a choice is made or allowed decision time is elapsed. The chosen option is briefly highlighted, then feedback based on probabilistic rewards is given to the subject. Adapted from @mileticNewModelDecision2021.
    ],
  ),
) <fig:mab>

==== Time course of a decision <par:decision_time_course>

All decisions are made under a form of time pressure @forstmannSequentialSamplingModels2016: one simply cannot take hours to ponder over his or her socks collection, or wait indefinitely before accepting a PhD offer. A choice takes place at the end of a deliberation phase, in which available information is acquired and processed by the decision-maker. Many decisions are based on information that unfolds over time: for example, tasting wine before recognizing its grape variety. Even when all information is immediately available (for example, a chessboard observed by a player before choosing his or her next move), it generally has to be treated sequentially, reflecting the inability of the decision-maker's cognitive system to process all information simultaneously. Thus, the sequential nature of the decision process is a fundamental property of biological nervous systems @forstmannSequentialSamplingModels2016.

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

Decisions across many trials of the same task are often studied through _Response Time distributions_. A #acr("RT") distribution is the probability distribution of how long the decision-maker takes to respond across all trials. Since no two responses take exactly the same time, #acr("RT") can be envisioned as a random variable, and its distribution characterizes the full shape of response speed.

==== Speed-Accuracy Tradeoff <par:sat>

Another criterion for studying decisions is the possibility of objectively evaluating their outcome. Some decisions have correct or optimal answers, to which the chosen alternatives can be compared in order to compute evaluation metrics like _accuracy_. This is typically the case for perceptual decisions, for which the expected results are controlled by the experimenter. On the other hand, some value-based decisions do not have objectively good or bad answers: for example, picking one’s favorite color. In that case, prior knowledge about the decision-maker would be necessary for accuracy to be computed.

For decisions whose outcome can be assessed, the balance between #acr("RT") and accuracy is called the #acr("SAT"). It expresses a simple but unescapable fact: certainty takes time. Faster responses rely on potentially incomplete information and tend to be less accurate. On the contrary, integrating more evidence during the decision process generally improves accuracy but takes more time. This ubiquitous aspect of decision-making has been a phenomenon of interest in behavioral science for a long time @heitzSpeedaccuracyTradeoffHistory2014. The #acr("SAT") is at least partially under the decision-maker’s control: faster decisions can be prioritized at the expense of a higher error rate, and vice-versa @ratcliffDiffusionDecisionModel2016. As such, one must not only consider accuracy and speed, but also the interaction between them when studying decisions @myersPracticalIntroductionUsing2022.

==== Uncertainty

Uncertainty is an inherent part of almost all decisions. Generally speaking, it characterizes situations involving changing, noisy or unknown information. In the narrower context of decision-making, uncertainty refers to the variability in the representation of information during a decision @mamassianConfidenceForcedChoiceOther2020. Sources of uncertainty are indeed multiple. For example, driving one’s car requires processing different visual, auditory and vestibular inputs in order to adapt to a continuous stream of not-so-predictable external events (a child or an animal crossing the street, the car in front of yours breaking suddenly, and so on) @pougetConfidenceCertaintyDistinct2016. Furthermore, uncertainty can arise from imperfections in external signals (e.g. bad image quality in a classification task) or from internal limitations in the abilities of the decision-maker (e.g. added noise when processing signals).

From the perspective of the decision-maker, uncertainty can be interpreted as a signal for adapting their behavior, according to the following dichotomy @yuUncertaintyNeuromodulationAttention2005 :

- _Expected_ uncertainty comes from known, irreducible stochasticity within a stable environment. This refers to situations in which the variability of outcomes complies with the model of the world used by the decision-maker (known likelihoods). This is closely related to the concept of _aleatoric_ uncertainty from the decision theory field (TODO: citation d-t?). For example, a subject observing a series of six-sided die rolls would expect each possible result to have a probability of around $1/6$.

- _Unexpected_ uncertainty, sometimes called _volatility_, arises when evidence signals a possible change in the environment. This refers to situations in which the variability of outcomes is no longer explained by the decision-maker's model (unknown likelihoods). Unexpected uncertainty should promote learning about the potentially new context. A parallel can be drawn with _epistemic_ uncertainty from decision theory (incomplete knowledge about the world which can in principle be reduced by gathering more information).  For example, results for a series of six-sided die rolls that diverge from the $1/6$ probability would contradict the hypothesis that the die is fair.

=== Computational modeling

One approach to understanding decision-making is through computational modeling. Many solutions have been proposed to describe the decision process @bogaczOptimalDecisionmakingTheories2007.

==== Binary decisions

Binary decisions have only two possible outcomes. As a first approach, the associated process can be modeled as a comparison between a quantity, hereafter named a _decision variable_, and a threshold (or criterion). The decision variable represents the integration into a single conceptual entity of all sources of information available to the decision-maker: external cues, called _evidence_ and denoted $e$, but also any prior beliefs and values that could bias its judgment @goldNeuralBasisDecision2007. Depending on the context, the decision variable can either be externally observable (e.g. the score in a test) or available only to the decision-maker (e.g. the feeling of familiarity associated with an item in a memory study). A decision is made if (or when) the decision variable exceeds the threshold. This formalism is at the same time conceptually simple and biologically grounded, as we shall see later.

The following sections review several prominent models of binary decision-making.

===== Signal Detection Theory <par:sdt>

#acr("SDT") is a framework for understanding decision-making in the presence of uncertainty. It provides a mathematical and conceptual foundation for analyzing the capacity of a decision-maker — biological or artificial — to discriminate _signal_ (meaningful information) from  _noise_. Originally developed in the mid-#nth(20) century to assess how faithfully a radar operator was able to distinguish incoming threats (signal) from random interferences or electronic artefacts (noise), #acr("SDT") has since been applied to many fields, including cognitive psychology @greenSignalDetectionTheory1966, clinical medicine, neuroscience, and machine learning.

#acr("SDT") is applicable to any binary decision task in which an observer must judge whether the signal was present or absent from a single piece of evidence. Examples include testing the ability of a subject to detect a short tone (signal) in a background of white noise, or to assess items as already seen (signal) or new (noise) during a memory recognition test. In this kind of binary decision task, the response given by the decision-maker for each trial can be sorted in one of four categories (@tab:sdt_outcomes).

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

#acr("SDT") assumes that the evidence obtained at each trial, denoted $e$, can be modeled as a single scalar value drawn from one of two probability distributions: a _noise distribution_ when the signal is absent and a _signal-plus-noise distribution_, or _signal distribution_, when it is present. These two distributions respectively describe the values that $e$ can attain in the absence/presence of signal. In the general case, the two distributions will overlap, reflecting the task difficulty. In the standard equal-variance Gaussian version of #acr("SDT"), both distributions are assumed to be normal with equal variance, differing only in their respective means $mu_"noise"$ and $mu_"signal"$. To make a choice, the decision-maker sets a criterion $lambda$ along the evidence axis, and compares the value of $e$ (used as the decision variable) to it. If $e>lambda$, the decision-maker responds "signal present"; otherwise, it responds "signal absent" (@fig:sdt_dist).

Since the two distributions can be interpreted as likelihood functions for the evidence, an equivalent formulation of #acr("SDT") uses the likelihood ratio, denoted $X$, as the decision variable. The numerator is the likelihood of obtaining a particular value of $e$ on a signal trial, and the denominator is the likelihood of obtaining the same value of $e$ on a noise trial (@eq:sdt_lr). The criterion $beta$ to which this decision variable is compared is the likelihood ratio for the value of $e$ corresponding to the evidence criterion $lambda$ (@eq:sqt_beta).

$ X = P(e|"signal")/P(e|"noise") $ <eq:sdt_lr>

$ beta = P(e=lambda|"signal") / P(e=lambda|"noise") $ <eq:sqt_beta>

The probability of responding "present" on signal trials is called the _hit rate_ or #acr("TPR"). It corresponds to the proportion of the signal distribution that exceeds the evidence criterion $lambda$. The hit rate can be calculated (@eq:sdt_tpr) using the cumulative distribution function $Phi$, which computes the probability that a value fails below a given _z-score_ (@eq:sdt_phi). Geometrically, the $Phi$ function determines the portion of the distribution that lies to the left of the z-score. Given a raw value $x$, the z-score or standard score $z$ measures how many standard deviations $x$ is from the mean of the distribution (@eq:sdt_z). Similarly, the probability of responding "present" on noise trials is called the _false alarm rate_ or #acr("FPR"). It corresponds to the proportion of the noise distribution that exceeds the criterion $lambda$ (@eq:sdt_fpr). Both #acr("TPR") and #acr("FPR") are areas under their respective normal curves.

$ Phi(z) = P(X<=z) $ <eq:sdt_phi>

$ z = (x-mu)/sigma $ <eq:sdt_z>

$ "TPR" = P(e>lambda|"signal") = 1 - Phi((lambda - mu_"signal")/sigma) $ <eq:sdt_tpr>

$ "FPR" = P(e>lambda|"noise") = 1 - Phi((lambda - mu_"noise")/sigma) $ <eq:sdt_fpr>

#acr("SDT")’s main virtue is its ability to disentangle two factors in a decision process: the tendency towards responding yes regarless of the evidence, called _bias_, and the ability to distinguish signal from noise, called _sensitivity_. For example, industry quality-control inspectors often detect fewer faulty items as their work day progresses. SDT demonstrated that this declining hit rate usually results from a change in response bias rather than a declining sensitivity @stanislawCalculationSignalDetection1999.

Sensitivity is determined by the degree of overlap between the noise and signal distributions. One possible measure of sensitivity is $d′$, which corresponds to the distance between the means in standard deviation units. Two assumptions must be met for $d′$ to be a bias-free measure of sensitivity: the noise and signal distributions must be normal (Gaussian) and have the same variance. It can be calculated using the inverse cumulative distribution function $Phi^(-1)$, which computes the standard score (_z-score_) associated with a probability (@eq:sdt_dprime).

$
  d' = (mu_"signal"-mu_"noise")/sigma = (mu_"signal"-lambda)/sigma - (mu_"noise"-lambda)/sigma = Phi^(-1)("TPR") - Phi^(-1)("FPR")
$ <eq:sdt_dprime>

Bias is determined by the location of the criterion $lambda$ on the evidence axis. It can be quantified using either $beta$ (@eq:sqt_beta) or the distance $c$, measured in standard deviation units, between $lambda$ and the neutral point $N$ where distributions cross and neither response is favored (@eq:sdt_c). A lower or _liberal_ criterion ($beta<1$, $c<0$) biases the decision-maker towards "present" responses, while a higher or _conservative_ value ($beta>1$, $c>0$) has the opposite effect. An advantage of $c$ is that it is unaffected by changes in sensitivity, whereas $beta$ is not.

$ lambda = mu_"noise" - sigma Phi^(-1)("FPR") $

$ N = (mu_"noise" + mu_"signal")/2 $

$
  c &= (lambda - N) / sigma = -Phi^(-1)("FPR") - (mu_"signal" - mu_"noise")/ (2 sigma) = - (Phi^(-1)("TPR")+Phi^(-1)("FPR"))/2
$ <eq:sdt_c>

#figure(
  image("images/stanislawCalculationSignalDetection1999_1.png", width: 80%),
  caption: flex-caption(
    short: [Signal Detection Theory: hypothetical probability density functions for the noise and signal distributions],
    long: [
      Signal Detection Theory: hypothetical probability density functions (likelihoods) for the noise distribution $cal(N)(mu_"noise", sigma^2)$ and the signal distribution $cal(N)(mu_"signal", sigma^2)$ of the evidence, measured in arbitrary units. A "present" response is made for trials in which the evidence, used as the decision variable, exceeds the criterion $lambda$ (shaded region of the two distributions). Here, $mu_"noise"=0$, $mu_"signal"=2$, $sigma=1$ and $lambda=0.5$. The _hit rate_ or True Positive Rate (the probability of responding "present" on signal trials) equals the proportion of the signal distribution that exceeds the criterion ($"TPR"=0.9332$). The _false alarm rate_ or False Positive Rate (the probability of responding "present" on noise trials) equals the proportion of the noise distribution that exceeds the criterion ($"FPR" = 0.3085$). Both distributions are normal and of equal variance, so $d'$ is a bias-free measure of sensitivity ($d' = 2$). Response bias can be quantified by either the likelihood ratio $beta$ at the criterion location ($beta = 0.1295/0.3521 = 0.37$), or the distance $c$ between the criterion and the neutral point ($c = −0.5$). Adapted from @stanislawCalculationSignalDetection1999.
    ],
  ),
) <fig:sdt_dist>

Another possible measure of sensitivity uses the #acr("ROC") curve, which plots the True Positive Rate as a function of the False Positive Rate for all possible values of the criterion $lambda$. Computing the #acr("AUROC") is a non-parametric way to assess sensitivity independently of bias that is free from the equal-variance Gaussian assumptions needed for $d′$ to be bias-free.

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

#acr("SDT") does not handle the dimension of decision time. Another class of decision-making models assumes that the decision variable is constructed from multiple pieces of evidence integrated over time. The process stops when a threshold is reached, which triggers the decision. This approach, called _sequential sampling_ or _sequential analysis_, allows studying the relationship between accuracy and the time needed to take a decision (@par:sat). Different approaches to sequential sampling coexist. Models differ according to the number of decision variables, and whether these are independent, correlated or subject to non-linear operations like decay or mutual inhibition. Models belonging to this family are called #acrpl("SSM") or #acrpl("EAM") (@fig:eam_family, @fig:eam_comparison).

#figure(
  image("images/ratcliffDiffusionDecisionModel2016_1.png", width: 100%),
  caption: flex-caption(
    short: [The sequential sampling model family],
    long: [The sequential sampling model family. Accumulator models, also known as _race models_, have several decision variables (typically one per possible alternative) and an absolute evidence response rule (one threshold for each DV). Random walk/diffusion models use a relative evidence rule: a decision is made as soon as the difference in integrated evidence reaches a predefined threshold. When there are two alternatives and the DVs are inversely correlated, a race model is equivalent to a random walk. In discrete-time models, evidence increments are summed over time, whereas in continuous-time models accumulation is represented by stochastic differential equations. Adapted from @ratcliffDiffusionDecisionModel2016.
    ],
  ),
) <fig:eam_family>

#figure(
  image("images/pesquetDDMRace.png", width: 75%),
  caption: flex-caption(
    short: [Illustration of the difference between single- and multi-accumulator models],
    long: [Illustration of the difference between single- and multi-accumulator models of sequential decision-making. _(a)_ A single accumulator model has only one decision variable encoding both options. _(b)_ A multi-accumulator model uses several DVs (typically one per alternative) that run in parallel until one of them crosses the decision threshold, hence the name _race model_.
    ],
  ),
) <fig:eam_comparison>

===== Sequential Probability Ratio Test

A well-known form of sequential sampling for binary decisions is the #acr("SPRT"). Like #acr("SDT"), #acr("SPRT") uses a single decision variable, denoted $X(t)$, based on the likelihood ratio of the two alternatives $h_1$ and $h_2$ at time $t$. But rather than deciding based on a single piece of evidence, #acr("SPRT") keeps accumulating until one of the decision boundaries is crossed. Thus, it can be envisioned as applying #acr("SDT") repeatedly to a stream of evidence $e(t), t in [1,tau]$ (@eq:sprt).

$
  X(tau) = log_e P(e(1), e(2), ..., e(tau)|h_1)/P(e(1), e(2), ..., e(tau)|h_2) = sum_(t=1)^tau log_e P(e(t)|h_1)/P(e(t)|h_2) = sum_(t=1)^tau w(t)
$ <eq:sprt>

This running sum is compared to two fixed boundaries $A$ (upper) and $B$ (lower) with $B < 0 < A$. The process terminates and a decision is made the first time the cumulative log-likelihood ratio exits the interval $[B, A]$. With a desired false alarm rate $p_("fa")$ (probability of choosing $h_1$ when $h_2$ is true) and a miss rate $p_("miss")$ (probability of choosing $h_2$ when $h_1$ is true), the boundaries $A$ and $B$ can be derived as follows (@eq:sprt_A, @eq:sprt_B).

$ A = log_e (1-p_("miss"))/p_("fa") $ <eq:sprt_A>

$ B = log_e p_("miss")/(1-p_("fa")) $  <eq:sprt_B>

For example, with $p_("fa")=0.05$ and $p_("miss") = 0.1$, $A = log_e (1-0.1) / 0.05 = log_e 18 approx 2.89$. The process must accumulate a log-likelihood ratio of at least $2.89$ before deciding in favor of the $h_1$ alternative, which means the likelihood ratio must be greater or equal than $18$. Stricter error tolerance (smaller $p_("fa")$) pushes $A$ higher, demanding more evidence before committing.

A core strength of #acr("SPRT") is that it achieves the fastest mean decision time for a given error rate @waldOptimumCharacterSequential1948, @bogaczOptimalDecisionmakingTheories2007. As an example (adapted from @goldNeuralBasisDecision2007), consider two coins placed in a bag: one is fair (50/50 chance of obtaining heads or tails when tossing it), the other is biased towards heads (60/40). One of the coins is drawn from the bag: is it the biased ($h_("heads")$) or the fair ($h_("fair")$) one? And how many tosses are needed for this decision? To answer these questions, each toss result $e(t)$ is converted to a weight of evidence $w(t)$ defined by @eq:sprt_coin.

$
  forall t in [1,tau], w(t) = cases(
    log_e P(e="heads"|h_("heads"))/P(e="heads"|h_("fair")) = log_e 0.6/0.5 approx 0.182 "if" text("toss gives \"heads\""),
    log_e P(e="tails"|h_("heads"))/P(e="tails"|h_("fair")) = log_e 0.4/0.5 approx -0.223 "if" text("toss gives \"tails\""),
  )
$ <eq:sprt_coin>

With the previously defined error rates, the minimum number of tosses needed to decide that the coin is the biased one with a false positive rate lower than 5% would be $2.89/0.182 approx 16$.

===== Diffusion Decision Model <par:ddm>

Another prominent model of the decision process id the #acr("DDM") @ratcliffDiffusionDecisionModel2008. This model is the continuous-time limit of #acr("SPRT") under Gaussian noise. The #acr("DDM") assumes that a binary decision is based on the accumulation of noisy evidence in a decision variable, beginning at a starting point and terminating at one of the two decision thresholds that are associated with each of the alternatives (@fig:ddm_dots).

#figure(
  image("images/forstmannSequentialSamplingModels2016_1.png", width: 90%),
  caption: flex-caption(
    short: [Diffusion Decision Model: schematic representation on a perceptual discrimination task],
    long: [Diffusion Decision Model: schematic representation on a perceptual discrimination task (Random Dot Motion). Evidence is accumulated over time until the threshold associated with one of the responses ("left" here) is crossed. As the input which constitutes the evidence is noisy, the accumulation process is stochastic, mimicking a random walk or the Brownian motion of physical particles. Adapted from @forstmannSequentialSamplingModels2016.
    ],
  ),
) <fig:ddm_dots>

The core parameters of the #acr("DDM") are:

- $a$, the decision boundary (threshold), implements the #acr("SAT"): increasing it results in fewer errors but also slower responses. In this review, we assume _symmetric bounds_ $(-a,a)$: evidence accumulates between $-a$ and $a$. Some descriptions of #acr("DDM") use bounds $0$ and $a$ instead.
- $z$, the starting point of evidence accumulation, represents the a priori bias favoring one of the two alternatives. In an unbiased setting, $z = 0$ with symmetric bounds (otherwise, $z = a/2$).
- $v$ (sometimes denoted $mu$), the _drift rate_,  encodes the rate of evidence accumulation per unit of time (i.e. the average speed of evidence accumulation). Similarly to $d'$ (@par:sdt), it is an index of task difficulty or subject sensitivity.
- $sigma$, the noise magnitude, governs the importance of internal noise in the decision process.
- $T_("er")$, the non-decision time (@par:decision_time_course), measures the time needed for peripheral processes such as stimulus encoding and motor response.

Evidence accumulation in the #acr("DDM") is modeled as a noisy stochastic process. For each time $t$, the decision variable corresponds to a scalar-valued random variable $X(t)$ whose evolution is governed by the stochastic differential equation of arithmetic Brownian motion (@eq:ddm). For a defined noise trajectory $omega$, each realization $x(t)$ of $X(t)$ produces a scalar-valued path over time (@eq:ddm_x).

$ "d"X(t) = v"d"t + sigma"d"W(t) $ <eq:ddm>

$ x(t) = X(t, omega) "where" omega in Omega $ <eq:ddm_x>

The _drift term_ $v"d"t$ is the deterministic component, with $"d"t$ an infinitesimal time step. The _diffusion term_ $sigma"d"W(t)$ is the stochastic component, with $"d"W(t) tilde cal(N)(0, "d"t)$ a infinitesimal increment of a Wiener process (Gaussian white noise). This term captures intra-trial variability in evidence sampling. Evidence is not accumulated deterministically, but drifts on average in one direction while fluctuating randomly. An analogy is that of a particle doing a random walk between two walls. The drift term is the constant wind pushing the particle in one direction. The diffusion term is the turbulence deviating it randomly.

The DDM unifies accuracy, #acr("RT") distributions, and #acr("RT")-accuracy correlations (#acr("SAT")) in a single mechanistic framework with strong explanatory power (@fig:ddm_drift_bounds).

#figure(
  image("images/desenderConfidencePredictsSpeedaccuracy2019_1.jpg", width: 85%),
  caption: flex-caption(
    short: [Diffusion Decision Model: impact of drift rate and decision bound],
    long: [Diffusion Decision Model: impact of drift rate $v$ and decision bound $a$ on Response Time. RT distributions for correct (upper bounds) and error (lower bounds) choices are depicted for different levels of drift rate and decision bound. _(A)_ A stronger drift rate yields faster decisions and higher accuracy. _(B)_ By increasing the separation between decision bounds, the probability of being correct increases, at the expense of longer RTs. Adapted from @desenderConfidencePredictsSpeedaccuracy2019.
    ],
  ),
) <fig:ddm_drift_bounds>

Originally designed in the 1970s @ratcliffTheoryMemoryRetrieval, the #acr("DDM") is being used by a growing body of literature to elucidate the cognitive processes of decision-making @myersPracticalIntroductionUsing2022. From a behavioral standpoint, #acr("DDM")-based studies showed that older adults had slower non-decision times and set wider boundaries, but their drift rates were not always lower than those of young adults. #acr("DDM")-based analyses demonstrated that drift rate varied with IQ, but boundary separation and nondecision time did not. Sleep deprivation and alcohol consumption have been linked to a drift rate, but have either small or no effect on boundary separation and non-decision time. From a neuroscience standpoint, studies use the #acr("DDM") as inspiration to interpret neuron firing rates in monkeys as evidence accumulation until a threshold is reached @goldNeuralBasisDecision2007. Others correlate parameter estimates from #acr("DDM") models to the blood-oxygen-level dependent signal obtained from fMRI experiments in perceptual decision-making. The initial model has been extended to account for specific behavioral patterns like the difference in #acr("RT") between correct and error responses @ratcliffDiffusionDecisionModel2008, post-decisional change of mind by the decision-maker @resulajChangesMindDecisionmaking2009, or the need for less evidence as time passes @hawkinsRevisitingEvidenceCollapsing2015 (@fig:ddm_collapsing_bounds).

#figure(
  image("images/forstmannSequentialSamplingModels2016_5.png", width: 100%),
  caption: flex-caption(
    short: [Diffusion Decision Model: fixed versus collapsing bounds],
    long: [Diffusion Decision Model: fixed versus collapsing bound. _(a)_ The DDM with fixed (dashed) or collapsing (solid) decision boundaries. Models with collapsing bounds can terminate the evidence accumulation process earlier, resulting in faster decisions. _(b)_ Ways in which the models lead to different predictions for RT distributions. Adapted from @forstmannSequentialSamplingModels2016.
    ],
  ),
) <fig:ddm_collapsing_bounds>

==== Multi-alternative decisions <par:hicks_law>

For all its qualities, the #acr("DDM") has several limitations. One of the most notable is that it is designed for binary decisions. Indeed, modeling decisions involving more than two alternatives is not as straightforward as it may seem. Empirical results demonstrate that increasing the number of options will increase the decision time _logarithmically_: the average time taken to choose between $n$ options is proportional to $log_2 n$ @brownSimplestCompleteModel2008. This finding is referred to as Hick-Hyman law or Hick's law. On the contrary, simple race models with one accumulator per possible option produce the opposite effect: more accumulators lead to faster #acrpl("RT").

The following sections review several models of multi-alternative decision making that take this issue into account.

===== Multihypothesis Sequential Probability Ratio Test

The #acr("MSPRT") is, at its name implies, a generalization of #acr("SPRT") to multiple alternatives @dragalinMultihypothesisSequentialProbability, @dragalinMultihypothesisSequentialProbabilitya. Its most direct formulation uses pairwise log-likelihood ratios as decision variables. For a set of $n$ competing hypotheses $h_i, i in [1,n]$, each of the $n(n-1)$ decision variables $X_(i,j) (t)$ measures how much more the evidence supports $h_i$ over hypothesis $h_j$ (@eq:msprt).

$
  X_(i,j) (tau) = sum_(t=1)^tau log_e P(e(t)|h_i)/P(e(t)|h_j) = sum_(t=1)^tau w_(i,j) (t) "where" (i,j) in [1,n]^2 "and" i != j
$ <eq:msprt>

Evidence is sampled until one hypothesis dominates all others. A common stopping rule for accepting $h_i$ uses a set of predefined tolerances $epsilon_(i,j)$ to define the pairwise thresholds (@eq:msprt_stop).

$ forall j != i, sum_(t=1)^t log_e P(e(t)|h_i)/P(e(t)|h_j) >= log_e 1/epsilon_(i,j) $ <eq:msprt_stop>

For example, #acr("MSPRT") could be used to classify a coin as one of three possible types: fair (50/50), biased towards heads (60/40), biased towards tails (30/70). Observations would be the coin flips, and the test stops as soon as the evidence is strong enough to declare one hypothesis true. In this setup, $3(3-1) = 6$ pairwise log-likelihood ratios are tracked. For the $h_("heads")$ hypothesis, each toss result $e(t)$ is converted to two separate weights of evidence $w_("heads","fair") (t)$ and $w_("heads","tails") (t)$ accumulated to their respective log-likelihood ratios (@eq:msprt_heads_fair, @eq:msprt_heads_tails).

$
  forall t in [1,tau], w_("heads","fair") (t) = cases(
    log_e P(e="heads"|h_("heads"))/P(e="heads"|h_("fair")) = log_e 0.6/0.5 approx 0.182 "if" text("toss gives \"heads\""),
    log_e P(e="tails"|h_("heads"))/P(e="tails"|h_("fair")) = log_e 0.4/0.5 approx -0.223 "if" text("toss gives \"tails\""),
  )
$ <eq:msprt_heads_fair>

$
  forall t in [1,tau], w_("heads","tails") (t) = cases(
    log_e P(e="heads"|h_("heads"))/P(e="heads"|h_("tails")) = log_e 0.6/0.3 approx 0.693 "if" text("toss gives \"heads\""),
    log_e P(e="tails"|h_("heads"))/P(e="tails"|h_("tails")) = log_e 0.4/0.7 approx -0.56 "if" text("toss gives \"tails\""),
  )
$ <eq:msprt_heads_tails>

With $epsilon_(i,j) = 0.1 forall (i,j) in {1,2,3}^2 "and" i!=j$, the test would stop when any decision variable becomes greater or equal than $log 1/0.1 approx 2.3$.

===== Linear Ballistic Accumulator <par:lba>

The #acr("LBA") is a model of sequential decision-making based on a race between multiple independent accumulators (one per alternative) @brownSimplestCompleteModel2008. Evidence accumulates linearly and deterministically (hence the name "ballistic") towards a common threshold $a$. Instead of within-trial noise, the model relies on between-trial variability: each of the $n$ accumulators begins at a starting point $z_i$ drawn uniformly from the interval $[0,Z]$, $Z in RR^+$ (@eq:lba_dv). The drift rate $v_i$ for each accumulator is drawn independently on each trial from a normal distribution $cal(N)(mu, s^2)$. The time $T_i$ needed for accumulator $i$ to reach the threshold $a$ is determined by its initial conditions (@eq:lba_t, @fig:lba).

$ X_i (t) = v_i t + z_i $ <eq:lba_dv>

$ T_i = (a-z_i)/v_i "where" v_i > 0 $ <eq:lba_t>

#figure(
  image("images/pesquetLBA.png", width: 75%),
  caption: flex-caption(
    short: [Linear Ballistic Accumulator],
    long: [Simulation of the Linear Ballistic Accumulator model for three alternatives $A$, $B$ and $C$. Starting values $z_i$ for the $n=3$ accumulators are drawn randomly and independently from identical uniform distributions on the interval $[0, Z]$ ($Z=0.5$ here). Drift rates $v_i$ (speed of evidence accumulation) are drawn independently for each accumulator from normal distributions. The choice and RT are determined by which accumulator crosses the threshold $a=1$ first (here, alternative $B$ is chosen).
    ],
  ),
) <fig:lba>

Despite its simplicity, the #acr("LBA") model successfully accommodates empirical phenomena from binary and multiple choice tasks while being analytically tractable and computationally efficient.

===== Attentional Diffusion Decision Model

The independence of accumulators at the core of the #acr("LBA")'s architecture is a mathematical convenience that may not reflect the biological reality of competitive decision circuits, empirically characterized by mutual inhibition mechanisms @wangProbabilisticDecisionMaking2002. This model therefore sacrifices neural plausibility for tractability. Other models of sequential decision-making relax this independence assumption and introduce relationships between accumulators during the decision process.

The #acr("aDDM") is a generalization of the #acr("DDM") to multi-alternative value-based decisions. It is guided by _visual attention_: evidence in favor of each alternative is accumulated at different rates depending on the item’s value and whether it is being fixated on by the decision-maker @krajbichMultialternativeDriftdiffusionModel2011. Let us consider a decision between three available items as an example. When the decision-maker is looking at the item on the left, the respective evidence for the three options at time $t$ are given by @eq:addm_e_left, @eq:addm_e_center and @eq:addm_e_right.

$ e_("left") (t) = v r_("left") + epsilon_("left") (t) $ <eq:addm_e_left>

$ e_("center") (t) = theta v r_("center") + epsilon_("center") (t) $ <eq:addm_e_center>

$ e_("right") (t) = theta v r_("right") + epsilon_("right") (t) $ <eq:addm_e_right>

The parameter $v$ is the drift rate controlling the speed of evidence integration (@par:ddm). $theta in [0,1]$ reflects the bias against the unfixated alternatives. $r_("left")$, $r_("center")$ and $r_("right")$ respectively denote the subjective values (ratings) of each option expressed by the decision-maker beforehand. $epsilon (t)$ is Gaussian white noise with variance $sigma^2$.

The model uses one decision variable per alternative based on the evidence accumulated for that option compared with the highest accumulated evidence for the others (@eq:addm_dv_left, @eq:addm_dv_center, @eq:addm_dv_right).

$
  x_("left") (t) = sum_(t=1)^t e_("left") (k) - "max"(sum_(t=1)^t e_("center") (k), sum_(t=1)^t e_("right") (k))
$ <eq:addm_dv_left>

$
  x_("center") (t) = sum_(t=1)^t e_("center") (k) - "max"(sum_(t=1)^t e_("left") (k),sum_(t=1)^t e_("right") (k))
$ <eq:addm_dv_center>

$
  x_("right") (t) = sum_(t=1)^t e_("right") (k) - "max"(sum_(t=1)^t e_("left") (k),sum_(t=1)^t e_("center") (k))
$ <eq:addm_dv_right>

The decision is made once one of these decision variables crosses a threshold. This "best versus next" approach provides a more accurate description of the decision-maker's behavior than the alternative "best versus average", in which the evidence accumulated for each option is compared to the average accumulated evidence for the others.

#figure(
  image("images/krajbichMultialternativeDriftdiffusionModel2011_1.png", width: 100%),
  caption: flex-caption(
    short: [Attentional Diffusion Decision Model: task and simulation],
    long: [Attentional Diffusion Decision Model: task and simulation. _(A)_ Task: decision-makers are presented with images of three food items and given as much time as needed to make a decision. _(B)_ Simulation: decision variables are computed for each item based on the evidence accumulated for that item compared with the highest accumulated evidence for the other items. The average rate of evidence accumulation is higher for an item when it is fixated. When one of the DVs hits the threshold, then that item is chosen (right item here). In this particular simulation, $r_("left") = 3$, $r_("center") = 5$ and $r_("right") = 7$. Adapted from @krajbichMultialternativeDriftdiffusionModel2011.
    ],
  ),
) <fig:addm>

A variation of the #acr("aDDM") extends it to purchasing decisions, taking into account the prices for the different alternatives displayed to the decision-maker during the decision process @krajbichAttentionalDriftDiffusionModel2012.

===== Advantage Linear Ballistic Accumulator

The #acr("ALBA") is a model of sequential decision-making combining the mathematical framework of the #acr("LBA") model (@par:lba) with a value-difference encoding mechanism @vanravenzwaaijAccumulatingAdvantagesNew2020. In this model, each of the $n$ alternatives is associated with $n-1$ accumulators driven by the difference (“advantage”) in evidence versus another option. The drift rate $v_(i,j)$ for an accumulator tracking option $i$ over option $j$ is calculated using a sum of three terms (@eq:alba_drift).

$ v_(i,j) = w_D (S_i-S_j) + w_S (S_i+S_j) + v_0 $ <eq:alba_drift>

The _advantage term_ $w_D (S_i-S_j)$ represents the difference between absolute evidence strengths for their respectives options $S_i$ and $S_j$, weighted by $w_D in RR^+$. The _sum term_ $w_S (S_i+S_j)$ represents the total absolute evidence of both options, weighted by $w_S in RR^+$. Empirically, the advantage term strongly dominates the model's behavior (e.g. $w_D >> w_S$). Lastly, $v_0$ is a scaling parameter. These drift rates are used to drive evidence accumulation linearly, with starting points $z_(i,j)$ independently and uniformly sampled from the $[0,Z]$ range (@eq:alba_dv).

$ X_(i,j) (t) = v_(i,j) t + z_(i,j) $ <eq:alba_dv>

An alternative is selected when a sufficient number of accumulators associated with it reach their thresholds. The standard #acr("ALBA") model uses the "win-all" stopping rule: all pairwise accumulators $"DV"^(i,j)$ favoring option $i$ over its rivals must reach their respective thresholds $a_(i,j)$. The win-all version of #acr("ALBA") naturally provides an account of Hick’s law (@par:hicks_law).

#figure(
  image("images/pesquetALBA.png", width: 90%),
  caption: flex-caption(
    short: [Advantage Linear Ballistic Accumulator],
    long: [Simulation of the Advantage Linear Ballistic Accumulator model for three alternatives $A$, $B$ and $C$. Each subgraph shows accumulators favoring one of the options (top: $A$, center: $B$, bottom: $C$). The win-all stopping rule implies that an alternative is chosen once all associated accumulators cross their thresholds $a_(i,j)$. Here, $a_(i,j) = 1$ for all accumulators and option $A$ is selected after 1000 timesteps.
    ],
  ),
) <fig:alba>

===== Leaky Competing Accumulator

The #acr("LCA") is a biologically grounded model of sequential decision-making that incorporates leakage (or decay), lateral inhibition and noise into the accumulation process @usherTimeCoursePerceptual2001. Each alternative is associated with an accumulator whose value changes continuously. For each time $t$, decision variables correspond to random variables $X_i (t)$. The dynamics of evidence accumulation are expressed as coupled stochastic differential equations (@eq:lca).

$ "d"X_i (t) = (S_i - k X_i (t) - beta sum_(j != i) X_j (t))"d"t + sigma "d"W_i (t) $ <eq:lca>

$k$ is the _leakage_ parameter. $beta$ controls _lateral inhibition_.

===== Attractor models

=== Neural basis


