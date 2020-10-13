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


WITH stocks AS (

	SELECT
		f.transaction_id
		,CAST(f.date_id AS DATE) AS date_id
		,f.stock_id
		,d.agency
		,d.stock_type
		,d.stock_name
		,f.current_value
		,f.rate
		,f.input
		,f.output
		,f.input    / f.rate	AS 'input_share'
		,f.output   / f.rate	AS 'output_share'
		,SUM(ISNULL(f.input/f.rate,0) - ISNULL(f.output/f.rate,0))	OVER(PARTITION BY f.stock_id ORDER BY f.transaction_id ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW )	AS 'acc_share'
		,SUM(ISNULL(f.input/f.rate,0) )							    OVER(PARTITION BY f.stock_id ORDER BY f.transaction_id ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW )	AS 'acc_input_share'
		,SUM(f.input)											    OVER(PARTITION BY f.stock_id ORDER BY f.transaction_id ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW )	AS 'input_acc'
		,SUM(ISNULL(f.output,0))								    OVER(PARTITION BY f.stock_id ORDER BY f.transaction_id ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW )	AS 'output_acc'

	FROM
                {{ref('f_stocks')}} AS f
    LEFT JOIN   {{ref('d_stocks')}} AS d ON f.stock_id = d.stock_id

)

	SELECT
		transaction_id
		,date_id
		,stock_id
		,stock_type
		,stock_name
		,current_value
		,rate
		,acc_share
		,acc_share * rate															AS 'current_value_calc'
		,CAST(((acc_share * rate) / (input_acc-output_acc)) -1	AS DECIMAL(18,4))	AS 'growth_percentage_total'
		,CAST(((acc_share * rate) / input_acc) 	-1	AS DECIMAL(18,4))				AS 'growth_percentage_current'
		,(acc_share * rate)	- input_acc + output_acc								AS 'return_total'
		,(acc_share * rate)	- input_acc												AS 'return_current'
		,output_acc																	AS 'return_real'
		,input
		,input_acc
		,output
		,output_acc
		,output_share
		,input_share
        ,CASE WHEN ROW_NUMBER() OVER (PARTITION BY stock_id ORDER BY date_id DESC) = 1 THEN 1 ELSE 0 END AS 'last_day'
	FROM
		stocks