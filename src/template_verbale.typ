// Template per i verbali interni ed esterni

#let header = {
  grid(
    columns: (3cm, 1fr, 3cm, 1fr),
    align: horizon,

    image("sigillo unipd.jpg", width: 3cm),
    text(fill: rgb("#9b0014"))[Università di Padova, corso di Ingegneria del Software \ A.A. 2026/2027],

    image("logo gruppo.png", width: 3cm),
    [
      Gruppo 18\
      _Lord of The String_\
      #link("mailto:lordofthestrings03@gmail.com")[lordofthestrings03\@gmail.com]
    ],
  )
  v(1cm)
}

#let firma = {
  v(1.2cm)
  align(right)[
    _Firma di approvazione del proponente_
    \ \ 
    #line(length: 7cm)
  ]
}

#let template(
  doctitle: "",
  writer: "",
  partecipants: (),
  body,
) = {
  show title: set text(size: 21pt)
  set heading(numbering: "1.1.1.")
  set text(
    lang: "it",
    hyphenate: false,
  )
  set document(
    title: doctitle,
    author: ((writer,) + partecipants),
  )

  // Prima pagina con titolo e versionamento
  set page(numbering: none)
  header
  pad(
    bottom: 3pt,
    top: 3pt,
    align(center)[
      #title()
    ],
  )

  // Indice
  outline(indent: 0em)
  pagebreak()

  // Inizio contenuto
  set page(
    numbering: "1",
    number-align: right,
  )
  counter(page).update(1)
  body
}

