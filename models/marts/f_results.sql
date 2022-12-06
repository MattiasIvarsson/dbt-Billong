{{config(materialized='incremental',tags='football')}}

    SELECT
        f.*
    FROM
                {{ref('f_results_team')}}    AS f
    LEFT JOIN   {{ref('d_calendar')}}       AS d ON f.match_date = d.date_key
    WHERE
        d.year > 2010
    {% if is_incremental() %} AND  match_date  > (SELECT MAX(match_date) FROM {{ this }}) {% endif %}