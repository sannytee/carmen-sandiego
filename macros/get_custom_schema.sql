{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- set default_schema = target.schema -%}

    {% set prod = production_environments() -%}

    {%- if target.name in prod -%}
        {{ custom_schema_name | trim }}
    {%- elif custom_schema_name is not none  -%}
        {{ default_schema }}_{{ custom_schema_name | trim }}
    {%- else -%}
         {{ default_schema | trim }}
    {%- endif -%}

{%- endmacro %}