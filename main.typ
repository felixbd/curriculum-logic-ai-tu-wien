#import "@preview/cheq:0.2.2": checklist
#import "@preview/tablem:0.2.0": tablem, three-line-table
#import "@preview/shadowed:0.2.0": shadowed as shadowed-original
#import "@preview/theorion:0.3.3": cosmos, caution-box, warning-box, remark, important-box
#import cosmos.fancy: *


#show: checklist.with(
  marker-map: (
    " ": sym.ballot,
    "x": sym.ballot.cross,
    "-": sym.bar.h,
    "/": sym.slash.double
  )
)

// #

#set page(
  paper: "a4",
  height: auto,
)


= Double Degree Logic and Computation

- https://informatics.tuwien.ac.at/master/double-degree-logic-and-computation/
- https://www.uni-hannover.de/en/studium/studienangebot/info/studiengang/detail/informatik-vertiefung-logic-and-computation


#pagebreak(weak: true)

== Master programme Logic and Artificial Intelligence

TU Wien: Academic Program: 066 931

- *curriculum pdf*: https://informatics.tuwien.ac.at/master/curriculum-ue066931.pdf
- *tiss:* https://tiss.tuwien.ac.at/curriculum/public/curriculum.xhtml?key=55301&locale=en



=== Mandatory / Pflicht (marked with a $dagger$)

#stack(
  dir: ltr, spacing: 1cm,
  [
    - Logic and Theory
      - [ ] Discrete Mathematics (6,0 ECTS)
      - [ ] Logic and Computability (6,0 ECTS)
    
    - Algorithms and Complexity
      - [ ] Algorithmics (6,0 ECTS)    
  ],
  [
    - Symbolic Artificial Intelligence
      - [x] Logic-based Artificial Intelligence (6,0 ECTS)
    
    - Machine Learning
      - [x] Machine Learning (6,0 ECTS)
  ]
)

#figure(
  image("Studienplan-tu.png"),
)



/****************************

grade:
  - 0     in progress
  - 1-4   done / passed
  - 5     fail / redo

***************************/


#let tu-curses = (
  (
    id: "192.183",
    name: "Machine Learning",
    sem: "2026S",
    ects: 6,
    grade: 0,
    mandatory: true
  ),
  (
    id: "192.204",
    name: "Logic-based Artificial Intelligence",
    sem: "2026S",
    ects: 6,
    grade: 0,
    mandatory: true,
  ),
  (
    name: "Graph Drawing Algorithms",
    id: "192.155",
    sem: "2026S",
    ects: 6,
    grade: 0
  ),
  (
    name: "Problem Solving and Search in Artificial Intelligence",
    id: "192.207",
    sem: "2026S",
    ects: 6,
    grade: 0
  ),
  (
    name: "Knowledge Graphs",
    id: "192.194",
    sem: "2026S",
    ects: 6,
    grade: 0
  )  
)


#let format-kurs(kurs, w: auto) = {
  box(
    fill: {
      if kurs.grade == 0 { orange }
      else if kurs.grade < 5 { green }
      else { red }
    }.transparentize(35%),
    inset: 2mm,
    // outset: -2mm,
    radius: 2mm,
    width: w,
    stroke: .2mm,
  )[
    #kurs.id | ects: #kurs.ects | grade: #kurs.grade  \
    #if kurs.at("mandatory", default: false) { super[#math.dagger] } #kurs.name    
  ]
}



#let lecture-from-id(id) = tu-curses.filter((e) => e.id == id).first()


#let f(x) = format-kurs(lecture-from-id(x))



#let sembox(n) = box(radius: 5mm, inset: 5mm)[#set text(size: 15pt); Sem #n.]


#tablem[
  | #sembox("I") | #sembox("II") | #sembox("III") | #sembox("IV") |
  | ------------ | ------------- | -------------- | ------------- |
  | Logic and Theory | Symbolic AI \ #f("192.204") \ #f("192.194") \ #f("192.207") | Electives | Master's Thesis |
  | Algorithms and Complexity \ #f("192.155") | Machine Learning \ #f("192.183") | ^ | ^ |
  | AI and Society | < | ^ | ^ |
  | Extensions | < | < | ^ |
  | Open Electives and Transferable Skills | < | < | ^ |
]


#align(center)[
  #box(width: 110%,)[
    #shadowed-original(
      inset: 5mm,
      radius: .5cm,
)[
  #set align(left)
  ===  TU Lectures:
  
  #for kurs in tu-curses [
    #format-kurs(kurs, w: 5cm) ~
  ]

  #line(
    length: 100%,
    stroke: (
        paint: gradient.linear(..color.map.crest.rev()),
        thickness: 1pt, dash: "dashed", cap: "round"
    )
  )
  
  #stack(
    dir: ltr, spacing: .5cm,
    box(fill: orange.lighten(20%).transparentize(10%), inset: 2mm, radius: 2mm)[in Progress],
    box(fill: green.lighten(20%).transparentize(10%), inset: 2mm, radius: 2mm)[done],
    box(fill: red.lighten(20%).transparentize(10%), inset: 2mm, radius: 2mm)[dropped / failed / redo],
  )
  $sum #tu-curses.map((e) => e.ects).sum() "ects"$
]]]
