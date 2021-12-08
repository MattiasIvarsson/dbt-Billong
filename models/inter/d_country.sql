{{config(materialized='view', tags=['football','dimension'])}}


---- JOIN ON COUNTRY DATA
--Population
-- etc



WITH country AS (
    SELECT DISTINCT
        country
        ,league
    FROM
        {{ref('countries_union')}}

)
SELECT
    ROW_NUMBER() OVER(  ORDER BY country, league) AS country_key
    ,country
    ,league
    ,CASE WHEN Country IN ('England','Italy','France','Germany','Spain') THEN 1 ELSE 0 END AS big_five
FROM
    country

