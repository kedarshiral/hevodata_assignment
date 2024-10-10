WITH first_name_null AS (
    SELECT *
    FROM {{ ref('customers') }}
    WHERE FIRST_NAME IS NULL
),
last_name_null AS (
    SELECT *
    FROM {{ ref('customers') }}
    WHERE LAST_NAME IS NULL
)
SELECT * FROM first_name_null
UNION ALL
SELECT * FROM last_name_null
