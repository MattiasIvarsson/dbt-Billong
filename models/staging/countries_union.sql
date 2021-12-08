{{config(materialized='view', tags='football')}}


    SELECT * FROM {{ref('england_0019')}}
UNION ALL
    SELECT * FROM {{ref('france_0019')}}
UNION ALL
    SELECT * FROM {{ref('germany_0019')}}
UNION ALL
    SELECT * FROM {{ref('italy_0019')}}
UNION ALL
    SELECT * FROM {{ref('spain_0019')}}
