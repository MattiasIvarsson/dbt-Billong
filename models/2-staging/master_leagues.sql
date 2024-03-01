{{config(tags='football')}}

	SELECT
        league_id
        ,league_name
        ,league_type
        ,league_logo
        ,country_name
        ,country_code
        ,country_confederation
        ,country_confederation2
        ,country_continent
        ,country_flag
    FROM
        {{ref('land_master_leagues')}} AS l
