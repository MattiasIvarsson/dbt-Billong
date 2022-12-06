{{config(   materialized='table',
            tags='football',
            enabled=false,
            post_hook ="{{ create_nonclustered_index(columns = ['match_key'], includes = ['points_home']) }}"
)}}


    SELECT
        r.match_key
        ,c.country_key
        ,th.team_key AS team_key_home
        ,ta.team_key AS team_key_away

        ,r.match_no
        ,r.match_week
        ,r.match_date
        ,r.season
        ,r.division

        ,r.referee
        ,r.result_full_time
        ,r.result_half_time
        ,r.goals_home
        ,r.goals_away
        ,r.goals_half_time_home
        ,r.goals_half_time_away
        ,r.points_home
        ,r.points_away
        ,r.points_half_time_home
        ,r.points_half_time_away
        ,r.shots_home
        ,r.shots_away
        ,r.shots_target_home
        ,r.shots_target_away
        ,r.fouls_home
        ,r.fouls_away
        ,r.corners_home
        ,r.corners_away
        ,r.yellow_home
        ,r.yellow_away
        ,r.red_home
        ,r.red_away
        ,r.big_five
    FROM
                {{ref('f_results_countries_stg')}}  AS r
    LEFT JOIN   {{ref('d_country')}}                AS c    ON r.country = c.country   AND r.league = c.league
    LEFT JOIN   {{ref('d_team')}}                   AS th   ON r.team_home = th.team
    LEFT JOIN   {{ref('d_team')}}                   AS ta   ON r.team_home = ta.team

