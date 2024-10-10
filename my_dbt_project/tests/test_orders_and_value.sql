WITH number_of_orders_null AS (
    SELECT *
    FROM {{ ref('customers') }}
    WHERE NUMBER_OF_ORDERS IS NULL OR NUMBER_OF_ORDERS < 0
),
customer_lifetime_value_null AS (
    SELECT *
    FROM {{ ref('customers') }}
    WHERE CUSTOMER_LIFETIME_VALUE IS NULL OR CUSTOMER_LIFETIME_VALUE < 0
)
SELECT * FROM number_of_orders_null
UNION ALL
SELECT * FROM customer_lifetime_value_null
