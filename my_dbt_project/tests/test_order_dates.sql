WITH first_order_null AS (
    SELECT *
    FROM {{ ref('customers') }}
    WHERE FIRST_ORDER IS NULL
),
most_recent_order_null AS (
    SELECT *
    FROM {{ ref('customers') }}
    WHERE MOST_RECENT_ORDER IS NULL
),
invalid_dates AS (
    SELECT *
    FROM {{ ref('customers') }}
    WHERE FIRST_ORDER >= CURRENT_DATE OR MOST_RECENT_ORDER >= CURRENT_DATE
),
invalid_date_order AS (
    SELECT *
    FROM {{ ref('customers') }}
    WHERE MOST_RECENT_ORDER < FIRST_ORDER
)
SELECT * FROM first_order_null
UNION ALL
SELECT * FROM most_recent_order_null
UNION ALL
SELECT * FROM invalid_dates
UNION ALL
SELECT * FROM invalid_date_order
