{% set social = [] %}
{% set contact = [] %}
{% for connection in cv.connections %}
{% if "linkedin.com" in connection or "github.com" in connection or "bsky.app" in connection %}
{% set _ = social.append(connection|replace("[linkedin.com\/", "[")|replace("[github.com\/", "[gh\/")|replace("[bsky.app\/profile\/", "[")) %}
{% else %}
{% set _ = contact.append(connection) %}
{% endif %}
{% endfor %}
#block(width: 100%, height: 6pt, fill: accent, below: 15pt)
#block(
  width: 100%,
  inset: (bottom: 13.5pt),
  stroke: (bottom: 1.5pt + ink),
  below: 0pt,
)[
  #grid(
    columns: (label-width, 1fr),
    column-gutter: gutter,
    pad(top: 4.5pt, text(size: {{ design.typography.font_size.connections }}, fill: rgb("#333333"))[
{% for connection in contact %}
      {{ connection }} \
{% endfor %}
    ]),
    [
      #block(below: 4.5pt)[= {{ cv.name }}]
      #grid(
        columns: (1fr, auto),
        column-gutter: 12pt,
        align: (left + bottom, right + bottom),
{% if cv.headline %}
        text(size: {{ design.typography.font_size.headline }}, weight: 500, fill: accent)[{{ cv.headline }}],
{% else %}
        [],
{% endif %}
        text(size: {{ design.typography.font_size.connections }}, fill: ink)[{{ social|join("#h(10.5pt)") }}],
      )
    ],
  )
]
{% if design.stats %}
#block(above: section-gap, below: 0pt, breakable: false, width: 100%)[
  #grid(
    columns: (label-width, {% for s in design.stats %}1fr, {% endfor %}),
    column-gutter: gutter,
    pad(top: 4.5pt, section-label[At a glance]),
{% for s in design.stats %}
    pad(top: 4.5pt)[
      #text(size: 22.5pt, weight: 800, tracking: -0.03em, fill: ink)[{{ s.value }}] \
      #v(-2pt)
      #text(size: {{ design.typography.font_size.connections }}, fill: muted)[{{ s.label }}]
    ],
{% endfor %}
  )
]
{% endif %}
