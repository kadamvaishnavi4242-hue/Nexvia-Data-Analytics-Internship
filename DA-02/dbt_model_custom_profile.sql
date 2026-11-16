SELECT
  user_pseudo_id,
  MIN(TIMESTAMP_MICROS(event_timestamp)) AS first_seen_time,
  MAX(TIMESTAMP_MICROS(event_timestamp)) AS last_seen_time,
  COUNT(DISTINCT (SELECT value.int_value FROM UNNEST(event_params) WHERE key = 'ga_session_id')) AS total_sessions,
  COUNTIF(event_name = 'purchase') AS total_purchases,
  SUM(ecommerce.purchase_revenue) AS total_lifetime_revenue
FROM
  `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
WHERE
  _TABLE_SUFFIX BETWEEN '20210101' AND '20210131'
GROUP BY
  user_pseudo_id;