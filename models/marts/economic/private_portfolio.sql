

    SELECT
        f.transaction_id
        ,f.date_id
        ,f.stock_id
        ,d.agency
        ,d.stock_type
        ,d.stock_name
        ,f.current_value
        ,f.rate
        ,f.input
        ,f.output

    FROM
                {{ref('f_stocks')}} AS f
    LEFT JOIN   {{ref('d_stocks')}} AS d ON f.stock_id = d.stock_id
