{% macro upper_mc(column_name) %}
    upper({{ column_name }})
{% endmacro %}