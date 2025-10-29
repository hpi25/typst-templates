#let VSPACE = 1em
#let HSPACE = 1em

#let exercise_counter = counter("exercise")

#let exercise_ex(name, in_parens, content) = block[
    *#name* (#in_parens)#if content != [] [:] else []\
    #box(inset: (left: HSPACE, top: 0em), width: 1fr, content)
    #v(VSPACE)
]

#let exercise(title, content) = [
    #exercise_counter.step()
    #exercise_ex([Aufgabe #context exercise_counter.display("1")], title, content)
]

#let solution(content) = [
  *Lösung:*\
  #pad(left: HSPACE, top: 0em, content)
  #v(VSPACE)
]


#let template(
  document,
  names: [Peter Silie],
  title: [Hausaufgabe Woche 1],
  group: [Tutorium Dublone],
  course: [Mathematik I],
  semester: [Wintersemester 2025/26]
) = {
  set par(justify: true)
  set list(indent: .5em)
  set enum(indent: .5em)
  set text(lang: "de")
  
  show link: text.with(fill: blue)
  show heading.where(level: 1): set text(size: 20pt)

  set page(
    footer: context [
      #set align(center)
      #v(1.5em)
      #counter(page).display() / #counter(page).final().first()
    ], 
    header: context [
      #if here().page() != 1 [
        #course -- #title
        #h(1fr)
        #names (#group)
        // #datetime.today().display("[day].[month].[year]")
        // #h(1fr)
        #v(-.5em)
        #line(length: 100%, stroke: .5pt + black)
      ]
    ],
    paper: "a4",
  )

  align(center, rect(inset:   1em)[
    #names #h(1fr) #course
    = #title
    #v(1em)
    Tutorium: #group #h(1fr) #semester
  ])

  v(2em)

  document
}