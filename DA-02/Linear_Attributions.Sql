WITH user_touches AS (
  SELECT
    user_pseudo_id,
    COALESCE((SELECT value.string_value FROM UNNEST(event_params) WHERE key = 'source'), '(direct)') AS traffic_source,
    COALESCE((SELECT value.string_value FROM UNNEST(event_params) WHERE key = 'medium'), '(none)') AS traffic_medium,
    COUNT(*) OVER(PARTITION BY user_pseudo_id) AS total_touches
  FROM
    `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
  WHERE
    _TABLE_SUFFIX BETWEEN '20210101' AND '20210131'
)
SELECT
  traffic_source,
  traffic_medium,
  ROUND(SUM(1.0 / total_touches), 2) AS linear_attributed_users
FROM
  user_touches
GROUP BY
  traffic_source,
  traffic_medium
ORDER BY
  linear_attributed_users DESC;