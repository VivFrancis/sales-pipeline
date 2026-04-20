WITH source AS (
    SELECT *
    FROM SALES_PIPELINE.RAW.SUPERSTORE_RAW
),

product_sales AS (
    SELECT
        PRODUCT_ID,
        PRODUCT_NAME,
        CATEGORY,
        SUB_CATEGORY,
        ROUND(SUM(SALES), 2) AS total_revenue,
        SUM(QUANTITY) AS total_units_sold,
        ROUND(SUM(PROFIT), 2) AS total_profit,
        ROUND(SUM(PROFIT) / SUM(SALES) * 100, 2) AS profit_margin_pct
    FROM source
    GROUP BY 1, 2, 3, 4
    ORDER BY total_revenue DESC
    LIMIT 10
)

SELECT * FROM product_sales