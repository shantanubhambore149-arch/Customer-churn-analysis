-- ============================================
-- Customer Churn Analysis
-- File 02: KPI Queries
-- ============================================

-- KPI 1: Overall Churn Rate (%)
SELECT 
    (SELECT COUNT(*) FROM telco_cleaned WHERE Churn = 'Yes') * 100.0 / COUNT(*) AS churn_rate_pct
FROM telco_cleaned;

-- KPI 2: Monthly Revenue at Risk ($)
SELECT 
    ROUND(SUM(MonthlyCharges), 2) AS monthly_revenue_at_risk
FROM telco_cleaned
WHERE Churn = 'Yes';

-- KPI 3: Average Tenure at Churn (months)
SELECT 
    ROUND(AVG(tenure), 2) AS avg_tenure_at_churn
FROM telco_cleaned
WHERE Churn = 'Yes';

-- KPI 4: Highest Churn Rate by Contract Type
SELECT 
    Contract,
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate_pct
FROM telco_cleaned
GROUP BY Contract
ORDER BY churn_rate_pct DESC
LIMIT 1;