{{config(   materialized='table',
            tags='football',
            post_hook ="{{ create_nonclustered_index(columns = ['match_key'], includes = ['points']) }}"
)}}



WITH match_union AS (

    SELECT
        r.match_key
        ,c.country_key
        ,r.match_date   AS date_key
        ,'Home'         AS location
        ,th.team_key    AS team_key
        ,ta.team_key    AS team_key_opponent
        ,r.match_no
        ,r.match_week
        ,r.season
        ,r.division
        ,r.result_full_time         AS result
        ,r.result_half_time
        ,r.points_home			    AS points
        ,r.points_half_time_home	AS points_half_time
        ,r.goals_home			    AS goals
        ,r.goals_half_time_home	    AS goals_half_time
        ,r.shots_home			    AS shots
        ,r.shots_target_home	    AS shots_target
        ,r.fouls_home			    AS fouls
        ,r.corners_home			    AS corners
        ,r.yellow_home			    AS yellow
        ,r.red_home				    AS red
    FROM
                {{ref('countries_union')}}  AS r
    LEFT JOIN   {{ref('d_country')}}        AS c    ON r.country = c.country   AND r.league = c.league
    LEFT JOIN   {{ref('d_team')}}           AS th   ON r.team_home = th.team
    LEFT JOIN   {{ref('d_team')}}           AS ta   ON r.team_home = ta.team

UNION ALL
    SELECT
        r.match_key
        ,c.country_key
        ,r.match_date   AS date_key
        ,'Away'         AS location
        ,ta.team_key    AS team_key
        ,th.team_key    AS team_key_opponent
        ,r.match_no
        ,r.match_week
        ,r.season
        ,r.division
        ,r.result_full_time         AS result
        ,r.result_half_time
        ,r.points_away			    AS points
        ,r.points_half_time_away    AS points_half_time
        ,r.goals_away			    AS goals
        ,r.goals_half_time_away	    AS goals_half_time
        ,r.shots_away			    AS shots
        ,r.shots_target_away	    AS shots_target
        ,r.fouls_away			    AS fouls
        ,r.corners_away			    AS corners
        ,r.yellow_away			    AS yellow
        ,r.red_away				    AS red
    FROM
                {{ref('countries_union')}}  AS r
    LEFT JOIN   {{ref('d_country')}}        AS c    ON r.country = c.country   AND r.league = c.league
    LEFT JOIN   {{ref('d_team')}}           AS th   ON r.team_home = th.team
    LEFT JOIN   {{ref('d_team')}}           AS ta   ON r.team_home = ta.team

)

    SELECT
        match_key
        ,country_key
        ,date_key
        ,location
        ,team_key
        ,team_key_opponent
        ,match_no
        ,match_week
        ,season
        ,division
        ,result
        ,result_half_time
        ,points
        ,points_half_time
        ,goals
        ,goals_half_time
        ,shots
        ,shots_target
        ,fouls
        ,corners
        ,yellow
        ,red
    FROM
        match_union
