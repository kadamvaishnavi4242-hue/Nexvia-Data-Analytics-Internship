# Nexvia-Data-Analytics-Internship
# Customer 360 and Marketing Attribution Platform

## 📌 Project Overview
This project builds an end-to-end Customer 360 and Multi-Touch Marketing Attribution solution for an e-commerce platform. By integrating Google Analytics 4 (GA4) e-commerce event data with synthetic CRM and ad-spend datasets, this platform resolves customer identities, models customer lifetime value (LTV), segments customers using RFM analysis, and evaluates marketing channel performance across multiple attribution models.

## 🛠️ Tech Stack & Tools
* **Data Warehouse:** Google BigQuery
* **Data Transformation & Modeling:** dbt (Data Build Tool), SQL
* **Data Generation & Scripting:** Python (Faker, Pandas)
* **Data Visualization:** Tableau

## 🏗️ Data Architecture & Workflow
1. **Data Ingestion:** Loaded GA4 sample e-commerce data alongside synthetic CRM (`synthetic_crm_data`) and ad-spend (`synthetic_ad_spend`) tables into BigQuery (`analytics_data` dataset).
2. **Identity Resolution & dbt Modeling:** Created modular dbt models (`dbt_model_sessions`, `dbt_model_orders`, and `dbt_model_custom_profile`) to unify user sessions and customer profiles.
3. **RFM & LTV Segmentation:** Segmented customers into actionable groups (*Champions, Loyal Customers, Potential Loyalists, At Risk / Needs Attention*) based on Recency, Frequency, and Monetary metrics.
4. **Multi-Touch Attribution:** Built SQL queries comparing **First-Touch** and **Time-Decay** attribution models to evaluate true channel conversion impact.
5. **ROI & CPA Analysis:** Computed channel-wise Return on Investment (ROI) and Cost Per Acquisition (CPA) across Facebook, Google, Instagram, and YouTube.
6. **Interactive BI Dashboard:** Visualized customer segments, campaign ROI, and CPA metrics in Tableau to guide marketing budget reallocation.

## 📊 Key Findings & Insights
* **Top Performing Channel (ROI):** **Instagram** achieved the highest ROI at **253.20%**, followed by **Google (217.80%)** and **Facebook (206.46%)**.
* **Most Cost-Effective Acquisition (CPA):** **Instagram** maintained the lowest CPA at **$14.16**, making it the most efficient channel for customer acquisition.
* **Customer Base Distribution:** *Loyal Customers* form the largest segment, followed by *Potential Loyalists* and *Champions*, indicating strong retention opportunities.

## 🚀 How to Run This Project
1. Clone this repository to your local machine.
2. Set up a BigQuery dataset named `analytics_data` and upload the synthetic CRM and ad-spend CSV files.
3. Execute the SQL transformation scripts in the `/sql_queries` folder in sequence (Models $\rightarrow$ RFM $\rightarrow$ Attribution $\rightarrow$ ROI/CPA).
4. Open the `.twb` / `.twbx` file in Tableau Desktop and connect it to your BigQuery output tables to view the live dashboard.
5.
