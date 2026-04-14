// LTeX: enabled=false

#import "/utils.typ": *


/// Map of categories keys and names
#let categ-map = (
  enun: [Enunciado],
  curso: [Curso],
  sol: [Solución],
  contexto: [Contexto],
  categoria: [Categoría de contenido],
  proceso: [Proceso matemático],
  tipo: [Tipo de respuesta],
  nivel: [Nivel de dificultad],
  saber: [Saber básico],
)

#let NON-SUMMARY-CATEG = ("enun", "sol")

/// Computes the difficulty range (alto-medio-bajo) from the level
///
/// - l (str): Level
/// -> str
#let diff-level(l) = {
  if l == "" or l == none { return }

  l = int(l.slice(0, 1))

  if l > 4 { return "Alto" }
  if l > 2 { return "Medio" }
  return "Bajo"
}

#let ctx = (
  per: "Personal",
  ocu: "Ocupacional",
  soc: "Social",
  cif: "Cientifico",
)

#let ctg = (
  qty: "Cantidad",
  spa: "Espacio",
  inc: "Incertidumbre y datos",
  rel: "Cambios y relaciones",
)

#let proc = (
  emp: "Emplear conceptos, hechos y procedimientos matemáticos",
  form: "Formular situaciones matemáticamente",
  int: "Interpretar, aplicar y evaluar resultados matemáticos",
  raz: "Razonamiento matemático",
)

#let rep = (
  cc: "Construida cerrada",
  s: "Seleccionada",
  ca: "Construida abierta",
)

#let fmt(sol) = strong(lower(sol))

#let problems = (
  (
    categoria: (
      ctg.qty,
      [El estudiante debe realizar cálculos cuantitativos y evaluar los
        resultados de los mismos, así como las relaciones con otras cantidades.
        Por ello pertenece a la categoría de #fmt(ctg.qty)],
    ),
    proceso: (proc.emp, []),
    tipo: (
      rep.s,
      [El estudiante debe de seleccionar las respuectas correctas de entre las
        dadas, por lo que es tipo de respuesta #fmt(rep.s).],
    ),
    contexto: (
      ctx.per,
      [La situación descrita se desenvuelve en el ámbito de la recreación, por
        lo que el contexto es #fmt(ctx.per).],
    ),
    nivel: (
      "3",
      [El estudiante debe idear una estrategia para solucionar el problema, así
        realizar varios cálculos rutinarios no claramente definidos (sumas,
        restas, y divisiones) sobre números decimales. También deben usar
        fuentes de información textuales y en formato tabular para recopilar los
        datos. Por ello, se le otorga un nivel de dificultad *3*.],
    ),
    enun: [
      Alberto va al cine con su amigo Juan a ver la última entrega de su _anime_
      favorito. Llevan esperándola mucho tiempo, y han ahorrado dinero para la
      ocasión. Alberto ha ahorrado #money(29.4) y Juan #money(26.7). Cada
      entrada cuesta #money(7.4), y se han repartido equitativamente los #money(
        24.5,
      ) del pack de dos disfraces.

      Dada la siguiente tabla de precios y, sabiendo que se van a repartir el
      coste equitativamente, ¿cuales de las siguientes opciones de palomitas y
      refrescos se pueden permitir?
      #set enum(numbering: "a)")
      + Un menú 'Pareja'
      + Un menú 'Cubo' y un refresco
      + Dos menús 'Combi'

      #figure(table(
        columns: 2,
        table.header([*Menú*], [*Precio/unidad*]),
        [Menú 'Pareja' (dos cubos pequeños, dos refrescos)], [#money(14.5)],
        [Menú 'Cubo' (un cubo grande, un refresco)], [#money(10.45)],
        [Menú 'Combi' (un cubo pequeño, un refresco)], [#money(7.75)],
        [Refresco], [#money(3.20)],
      ))
    ],
    sol: [
      Tanto Alberto como Jose se han gastado un total de
      #let pre-cost = 7.2 + (24.5 / 2)
      #let alberto = 29.4
      #let juan = 26.7
      $#money(7.2) + #money(24.5)/2 = #money(pre-cost)$.

      Esto deja a Alberto con un total de
      $#money(alberto) - #money(pre-cost) = #money(alberto - pre-cost)$, y a
      Juan con un total de
      $#money(juan) - #money(pre-cost) = #money(juan - pre-cost)$.

      #set enum(numbering: "a)")
      #set enum(spacing: 1.3em)
      Los costes de las opciones de palomitas y refrescos son, por persona:
      + $#money(14.5)/2 = #money(14.5 / 2)$ <opt-d>
      + $(#money(10.45) + #money(3.20))/2 = #money((10.45 + 3.20) / 2)$
      + $(2 times #money(7.75))/2 = #money(7.75)$

      Alberto se puede permitir todas las opciones, pero Juan sólo se puede
      permitir las opciones de un menú 'Cubo' y un refresco y la de un menú
      'Pareja'. Como deben pagar los dos lo mismo, sólo las opciones a) y c) son
      las que ambos se pueden permitir.
    ],
    saber: ("", []),
    curso: "A y B",
  ),
  (
    categoria: (ctg.inc, []),
    proceso: ("", []),
    tipo: ("", []),
    contexto: ("", []),
    nivel: ("", []),
    enun: [],
    sol: [],
    saber: ("", []),
    curso: "A y B",
  ),
  (
    categoria: (
      ctg.spa,
      [El problema requiere de la identificación de figuras geométricas (el logo
        como un rectángulo y la tapa como un círculo) y el uso de funciones y
        teoremas geométricos. Por ello pertenece a la categoría #fmt(ctg.spa).],
    ),
    proceso: (
      proc.form,
      [El problema propone una situación el cual da la oportunidad de ser
        resuelto matemáticamente. El estudiante debe identificar los aspectos
        matemáticos del problema y representarlo de una manera matemática. Por
        esos motivos, se emplea el proceso de #fmt(proc.form).
      ],
    ),
    contexto: (
      ctx.ocu,
      [El contexto es #fmt(ctx.ocu), ya que trata del diseño de un producto para
        una empresa.],
    ),
    tipo: (
      rep.ca,
      [El problema requiere proporcionar una fórmula como solución al problema,
        por lo que es #fmt(rep.ca).],
    ),
    nivel: (
      "5",
      [El estudiante debe realizar una visualización compleja que no se
        proporciona, y requiere incorporar conocimientos no establecidos
        explícitamente (teorema de Pitágoras, funciones trigonométricas). Por
        ello se considera que tiene un nivel de dificultad #fmt("5").],
    ),
    enun: [
      A la empresa BOTELLAS ANA, S.L. se le realiza un pedido de botellas
      personalizadas. El cliente quiere que se grabe el logo de su empresa, el
      cual es es dos veces más alto que ancho, en la tapa, la cual es
      perfectamente circular.

      Expresa el tamaño real que el logo, en función del radio de la tapa, para
      que quede perfectamente centrado en la ella sin sobresalir por ningún
      lado.

      #set align(center)

      #grid(
        columns: 2,
        inset: (x: 2em),
        image("img/botella.jpg", height: 4cm),
        image("img/logo.png", height: 4cm),
      )
    ],
    sol: [
      Asumamos que la tapa es un círculo de radio $r$, y el logo es un
      rectángulo de lados $a$ y $b$. Dado que uno de los lados es el doble del
      otro:

      $ b = 2a $

      Si queremos hacer que el logo encaje centrado en la tapa, debemos hacer
      que la diagonal $c$ del logo rectangular coincida con el diámetro de la
      tapa circular (dos veces el radio), es decir:

      $ c = 2r $

      Todo esto queda resumido en la siguiente figura:

      #figure(include "diagrams/ex3.typ")

      El problema se puede resolver aplicando el Teorema de Pitágoras al
      triángulo $A C B$:

      $ a^2 + b^2 = c^2 $
      $ a^2 + (2a)^2 = (2r)^2 $
      $ 5a^2 = 4r^2 $
      $ a = sqrt((4r^2)/5) = (2r)/sqrt(5) $

      También se puede resolver mediante la ecuación fundamental de la
      trigonometría y la definición de seno y coseno:

      $ sin(alpha) = a/c = a/(2r) $
      $ cos(alpha) = b/c = (cancel(2)a)/(cancel(2)r) $
      $ sin^2(alpha) + cos^2(alpha) = 1 $
      $ (a/(2r))^2 + (a/r)^2 = 1 => a^2/(4r^2) + a^2/r^2 = 1 $
      $ a^2/r^2 + (4a^2)/r^2 = 4 => (5a^2)/r^2 = 4 $
      $ a = sqrt((4r^2)/5) = (2r)/sqrt(5) $


    ],
    saber: ("", []),
    curso: "A",
  ),
  (
    categoria: (ctg.rel, []),
    proceso: ("", []),
    tipo: ("", []),
    contexto: ("", []),
    nivel: ("", []),
    enun: [],
    sol: [],
    saber: ("", []),
    curso: "A y B",
  ),
)
