{{ config( materialized='view')}}
{{ config(tags=["eco"])}}

	SELECT
        stock_id
        ,agency
        ,stock_name
        ,stock_type
	FROM
	    {{source('economic','economic_d_stocks')}}