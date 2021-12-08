{{config(materialized='view', tags='football')}}

SELECT
    *
FROM
    {{source('football_land', 'team_other')}}