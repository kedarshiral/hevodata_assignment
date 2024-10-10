WITH orders_payments AS (
    SELECT 
        o.user_id,
        o.order_date,
        p.amount
    FROM 
        public.hevo_raw_orders o
    INNER JOIN 
        public.hevo_raw_payments p 
        ON o.id = p.order_id
)
SELECT 
    c.id AS customer_id,
    c.first_name, 
    c.last_name, 
    MIN(op.order_date) AS first_order,
    MAX(op.order_date) AS most_recent_order,
    COUNT(op.order_date) AS number_of_orders,
    SUM(COALESCE(op.amount, 0)) AS customer_lifetime_value
FROM 
    public.hevo_raw_customers c
inner JOIN 
    orders_payments op 
    ON c.id = op.user_id
GROUP BY 
    c.id, c.first_name, c.last_name
ORDER BY 
    c.id
