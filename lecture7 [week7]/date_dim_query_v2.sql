-- create date_dim in bigquery
SELECT
  CONCAT (FORMAT_DATE("%Y",d),FORMAT_DATE("%m",d),FORMAT_DATE("%d",d)) as date_id,
  d AS full_date,
  FORMAT_DATE('%w', d) AS week_day,
  FORMAT_DATE('%A', d) AS day_name,
  EXTRACT(DAY FROM d) AS year_day,
  EXTRACT(WEEK FROM d) AS week,
  EXTRACT(WEEK FROM d) AS year_week,
  EXTRACT(MONTH FROM d) AS month,
  FORMAT_DATE('%B', d) as month_name,
  FORMAT_DATE('%Q', d) as fiscal_qtr,
  EXTRACT(YEAR FROM d) AS year,
  CONCAT (EXTRACT(YEAR FROM d), EXTRACT(WEEK FROM d)) AS year_week_concat,
  CONCAT (EXTRACT(YEAR FROM d), EXTRACT(MONTH FROM d)) AS year_month_concat,
  (CASE WHEN FORMAT_DATE('%A', d) IN ('Sunday', 'Saturday') THEN 0 ELSE 1 END) AS day_is_weekday,
FROM (
  SELECT
    *
  FROM
    UNNEST(GENERATE_DATE_ARRAY('2014-01-01', '2030-01-01', INTERVAL 1 DAY)) AS d )