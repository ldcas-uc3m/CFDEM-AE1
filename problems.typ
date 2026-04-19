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

#let sab = (
  num: "Sentido numérico",
  med: "Sentido de la medida",
  esp: "Sentido espacial",
  alg: "Sentido algebraico",
  est: "Sentido estocástico",
  soc: "Sentido socioafectivo",
)

#let fmt(sol) = strong(lower(sol))

#let problems = (
  (
    categoria: (
      ctg.qty,
      [El estudiante debe realizar cálculos cuantitativos y evaluar los
        resultados de los mismos, así como las relaciones con otras cantidades.
        Por ello pertenece a la categoría de #fmt(ctg.qty).],
    ),
    proceso: (
      proc.emp,
      [El estudiante debe realizar cálculos sencillos para resolver el problema,
        así como diseñar e implementar una estrategia pare encontrar la
        solución, por lo que se utiliza el proceso de #fmt(proc.emp).],
    ),
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
    saber: (
      sab.num,
      [El problema requiere la aplicación de conocimiento sobre cálculo en un
        contexto de transacciones monetarias, desarrollando destrezas en la
        comprensión, representación y uso flexible de los números y operaciones.
        Por ello, se corresponde con el #fmt(sab.num).

        Este problema está diseñado para 4º de ESO (*Matemáticas A y B*), ya que
        exige al estudiante no solo aplicar cálculos rutinarios, sino también
        seleccionar y valorar una estrategia para determinar qué opciones son
        asequibles, obteniendo todas las soluciones posibles que cumplen con las
        condiciones dadas.],
    ),
    curso: "A y B",
  ),
  (
    categoria: (
      ctg.rel,
      [El problema presenta una gráfica que representa patrones climáticos, y
        requiere interpretar los cambios y relaciones entre ellos, por lo que
        entra en la categoría de #fmt(ctg.rel).],
    ),
    proceso: (
      proc.int,
      [El estudiante debe interpretar la información representada gráficamente y
        evaluar un resultado matemático (máximos y mínimos) en el contexto del
        problema, por lo que se usa el proceso de #fmt(proc.int).],
    ),
    tipo: (
      rep.s,
      [El estudiante debe seleccionar las opciones de verdadero o falso entre
        las afirmaciones propuestas, por lo que es #fmt(rep.s).],
    ),
    contexto: (
      ctx.soc,
      [El problema trata de meteorología de ciudades, por lo cual es contexto
        #fmt(
          ctx.soc,
        ).],
    ),
    nivel: (
      "1b",
      [El estudiante debe responder a una pregunta en un contexto fácilmente
        entendible, con una representación simple (temperatura a lo largo del
        tiempo), y debe reconocer cuando una información debe ignorarse
        (temperatura percibida), por lo que se le otorga un nivel de dificultad
        de *1b*.],
    ),
    enun: [
      El siguiente gráfico muestra las temperaturas máximas y mínimas promedio
      diarias de las ciudades de Madrid y Zaragoza. Las líneas delgadas
      discontínuas representan las temperaturas percibidas correspondientes.

      #show figure.caption: it => emph(it.body)
      #show figure.caption: set align(left)

      #figure(image("img/temperatura.svg", width: 80%), caption: [Fuente: #link(
          "https://es.weatherspark.com/compare/y/36848~43119/Comparaci%C3%B3n-del-tiempo-promedio-en-Madrid-y-Zaragoza",
        )[WeatherSpark.com]])

      Usando la información proporcionada por el grafo, marca como verdaderas o
      falsas las siguientes afirmaciones:

      #set enum(numbering: "a)")
      + Los meses de verano son los más calurosos en ambas ciudades.
      + La temperatura máxima en Zaragoza es siempre superior a la de Madrid.
      + La temperatura mínima promedio anual de Madrid es inferior a la de
        Zaragoza.
    ],
    sol: [
      #set enum(numbering: "a)")
      + Las temperaturas más altas se registran en los meses de junio, julio,
        agosto, y septiembre, por lo que la afirmación es *verdadera*.
      + La temperatura máxima de Madrid es de 33 ºC, mientras que la de Zaragoza
        es 32 ºC, lo cual hace la afirmación *falsa*.
      + Todos los días la temperatura mínima de Madrid es inferior a la de
        Zaragoza, lo cual hace la afirmación *verdadera*.

    ],
    saber: (
      sab.est,
      [El problema requiere el análisis y la interpretación de datos
        representados gráficamente para evaluar afirmaciones y tomar decisiones
        basadas en la información estadística presentada. Por ello, se
        corresponde con el #fmt(sab.est).

        Este problema es adecuado para 4º de ESO (*Matemáticas A y B*), ya que
        requiere que el estudiante reformule la información de un gráfico para
        validar o descartar afirmaciones, seleccionando los datos relevantes y
        evaluando su pertinencia para llegar a una conclusión sobre todas las
        posibles interpretaciones.],
    ),
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
      rep.cc,
      [El problema requiere proporcionar una fórmula como solución al problema,
        por lo que es #fmt(rep.cc).],
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
      triángulo $A B C$:

      $ a^2 + b^2 = c^2 $
      $ a^2 + (2a)^2 = (2r)^2 => 5a^2 = 4r^2 $
      $ therefore a = sqrt((4r^2)/5) = (2r)/sqrt(5) $

      También se puede resolver mediante la ecuación fundamental de la
      trigonometría (la cual se deriva del Teorema de Pitágoras) y las
      definiciónes de seno y coseno:

      #import "@preview/intextual:0.1.1": flushr, intertext-rule
      #show: intertext-rule

      $ sin(alpha) = a/c = a/(2r) $
      $ cos(alpha) = b/c = (cancel(2)a)/(cancel(2)r) $
      $ sin^2(alpha) + cos^2(alpha) = 1 $
      $ (a/(2r))^2 + (a/r)^2 = 1 => a^2/(4r^2) + a^2/r^2 = 1 $
      $
        a^2/r^2 + (4a^2)/r^2 = 4 => (5a^2)/r^2 = 4
        #flushr[(multiplica por $4$)]
      $
      $ therefore a = sqrt((4r^2)/5) = (2r)/sqrt(5) $


    ],
    saber: (
      (sab.alg, sab.esp),
      [El problema requiere el uso del lenguaje algebraico para expresar
        relaciones de dependencia entre variables (el tamaño del logo y el radio
        de la tapa) y modelizar una situación geométrica con expresiones
        simbólicas. También involucra el sentido espacial al identificar y
        razonar con las propiedades geométricas de las figuras. Por ello, se
        corresponde con el #fmt(sab.alg) y el #fmt(sab.esp).

        Este problema se ajusta a 4º de ESO (*Matemáticas A*), ya que demanda la
        capacidad de reformular un problema de la vida real en términos
        matemáticos, seleccionar y aplicar estrategias de modelización y obtener
        una solución general en forma de expresión algebraica, valorando la
        idoneidad del modelo geométrico y algebraico utilizado.],
    ),
    curso: "A",
  ),
  (
    categoria: (
      ctg.inc,
      [El problema requiere que el estudiante interprete y evalúe datos
        presentados en una tabla de doble entrada para sacar conclusiones en una
        situación con incertidumbre, por lo que pertenece a la categoría de
        #fmt(ctg.inc).],
    ),
    proceso: (
      proc.raz,
      [El estudiante debe analizar la tabla de datos, identificar las relaciones
        entre las variables y construir un argumento lógico para justificar su
        conclusión sobre la efectividad del tratamiento. Esto requiere #fmt(
          proc.raz,
        ).],
    ),
    tipo: (
      rep.ca,
      [El estudiante debe elaborar una respuesta abierta y justificada, basada
        en el análisis de los datos, por lo que es de tipo #fmt(rep.ca).],
    ),
    contexto: (
      ctx.cif,
      [El problema se sitúa en el marco de un estudio sobre la efectividad de un
        fármaco, lo que corresponde a un contexto #fmt(ctx.cif).],
    ),
    nivel: (
      "2",
      [El estudiante debe extraer información de una tabla de doble entrada y
        utilizar una estrategia simple (cálculo de proporciones) para resolver
        el problema. La tarea requiere una interpretación literal de los
        resultados para determinar la efectividad del fármaco, lo que se ajusta
        a un nivel de dificultad de *2*.],
    ),
    enun: [
      Un equipo de investigación está estudiando la efectividad de un nuevo
      fármaco para tratar una enfermedad. Para ello, seleccionaron una muestra
      de 200 pacientes y los dividieron en dos grupos: uno que recibió el
      fármaco y otro que recibió un placebo. Los resultados del estudio se
      resumen en la siguiente tabla:

      #figure(
        table(
          columns: 3,
          align: center,
          table.header([*Tratamiento*], [*Mejoría*], [*Sin mejoría*]),
          [Fármaco], [70], [30],
          [Placebo], [40], [60],
        ),
      )

      Basándote en los datos de la tabla, ¿consideras que el fármaco es
      efectivo? Justifica tu respuesta utilizando los datos para apoyar tu
      razonamiento.
    ],
    sol: [
      Para determinar si el fármaco es efectivo, debemos comparar la proporción
      de pacientes que mejoraron en el grupo que recibió el fármaco con la
      proporción de pacientes que mejoraron en el grupo que recibió el placebo.

      Primero, calculamos el total de pacientes en cada grupo:
      - Grupo del Fármaco: $70 + 30 = 100$ pacientes.
      - Grupo del Placebo: $40 + 60 = 100$ pacientes.

      Ahora, calculamos el porcentaje de mejoría en cada grupo.

      Porcentaje de mejoría con el fármaco:
      $ (70 / 100) * 100% = 70% $

      Porcentaje de mejoría con el placebo:
      $ (40 / 100) * 100% = 40% $

      El 70% de los pacientes que recibieron el fármaco mostraron una mejoría,
      en comparación con solo el 40% de los que recibieron el placebo. Esto
      indica que la probabilidad de mejorar es considerablemente mayor si se
      toma el fármaco. Por lo tanto, basándonos en estos datos, podemos concluir
      que el fármaco es efectivo para tratar la enfermedad.
    ],
    saber: (
      sab.est,
      [El problema requiere el análisis y la interpretación de datos de una
        tabla para hacer inferencias y tomar decisiones basadas en información
        estadística, evaluando críticamente la efectividad de un tratamiento.
        Por ello, se corresponde con el #fmt(sab.est).

        Este problema es apropiado para 4º de ESO (*Matemáticas A y B*), ya que
        implica la interpretación y reformulación de datos de una tabla para
        construir un argumento, seleccionando una estrategia de análisis
        (comparación de proporciones) y valorando su eficacia para obtener una
        conclusión justificada sobre la efectividad del fármaco.],
    ),
    curso: "A y B",
  ),
)
