-- File: macros/unique.sql
{% macro unique(column_name, table_name) %}
    select 
        count(*) as duplicates
    from (
        select 
            {{ column_name }},
            count(*) as count
        from 
            {{ table_name }}
        group by 
            {{ column_name }}
        having 
            count > 1
    ) subquery
    where 
        count > 1
{% endmacro %}
