{{config(materialized='incremental',
        tags='football',
        alias ='f_result_premier_league',
       post_hook ="{{ create_nonclustered_index(columns = ['match_key'], includes = ['points']) }}"
)}}

    SELECT
        f.*
    FROM
                {{ref('f_results_team')}}    AS f
    LEFT JOIN   {{ref('d_league')}}         AS c ON f.league_key = c.league_key
    LEFT JOIN   {{ref('d_calendar')}}       AS d ON f.match_date = d.date_key
    WHERE
        c.country = 'England'
    AND d.year > 2010
    AND f.match_date >= {{var("billong_start_date_limit")}}

    {% if is_incremental() %} AND  match_date  > (SELECT MAX(match_date) FROM {{ this }}) {% endif %}