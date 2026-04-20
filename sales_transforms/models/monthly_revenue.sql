WITH source AS (
    SELECT *
    FROM SALES_PIPELINE.RAW.SUPERSTORE_RAW
),

monthly AS (
    SELECT
        DATE_TRUNC('month', TO_DATE(ORDER_DATE, 'MM/DD/YYYY')) AS order_month,
        ROUND(SUM(SALES), 2) AS total_revenue,
        COUNT(DISTINCT ORDER_ID) AS total_orders,
        ROUND(AVG(SALES), 2) AS avg_order_value
    FROM source
    GROUP BY 1
    ORDER BY 1
)

SELECT * FROM monthly