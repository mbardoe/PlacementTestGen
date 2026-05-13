// command: render

#import "@preview/cetz:0.5.1" as cetz

#let small-graph(kind) = box(
  width: 1.4in,
  height: 1.4in,
  inset: 4pt,
  stroke: 0.5pt,
)[
  #align(center)[
    #cetz.canvas(length: 0.22in, {
      import cetz.draw: *

      // Axes
      line((-3, 0), (3, 0))
      line((0, -3), (0, 3))

      // Tick marks
      for x in range(-3, 4) {
        line((x, -0.08), (x, 0.08))
      }

      for y in range(-3, 4) {
        line((-0.08, y), (0.08, y))
      }

      // Draw the selected graph
      if kind == "x2" {
        for i in range(-17, 17) {
          let x1 = i / 10
          let x2 = (i + 1) / 10
          line((x1, x1 * x1), (x2, x2 * x2), stroke: 1pt)
        }
      } else if kind == "x" {
        line((-3, -3), (3, 3), stroke: 1pt)
      } else if kind == "x3" {
        for i in range(-14, 14) {
          let x1 = i / 10
          let x2 = (i + 1) / 10
          line((x1, x1 * x1 * x1), (x2, x2 * x2 * x2), stroke: 1pt)
        }
      } else if kind == "abs" {
        line((-3, 3), (0, 0), stroke: 1pt)
        line((0, 0), (3, 3), stroke: 1pt)
      }
    })
  ]
]

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
  #align(left)[Answer: #answer-blank()]

  #v(0.3in)
]

#let sa(num, question, space: 1.2in) = block[
  #strong[#num.] #question

  #v(0.15in)
  Answer: #answer-blank(width: 5.5in)

  #v(0.35in)
  #line(length: 6.1in)

  #v(0.35in)
  #line(length: 6.1in)

  #v(space)
]

#let graph-line(points: none, labels: false) = box(
  width: 2.2in,
  height: 2.2in,
  inset: 4pt,
  stroke: 0.5pt,
)[
  #align(center)[
    #cetz.canvas(length: 0.28in, {
      import cetz.draw: *

      for x in range(-4, 5) {
        line((x, -4), (x, 4), stroke: rgb("dddddd") + 0.25pt)
      }
      for y in range(-4, 5) {
        line((-4, y), (4, y), stroke: rgb("dddddd") + 0.25pt)
      }

      line((-4, 0), (4, 0), mark: (end: ">"))
      line((0, -4), (0, 4), mark: (end: ">"))

      for x in range(-4, 5) {
        if x != 0 {
          line((x, -0.08), (x, 0.08))
        }
      }
      for y in range(-4, 5) {
        if y != 0 {
          line((-0.08, y), (0.08, y))
        }
      }

      line((-4, -1), (4, 3), stroke: 1pt)

      if points != none {
        for p in points {
          circle(p, radius: 0.09, fill: black)
        }
      }
    })
  ]
]

= Geometry Placement Test

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

== Part I: Multiple Choice

#mc(
  1,
  [The total cost, in dollars, of buying $b$ cans of beans can be found using the equation $c = 0.79b$. What is represented by the dependent variable?],
  (
    [The total cost of $b$ cans],
    [The cost of 1 can],
    [The number of cans purchased],
    [The number of cans that can be purchased for \$0.79],
  ),
)

#mc(
  2,
  [A certain oak tree is 12 feet taller than a certain pine tree. If the pine tree is $p$ feet tall, which expression represents the height of the oak tree?],
  (
    [$12 + p$],
    [$12 - p$],
    [$p - 12$],
    [$12p$],
  ),
)

#mc(
  3,
  [Solve the equation $3(x - 4) = 2x + 7$.],
  (
    [$x = 19$],
    [$x = 5$],
    [$x = -5$],
    [$x = -19$],
  ),
)

#mc(
  4,
  [Which of the following is equivalent to $4x^2-9$?],
  (
    [$(2x - 3)(2x + 3)$],
    [$(4x - 3)(x + 3)$],
    [$(4x - 9)(x + 1)$],
    [$(2x - 9)(2x + 1)$],
  ),
)

#mc(
  5,
  [Which expression is equivalent to $2x^2 - 5x - 3$?],
  (
    [$(2x + 1)(x - 3)$],
    [$(2x - 1)(x + 3)$],
    [$(2x - 3)(x + 1)$],
    [$(x - 3)(x + 1)$],
  ),
)

#mc(
  6,
  [Simplify $3(2a - 5) - 4(a + 1)$.],
  (
    [$2a - 19$],
    [$2a - 11$],
    [$10a - 19$],
    [$10a - 11$],
  ),
)

#mc(
  7,
  [The points $(2, 5)$ and $(6, 13)$ lie on a line. What is the slope of the line?],
  (
    [$2$],
    [$1/2$],
    [$4$],
    [$8$],
  ),
)

#mc(
  8,
  [Which equation represents the line with slope $-3$ and $y$-intercept $4$?],
  (
    [$y = -3x + 4$],
    [$y = 4x - 3$],
    [$y = -3x - 4$],
    [$y = 3x + 4$],
  ),
)

#mc(
  9,
  [A line passes through $(1, 2)$ and has slope $5$. Which point must also be on the line?],
  (
    [$(2, 7)$],
    [$(2, 5)$],
    [$(6, 3)$],
    [$(0, 7)$],
  ),
)

#mc(
  10,
  [What is the domain of the function $f(x) = sqrt(x - 3)$?],
    (
        [$x >= 3$],
        [$x > 3$],
        [$x <= 3$],
        [$x < 3$],
 )
)

#mc(
  11,
  [Which graph best represents $y = |x|$?],
  (
    [#small-graph("x2")],
    [#small-graph("x")],
    [#small-graph("x3")],
    [#small-graph("abs")],
  ),
)

#mc(
  12,
  [The function $f(x) = 2x^2 - 3$ is evaluated at $x = -4$. What is $f(-4)$?],
  (
    [$29$],
    [$-35$],
    [$13$],
    [$5$],
  ),
)

#mc(
  13,
  [Which expression is equivalent to $sqrt(72)$?],
  (
    [$6 sqrt(2)$],
    [$12 sqrt(6)$],
    [$8 sqrt(9)$],
    [$36 sqrt(2)$],
  ),
)

#mc(
  14,
  [A rectangle has length $x + 7$ and width $x - 2$. Which expression represents its area?],
  (
    [$x^2 + 5x - 14$],
    [$x^2 + 9x + 14$],
    [$2x + 5$],
    [$x^2 - 5x - 14$],
  ),
)

#mc(
  15,
  [Solve the equation $A=frac(1, 2)b(h_1 + h_2)$ for $h_1$.],
  (

    [$h_1 = frac(2A, b) + h_2$],
    [$h_1 = frac(A, b) - h_2$],
    [$h_1 = frac(A, b) + h_2$],
    [$h_1 = frac(2A, b) - h_2$],
  ),
//  (
//    [The triangle is a right triangle because $6^2 + 8^2 = 12^2$.],
//    [The triangle is a right triangle because $6 + 8 > 12$.],
//    [The triangle is not a right triangle because $6^2 + 8^2 != 10^2$.],
//    [The triangle cannot exist because $6 + 8 < 10$.],
//  ),
)

#mc(
  16,
  [What is the distance between the points $(-2, 3)$ and $(4, 3)$?],
  (

    [$2$],
    [$7$],
    [$6$],
    [$sqrt(52)$],
  ),
)

#mc(
  17,
  [What is the midpoint of the segment with endpoints $(-4, 7)$ and $(6, -1)$?],
  (
    [$(1, 3)$],
    [$(2, 6)$],
    [$(-5, 8)$],
    [$(10, -8)$],
  ),
)

#mc(
  18,
  [If a figure is translated 5 units right and 2 units down, which rule describes the transformation?],
  (

    [$(x, y) -> (x - 5, y + 2)$],
    [$(x, y) -> (x + 5, y - 2)$],
    [$(x, y) -> (x + 2, y - 5)$],
    [$(x, y) -> (5x, -2y)$],
  ),
)

#mc(
  19,
  [Point $A(3, -5)$ is reflected over the $x$-axis. What are the coordinates of the image of $A$?],
  (

    [$(-3, -5)$],
    [$(-3, 5)$],
    [$(3, 5)$],
    [$(5, 3)$],
  ),
)

#mc(
  20,
  [Angles $A$ and $B$ are supplementary. If $m angle A = 3x + 20$ and $m angle B = 2x - 10$, what is $x$?],
  (

    [$30$],
    [$34$],
    [$18$],
    [$170$],
  ),
)

#mc(
  21,
  [Which statement is the converse of "If a number is divisible by 6, then it is divisible by 3"?],
  (
    [If a number is not divisible by 6, then it is not divisible by 3.],
    [If a number is not divisible by 3, then it is not divisible by 6.],
    [A number is divisible by 6 and divisible by 3.],
    [If a number is divisible by 3, then it is divisible by 6.],

  ),
)

#mc(
  22,
  [A line has $x$-intercept $-4$ and $y$-intercept $6$. What is the equation of the line in standard form?],
  (
    [$-4x + 6y = 24$],
    [$4x + 6y = 24$],
    [$3x - 2y = -12$],
    [$3x - 2y = 0$],
  ),
)

#mc(
  23,
  [Which value of $k$ makes the equation $k x + 6 = 2x + 6$ have infinitely many solutions?],
  (
    [$2$],
    [$6$],
    [$0$],
    [$-2$],
  ),
)

#mc(
  24,
  [A square has side length $s$. If the side length is tripled, what happens to the area?],
  (
    [The area is multiplied by $9$.],
    [The area is multiplied by $6$.],
    [The area is multiplied by $3$.],
    [The area increases by $9$.],
  ),
)

#pagebreak()

== Part II: Short Answer

#sa(
  25,
  [Solve the equation $4(2x - 3) - 5 = 3x + 18$. Show your steps.],
  space: 1.1in,
)

#sa(
  26,
  [Find the equation of the line in slope-intercept form that is perpendicular to $y=3x-7$ and goes through the point $(1, -5)$.],
  space: 1.4in,
)

#sa(
  27,
  [The points $A(-3, 1)$, $B(1, 4)$, and $C(7, -4)$ are three vertices of a quadrilateral $A B C D$. Find coordinates for a point $D$ so that $A B C D$ is a parallelogram. Explain how you know.],
  space: 1.6in,
)

#sa(
  28,
  [A student claims that the equations $y = 2x + 1$ and $4x - 2y = -2$ have exactly one solution. Is the student correct? Explain your reasoning.],
  space: 1.4in,
)





#pagebreak()

= Teacher Notes / Draft Answer Key

== Multiple Choice

#enum(
 [A],
 [A],
 [B],
 [A],
 [A],
 [A],
 [C],
 [A],
 [A],
 [A],
 [D],
 [A],
 [A],
 [A],
 [D],
 [C],
 [A],
 [A],
 [B],
 [C],
)

== Short Answer

#enum(
  [25. $x = 7$],
  [26. Slope is $-1$, so $y = -x + 3$.],
  [27. One possible answer is $D(3, -7)$. This uses $D = A + C - B$. Other vertices may be possible if the points are ordered differently, but for parallelogram $A B C D$, $D(3, -7)$ is the intended answer.],
  [28. The student is not correct. The second equation simplifies to $y = 2x + 1$, so the two equations represent the same line and have infinitely many solutions.],
  [29. Width is $8$ units and length is $19$ units.],
  [30. $A B^2 = 25$, $B C^2 = 25$, and $A C^2 = 65$. Since no pair of squared side lengths adds to the third, the triangle is not right.],
)

== Placement Notes

This draft is designed to test readiness for Geometry after Algebra 1. Questions 1--24 emphasize core Algebra 1 fluency, coordinate reasoning, transformations, and early geometric reasoning. Questions 27, 28, and 30 are intended to give stronger evidence for Honors Geometry placement because they require students to connect algebraic and geometric representations and justify their reasoning.
