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

#let mc(num, question, choices, columns: 1) = block(
  breakable: false,
)[
  #strong[#num.] #question

  #if columns == 1 [
    #enum(
      numbering: "A.",
      ..choices
    )
  ] else [
    #grid(
      columns: (1fr, 1fr),
      gutter: 1em,
      row-gutter: 0.25em,

      [A. #choices.at(0)], [B. #choices.at(1)],
      [C. #choices.at(2)], [D. #choices.at(3)],
    )
  ]

  #v(0.1in)
  #align(left)[Answer: #answer-blank()]

  #v(0.35in)
]
#let sa(num, question, space: 1.5in) = block(
  breakable: false,
)[
  #strong[#num.] #question

  #v(0.15in)
  Answer: #answer-blank(width: 5.5in)

  #v(0.35in)
  #line(length: 6.1in)

  #v(0.35in)
  #line(length: 6.1in)

  #v(space)
]
= Wellington Algebra 2 Placement and Honors Readiness Test

#v(0.3in)

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [Name: #answer-blank(width: 2.5in)],
  [Date: #answer-blank(width: 2.5in)],
)

#v(0.3in)

#directions[
  Answer each multiple-choice question by circling the best answer.
  For short-answer questions, show enough work to make your reasoning clear.
  Calculators may be used only if your teacher allows them.
]

#v(0.2in)


#mc(
  1,
  [Which equation describes the functional relationship shown in the table?
  #table(
    columns: 6,
    inset: 8pt,
    align: center,
    stroke: 0.5pt,

    [$x$], [$-2$], [$-1$], [$0$], [$1$], [$2$],
    [$y$], [$-6$], [$-3$], [$0$], [$-3$], [$-6$],
  )],
  (
    [$y = 3|x|$],
    [$y = -3|x|$],
    [$y = |3x|$],
    [$y = -|x| + 3$],
  ),
)

#mc(
  2,
  [Which graph shows $y = x^2$?],
  (
    [#small-graph("x2")],
    [#small-graph("x")],
    [#small-graph("x3")],
    [#small-graph("abs")],
  ),
  columns: 2,
)

#mc(
  3,
  [Simplify: $4(2x - 1) - 3(x + 5)$],
  (
    [$3x - 19$],
    [$5x - 19$],
    [$5x - 16$],
    [$9x - 2$],
  ),
)

#mc(
  4,
  [What is the slope of a line that passes through $(4, -1)$ and $(2, 9)$?],
  (
    [$frac(3, 7)$],
    [$-5$],
    [$-frac(5, 7)$],
    [$-4$],
  ),
)

#mc(
  5,
  [Which equation represents the line with slope $frac(1, 2)$ that passes through $(3, -1)$?],
  (
    [$x + 2y = 1$],
    [$x - 2y = 5$],
    [$x + 2y = -1$],
    [$x - 2y = 8$],
  ),
)

#mc(
  6,
  [What is the $x$-intercept of the graph of $3x - 4y = 12$?],
  (
    [$-4$],
    [$-3$],
    [$3$],
    [$4$],
  ),
)

#mc(
  7,
  [Which method can be used to solve the linear equation $3x - 2 = 9$?],
  (
    [Graph $y = 3x - 2$ and identify the $x$-intercept.],
    [Graph $y = 3x - 11$ and identify the $x$-intercept.],
    [Graph $y = 3x - 2$ and identify the $y$-intercept.],
    [Graph $y = 3x - 11$ and identify the $y$-intercept.],
  ),
)

#mc(
  8,
  [The sum of two numbers is $27$. The larger number is $6$ more than twice the smaller number. Which system of equations can be used to find the two numbers, where $x$ is the smaller number and $y$ is the larger number?],
  (
    [$x y = 27$ and $y = 6 + x$],
    [$x + y = 27$ and $y = 6 + x$],
    [$x + y = 27$ and $y = 6 + 2x$],
    [$x y = 27$ and $y = 6 + 2x$],
  ),
)

#mc(
  9,
  [What is the range of the function $f(x) = x^2 + 6x + 9$?],
  (
    [all real numbers],
    [all real numbers greater than or equal to $0$],
    [all real numbers greater than or equal to $3$],
    [all real numbers greater than or equal to $9$],
  ),
)

#mc(
  10,
  [What are the solutions of the equation $x^2 - 3x - 1 = 0$?],
  (
    [$frac(-3 + sqrt(5), 2)$ and $frac(-3 - sqrt(5), 2)$],
    [$frac(3 + sqrt(5), 2)$ and $frac(3 - sqrt(5), 2)$],
    [$frac(-3 + sqrt(13), 2)$ and $frac(-3 - sqrt(13), 2)$],
    [$frac(3 + sqrt(13), 2)$ and $frac(3 - sqrt(13), 2)$],
  ),
)

#mc(
  11,
  [Which value is a counterexample to the statement $x^2 >= x$?],
  (
    [$x = -0.5$],
    [$x = 0.5$],
    [$x = 1.0$],
    [$x = 1.5$],
  ),
)

#mc(
  12,
  [Which of the following is an example of inductive reasoning?],
  (
    [Every rectangle is a parallelogram. Every square is a rectangle. Therefore, every square is a parallelogram.],
    [If $x > 3$, then $x^2 > x$. Since $4 > 3$, $4^2 > 4$.],
    [Ted's bus arrived at his bus stop before 8:05 a.m. every morning for two weeks. Ted decides that his bus will arrive before 8:05 a.m. the next morning.],
    [Keisha's uncle promises to give her \$5 if she gets a grade of $85$ or higher on her math test. Keisha gets a $93$ on her math test. Therefore, Keisha's uncle gives her \$5.],
  ),
)

#mc(
  13,
  [The table below shows the number of diagonals in certain polygons. Which expression describes the number of diagonals in a polygon with $n$ sides?
  #table(
    columns: 2,
    inset: 8pt,
    align: center,
    stroke: 0.5pt,
    [Number of Sides], [Number of Diagonals],
    [3], [0],
    [4], [2],
    [5], [5],
    [6], [9],
    [7], [14],
  )],
  (
    [$n(n - 3)$],
    [$frac(n(n - 3), 2)$],
    [$frac(n - 3, 2)$],
    [$frac(n, 2)$],
  ),
)

#mc(
  14,
  [The table below shows the sum of the interior angle measures of certain polygons. According to the information in the table, which is the best prediction for the sum of the interior angle measures in an 11-gon?
  #table(
    columns: 2,
    inset: 8pt,
    align: center,
    stroke: 0.5pt,
    [Number of Sides], [Sum of Interior Angle Measures],
    [3], [180],
    [4], [360],
    [5], [540],
    [6], [720],
  )],
  (
    [$900$],
    [$1260$],
    [$1440$],
    [$1620$],
  ),
)

#mc(
  15,
  [Eleanor has a garden in the shape of a right isosceles triangle. The two legs of the triangle are each 10 feet long. What is the length of the hypotenuse?],
  (
    [$20$ feet],
    [$10 sqrt(3)$ feet],
    [$15$ feet],
    [$10 sqrt(2)$ feet],
  ),
)

#mc(
  16,
  [A plane intersects a right cylinder parallel to one of the cylinder's bases. What is the shape of the intersection?],
  (
    [circle],
    [rectangle],
    [ellipse],
    [trapezoid],
  ),
)

#mc(
  17,
  [At which point do the graphs of $y = 2x - 3$ and $y = 3x - 2$ intersect?],
  (
    [$(1, -1)$],
    [$(-1, -5)$],
    [$(-4, -11)$],
    [$(0, -3)$],
  ),
)

#mc(
  18,
  [How many real solutions does the equation $2x^2 - 5x + 4 = 0$ have?],
  (
    [No real solutions],
    [One real solution],
    [Two real solutions],
    [Infinitely many real solutions],
  ),
)

#mc(
  19,
  [The line $y = m x + 7$ is perpendicular to the line $y = frac(3, 4)x - 9$. What is the value of $m$?],
  (
    [$frac(3, 4)$],
    [$-frac(3, 4)$],
    [$frac(4, 3)$],
    [$-frac(4, 3)$],
  ),
)

#mc(
  20,
  [In the right triangle below, $M$ is the midpoint of hypotenuse $Q R$. Which statement must be true?

  #let a = 1
  #let b = 1
  #let c = 4
  #let d = 3.5
  #let mx = (a + c) / 2
  #let my = (b + d) / 2


  #align(center)[
    #cetz.canvas(length: 0.8cm, {
      import cetz.draw: *

      // Axes
      line((-0.5, 0), (5.5, 0), mark: (end: ">"))
      line((0, -0.5), (0, 5), mark: (end: ">"))

      content((5.7, 0), [$x$])
      content((0, 5.2), [$y$])

      // Triangle sides
      line((a, b), (a, d))   // P to Q
      line((a, b), (c, b))   // P to R
      line((a, d), (c, b))   // Q to R

      // Right-angle marker at P
      line((a + 0.22, b), (a + 0.22, b + 0.22))
      line((a, b + 0.22), (a + 0.22, b + 0.22))

      // Points
      circle((a, b), radius: 0.05)
      circle((a, d), radius: 0.05)
      circle((c, b), radius: 0.05)

      // Labels for points
      content((a - 0.25, b - 0.3), [$P(a, b)$])
      content((a - 0.25, d + 0.25), [$Q(a, d)$])
      content((c + 0.25, b - 0.3), [$R(c, b)$])

      // Midpoint M of QR
      circle((mx, my), radius: 0.05)
      content((mx + 0.25, my + 0.25), [$M$])
    })
  ]],
  (
    [$P M = Q M $],
    [$P M = P Q + P R$],
    [$Q M = P R$],
    [$P M = Q R$],
  ),
)

#mc(
  21,
  [For the circle below, which expression can be used to find the area of the shaded region?

  #align(center)[
    #cetz.canvas(length: 0.75cm, {
      import cetz.draw: *

      let r = 3.2
      let start = -50deg
      let stop = 50deg
      let sec_x_start = calc.cos(start) * r
      let sec_y_start = calc.sin(start) * r

      // Shaded sector
      arc(
        (sec_x_start, sec_y_start),
        radius: r,
        start: start,
        stop: stop,
        mode: "PIE",
        fill: rgb("#dddddd"),
        stroke: none,
      )

      // Circle outline
      circle((0, 0), radius: r, stroke: 1pt)

      // Radii
      line((0, 0), (start, r), stroke: 1pt)
      line((0, 0), (stop, r), stroke: 1pt)

      // Center point
      circle((0, 0), radius: 0.06, fill: black)
      content((-0.45, 0.18), [$O$])

      // Small central-angle arc
      arc((0.85 * calc.cos(start), 0.85*calc.sin(start)), radius: 0.85, start: start, stop: stop, stroke: 0.8pt)
      content((0deg, 2.2), [$100$ degrees])

      // Radius label
      content((start + 15deg, 2.2), [$9$ cm])
    })
  ]],
  (
    [$frac(100, 360) dot pi dot 9^2$],
    [$frac(100, 360) dot pi dot 3.2^2$],
    [$frac(260, 360) dot pi dot 9^2$],
    [$100 dot pi dot 9^2$],
  ),
)

#mc(
  22,
  [Points $A(-2, 5)$ and $B(4, -3)$ are endpoints of a segment. What is the midpoint of segment $A B$?],
  (
    [$(1, 1)$],
    [$(2, -4)$],
    [$(3, -1)$],
    [$(6, -8)$],
  ),
)

#mc(
  23,
  [What is the distance between the points $(-1, 2)$ and $(5, 10)$?],
  (
    [$10$],
    [$sqrt(52)$],
    [$14$],
    [$sqrt(80)$],
  ),
)

#mc(
  24,
  [A triangle has side lengths $x + 3$, $2x - 1$, and $x + 8$. If its perimeter is $34$, what is the value of $x$?],
  (
    [$4$],
    [$5$],
    [$6$],
    [$8$],
  ),
)

#mc(
  25,
  [Two angles are complementary. One angle is $3x + 10$ degrees and the other is $2x - 5$ degrees. What is the measure of the larger angle?],
  (
    [$29$ degrees],
    [$41$ degrees],
    [$49$ degrees],
    [$61$ degrees],
  ),
)

#mc(
  26,
  [A line has equation $2x + 5y = 20$. What is the slope of a line perpendicular to it?],
  (
    [$-frac(2, 5)$],
    [$frac(2, 5)$],
    [$-frac(5, 2)$],
    [$frac(5, 2)$],
  ),
)

#mc(
  27,
  [A rectangle has length $x + 7$ and width $x - 2$. Its area is $36$. Which answer could represent the dimensions of the rectangle?],
  (
    [$5$ by $5$],
    [$6$ by $6$],
    [$9$ by $4$],
    [$12$ by $3$],
  ),
)

#mc(
  28,
  [A dilation centered at the origin maps point $P(6, -9)$ to point $P'(2, -3)$. What is the scale factor?],
  (
    [$frac(1, 3)$],
    [$frac(2, 3)$],
    [$3$],
    [$-3$],
  ),
)

#mc(
  29,
  [Triangle $A B C$ is similar to triangle $D E F$. If $A B = 6$, $B C = 9$, and $D E = 10$, what is the length of $E F$?],
  (
    [$12$],
    [$13$],
    [$15$],
    [$18$],
  ),
)

#mc(
  30,
  [A tree's shadow is 15 feet long. The angle made by the sun's rays and the ground is $30$ degrees. Which expression can be used to find the height of the tree?],
  (
    [$15 tan(30)$ feet],
    [$15 sin(30)$ feet],
    [$15 cos(30)$ feet],
    [$frac(15, tan(30))$ feet],
  ),
)


#sa(
  31,
  [
    Complete the table of values for the function $f(x) = frac(1,2)x^2 - 2$. Then use the points to sketch the graph.

    #v(0.15in)

    #table(
      columns: 4,
      inset: 8pt,
      align: center,
      stroke: 0.5pt,

      [$x$], [$-2$], [$0$], [$2$],
      [$f(x)$], [], [], [],
    )

    #v(0.25in)

    #align(center)[
      #cetz.canvas(length: 0.45cm, {
        import cetz.draw: *

        // Axes
        line((-5, 0), (5, 0), mark: (end: ">"))
        line((0, -4), (0, 5), mark: (end: ">"))

        // Tick marks
        for x in range(-5, 6) {
          line((x, -0.08), (x, 0.08))
        }

        for y in range(-4, 6) {
          line((-0.08, y), (0.08, y))
        }

        content((5.3, 0), [$x$])
        content((0, 5.3), [$y$])
      })
    ]
  ],
  space: 0.5in,
)

#sa(
  32,
  [A rectangle has perimeter $46$. Its length is $5$ more than twice its width. Find the dimensions of the rectangle.],
  space: 1.7in,
)

#sa(
  33,
  [Consider the following list of ordered pairs:

  ${( -3, 5 ), ( -1, 2 ), ( 0, 5 ), ( 2, 2 ), ( 4, 7 )}$

  Does this list of ordered pairs represent a function? Explain why or why not.],
  space: 1.6in,
)