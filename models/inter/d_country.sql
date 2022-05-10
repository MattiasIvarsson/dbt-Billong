{{config(materialized='view', tags=['football','dimension'])}}


---- JOIN ON COUNTRY DATA
--Population
-- etc

    SELECT DISTINCT
        country_key
        ,country
        ,league
        ,ISNULL(big_five,0) AS big_five
    FROM
        {{ref('countries_union')}}

