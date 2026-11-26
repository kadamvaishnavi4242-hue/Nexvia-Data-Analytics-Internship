# DA-01: Multi-Region Enterprise BI

## Project Overview
This project delivers an end-to-end Multi-Region Enterprise Business Intelligence solution built in **Power BI** to analyze regional sales performance, profitability, customer trends, and product metrics. Instead of using external Azure or separate SQL services, the entire solution—including data preparation, star schema modeling, DAX calculations, drill-through views, and Row-Level Security (RLS)—was implemented directly within **Power BI** so each region manager can view data relevant to their region.

## Architecture & Workflow
1. **Data Preparation in Power BI:** Loaded multi-table enterprise data (`Fact_Sales`, `Dim_Customer`, `Dim_Product`, and `Dim_Region`) and cleaned/shaped columns and data types directly in **Power Query** within Power BI (without Azure Data Factory or external SQL jobs).
2. **Star Schema Modeling:** Structured fact and dimension tables into a star schema model with relationships in Power BI.
3. **DAX Measures:** Created DAX measures for YTD, Year-over-Year (YoY) growth, margin %, and rolling averages.
4. **Executive & Drill-Through Pages:** Built executive KPI overview pages along with drill-through pages for detailed views.
5. **Row-Level Security (RLS):** Configured regional roles (such as `Central` and other regional roles) in Power BI to restrict data by region and verified using **View as**.
6. **Documentation & Deliverables:** Included architecture diagram (`DA-01_Architecture.png`), presentation (`DA-01_Multi_Region_Enterprise_BI_Presentation.pptx`), user guide (`One_Page_User_Guide.md`), test results (`Test_Results.md`), and demo outline (`Working_Demo_Outline.md`).

## Key Features
* **Power BI End-to-End Implementation:** All data shaping, modeling, DAX, drill-through, and RLS handled inside Power BI without Azure or external SQL dependencies.
* **Star Schema Model:** Clear separation between `Fact_Sales` and dimension tables (`Dim_Customer`, `Dim_Product`, `Dim_Region`).
* **DAX Measures:** Key metrics including YTD, YoY growth, margin %, and rolling averages.
* **Drill-Through Navigation:** Detailed breakdown pages linked from summary visuals.
* **Row-Level Security (RLS):** Region-based role filtering for regional views.

## How to Run This Project
1. Open the **`DA-01`** folder in this repository.
2. Open the Power BI report (`.pbix`) file in **Power BI Desktop**.
3. If prompted, update the data source path and refresh visuals in Power Query.
4. Use **Modeling → View as** to test regional roles.
5. Check `One_Page_User_Guide.md', `Test_Results.md`,'Individual_Reflection ' for usage and testing details.

## Project Demo Video
[Watch DA-01 Working Demo](https://drive.google.com/file/d/1PZ6mIB5cBMkuEmF9159GOStnb7NFrmxz/view?usp=sharing)
