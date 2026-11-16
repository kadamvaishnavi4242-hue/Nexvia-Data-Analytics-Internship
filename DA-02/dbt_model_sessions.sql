
SELECT
  date AS session_date,
  LOWER(channel) AS channel,
  ad_spend,
  impressions,
  clicks
FROM
  `analytics_data.synthetic_ad_spend`
WHERE
  date IS NOT NULL
  AND channel IS NOT NULL;