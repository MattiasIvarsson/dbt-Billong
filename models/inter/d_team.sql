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
        team_home AS team
    FROM
        {{ref('countries_union')}}

UNION ALL
    SELECT DISTINCT
        team_away AS team
    FROM
        {{ref('countries_union')}}
),
team_step2 AS (

    SELECT DISTINCT
        team
    FROM
        team_step1
 )

SELECT
    ROW_NUMBER() OVER( ORDER BY team) AS team_key
    ,team
FROM
    team_step2
