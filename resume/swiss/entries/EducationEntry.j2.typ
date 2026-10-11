{% set lines = entry.main_column.splitlines() %}
#education-entry(
  [{{ lines[0] }}],
  [{{ entry.date_and_location_column.splitlines()|join(" \ ") }}],
{% if lines|length > 1 %}
  main-column-second-row: [
{% for line in lines[1:] %}
    {{ line|indent(4) }}

{% endfor %}
  ],
{% endif %}
)
