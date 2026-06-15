#import "../../utils.typ"
#import utils.acrostiche: acr, acrpl
#import utils: flex-caption

== The human brain: an overview

The human brain is the most complex biological structure known, comprising approximately 86 billion neurons and an estimated 100 trillion synaptic connections. It is the main organ of the central nervous sytem and the seat of cognition.

This section contains only general knowledge about the human brain and is by no means a scientific review. It may be skipped by readers already familiar with neuroscience.

=== Neurons

Neurons are the fundamental units of the brain. Their role is to transmit information through electrical and chemical signals. A typical neuron consists of three main parts: _dendrites_ that receive signals, a body (_soma_) that integrates all incoming signals and an _axon_ that transmits electrical signals from the body to connected cells. When a neuron is inactive, it lies in a polarized state (negative inside relative to outside) called the _resting membrane potential_. Each neuron receives thousands of inputs from other neurons at exchange points called _synapses_. Incoming signals can either be _excitatory_ (depolarizing the neuron membrane) or _inhibitory_ (repolarizing it). The neuron continuously sums all incoming signals. If the combined excitatory input received at its dendrites exceeds its threshold, chemical exchanges cause the neuron's membrane potential to suddenly become positive, triggering an _action potential_. This sudden electrical spike is the actual _firing_ of the neuron. There is no partial spike: a neuron either fires fully or not at all. The action potential travels down the axon to the _presynaptic terminals_, where it is broadcasted to subsequent neurons either through electrical or chemical synapses. In the first case, ions flow directly between neurons. In the second case, there is no direct physical contact between neurons: they are separated by a tiny gap called the _synaptic cleft_. When an action potential reaches the presynaptic terminal, _neurotransmitters_ (chemical messengers like glutamate, GABA, dopamine, serotonin or acetylcholine) are released into this cleft and bind to receptors on the postsynaptic neuron's dendrites. Chemical synapses are slower but more flexible. In both cases, the signal can either be _excitatory_ or _inhibitory_ for the post-synaptic neuron. This sequence of events, from synaptic inputs to action potential propagation, constitutes the fundamental mechanism of information processing in the brain (@fig:neuron). Synaptic connections strengthen or weaken over time: this _plasticity_ is at the heart of essential cognitive functions like memory and learning.

#figure(
  image("images/brain/pesquetNeuron.png", width: 80%),
  caption: flex-caption(
    short: [Anatomy of a neuron],
    long: [General structure of a neuron, showing dendrites (branch-like extensions that receive signals from other neurons), the neuron body that integrates inputs, the axon that is used to transmit action potentials, presynaptic terminals and synapses that enable neuronal communication. Adapted from @henleyFoundationsNeuroscience.
    ],
  ),
) <fig:neuron>

Neurons encode stimulus strength through _firing rate_. Since the height of the action potential is always the same for a given neuron, the strength of the incoming stimulus determines the frequency of action potential firing. There is, however, an upper limit to a neuron's firing rate set by its _refractory period_, during which the neuron membrane repolarizes after a spike (@fig:neuron_firing_rate). Alongside this _rate coding_ technique, the nervous system also uses _temporal coding_ (the precise timing of individual spikes relative to a reference signal) to carry information. The firing rate is measured in Hertz (Hz) or spikes per second. Most neurons fire at up to a few hundred Hertz, with some specialized cells reaching up to 1,000 Hz. At the population level, the combined activity of large assemblies of rhythmically synchronized neurons produces oscillatory patterns known as _brain waves_ (@tab:brain_waves).

#figure(
  image("images/brain/pesquetFiringRate.png", width: 100%),
  caption: flex-caption(
    short: [Neuron action potential and rate coding],
    long: [Illustrations of neuron firing. _(a)_ The action potential is a brief but large change in membrane potential, moving from negative to positive value through rapid depolarization, before returning to rest after a refractory period. _(b)_ Rate coding of stimulus strength: a neuron communicates the intensity of a stimulus by varying how frequently it fires action potentials. Downstream neurons interpret it as signal strength.  Adapted from @henleyFoundationsNeuroscience.
    ],
  ),
) <fig:neuron_firing_rate>

#figure(
  table(
    columns: 3,
    table.header([*Wave band*], [*Frequency*], [*Common associations*]),
    [Delta], [$tilde$0.5-4 Hz], [Deep, dreamless sleep],
    [Theta], [$tilde$4-8 Hz], [Deep meditation, drowsiness, memory processes],
    [Alpha], [$tilde$8-12 Hz], [Relaxed wakefulness],
    [Beta], [$tilde$13-30 Hz], [Active thinking and execution],
    [Gamma], [$tilde$30-100+ Hz], [Attention, high-level cognitive processing],
  ),
  caption: flex-caption(
    short: [Major brain wave bands],
    long: [
      List of major brain wave bands. Oscillation frequencies are associated with different brain states. These categories are not strict: multiple frequencies often coexist in different brain regions.
    ],
  ),
) <tab:brain_waves>

=== Anatomico-functional structure

The adult human brain is generaly divided into four major regions: the _cerebrum_, the _diencephalon_, the _cerebellum_, and the _brainstem_. These structures are sequentially described below.

==== Cerebrum

The cerebrum, also called _telencephalon_, is the largest division of the brain and consists of two hemispheres divided by the longitudinal fissure. Each hemisphere (left or right) receives sensory information and commands motor responses for the opposed part of the body. Hemispheres are covered by the _cerebral cortex_, a thin (between 1.5 and 4 millemeters) layer of _gray matter_ composed of neuronal cell bodies (_somas_), dendrites and synapses. The cerebral cortex consists of the _neocortex_ (90 to 95% of its surface) and the _allocortex_. The former is composed of six distinct neuronal layers, distinguishable by cell type, density, and connectivity. The latter is evolutionarily older and structurally simpler, with three to five layers. Inside the neocortex, neurons are vertically grouped into _cortical columns_ spanning the six layers and acting as functional units. Beneath the cortical gray matter lies the _white matter_, an extensive network of axons that connects cortical regions to each other and to subcortical structures (@fig:cortex_gray_white_matter).

#figure(
  image("images/brain/thijsDhollanderGrayWhiteMatter.png", width: 75%),
  caption: flex-caption(
    short: [The cerebral cortex: gray and white matter],
    long: [
      Schematic drawing of the human brain on a coronal slice, indicating the two main tissue classes (gray matter and white matter) and the ventricles filled with a protection and transportation fluid. Adapted from @dhollanderPhdthesis.
    ],
  ),
) <fig:cortex_gray_white_matter>

The folding pattern of the cerebral cortex creates _gyri_ (ridges) and _sulci_ (depressions), expanding its total surface area to approximately 2,500 cm² (@fig:cortex_gyrus_sulcus). The largest sulci further subdivide each hemisphere into four external and two internal _lobes_ (@fig:brain_lobes).

#figure(
  image("images/brain/wikipedia_gyrus_sulcus.png", width: 35%),
  caption: flex-caption(
    short: [The cerebral cortex: gyri and sulci],
    long: [
      A ridge in the cerebral cortex is called a _gyrus_ (plural gyri) and a depression is called a _sulcus_ (plural sulci). The largest sulci are also called fissures. Adapted from #link("https://commons.wikimedia.org/wiki/File:Gyrus_sulcus.png")[wikimedia].
    ],
  ),
) <fig:cortex_gyrus_sulcus>

#figure(
  image("images/brain/wikipedia_brain_lobes.png", width: 50%),
  caption: flex-caption(
    short: [The cerebral cortex: external lobes],
    long: [
      Localization of the frou external lobes in the human cortex: the frontal lobe (blue), the parietal lobe (yellow), the temporal lobe (green), and the occipital lobe (red). The insular and limbic lobes are not visible. Adapted from #link("https://commons.wikimedia.org/wiki/File:Lobes_of_the_brain_NL.svg")[wikimedia].
    ],
  ),
) <fig:brain_lobes>

===== Frontal lobe

The frontal lobe, situated anterior to the central sulcus, is the largest cortical lobe, associated with high-level cognitive functions. It is composed of three main structures: the #acr("PFC"), the premotor cortex and the motor cortex. The #acr("PFC"), occupying the anterior frontal lobe, is associated with higher-order cognitive functions like planning @luria2012higher, attention @Shallice_1988 and goal-directed behavior @hunt2017FrameworkReward. It is not a single homogeneous structure but a collection of interconnected cortical regions. The #acr("PFC") can be further divided along the dorsal-ventral and medial-lateral axes. The corresponding substructures are the #acr("dlPFC"), the #acr("dmPFC"), the #acr("vlPFC"), the #acr("vmPFC") and the #acr("OFC") (@fig:pfc).

#figure(
  image("images/brain/pesquetBrainAxesPlanes.png", width: 100%),
  caption: flex-caption(
    short: [Anatomical axes and planes used to divide brain regions],
    long: [
      Anatomical axes and planes used to divide brain regions. _(a)_ Rostral-caudal, dorsal-ventral, and medial-lateral axes. _(b)_ The _frontal_ or _coronal_ plane runs parallel to the eyes or ears and divides the brain into front and back regions. The _sagittal_ plane runs perpendicular to the eyes or ears and divides the brain into left and right regions. The _horizontal_ plane runs parallel to the ground and divides the brain into top and bottom regions. Adapted from #link("https://openbooks.lib.msu.edu/neuroscience/")[Foundation of Neuroscience].
    ],
  ),
) <fig:brain_axes_planes>

#figure(
  image("images/brain/pesquetPFC.png", width: 100%),
  caption: flex-caption(
    short: [Lateral and sagittal views of the prefrontal cortex],
    long: [
      Schema of the prefrontal cortex. _(a)_ Rostral-caudal, dorsal-ventral, and medial-lateral axes for refering to specific regions. _(b)_ Lateral view of the PFC showing the dlPFC, the vlPFC and the OFC, as well as premotor and motor cortices, the other parts of the frontal lobe:. Adapted from #link("https://commons.wikimedia.org/wiki/File:PFC_anatomy_correctedlabels.png")[wikimedia].
    ],
  ),
) <fig:pfc>

===== Parietal lobe

===== Temporal lobe

===== Occipital lobe

==== Diencephalon

==== Cerebellum

==== Brainstem

=== Dynamics
