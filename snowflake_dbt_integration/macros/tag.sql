{% macro tag(column) %}
    case
        when cast({{ column }} as numeric) < 200 then 'low'
        when cast({{ column }} as numeric) < 500 then 'medium'
        else 'high'
    end
{% endmacro %}