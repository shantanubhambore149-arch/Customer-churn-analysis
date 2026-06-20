# Customer Churn Analysis — Telco Dataset

## Business Problem
A telecom company is losing customers at an alarming rate. This project identifies **who is churning, why, and how much revenue is at risk** — giving the business actionable insight to reduce churn and retain high-value customers.

---

## Dataset
- **Source:** IBM Telco Customer Churn Dataset ([Kaggle](https://www.kaggle.com/datasets/blastchar/telco-customer-churn))
- **Size:** 7,032 customers × 21 features (after cleaning)
- **Key columns:** Contract type, Internet service, Tenure, Monthly charges, Churn (Yes/No)

---

## Project Structure
```
customer-churn-analysis/
├── data/
│   ├── raw/                        ← Original CSV
│   └── cleaned/telco_cleaned.csv   ← Cleaned output
├── notebooks/
│   └── EDA.ipynb                   ← Exploratory data analysis
├── python/
│   └── Clean_data.py               ← Data cleaning script
├── sql/
│   ├── 01_load_data.sql            ← Schema + load instructions
│   ├── 02_kpi_queries.sql          ← KPI calculations
│   └── 03_advanced_analysis.sql    ← CTEs + Window functions
└── README.md
```

---

## Key Findings
- **26.6% overall churn rate** — more than 1 in 4 customers are leaving
- **Month-to-month contracts churn at 42.7%** vs just 2.8% for two-year contracts — contract type is the strongest predictor of churn
- **Highest-risk segment: Month-to-month + Fiber optic at 54.6% churn** — over half of customers in this segment are leaving
- **Churned customers pay $13 more per month** ($74.4 vs $61.3) and leave after just 18 months on average vs 37 months for retained customers
- **New customers (Q1 tenure) churn at ~50%** — the first year is the most critical retention window

---

## KPIs
| Metric | Value |
|---|---|
| Overall Churn Rate | 26.6% |
| Monthly Revenue at Risk | $139,130.85 |
| Avg Tenure at Churn | 17.98 months |
| Highest Churn Segment | Month-to-month (42.7%) |

---

## SQL Techniques Used
- `CASE WHEN` inside `SUM()` for conditional aggregation
- **CTEs** (`WITH` clause) for multi-step segment analysis
- **Window functions:** `RANK() OVER (PARTITION BY ...)` to rank highest-paying churned customers per contract type
- **Window functions:** `NTILE(4) OVER (ORDER BY tenure)` to bucket customers into tenure quartiles
- `GROUP BY`, `HAVING`, `ORDER BY`, subqueries

---

## Dashboard
Built in Tableau Public — includes 4 KPI cards and 3 focused charts:
- Churn Rate by Contract Type (Bar)
- Churn Rate by Tenure Quartile (Bar)
- Churn Rate Heatmap — Contract × Internet Service

[View Live Dashboard](https://public.tableau.com/app/profile/shantanu.bhambore/viz/Book1_17816104649260/Dashboard1)

---

## Tools Used
| Tool | Purpose |
|---|---|
| Python (Pandas) | Data cleaning |
| Jupyter Notebook | Exploratory analysis |
| SQL (SQLite) | KPI queries + advanced analysis |
| Tableau Public | Dashboard |
| DB Browser for SQLite | SQL execution |
| VS Code | Development environment |

---

## How to Run
1. Clone the repo
2. Run `python/Clean_data.py` to generate the cleaned CSV
3. Open `notebooks/EDA.ipynb` in Jupyter
4. Open `data/churn.db` in DB Browser for SQLite and run SQL files in order
5. View the live dashboard on Tableau Public (link above)