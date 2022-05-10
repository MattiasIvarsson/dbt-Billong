{{config(materialized='view', tags=['football','dimension'])}}

---- JOIN ON TEAM DATA
-- Stadium
-- Capacity
-- City
-- Region
-- Shirt Color
-- Website
-- Nicknames

WITH team_step1 AS (

    SELECT DISTINCT
        team_home       AS team
        ,team_home_key  AS team_key
    FROM
        {{ref('countries_union')}}
UNION ALL
    SELECT DISTINCT
        team_away       AS team
        ,team_away_key  AS team_key
    FROM
        {{ref('countries_union')}}
)

    SELECT DISTINCT
        team
        ,team_key
    FROM
        team_step1

