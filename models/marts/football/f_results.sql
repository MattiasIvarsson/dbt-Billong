{{config(materialized='view',tags='football')}}


SELECT * FROM {{ref('f_result_team')}}