-- Changed to 2024 to make it work

WITH date_dim AS (
    {{ dbt_date.get_base_dates(start_date="2024-01-01", end_date="2024-12-31") }} 
)

SELECT 
    date_format(date_day, '%Y-%m-%d') AS date_of_the_day
    , date_format(date_day, '%Y-%m') AS year_month
    , date_format(date_day, '%Y') AS year
    , date_format(date_day, '%m') AS month
    , date_format(date_day, '%d') AS day
FROM date_dim