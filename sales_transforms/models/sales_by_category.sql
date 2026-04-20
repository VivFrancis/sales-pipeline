WITH source AS (
    SELECT *
    FROM SALES_PIPELINE.RAW.SUPERSTORE_RAW
),

category_sales AS (
    SELECT
        CATEGORY,
        SUB_CATEGORY,
        ROUND(SUM(SALES), 2) AS total_revenue,
        COUNT(DISTINCT ORDER_ID) AS total_orders,
        ROUND(SUM(PROFIT), 2) AS total_profit,
        ROUND(SUM(PROFIT) / SUM(SALES) * 100, 2) AS profit_margin_pct
    FROM source
    GROUP BY 1, 2
    ORDER BY 1, 3 DESC
)

SELECT * FROM category_sales