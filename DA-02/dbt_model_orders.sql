SELECT
  ecommerce.transaction_id AS order_id,
  user_pseudo_id,
  (SELECT value.int_value FROM UNNEST(event_params) WHERE key = 'ga_session_id') AS session_id,
  TIMESTAMP_MICROS(event_timestamp) AS order_timestamp,
  ecommerce.purchase_revenue AS order_revenue,
  ecommerce.total_item_quantity AS total_items
FROM
  `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
WHERE
  _TABLE_SUFFIX BETWEEN '20210101' AND '20210131'
  AND event_name = 'purchase'
  AND ecommerce.transaction_id IS NOT NULL
  AND ecommerce.transaction_id != '(not set)'
ORDER BY
  order_timestamp DESC;