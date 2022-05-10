{{config(materialized='view', tags='football')}}


WITH union_all AS (
    SELECT * FROM {{ref('england_all')}}
UNION ALL
    SELECT * FROM {{ref('france_all')}}
UNION ALL
    SELECT * FROM {{ref('germany_all')}}
UNION ALL
    SELECT * FROM {{ref('italy_all')}}
UNION ALL
    SELECT * FROM {{ref('spain_all')}}

)

    SELECT
        CONVERT(BINARY(16), HASHBYTES('MD5',CONCAT(country,league)))  AS country_key
        ,CONVERT(BINARY(16), HASHBYTES('MD5',team_home))  AS team_home_key
        ,CONVERT(BINARY(16), HASHBYTES('MD5',team_away))  AS team_away_key
        ,*
    FROM
        union_all