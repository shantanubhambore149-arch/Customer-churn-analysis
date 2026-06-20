-- ============================================
-- Customer Churn Analysis
-- File 01: Load Data
-- ============================================
 
-- NOTE: Table was created by importing telco_cleaned.csv
-- directly into DB Browser for SQLite via:
-- File → Import → Table from CSV
-- Table name: telco_cleaned
 
-- Verify load:
SELECT COUNT(*) AS total_rows FROM telco_cleaned;
-- Expected: 7032
 
-- Preview first 5 rows:
SELECT * FROM telco_cleaned LIMIT 5;
 
-- Column overview:
-- customerID       TEXT    Unique customer identifier
-- gender           TEXT    Male / Female
-- SeniorCitizen    TEXT    Yes / No
-- Partner          TEXT    Yes / No
-- Dependents       TEXT    Yes / No
-- tenure           INT     Months with company
-- PhoneService     TEXT    Yes / No
-- MultipleLines    TEXT    Yes / No / No phone service
-- InternetService  TEXT    DSL / Fiber optic / No
-- OnlineSecurity   TEXT    Yes / No / No internet service
-- OnlineBackup     TEXT    Yes / No / No internet service
-- DeviceProtection TEXT    Yes / No / No internet service
-- TechSupport      TEXT    Yes / No / No internet service
-- StreamingTV      TEXT    Yes / No / No internet service
-- StreamingMovies  TEXT    Yes / No / No internet service
-- Contract         TEXT    Month-to-month / One year / Two year
-- PaperlessBilling TEXT    Yes / No
-- PaymentMethod    TEXT    4 payment types
-- MonthlyCharges   REAL    Monthly bill amount
-- TotalCharges     REAL    Total billed (nulls removed during cleaning)
-- Churn            TEXT    Yes / No (target variable)
 