WITH rfm_base AS (
  SELECT
    customer_id,
    -- Recency: Days since signup date (as a proxy for last interaction)
    DATE_DIFF(CURRENT_DATE(), MAX(signup_date), DAY) AS recency,
    -- Frequency: Counting records per customer
    COUNT(customer_id) AS frequency,
    -- Monetary: Using age or a dummy monetary metric since it's CRM data
    SUM(age) * 10 AS monetary
  FROM
    `nexvia-project-1.analytics_data.synthetic_crm_data`
  GROUP BY
    customer_id
),
rfm_scores AS (
  SELECT
    customer_id,
    recency,
    frequency,
    monetary,
    -- Assign RFM scores from 1 to 4 using NTILE
    NTILE(4) OVER (ORDER BY recency DESC) AS r_score,
    NTILE(4) OVER (ORDER BY frequency ASC) AS f_score,
    NTILE(4) OVER (ORDER BY monetary ASC) AS m_score
  FROM
    rfm_base
)
SELECT
  customer_id,
  recency,
  frequency,
  monetary,
  r_score,
  f_score,
  m_score,
  (r_score + f_score + m_score) AS total_rfm_score,
  -- Customer Segmentation based on total RFM score
  CASE
    WHEN (r_score + f_score + m_score) >= 10 THEN 'Champions'
    WHEN (r_score + f_score + m_score) BETWEEN 7 AND 9 THEN 'Loyal Customers'
    WHEN (r_score + f_score + m_score) BETWEEN 5 AND 6 THEN 'Potential Loyalists'
    ELSE 'At Risk / Needs Attention'
  END AS customer_segment
FROM
  rfm_scores
ORDER BY
  total_rfm_score DESC;