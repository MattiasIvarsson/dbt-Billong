{{config(materialized='view', tags='football')}}

    SELECT
        country_id
        ,country_name
        ,country_confederation
        ,country_confederation2
        ,country_continent
        ,country_code
        ,country_flag
    FROM
        {{source('football_land', 'master_country_all')}}
