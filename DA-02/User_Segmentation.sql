SELECT
  user_pseudo_id,
  COUNT(DISTINCT (SELECT value.int_value FROM UNNEST(event_params) WHERE key = 'ga_session_number')) AS total_sessions,
  COUNT(event_name) AS total_events
FROM
  `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
WHERE
  _TABLE_SUFFIX BETWEEN '20210101' and '20210131'
GROUP BY
  user_pseudo_id
LIMIT 20;