-- ============================================
-- Customer Churn Analysis
-- File 03: Advanced Analysis
-- CTEs + Window Functions
-- ============================================


-- QUERY 1: Churn Rate by Segment (Contract x Internet Service)
-- CTE builds the summary first, outer query calculates churn rate
WITH segment_summary AS (
    SELECT 
        Contract,
        InternetService,
        COUNT(*) AS total_customers,
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned
    FROM telco_cleaned
    GROUP BY Contract, InternetService
)
SELECT 
    Contract,
    InternetService,
    total_customers,
    churned,
    ROUND(churned * 100.0 / total_customers, 2) AS churn_rate_pct
FROM segment_summary
ORDER BY churn_rate_pct DESC;


-- QUERY 2: Rank Highest-Paying Churned Customers per Contract Type
-- RANK() resets ranking within each Contract partition
SELECT 
    customerID,
    Contract,
    MonthlyCharges,
    RANK() OVER (PARTITION BY Contract ORDER BY MonthlyCharges DESC) AS rank_in_contract
FROM telco_cleaned
WHERE Churn = 'Yes';


-- QUERY 3: Bucket All Customers into Tenure Quartiles
-- NTILE(4) divides customers into 4 equal groups by tenure
-- Quartile 1 = newest customers, Quartile 4 = longest-tenured
SELECT 
    customerID,
    tenure,
    Churn,
    MonthlyCharges,
    NTILE(4) OVER (ORDER BY tenure) AS tenure_quartile
FROM telco_cleaned;