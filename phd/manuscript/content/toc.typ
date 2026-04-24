// ToC
#outline(
  title: "Contents",
  indent: auto,
  depth: 4,
)

// Figures
// TODO: display shorter titles for figures
#outline(
  title: "Figures",
  target: figure.where(kind: image),
)

// Tables
#outline(
  title: "Tables",
  target: figure.where(kind: table),
)
