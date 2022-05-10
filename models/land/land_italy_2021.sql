{{config(materialized='view', tags=['football','italy'])}}

        SELECT
            CONCAT(CAST(CONCAT( RIGHT(date,4),'-',RIGHT(LEFT(date,5),2),'-',LEFT(date,2)) AS DATE),HomeTeam,AwayTeam) AS match_key
            ,CAST(CONCAT( RIGHT(date,4),'-',RIGHT(LEFT(date,5),2),'-',LEFT(date,2)) AS DATE)    AS match_date
            ,Time				AS match_time
            ,'2020/2021'		AS season
            ,'Italy'			AS country
            ,'SerieA'          AS league
            ,1					AS division
            ,HomeTeam			AS team_home
            ,AwayTeam			AS team_away
            ,NULL               AS referee
            ,FTR				AS result_full_time
            ,HTR				AS result_half_time
            ,FTHG				AS goals_home
            ,FTAG				AS goals_away
            ,HTHG				AS goals_half_time_home
            ,HTAG				AS goals_half_time_away
            ,HS					AS shots_home
            ,[AS]				AS shots_away
            ,HST				AS shots_target_home
            ,AST				AS shots_target_away
            ,HF					AS fouls_home
            ,AF					AS fouls_away
            ,HC					AS corners_home
            ,AC					AS corners_away
            ,HY					AS yellow_home
            ,AY					AS yellow_away
            ,HR					AS red_home
            ,AR					AS red_away
            ,1                  AS big_five
        FROM
            {{source('football_land', 'italy_2021')}}


