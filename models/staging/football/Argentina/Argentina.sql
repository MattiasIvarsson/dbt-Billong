{{ config(tags=["football_staging"])}}

SELECT
		ROW_NUMBER () OVER (Partition By season ORDER By date )			AS 'GameNumber'
		,ROW_NUMBER () OVER (Partition By season ORDER By date )		AS 'Gameweek'
		,Date															AS 'MatchDay'
		,time 															AS 'MatchTime'
		,CASE	WHEN Season = '2019.2020'		THEN '2019/2020'			
				WHEN Season = '2018.2019'		THEN '2018/2019' 
				WHEN Season = '2017.2018'		THEN '2017/2018'
				WHEN Season = '2016.2017'		THEN '2016/2017'
				WHEN Season = '2016'			THEN '2016/2016'
				WHEN Season = '2015'			THEN '2015/2015'
				WHEN Season = '2014'			THEN '2015/2015'
				WHEN Season = '2013.2014'		THEN '2013/2014'
				WHEN Season = '2012.2013'		THEN '2012/2013' END	AS 'Season'	
		,Country														AS 'Country'
		,League															AS 'League'
		,1																AS 'Division'
		,Home															AS 'HomeTeam'
		,Away															AS 'AwayTeam'
		,HG																AS 'FulltimeHomeGoal'
		,AG																AS 'FulltimeAwayGoal'
		,Res															AS 'FullTimeResult'
		,PH																AS 'PinnaceleHome'
		,PD																AS 'PinnacleDraw'
		,PA																AS 'PinnacleAway'		
		,MaxH															AS 'OddsportalMaxHome'
		,MaxD															AS 'OddsportalMaxDraw'
		,MaxA															AS 'OddsportalMaxAway'
		,AvgH															AS 'OddsportalAvgHome'
		,AvgD															AS 'OddsportalAvgDraw'
		,AvgA															AS 'OddsportalAvgAway'
  
	FROM {{source('argentina','s_1220')}}


		


	