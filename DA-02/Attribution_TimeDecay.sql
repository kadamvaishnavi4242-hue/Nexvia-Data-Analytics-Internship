WITH ranked_touches AS (
  SELECT
    user_pseudo_id,
    COALESCE((SELECT value.string_value FROM UNNEST(event_params) WHERE key = 'source'), '(direct)') AS traffic_source,
    COALESCE((SELECT value.string_value FROM UNNEST(event_params) WHERE key = 'medium'), '(none)') AS traffic_medium,
    event_timestamp,
    ROW_NUMBER() OVER(PARTITION BY user_pseudo_id ORDER BY event_timestamp ASC) AS touch_index,
    COUNT(*) OVER(PARTITION BY user_pseudo_id) AS total_touches
  FROM
    `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
  WHERE
    _TABLE_SUFFIX BETWEEN '20210101' AND '20210131'
)
SELECT
  traffic_source,
  traffic_medium,
  ROUND(SUM(POWER(2, touch_index - total_touches)), 2) AS time_decay_attributed_users
FROM
  ranked_touches
GROUP BY
  traffic_source,
  traffic_medium
ORDER BY
  time_decay_attributed_users DESC;