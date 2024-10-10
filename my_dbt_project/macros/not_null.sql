-- File: macros/not_null.sql
{% macro not_null(column_name, table_name) %}
    select 
        count(*) as failures
    from 
        {{ table_name }}
    where 
        {{ column_name }} is null
{% endmacro %}
