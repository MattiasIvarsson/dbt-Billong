{{config(materialized='view', tags='football')}}

    SELECT
        league_id
        ,league_name
        ,league_type
        ,league_logo
        ,country_id
        ,country_name
        ,country_code
        ,country_confederation
        ,country_confederation2
        ,country_continent
        ,country_flag
    FROM
        {{source('football_land', 'master_leagues_all')}}
