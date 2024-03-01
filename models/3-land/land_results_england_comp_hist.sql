{{config(materialized='view', tags='football')}}

    SELECT
        CONCAT(match_date,team_home,team_away) AS match_key
        ,competition
        ,match_date
        ,season
        ,team_home
        ,team_away
        ,goals_home
        ,goals_away
        ,results
        ,points_home
        ,points_away
        ,round
        ,tie
        ,leg
        ,extra_time
        ,penalty
        ,penalties_result
        ,penalties_home
        ,penalties_away
        ,venue
        ,attendance
        ,non_match
        ,notes
        ,neutral
    FROM
        {{source('football_land', 'results_england_comp_hist')}}
