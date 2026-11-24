WITH user_last_touch AS (
  SELECT
    user_pseudo_id,
    event_timestamp,
    (SELECT value.string_value FROM UNNEST(event_params) WHERE key = 'medium') AS medium,
    (SELECT value.string_value FROM UNNEST(event_params) WHERE key = 'source') AS source,
    ROW_NUMBER() OVER(PARTITION BY user_pseudo_id ORDER BY event_timestamp DESC) as rn
  FROM
    `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
  WHERE
    _TABLE_SUFFIX BETWEEN '20210101' AND '20210131'
)
SELECT
  COALESCE(source, '(direct)') AS traffic_source,
  COALESCE(medium, '(none)') AS traffic_medium,
  COUNT(DISTINCT user_pseudo_id) AS converted_users
FROM
  user_last_touch
WHERE
  rn = 1
GROUP BY
  traffic_source,
  traffic_medium
ORDER BY
  converted_users DESC;