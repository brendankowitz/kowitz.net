#grid(
  columns: (1fr, auto),
  column-gutter: 18pt,
  align: (left + bottom, right + bottom),
  [
    = {{ cv.name }}
{% if cv.headline %}
    #v(-2pt)
    #text(font: mono, size: 10pt, fill: teal)[{{ cv.headline }}]
{% endif %}
  ],
  text(font: mono, size: 8.6pt, fill: muted)[
{% for connection in cv.connections %}
    {{ connection }} \
{% endfor %}
  ],
)
{% if design.stats %}
#v(10pt)
#block(
  width: 100%,
  stroke: (top: 1.5pt + ink, bottom: 0.75pt + hairline),
  breakable: false,
)[
  #grid(
    columns: ({% for s in design.stats %}1fr, {% endfor %}),
    stroke: (x, y) => if x > 0 { (left: 0.75pt + hairline) },
    inset: (x, y) => (left: if x == 0 { 0pt } else { 9pt }, right: 9pt, y: 7.5pt),
{% for s in design.stats %}
    [
      #text(font: mono, size: 15pt, weight: 500, fill: ink)[{{ s.value }}] \
      #v(-3pt)
      #text(size: 8.6pt, fill: muted)[{{ s.label }}]
    ],
{% endfor %}
  )
]
{% endif %}
