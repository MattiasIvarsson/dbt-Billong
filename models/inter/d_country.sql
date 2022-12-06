{{config(materialized='view', tags=['football','dimension'])}}


---- JOIN ON COUNTRY DATA
--Population
-- etc

    SELECT DISTINCT
        country_key
        ,country
        ,league
        ,CASE WHEN league IN    ('Premier League'
                                ,'Serie A'
                                ,'Ligue 1'
                                ,'La Liga'
                                ,'Bundesliga') THEN 1 ELSE 0 END AS big_five
    FROM
        {{ref('f_results_countries_stg')}}

