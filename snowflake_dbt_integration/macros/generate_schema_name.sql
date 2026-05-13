{% macro generate_schema_name(custom_schema_name, node) -%}
    {%- set default_schema = target.schema -%}
    {%- if custom_schema_name is none -%}
        {{ default_schema }}
    {%- elif target.name == 'prod' -%}
        {# Use only custom schema in prod #}
        {{ custom_schema_name | trim }}
    {%- else -%}
        {# Use default_custom in other environments #}
        {{ custom_schema_name | trim }}
    {%- endif -%}
{%- endmacro %}
