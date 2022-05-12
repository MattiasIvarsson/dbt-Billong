{{config(   materialized='table',
            tags=['other','financial']
)}}


    SELECT
		o.year
		,c.country_key
		,t.team_key
		,o.country
		,o.league
		,o.team
		,o.europe_competition
		,o.europe_position
		,o.europe_performance
		,o.total_games
		,o.avg_attendance_league
		,o.instagram_m
		,o.twitter_m
		,o.facebook_m
    FROM
                {{ref('team_other')}}       AS o
    LEFT JOIN   {{ref('d_country')}}        AS c    ON o.country = c.country   AND o.league = c.league
    LEFT JOIN   {{ref('d_team')}}           AS t    ON o.country = c.country   AND o.team = t.team





