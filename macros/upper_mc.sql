{% macro cents_to_dollars(column_name) %}
    upper({{ column_name }})
{% endmacro %}