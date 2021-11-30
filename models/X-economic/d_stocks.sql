{{config(materialized='view',tags='eco', enabled=false)}}

	SELECT
        stock_id
        ,agency
        ,stock_name
        ,stock_type
	FROM
	    {{source('economic','economic_d_stocks')}}