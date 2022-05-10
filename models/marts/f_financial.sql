{{config(materialized='table',tags='financial')}}

    SELECT * FROM {{ref('f_financial_team')}}

