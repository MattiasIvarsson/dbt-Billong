-- TODO

--Closing Balance
--OpeningBalance
--Return current portfolio
--Return real
--Return Tot
--return YTD
--Rate utveckling month per month
--Rate since last output
--Rate YTD
--Rate total


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
        ,NULL AS 'new_share'
        ,NULL AS 'total_share'
        ,NULL AS 'input_ack'
        ,NULL AS 'output_ack'

    FROM
                {{ref('f_stocks')}} AS f
    LEFT JOIN   {{ref('d_stocks')}} AS d ON f.stock_id = d.stock_id


