{% macro map_columns(column_mapping_list) %}
    {% for index in range(column_mapping_list|length) %}
       {{ column_mapping_list[index]['source'] }} as {{ column_mapping_list[index]['target'] }}
       {% if index < column_mapping_list|length - 1 %}
            ,
       {% endif %}
    {% endfor %}
{% endmacro %}