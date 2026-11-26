# One-Page User Guide — Multi-Region Enterprise BI Dashboard (DA-01)

## 1. Report Overview & Target Users
The **Multi-Region Enterprise BI** dashboard provides a clear view of business performance across regions, categories, and time periods. It helps leadership, regional and sales managers, and data analysts monitor key metrics and identify growth or profit trends quickly.

## 2. Pages & Key Features

### A. Executive Overview
* **KPI Cards:** Displays high-level metrics including **Total Sales**, **Total Profit**, **Total Quantity**, and **Profit Margin %**.
* **Region Slicer:** Located on the top right; allows filtering the dashboard by a specific region or viewing all regions together using **All**.
* **Visual Charts:** Includes breakdowns such as **Total Sales by Category**, **Total Profit by Region**, and **Total Sales by Year** for quick comparison.

### B. Drill - through Details
* **Regional Deep Dive:** Accessible via drill-through from a region on the **Executive Overview** page to inspect detailed performance for that selection.
* **Time & Trend KPIs:** Highlights **Sales YTD**, **YoY Growth %**, and **Rolling 3M Sales** alongside a category breakdown table (**Category**, **Total Sales**, and **Total Profit**).

## 3. How to Use Filters & Navigation
* **Filter by Region:** Select a region from the **Region** slicer on **Executive Overview** to update the overview visuals.
* **Reset to Full View:** Select **All** in the **Region** slicer to view overall performance across all regions.
* **Navigate Between Pages:** Use the bottom page tabs (**Executive Overview** and **Drill - through Details**) to switch views smoothly.

## 4. Access & Row-Level Security (RLS) Notes
* Regional RLS roles restrict data access to the assigned region for role-based viewers, while full access displays all regions.
* The report is developed and verified in **Power BI Desktop** (`NEXVIA_PROJECT.pbix`) and packaged in the project repository along with supporting screenshots and documentation.
