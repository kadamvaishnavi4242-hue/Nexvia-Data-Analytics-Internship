WITH channel_metrics AS (
  SELECT
    channel,
    SUM(ad_spend) AS total_ad_spend,
    SUM(impressions) AS total_impressions,
    SUM(clicks) AS total_clicks,
    -- Assuming a 5% conversion rate from clicks to acquisitions for simulation
    ROUND(SUM(clicks) * 0.05) AS estimated_conversions,
    -- Assuming an average order value (AOV) of $50 per conversion
    ROUND(SUM(clicks) * 0.05) * 50 AS estimated_revenue
  FROM
    `nexvia-project-1.analytics_data.synthetic_ad_spend`
  GROUP BY
    channel
)
SELECT
  channel,
  ROUND(total_ad_spend, 2) AS total_ad_spend,
  total_impressions,
  total_clicks,
  estimated_conversions,
  estimated_revenue,
  -- Cost Per Acquisition (CPA): Total Spend / Estimated Conversions
  ROUND(SAFE_DIVIDE(total_ad_spend, estimated_conversions), 2) AS cost_per_acquisition,
  -- Return on Investment (ROI %): ((Revenue - Spend) / Spend) * 100
  ROUND(SAFE_DIVIDE((estimated_revenue - total_ad_spend), total_ad_spend) * 100, 2) AS roi_percentage
FROM
  channel_metrics
ORDER BY
  roi_percentage DESC;