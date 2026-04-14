// LTeX: enabled=false

#import "@preview/cetz:0.4.2"

#let r = 2
#let a = 2 * r / calc.sqrt(5)
#let b = 2 * a

#cetz.canvas({
  import cetz.draw: *

  let dot(coord) = circle(coord, radius: .025, fill: black)

  // circle
  circle((0, 0), radius: r)
  dot((0, 0))

  // logo
  let A = (-b / 2, -a / 2)
  let B = A.map(x => -x)
  let C = (rel: (x: b), to: A)
  rect(A, B)
  content(
    (A, 50%, (rel: (x: b))),
    padding: .2,
    anchor: "north",
    $b=2a$,
  )
  content(
    (B, 50%, (rel: (y: -a))),
    padding: .2,
    anchor: "east",
    $a$,
  )

  // triangle
  line(A, B, name: "diameter")
  content(
    ("diameter.start", 50%, "diameter.end"),
    angle: "diameter.end",
    padding: .2,
    anchor: "south",
    $c = 2r$,
  )
  content(A, [A], padding: .2, anchor: "east")
  content(B, [B], padding: .2, anchor: "west")
  content(C, [C], padding: .2, anchor: "west")

  // angle
  arc((rel: (x: .5), to: A), start: 0deg, delta: calc.atan(1 / 2), radius: .5)
  content((rel: (x: .8, y: .25), to: A), $alpha$)

  // right angle logo
  rect(C, (rel: (x: -.3, y: .3)))
  dot((rel: (x: -.15, y: .15), to: C))
})
