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
    _Firma della proponente_
    \ \
    #line(length: 7cm)
  ]
}

#let changelog(body) = {
  table(
    columns: 5,
    table.header([Versione], [Data], [Descrizione], [Autore], [Verificatore]),
    ..body,
  )
}

#let todos(..body) = {
  [= Azioni pianificate]

  table(
    columns: 5,
    table.header([\# Issue], [Decisione], [Azione], [Incaricato/i], [Scadenza]),
    ..body,
  )
}

#let template(
  doctitle: "",
  // Redattore del documento
  writer: ("",),
  meetingplace: "",
  meetingtime: "",
  // Stringa dei partecipanti separati da virgola ESCLUSO il redattore
  partecipants: "",
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
    author: (writer,),
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

  [= Dettagli organizzativi]
  [
    / Orario: #meetingtime
    / Luogo: #meetingplace
    / Redattore del verbale: #writer.
    / Partecipanti: 
      #for person in partecipants.split(",") [
        - #person.trim(),
      ]
      - #writer.
  ]
  body
}

