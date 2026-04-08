/// Map of categories keys and names
#let categ-map = (
  enun: [Enunciado],
  curso: [Curso],
  sol: [Solución],
  estimulo: [Estímulo],
  contexto: [Contexto],
  categoria: [Categoría de contenido],
  proceso: [Proceso matemático],
  tipo: [Tipo de respuesta],
  nivel: [Nivel de dificultad],
  saber: [Saber básico],
)

#let NON-SUMMARY-CATEG = ("enun", "sol", "estimulo")

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

#let problems = (
  (
    categoria: (ctg.qty, []),
    estimulo: [],
    contexto: ("", []),
    proceso: ("", []),
    tipo: ("", []),
    nivel: ("", []),
    enun: [],
    sol: [],
    saber: ("", []),
    curso: "A",
  ),
  (
    categoria: (ctg.inc, []),
    contexto: ("", []),
    tipo: ("", []),
    proceso: ("", []),
    nivel: ("", []),
    enun: [],
    sol: [],
    estimulo: [],
    saber: ("", []),
    curso: "A y B",
  ),
  (
    categoria: (ctg.spa, []),
    contexto: ("", []),
    proceso: ("", []),
    tipo: ("", []),
    nivel: ("", []),
    enun: [],
    sol: [],
    estimulo: [],
    saber: ("", []),
    curso: "A y B",
  ),
  (
    categoria: (ctg.rel, []),
    contexto: ("", []),
    tipo: ("", []),
    proceso: ("", []),
    nivel: ("", []),
    enun: [],
    sol: [],
    estimulo: [],
    saber: ("", []),
    curso: "A y B",
  ),
)
