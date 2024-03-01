{{config(tags='football')}}

	SELECT
        country_id
        ,country_name
        ,country_confederation
        ,country_confederation2
        ,country_continent
        ,country_code
        ,country_flag
    FROM
        {{ref('land_master_country')}}
