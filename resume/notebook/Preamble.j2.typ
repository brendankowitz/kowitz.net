// "Engineer's Notebook" theme, ported from the Claude Design Resume.dc.html.
#let teal = {{ design.colors.section_titles.as_rgb() }}
#let ink = {{ design.colors.name.as_rgb() }}
#let body-color = {{ design.colors.body.as_rgb() }}
#let muted = {{ design.colors.connections.as_rgb() }}
#let hairline = rgb("#C9D3D2")
#let chip-fill = rgb("#EAF3F2")
#let mono = "{{ design.typography.font_family.connections }}"

#set document(title: "{{ cv.name }} - CV", author: "{{ cv.name }}")
#set page(
  paper: "{{ design.page.size }}",
  margin: (
    top: {{ design.page.top_margin }},
    bottom: {{ design.page.bottom_margin }},
    left: {{ design.page.left_margin }},
    right: {{ design.page.right_margin }},
  ),
{% if design.page.show_footer %}
  footer: context {
    set text(font: mono, size: 8pt, fill: muted)
    h(1fr)
    [{{ cv.name }} · #counter(page).display("1 / 1", both: true)]
  },
{% endif %}
)
#set text(
  font: "{{ design.typography.font_family.body }}",
  size: {{ design.typography.font_size.body }},
  fill: body-color,
  lang: "{{ locale.language_iso_639_1 }}",
)
#set par(leading: {{ design.typography.line_spacing }}, spacing: 0.7em, justify: false)
#show link: set text(fill: {{ design.colors.links.as_rgb() }})
#let std-link = link
#let link(dest, icon: false, if-underline: false, if-color: false, body) = std-link(dest, body)
#show strong: set text(weight: 600, fill: ink)
#show emph: it => box(
  fill: chip-fill,
  inset: (x: 2pt),
  outset: (y: 1.5pt),
  text(font: mono, size: 0.93em, weight: 500, style: "normal", fill: teal, it.body),
)
#set list(
  marker: text(font: mono, weight: 500, fill: teal)[›],
  indent: 0pt,
  body-indent: 7pt,
  spacing: 0.5em,
)

#show heading.where(level: 1): it => text(
  font: "{{ design.typography.font_family.name }}",
  size: {{ design.typography.font_size.name }},
  weight: 700,
  tracking: -0.02em,
  fill: ink,
  it.body,
)
#show heading.where(level: 2): it => block(above: 1.3em, below: 0.75em, sticky: true)[
  #grid(
    columns: (auto, 1fr),
    column-gutter: 8pt,
    align: horizon,
    text(
      font: mono,
      size: {{ design.typography.font_size.section_titles }},
      weight: 500,
      tracking: 0.14em,
      fill: teal,
      upper(it.body),
    ),
    line(length: 100%, stroke: 0.75pt + hairline),
  )
]

#let regular-entry(main, date, main-column-second-row: none) = block(
  above: 1.1em,
  below: 0pt,
  width: 100%,
)[
  // Title and date share one paragraph so PDF text extraction (ATS parsers) reads the date with its role.
  #par[#main#h(1fr)#text(font: mono, size: 9pt, fill: rgb("#4A5251"), date)]
  #if main-column-second-row != none { main-column-second-row }
]
#let education-entry(main, date, degree-column: none, main-column-second-row: none) = regular-entry(
  main,
  date,
  main-column-second-row: main-column-second-row,
)
#let summary(body) = block(above: 0.45em, below: 0.5em, text(fill: muted, body))
