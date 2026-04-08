#set math.equation(numbering: "(1)")

= Introduction

== Background

In this report, we will explore the various factors that influence fluid dynamics in glaciers and how they contribute to the formation and behavior of these natural structures.

+ The climate
  - Temperature
  - Precipitation
+ The topography
+ The geology

Glaciers as the one shown in @glaciers will cease to exist if we don't take action soon!

#figure(
  image("glacier.jpg", width: 50%),
  caption: [
    _Glaciers_ form an important part of the earth's climate system.
  ],
) <glaciers>

== Methods

We follow the glacier melting models established in @glacier-melt.

The equation $Q = rho A v + C$ defines the glacial flow rate.

The displaced soil by glacial flow is given by @flow.

$
  7.32 beta + sum_(i=0)^nabla (Q_i (a_i - epsilon)) / 2
$ <flow>

$ v := vec(x_1, x_2, x_3) $

$ a arrow.squiggly b $

#bibliography("works.bib")
