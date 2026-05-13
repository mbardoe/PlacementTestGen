// command: render
#import "@preview/cetz:0.5.1" as cetz

#let answer-blank(width: 1in) = box(
  width: width,
  height: 0.18in,
  stroke: (bottom: 0.5pt),
)[]

#set page(
  paper: "us-letter",
  margin: 0.75in,
)

#set text(
  font: "New Computer Modern",
  size: 11pt,
)

#set par(justify: false)

#let blank(width: 2.5in) = line(length: width)

#let directions(body) = block[
  #strong[Directions:] #body
]

#let mc(num, question, choices) = block[
  #strong[#num.] #question

  #enum(
    numbering: "A.",
    ..choices
  )

  #v(0.1in)
  #align(right)[Answer: #answer-blank()]

  #v(0.35in)
]

#let sa(num, question, space: 1.5in) = block[
  #strong[#num.] #question

  #v(0.15in)
  Answer: #line(length: 5.5in)

  #v(0.35in)
  #line(length: 6.1in)

  #v(0.35in)
  #line(length: 6.1in)

  #v(space)
]

= Algebra 2 Placement Test

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [Name: #blank()],
  [Date: #blank()],
)

#v(0.3in)

#directions[
  Answer each multiple-choice question by circling the best answer.
  For short-answer questions, show enough work to make your reasoning clear.
  Calculators may be used only if your teacher allows them.
]

#v(0.2in)

== Part 1: Algebraic Fluency

#directions[
  Choose the best answer.
]

#mc(
  1,
  [Simplify $3x + 4 - 2x + 7$.],
  (
    [$x + 11$],
    [$5x + 11$],
    [$x + 3$],
    [$5x + 3$],
  ),
)

#mc(
  2,
  [Solve $2(3x - 4) = 16$.],
  (
    [$x = 2$],
    [$x = 4$],
    [$x = 6$],
    [$x = 12$],
  ),
)

#mc(
  3,
  [Which expression is equivalent to $x^2 - 9$?],
  (
    [$(x - 3)(x - 3)$],
    [$(x + 3)(x + 3)$],
    [$(x - 3)(x + 3)$],
    [$x(x - 9)$],
  ),
)

#mc(
  4,
  [Simplify $frac(x^5, x^2)$, assuming $x != 0$.],
  (
    [$x^7$],
    [$x^3$],
    [$x^10$],
    [$frac(1, x^3)$],
  ),
)

#mc(
  5,
  [Factor $x^2 + 5x + 6$.],
  (
    [$(x + 1)(x + 6)$],
    [$(x + 2)(x + 3)$],
    [$(x - 2)(x - 3)$],
    [$(x + 5)(x + 1)$],
  ),
)

== Part 2: Linear Functions and Systems

#mc(
  6,
  [What is the slope of the line passing through $(2, 5)$ and $(6, 13)$?],
  (
    [$1$],
    [$2$],
    [$4$],
    [$8$],
  ),
)

#mc(
  7,
  [Which equation represents a line with slope $-3$ and $y$-intercept $4$?],
  (
    [$y = 4x - 3$],
    [$y = -3x + 4$],
    [$y = 3x + 4$],
    [$y = -4x + 3$],
  ),
)

#mc(
  8,
  [Solve the system: $y = 2x + 1$ and $y = x + 5$.],
  (
    [$(2, 5)$],
    [$(4, 9)$],
    [$(5, 6)$],
    [$(1, 3)$],
  ),
)

#mc(
  9,
  [A line contains the points $(0, -2)$ and $(3, 4)$. Which equation describes the line?],
  (
    [$y = 2x - 2$],
    [$y = -2x + 2$],
    [$y = 3x - 2$],
    [$y = 2x + 3$],
  ),
)

== Part 3: Quadratic Expressions and Equations

#mc(
  10,
  [What are the solutions to $x^2 - 5x + 6 = 0$?],
  (
    [$x = -2$ and $x = -3$],
    [$x = 2$ and $x = 3$],
    [$x = 1$ and $x = 6$],
    [$x = -1$ and $x = -6$],
  ),
)

#mc(
  11,
  [The graph of $y = (x - 4)^2 + 2$ has vertex],
  (
    [$(4, 2)$],
    [$(-4, 2)$],
    [$(4, -2)$],
    [$(-4, -2)$],
  ),
)

#mc(
  12,
  [Which quadratic opens downward?],
  (
    [$y = x^2 + 3x - 1$],
    [$y = 2x^2 - 4$],
    [$y = -x^2 + 5x + 6$],
    [$y = frac(1, 2)x^2 + 7$],
  ),
)

== Part 4: Functions and Graph Interpretation

#mc(
  13,
  [If $f(x) = 2x^2 - 3$, what is $f(4)$?],
  (
    [$5$],
    [$13$],
    [$29$],
    [$35$],
  ),
)

#mc(
  14,
  [If $g(x) = 3x - 7$, which value of $x$ makes $g(x) = 8$?],
  (
    [$1$],
    [$3$],
    [$5$],
    [$15$],
  ),
)

#mc(
  15,
  [Which statement is true about the graph shown below?],
  (
    [The graph has positive slope.],
    [The graph has negative slope.],
    [The graph is horizontal.],
    [The graph is not a line.],
  ),
)

#align(center)[
  #cetz.canvas(length: 0.55cm, {
    import cetz.draw: *

    // Axes
    line((-4, 0), (4, 0))
    line((0, -4), (0, 4))

    // Tick marks
    for x in range(-4, 5) {
      line((x, -0.08), (x, 0.08))
    }

    for y in range(-4, 5) {
      line((-0.08, y), (0.08, y))
    }

    // A line with negative slope: y = -x + 2
    line((-2, 4), (4, -2), stroke: 1.2pt)

    content((4.35, 0), [$x$])
    content((0, 4.35), [$y$])
  })
]

== Part 5: Short Answer

#directions[
  Show your work or briefly explain your reasoning.
]

#sa(
  16,
  [Solve the equation $4x - 7 = 2x + 9$.],
)

#sa(
  17,
  [Factor completely: $x^2 - 7x + 12$.],
)

#sa(
  18,
  [Write the equation of the line with slope $3$ passing through the point $(2, 5)$.],
)

#sa(
  19,
  [A student says that $(x + 5)^2 = x^2 + 25$. Explain the mistake and write the correct expansion.],
  space: 1.6in,
)

#pagebreak()

= Answer Key

#enum(
  [$x + 11$],
  [$x = 4$],
  [$(x - 3)(x + 3)$],
  [$x^3$],
  [$(x + 2)(x + 3)$],
  [$2$],
  [$y = -3x + 4$],
  [$(4, 9)$],
  [$y = 2x - 2$],
  [$x = 2$ and $x = 3$],
  [$(4, 2)$],
  [$y = -x^2 + 5x + 6$],
  [$29$],
  [$5$],
  [The graph has negative slope.],
)

#strong[16.] $4x - 7 = 2x + 9$, so $2x = 16$, and $x = 8$.

#strong[17.] $x^2 - 7x + 12 = (x - 3)(x - 4)$.

#strong[18.] One possible answer: $y - 5 = 3(x - 2)$, or $y = 3x - 1$.

#strong[19.] The student forgot the middle term. The correct expansion is $(x + 5)^2 = x^2 + 10x + 25$.