{{config(materialized='view', tags='football')}}

    SELECT
        team_id
        ,team_name
        ,team_code
        ,team_country
        ,team_founded
        ,is_national_team
        ,team_logo
        ,venue_id
        ,venue_name
        ,venue_address
        ,venue_city
        ,venue_capacity
        ,venue_surface
        ,venue_image
    FROM
        {{source('football_land', 'master_teams_all')}}
