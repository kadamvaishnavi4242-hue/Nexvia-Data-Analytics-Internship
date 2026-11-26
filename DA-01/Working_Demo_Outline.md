# Working Demo Outline — Multi-Region Enterprise BI Dashboard (DA-01)

## 1. Demo Objective
This walkthrough demonstrates how **NEXVIA_PROJECT.pbix** (**Multi-Region Enterprise BI**) works in **Power BI Desktop**, covering the data model (**Fact_Sales** and dimensions), **Executive Overview** page, **Drill - through Details** page, DAX time-intelligence calculations, drill-through behavior, and Row-Level Security (RLS) role testing.

## 2. Step-by-Step Demo Flow

### Step 1: Data Model & DAX Measures Overview
* Open **Model View** in Power BI Desktop to show **Fact_Sales** connected to dimension tables including **Dim_Region**, **Dim_Product**, and **Dim_Customer** (`1` to `*` relationships).
* Mention the key measures used across the report: **Total Sales**, **Total Profit**, **Total Quantity**, **Profit Margin %**, **Sales YTD**, **YoY Growth %**, and **Rolling 3M Sales**.

### Step 2: `Executive Overview` Page Walkthrough
* Open **Executive Overview** (**Multi Region Enterprise BI - Executive Overview**).
* Walk through the top KPI cards:
  * **Total Sales** (`13M`)
  * **Total Profit** (`1.47M`)
  * **Total Quantity** (`178K`)
  * **Profit Margin %** (`11.61%`)
* Show the **Region** slicer (including **All**) and the three charts below:
  * **Total Sales by Category**
  * **Total Profit by Region**
  * **Total Sales by Year**

### Step 3: Drill-Through to `Drill - through Details` & Time-Intelligence Metrics
* Drill through from a selected region (for example, **Oceania**) to open **Drill - through Details** (**Multi-Region Enterprise BI - Regional Drill-Through Analysis**).
* Show that the drill-through filter context (such as **Region is Oceania**) is applied and retained on the detail page.
* Walk through the three cards on the drill-through page:
  * **Sales YTD** (e.g., `337K` for Oceania / `4M` in default view)
  * **YoY Growth %** (e.g., `247.15%` for Oceania / `271.21%` in default view)
  * **Rolling 3M Sales** (e.g., `116K` for Oceania / `1M` in default view)
* Show the **Category** breakdown table with **Category**, **Total Sales**, and **Total Profit** (**Technology**, **Furniture**, **Office Supplies**, and **Total**).

### Step 4: Row-Level Security (RLS) — `Manage roles` & `View as`
* Go to **Modeling** → **Manage roles** to show the configured regional RLS roles.
* Use **Modeling** → **View as** to test a regional role (such as **West** or **Oceania**), noting that clearing any active drill-through filter on **Drill - through Details** before switching roles keeps filtering clean while leaving an active drill-through filter can cause blank (`..`) or conflicting results.
* Click **Stop viewing** to return to the normal full-data view.

## 3. Environment & Submission Note
* Direct publishing to Power BI Service is unavailable in the current account setup, so the demo is conducted directly in **Power BI Desktop** (`NEXVIA_PROJECT.pbix`), with the `.pbix` file, screenshots, and documentation packaged in the public GitHub repository.
* **Data Preparation Note:** Data loading, cleaning, and shaping were performed directly in Power Query within Power BI Desktop rather than using Azure Data Factory or scheduled external SQL jobs.
