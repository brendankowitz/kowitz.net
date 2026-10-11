{% if entry_type in ["ExperienceEntry", "EducationEntry", "NormalEntry", "PublicationEntry"] %}
#section-rule[{{ section_title }}]
{% else %}
#section-side([{{ section_title }}], [
{% endif %}
