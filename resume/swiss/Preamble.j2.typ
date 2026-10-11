// "Swiss grid" theme, ported from the Claude Design "Resume Swiss.dc.html".
#let accent = {{ design.colors.section_titles.as_rgb() }}
#let ink = {{ design.colors.name.as_rgb() }}
#let body-color = {{ design.colors.body.as_rgb() }}
#let muted = {{ design.colors.connections.as_rgb() }}
#let rule-color = rgb("#D4D4D4")
#let chip-fill = rgb("#FDE7D9")
#let label-width = 99pt
#let gutter = 18pt
#let section-gap = 12pt

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
    set text(size: 8pt, fill: muted)
    h(1fr)
    [{{ cv.name }} · #counter(page).display("1 / 1", both: true)]
  },
{% endif %}
)
#set text(
  font: "{{ design.typography.font_family.body }}",
  size: {{ design.typography.font_size.body }},
  fill: body-color,
  number-type: "lining",
  number-width: "tabular",
  lang: "{{ locale.language_iso_639_1 }}",
)
#set par(leading: {{ design.typography.line_spacing }}, spacing: 0.6em, justify: false)
#show link: set text(fill: {{ design.colors.links.as_rgb() }})
#let std-link = link
#let link(dest, icon: false, if-underline: false, if-color: false, body) = std-link(dest, body)
#show strong: set text(weight: 600, fill: ink)
#show emph: it => box(
  fill: chip-fill,
  inset: (x: 2.25pt),
  outset: (y: 1.5pt),
  text(weight: 800, style: "normal", fill: ink, it.body),
)
#set list(
  marker: box(height: 0.65em, align(horizon, circle(radius: 1.7pt, fill: accent))),
  indent: 0pt,
  body-indent: 6pt,
  spacing: 0.45em,
)

#show heading.where(level: 1): it => text(
  font: "{{ design.typography.font_family.name }}",
  size: {{ design.typography.font_size.name }},
  weight: 800,
  tracking: -0.035em,
  fill: ink,
  it.body,
)

#let section-label(body) = text(
  font: "{{ design.typography.font_family.section_titles }}",
  size: {{ design.typography.font_size.section_titles }},
  weight: 800,
  tracking: 0.08em,
  fill: accent,
  upper(body),
)

// Full-width heading with a rule, used above dated entries (experience, education).
#let section-rule(title) = block(above: section-gap, below: 10.5pt, sticky: true, width: 100%)[
  #block(
    width: 100%,
    inset: (bottom: 4.5pt),
    stroke: (bottom: 0.75pt + rule-color),
    section-label(title),
  )
]

// Label in the left column, content in the right, used for text sections.
#let section-side(title, body) = block(above: section-gap, below: 0pt, width: 100%)[
  #grid(
    columns: (label-width, 1fr),
    column-gutter: gutter,
    pad(top: 1.5pt, section-label(title)),
    body,
  )
]

// The date cell comes first so PDF text extraction (ATS parsers) reads the dates right before the role.
#let regular-entry(main, date, main-column-second-row: none) = block(
  above: 9pt,
  below: 0pt,
  width: 100%,
  breakable: false,
)[
  #grid(
    columns: (label-width, 1fr),
    column-gutter: gutter,
    pad(top: 1pt, text(size: 9.4pt, weight: 500, fill: muted, date)),
    [
      #block(below: 5pt, text(size: 10.9pt, weight: 500, fill: muted)[
        #show strong: set text(weight: 800, fill: ink)
        #main
      ])
      #if main-column-second-row != none { main-column-second-row }
    ],
  )
]
#let education-entry(main, date, degree-column: none, main-column-second-row: none) = regular-entry(
  main,
  date,
  main-column-second-row: main-column-second-row,
)
#let summary(body) = block(above: 0pt, below: 5pt, text(fill: rgb("#333333"), body))
