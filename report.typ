// LTeX: enabled=false

#import "/lib.typ": conf
#import "/utils.typ": *


#show: conf.with(
  degree: [
    Máster Universitario en Formación del Profesorado de Educación Secundaria
    Obligatoria, Bachillerato, Formación Profesional y Enseñanza de Idiomas
  ],
  subject: "C.F.D.E.M.",
  year: (25, 26),
  semester: 2,
  project: "Actividad Evaluable 1",
  title: "Examen competencial",
  // group: 89,
  // bibliography-content: bibliography("bib.bib", style: "apa"),
  // appendixes: include "apendixes.typ",
  authors: (
    (
      name: "Luis Daniel",
      surname: "Casais Mezquida",
    ),
  ),
  // team: "Los chungitos",
  professor: "Ana Lejárraga García",
  toc: false,
  chapter-on-new-page: true,
)


#set heading(numbering: none)
#show table: set par(justify: false)


#import "problems.typ": NON-SUMMARY-CATEG, categ-map, diff-level, problems


#[
  #set page(flipped: true)


  = Tabla resumen de los ejercicios desarrollados

  #v(1em)

  #box(
    width: 90%,
    table(
      align: horizon + center,
      columns: (3.5cm, ..for i in range(problems.len()) { (auto,) }),
      // columns: problems.len() + 1,
      table.header(
        [*Nº de problema*],
        ..for i in range(
          1,
          problems.len() + 1,
        ) {
          (strong[#i],)
        },
      ),

      // build table
      ..for row in categ-map
        .pairs()
        .filter(((k, ..)) => k not in NON-SUMMARY-CATEG) // remove non-summary
        // build rows
        .map(((category, name)) => (
          strong(name),
          // summaries
          ..for p in problems {
            if category == "curso" {
              ([4º ESO\ (Matemáticas #p.at(category))],)
            } else {
              (
                {
                  let val = p.at(category).first()
                  // handle multiple values
                  if type(val) == array {
                    val.join([, ])
                  } else {
                    val
                  }
                  if category == "nivel" [
                    (#diff-level(p.at(category).first()))
                  ]
                },
              )
            }
          },
        )) { (row) },
    ),
  )
]


= Desarrollo de los problemas

#for (i, p) in problems.enumerate() {
  heading([Problema #{ i + 1 }], level: 2)

  for category in categ-map.keys() {
    if category == "curso" { continue }

    heading(
      categ-map.at(if category == "saber" { "curso" } else { category }),
      level: 3,
    )

    // desarrollo
    if category in NON-SUMMARY-CATEG {
      p.at(category)
    } else {
      p.at(category).last()
    }
  }
  pagebreak(weak: true)
}
