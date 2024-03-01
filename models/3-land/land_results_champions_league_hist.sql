{{config(materialized='view', tags='football')}}

    SELECT
        CONCAT(match_date,team_home,team_away) AS match_key
        ,competition
        ,match_date
        ,season
        ,round
        ,leg
        ,tie_winner
        ,team_home
        ,team_away
        ,goals_home
        ,goals_away
        ,results
        ,goals_halftime_home
        ,goals_halftime_away
        ,results_halftime
        ,goals_home_aggregate
        ,goals_away_aggregate
        ,result_aggregate
        ,points_home
        ,points_away
        ,points_halftime_home
        ,points_halftime_away
        ,extra_time
        ,penalties
        ,team_home_country
        ,team_away_country
    FROM
        {{source('football_land', 'results_champions_league_hist')}}
