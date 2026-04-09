#import "deps.typ"
#import deps.glossarium: make-glossary, register-glossary

#show: make-glossary

#let entry-list = (
  (
    key: "kuleuven",
    short: "KU Leuven",
    long: "Katholieke Universiteit Leuven",
    description: "A university in Belgium.",
  ),
  // Add more terms
)

#register-glossary(entry-list)
