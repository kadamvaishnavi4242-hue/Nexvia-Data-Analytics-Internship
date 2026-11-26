# Test Results — Multi-Region Enterprise BI Dashboard (DA-01)

## 1. Summary of Testing
The **Multi-Region Enterprise BI** report (`NEXVIA_PROJECT.pbix`) was verified in **Power BI Desktop** across visuals, DAX time-intelligence measures, drill-through navigation, and Row-Level Security (RLS) role views before packaging deliverables for submission.

## 2. Functional & Visual Checks
* **Executive Overview Page:** Verified layout alignment, KPI cards (**Total Sales**, **Total Profit**, **Total Quantity**, **Profit Margin %**), category/region/year charts, and **Region** slicer filtering (including **All** selection).
* **Drill - through Details Page:** Verified drill-through from a selected region (such as **Oceania**) to inspect regional detail visuals (**Sales YTD**, **YoY Growth %**, **Rolling 3M Sales**, and the **Category** breakdown table showing **Total Sales** and **Total Profit**).
* **DAX Measures:** Verified **Sales YTD**, **YoY Growth %**, and **Rolling 3M Sales** display expected values in the drilled context without formula errors.

## 3. Row-Level Security (RLS) & Environment Notes
* **RLS Role Testing (`Manage roles` & `View as`):** Tested regional role views in Power BI Desktop. Clearing an active drill-through filter on **Drill - through Details** before using **View as** allows role-based filtering to update cleanly; leaving a prior drill-through filter active while switching role context can cause blank (`..`) or conflicting filter behavior.
* **Publishing & Environment Note:** Direct publishing to Power BI Service is unavailable in the current account setup, so verification was completed in **Power BI Desktop** with the `.pbix` file, screenshots, and documentation prepared for the public GitHub repository.
* **Data Preparation Note:** Data transformation and shaping were executed in Power Query inside Power BI Desktop instead of relying on Azure or separate SQL services
