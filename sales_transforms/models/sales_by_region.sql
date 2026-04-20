WITH source AS (
    SELECT *
    FROM SALES_PIPELINE.RAW.SUPERSTORE_RAW
),

region_sales AS (
    SELECT
        REGION,
        STATE,
        ROUND(SUM(SALES), 2) AS total_revenue,
        COUNT(DISTINCT ORDER_ID) AS total_orders,
        ROUND(SUM(PROFIT), 2) AS total_profit,
        ROUND(AVG(DISCOUNT), 2) AS avg_discount
    FROM source
    GROUP BY 1, 2
    ORDER BY 1, 3 DESC
)

SELECT * FROM region_sales