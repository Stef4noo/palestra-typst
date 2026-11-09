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

#let template(
  doctitle: "",
  changelog: (),
  body,
) = {
  // Impostazioni comuni per tutto
  show title: set text(size: 21pt)
  set heading(numbering: "1.1.1.")
  set text(
    lang: "it",
    hyphenate: false,
  )
  set document(
    title: doctitle,
    author: "Lord of The Strings",
  )
  show table.cell.where(y: 0): strong
  set table(
    align: top + left,
    stroke: 0.6pt + rgb("#3e3c3c"),
    fill: (col, row) => if row == 0 { rgb("#c7c3c3") } else { none },
  )
  set terms(
    tight: true,
    separator: [: ],
  )

  // Prima pagina con titolo
  set page(numbering: none)
  header
  pad(
    bottom: 3pt,
    top: 3pt,
    align(center)[
      #title()
    ],
  )
  pagebreak()

  // Per il changelog e l'indice non voglio il numero di pagina
  set page(
    footer: image(
      "logo alt footer.jpg",
      width: 4cm,
    ),
  )

  // Changelog
  table(
    columns: 5,
    table.header([Versione], [Data], [Descrizione], [Autore], [Verificatore]),
    ..changelog,
  )
  pagebreak()

  // Indice
  outline(indent: 0em)
  pagebreak()

  // Inizio contenuto
  set page(
    numbering: "1",
    number-align: right,
    footer: context {
      let page = counter(page).get().first()
      grid(
        columns: (1fr, auto),
        align: (left + horizon, right + horizon),
        image("logo alt footer.jpg", width: 4cm), [#page],
      )
    },
  )
  counter(page).update(1)

  body
}
