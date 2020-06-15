SELECT 
		ROW_NUMBER () OVER ( ORDER By date )				AS 'GameNumber'
		,IIF(ROW_NUMBER () OVER ( ORDER By date ) <11,1,LEFT (ROW_NUMBER () OVER ( ORDER By date )-1,	LEN(ROW_NUMBER () OVER ( ORDER By date ))-1)+1)		 AS 'GameWeek'
		,Date												AS 'MatchDay'
		,'2018/2019'										AS 'Season'
		,'Greece'											AS 'Country'
		,'Super League'									AS 'League'
		,1													AS 'Division'
		,HomeTeam											AS 'HomeTeam'
		,AwayTeam											AS 'AwayTeam'
		,FTHG												AS 'FullTimeHomeGoal'
		,FTAG												AS 'FullTimeAwayGoal'
		,FTR												AS 'FullTimeResult'
		,HTHG												AS 'HalfTimeHomeGoal'
		,HTAG												AS 'HalfTimeAwayGoal'
		,HTR												AS 'HalfTimeResult'
		,HS													AS 'HomeShots'				
		,[AS]												AS 'AwayShots'
		,HST												AS 'HomeShotTarget'
		,AST												AS 'AwayShotTarget'
		,HFKC												AS 'HomeFoulsConceded'	
		,AFKC												AS 'AwayFoulsConceded'
		,HC													AS 'HomeCorners'
		,AC													AS 'AwayCorners'
		,HY													AS 'HomeYellow'
		,AY													AS 'AwayYellow'
		,HR 												AS 'HomeRed'
		,AR 												AS 'AwayRed'
		,NULL												AS 'Referee'
	FROM {{source('Greece','s_1819')}}

	
-------------------------Super League 17/18---------------------------------------------------------------------------------
UNION ALL
SELECT 
		ROW_NUMBER () OVER ( ORDER By CAST(CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2)) AS DATE)	 )						AS 'GameNumber'
		,IIF(		ROW_NUMBER () OVER ( ORDER By CAST(CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2)) AS DATE)	 ) <11
				,1,
				LEFT (	ROW_NUMBER () OVER ( ORDER By CAST(CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2)) AS DATE))-1
				,LEN(	ROW_NUMBER () OVER ( ORDER By CAST(CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2)) AS DATE)))-1)+1)	AS 'GameWeek'		
		,CAST(CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2)) AS DATE)														AS 'MatchDay'								
		,'2017/2018'										AS 'Season'
		,'Greece'											AS 'Country'
		,'Super League'											AS 'League'
		,1													AS 'Division'
		,HomeTeam											AS 'HomeTeam'
		,AwayTeam											AS 'AwayTeam'
		,FTHG												AS 'FullTimeHomeGoal'
		,FTAG												AS 'FullTimeAwayGoal'
		,FTR												AS 'FullTimeResult'
		,HTHG												AS 'HalfTimeHomeGoal'
		,HTAG												AS 'HalfTimeAwayGoal'
		,HTR												AS 'HalfTimeResult'
		,HS													AS 'HomeShots'				
		,[AS]												AS 'AwayShots'
		,HST												AS 'HomeShotTarget'
		,AST												AS 'AwayShotTarget'
		,HFKC													AS 'HomeFouls'	
		,AFKC													AS 'AwayFouls'
		,HC													AS 'HomeCorners'
		,AC													AS 'AwayCorners'
		,HY													AS 'HomeYellow'
		,AY													AS 'AwayYellow'
		,HR													AS 'HomeRed'
		,AR													AS 'AwayRed'
		,NULL												AS 'Referee'

	FROM {{source('Greece','s_1718')}}

-------------------------Super League 16/17-------------------------------------------------------------------------------------
UNION ALL
SELECT  
		ROW_NUMBER () OVER ( ORDER By CAST(CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2)) AS DATE)	 )						AS 'GameNumber'
		,IIF(		ROW_NUMBER () OVER ( ORDER By CAST(CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2)) AS DATE)	 ) <11
				,1,
				LEFT (	ROW_NUMBER () OVER ( ORDER By CAST(CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2)) AS DATE))-1
				,LEN(	ROW_NUMBER () OVER ( ORDER By CAST(CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2)) AS DATE)))-1)+1)	AS 'GameWeek'		
		,CAST(CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2)) AS DATE)														AS 'MatchDay'		
		,'2016/2017'										AS 'Season'
		,'Greece'											AS 'Country'
		,'Super League'											AS 'League'
		,1													AS 'Division'
		,HomeTeam											AS 'HomeTeam'
		,AwayTeam											AS 'AwayTeam'
		,FTHG												AS 'FullTimeHomeGoal'
		,FTAG												AS 'FullTimeAwayGoal'
		,FTR												AS 'FullTimeResult'
		,HTHG												AS 'HalfTimeHomeGoal'
		,HTAG												AS 'HalfTimeAwayGoal'
		,HTR												AS 'HalfTimeResult'
		,null												AS 'HomeShots'				
		,null												AS 'AwayShots'
		,null												AS 'HomeShotTarget'
		,null												AS 'AwayShotTarget'
		,null												AS 'HomeFouls'	
		,null												AS 'AwayFouls'
		,null												AS 'HomeCorners'
		,null												AS 'AwayCorners'
		,null												AS 'HomeYellow'
		,null												AS 'AwayYellow'
		,null												AS 'HomeRed'
		,null												AS 'AwayRed'
		,NULL												AS 'Referee'
 

	FROM {{source('Greece','s_1617')}}


-------------------------Super League 15/16-------------------------------------------------------------------------
UNION ALL
SELECT 
		ROW_NUMBER () OVER ( ORDER By CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2))	 )						AS 'GameNumber'
		,IIF(		ROW_NUMBER () OVER ( ORDER By CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2)) 	 ) <11
				,1,
				LEFT (	ROW_NUMBER () OVER ( ORDER By CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2)) )-1
				,LEN(	ROW_NUMBER () OVER ( ORDER By CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2)) ))-1)+1)	AS 'GameWeek'		
		,CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2))															AS 'MatchDay'	
		,'2015/2016'										AS 'Season'
		,'Greece'											AS 'Country'
		,'Super League'									AS 'League'
		,1													AS 'Division'
		,HomeTeam											AS 'HomeTeam'
		,AwayTeam											AS 'AwayTeam'
		,FTHG												AS 'FullTimeHomeGoal'
		,FTAG												AS 'FullTimeAwayGoal'
		,FTR												AS 'FullTimeResult'
		,HTHG												AS 'HalfTimeHomeGoal'
		,HTAG												AS 'HalfTimeAwayGoal'
		,HTR												AS 'HalfTimeResult'
		,null												AS 'HomeShots'				
		,null												AS 'AwayShots'
		,null												AS 'HomeShotTarget'
		,null												AS 'AwayShotTarget'
		,null												AS 'HomeFouls'	
		,null												AS 'AwayFouls'
		,null												AS 'HomeCorners'
		,null												AS 'AwayCorners'
		,null												AS 'HomeYellow'
		,null												AS 'AwayYellow'
		,null										 		AS 'HomeRed'
		,null										 		AS 'AwayRed'
		,NULL												AS 'Referee'
	FROM {{source('Greece','s_1516')}}


-------------------------Super League 14/15-------------------------------------------------------------------------
UNION ALL
SELECT  
		ROW_NUMBER () OVER ( ORDER By CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2))	 )						AS 'GameNumber'
		,IIF(		ROW_NUMBER () OVER ( ORDER By CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2)) 	 ) <11
				,1,
				LEFT (	ROW_NUMBER () OVER ( ORDER By CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2)) )-1
				,LEN(	ROW_NUMBER () OVER ( ORDER By CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2)) ))-1)+1)	AS 'GameWeek'		
		,CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2))															AS 'MatchDay'				
		,'2014/2015'										AS 'Season'	
		,'Greece'											AS 'Country'
		,'Super League'									AS 'League'
		,1													AS 'Division'
		,HomeTeam											AS 'HomeTeam'
		,AwayTeam											AS 'AwayTeam'
		,FTHG												AS 'FullTimeHomeGoal'
		,FTAG												AS 'FullTimeAwayGoal'
		,FTR												AS 'FullTimeResult'
		,HTHG												AS 'HalfTimeHomeGoal'
		,HTAG												AS 'HalfTimeAwayGoal'
		,HTR												AS 'HalfTimeResult'
		,null												AS 'HomeShots'				
		,null												AS 'AwayShots'
		,null												AS 'HomeShotTarget'
		,null												AS 'AwayShotTarget'
		,null												AS 'HomeFouls'	
		,null												AS 'AwayFouls'
		,null												AS 'HomeCorners'
		,null												AS 'AwayCorners'
		,null												AS 'HomeYellow'
		,null												AS 'AwayYellow'
		,null												AS 'HomeRed'
		,null												AS 'AwayRed'
		,NULL												AS 'Referee'
	FROM {{source('Greece','s_1415')}}

-------------------------Super League 13/14----------------------------------------------------------------------------
UNION ALL
SELECT 
		ROW_NUMBER () OVER ( ORDER By CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2))	 )						AS 'GameNumber'
		,IIF(		ROW_NUMBER () OVER ( ORDER By CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2)) 	 ) <11
				,1,
				LEFT (	ROW_NUMBER () OVER ( ORDER By CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2)) )-1
				,LEN(	ROW_NUMBER () OVER ( ORDER By CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2)) ))-1)+1)	AS 'GameWeek'		
		,CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2))															AS 'MatchDay'	
		,'2013/2014'										AS 'Season'
		,'Greece'											AS 'Country'
		,'Super League'											AS 'League'
		,1													AS 'Division'
		,HomeTeam											AS 'HomeTeam'
		,AwayTeam											AS 'AwayTeam'
		,FTHG												AS 'FullTimeHomeGoal'
		,FTAG												AS 'FullTimeAwayGoal'
		,FTR												AS 'FullTimeResult'
		,HTHG												AS 'HalfTimeHomeGoal'
		,HTAG												AS 'HalfTimeAwayGoal'
		,HTR												AS 'HalfTimeResult'
		,NULL												AS 'HomeShots'				
		,NULL												AS 'AwayShots'
		,NULL												AS 'HomeShotTarget'
		,NULL												AS 'AwayShotTarget'
		,NULL												AS 'HomeFouls'	
		,NULL												AS 'AwayFouls'
		,NULL												AS 'HomeCorners'
		,NULL												AS 'AwayCorners'
		,NULL												AS 'HomeYellow'
		,NULL												AS 'AwayYellow'
		,NULL												AS 'HomeRed'
		,NULL												AS 'AwayRed'
		,NULL												AS 'Referee'
 
	FROM {{source('Greece','s_1314')}}

-------------------------Super League 12/13---------------------------------------------------------------------------------------------
UNION ALL
SELECT 
		ROW_NUMBER () OVER ( ORDER By CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2))	 )						AS 'GameNumber'
		,IIF(		ROW_NUMBER () OVER ( ORDER By CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2)) 	 ) <11
				,1,
				LEFT (	ROW_NUMBER () OVER ( ORDER By CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2)) )-1
				,LEN(	ROW_NUMBER () OVER ( ORDER By CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2)) ))-1)+1)	AS 'GameWeek'		
		,CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2))															AS 'MatchDay'			
		,'2012/2013'										AS 'Season'
		,'Greece'											AS 'Country'
		,'Super League'									AS 'League'
		,1													AS 'Division'
		,HomeTeam											AS 'HomeTeam'
		,AwayTeam											AS 'AwayTeam'
		,FTHG												AS 'FullTimeHomeGoal'
		,FTAG												AS 'FullTimeAwayGoal'
		,FTR												AS 'FullTimeResult'
		,HTHG												AS 'HalfTimeHomeGoal'
		,HTAG												AS 'HalfTimeAwayGoal'
		,HTR												AS 'HalfTimeResult'
		,NULL												AS 'HomeShots'				
		,NULL												AS 'AwayShots'
		,NULL												AS 'HomeShotTarget'
		,NULL												AS 'AwayShotTarget'
		,NULL												AS 'HomeFouls'	
		,NULL												AS 'AwayFouls'
		,NULL												AS 'HomeCorners'
		,NULL												AS 'AwayCorners'
		,NULL												AS 'HomeYellow'
		,NULL												AS 'AwayYellow'
		,NULL												AS 'HomeRed'
		,NULL												AS 'AwayRed'
		,NULL												AS 'Referee'
	
	FROM {{source('Greece','s_1213')}}

-------------------------Super League 11/12----------------------------------------------------------------------------------------------
UNION ALL
SELECT 
		ROW_NUMBER () OVER ( ORDER By CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2))	 )						AS 'GameNumber'
		,IIF(		ROW_NUMBER () OVER ( ORDER By CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2)) 	 ) <11
				,1,
				LEFT (	ROW_NUMBER () OVER ( ORDER By CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2)) )-1
				,LEN(	ROW_NUMBER () OVER ( ORDER By CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2)) ))-1)+1)	AS 'GameWeek'		
		,CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2))															AS 'MatchDay'		
		,'2011/2012'										AS 'Season'
		,'Greece'											AS 'Country'
		,'Super League'									AS 'League'
		,1													AS 'Division'
		,HomeTeam											AS 'HomeTeam'
		,AwayTeam											AS 'AwayTeam'
		,FTHG												AS 'FullTimeHomeGoal'
		,FTAG												AS 'FullTimeAwayGoal'
		,FTR												AS 'FullTimeResult'
		,HTHG												AS 'HalfTimeHomeGoal'
		,HTAG												AS 'HalfTimeAwayGoal'
		,HTR												AS 'HalfTimeResult'
		,NULL												AS 'HomeShots'				
		,NULL												AS 'AwayShots'
		,NULL												AS 'HomeShotTarget'
		,NULL												AS 'AwayShotTarget'
		,NULL												AS 'HomeFouls'	
		,NULL												AS 'AwayFouls'
		,NULL												AS 'HomeCorners'
		,NULL												AS 'AwayCorners'
		,NULL												AS 'HomeYellow'
		,NULL												AS 'AwayYellow'
		,NULL												AS 'HomeRed'
		,NULL												AS 'AwayRed'
		,NULL												AS 'Referee'
 
	FROM {{source('Greece','s_1112')}}


-------------------------Super League 10/11--------------------------------------------------------------------------------------------
UNION ALL
SELECT  
		ROW_NUMBER () OVER ( ORDER By CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2))	 )						AS 'GameNumber'
		,IIF(		ROW_NUMBER () OVER ( ORDER By CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2)) 	 ) <11
				,1,
				LEFT (	ROW_NUMBER () OVER ( ORDER By CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2)) )-1
				,LEN(	ROW_NUMBER () OVER ( ORDER By CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2)) ))-1)+1)	AS 'GameWeek'		
		,CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2))															AS 'MatchDay'		
		,'2010/2011'										AS 'Season'
		,'Greece'											AS 'Country'
		,'Super League'									AS 'League'
		,1													AS 'Division'
		,HomeTeam											AS 'HomeTeam'
		,AwayTeam											AS 'AwayTeam'
		,FTHG												AS 'FullTimeHomeGoal'
		,FTAG												AS 'FullTimeAwayGoal'
		,FTR												AS 'FullTimeResult'
		,HTHG												AS 'HalfTimeHomeGoal'
		,HTAG												AS 'HalfTimeAwayGoal'
		,HTR												AS 'HalfTimeResult'
		,NULL												AS 'HomeShots'				
		,NULL												AS 'AwayShots'
		,NULL												AS 'HomeShotTarget'
		,NULL												AS 'AwayShotTarget'
		,NULL												AS 'HomeFouls'	
		,NULL												AS 'AwayFouls'
		,NULL												AS 'HomeCorners'
		,NULL												AS 'AwayCorners'
		,NULL												AS 'HomeYellow'
		,NULL												AS 'AwayYellow'
		,NULL												AS 'HomeRed'
		,NULL												AS 'AwayRed'
 		,NULL												AS 'Referee'

	FROM {{source('Greece','s_1011')}}

-------------------------Super League 09/10------------------------------------------------------------------
UNION ALL
SELECT 
		ROW_NUMBER () OVER ( ORDER By CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2))	 )						AS 'GameNumber'
		,IIF(		ROW_NUMBER () OVER ( ORDER By CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2)) 	 ) <11
				,1,
				LEFT (	ROW_NUMBER () OVER ( ORDER By CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2)) )-1
				,LEN(	ROW_NUMBER () OVER ( ORDER By CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2)) ))-1)+1)	AS 'GameWeek'		
		,CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2))															AS 'MatchDay'	
		 ,'2009/2010'										AS 'Season'
		,'Greece'											AS 'Country'
		,'Super League'										AS 'League'
		,1													AS 'Division'
		,HomeTeam											AS 'HomeTeam'
		,AwayTeam											AS 'AwayTeam'
		,FTHG												AS 'FullTimeHomeGoal'
		,FTAG												AS 'FullTimeAwayGoal'
		,FTR												AS 'FullTimeResult'
		,HTHG												AS 'HalfTimeHomeGoal'
		,HTAG												AS 'HalfTimeAwayGoal'
		,HTR												AS 'HalfTimeResult'
		,NULL												AS 'HomeShots'				
		,NULL												AS 'AwayShots'
		,NULL												AS 'HomeShotTarget'
		,NULL												AS 'AwayShotTarget'
		,NULL												AS 'HomeFouls'	
		,NULL												AS 'AwayFouls'
		,NULL												AS 'HomeCorners'
		,NULL												AS 'AwayCorners'
		,NULL												AS 'HomeYellow'
		,NULL												AS 'AwayYellow'
		,NULL												AS 'HomeRed'
		,NULL												AS 'AwayRed'
 		,NULL												AS 'Referee'

	FROM {{source('Greece','s_0910')}}

-------------------------Super League 08/09-----------------------------------------------------------------
UNION ALL
SELECT 
		ROW_NUMBER () OVER ( ORDER By CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2))	 )						AS 'GameNumber'
		,IIF(		ROW_NUMBER () OVER ( ORDER By CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2)) 	 ) <11
				,1,
				LEFT (	ROW_NUMBER () OVER ( ORDER By CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2)) )-1
				,LEN(	ROW_NUMBER () OVER ( ORDER By CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2)) ))-1)+1)	AS 'GameWeek'		
		,CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2))															AS 'MatchDay'		
		,'2008/2009'										AS 'Season'
		,'Greece'											AS 'Country'
		,'Super League'									AS 'League'
		,1													AS 'Division'
		,HomeTeam											AS 'HomeTeam'
		,AwayTeam											AS 'AwayTeam'
		,FTHG												AS 'FullTimeHomeGoal'
		,FTAG												AS 'FullTimeAwayGoal'
		,FTR												AS 'FullTimeResult'
		,HTHG												AS 'HalfTimeHomeGoal'
		,HTAG												AS 'HalfTimeAwayGoal'
		,HTR												AS 'HalfTimeResult'
		,NULL												AS 'HomeShots'				
		,NULL												AS 'AwayShots'
		,NULL												AS 'HomeShotTarget'
		,NULL												AS 'AwayShotTarget'
		,NULL												AS 'HomeFouls'	
		,NULL												AS 'AwayFouls'
		,NULL												AS 'HomeCorners'
		,NULL												AS 'AwayCorners'
		,NULL												AS 'HomeYellow'
		,NULL												AS 'AwayYellow'
		,NULL												AS 'HomeRed'
		,NULL												AS 'AwayRed'
 		,NULL												AS 'Referee'

	FROM {{source('Greece','s_0809')}}


---------------------------Super League 07/08---------------------------------------------------------------------------------
UNION ALL
SELECT 
		ROW_NUMBER () OVER ( ORDER By CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2))	 )						AS 'GameNumber'
		,IIF(		ROW_NUMBER () OVER ( ORDER By CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2)) 	 ) <11
				,1,
				LEFT (	ROW_NUMBER () OVER ( ORDER By CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2)) )-1
				,LEN(	ROW_NUMBER () OVER ( ORDER By CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2)) ))-1)+1)	AS 'GameWeek'		
		,CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2))															AS 'MatchDay'		
		,'2007/2008'										AS 'Season'	
		,'Greece'											AS 'Country'
		,'Super League'										AS 'League'
		,1													AS 'Division'
		,HomeTeam											AS 'HomeTeam'
		,AwayTeam											AS 'AwayTeam'
		,FTHG												AS 'FullTimeHomeGoal'
		,FTAG												AS 'FullTimeAwayGoal'
		,FTR												AS 'FullTimeResult'
		,HTHG												AS 'HalfTimeHomeGoal'
		,HTAG												AS 'HalfTimeAwayGoal'
		,HTR												AS 'HalfTimeResult'
		,NULL												AS 'HomeShots'				
		,NULL												AS 'AwayShots'
		,NULL												AS 'HomeShotTarget'
		,NULL												AS 'AwayShotTarget'
		,NULL												AS 'HomeFouls'	
		,NULL												AS 'AwayFouls'
		,NULL												AS 'HomeCorners'
		,NULL												AS 'AwayCorners'
		,NULL												AS 'HomeYellow'
		,NULL												AS 'AwayYellow'
		,NULL												AS 'HomeRed'
		,NULL												AS 'AwayRed'
 		,NULL												AS 'Referee'

	FROM {{source('Greece','s_0708')}}
-------------------------Super League 06/07---------------------------------------------------------------------------------

UNION ALL
SELECT 
		ROW_NUMBER () OVER ( ORDER By CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2))	 )						AS 'GameNumber'
		,IIF(		ROW_NUMBER () OVER ( ORDER By CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2)) 	 ) <11
				,1,
				LEFT (	ROW_NUMBER () OVER ( ORDER By CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2)) )-1
				,LEN(	ROW_NUMBER () OVER ( ORDER By CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2)) ))-1)+1)	AS 'GameWeek'		
		,CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2))															AS 'MatchDay'		
		,'2006/2007'										AS 'Season'
		,'Greece'											AS 'Country'
		,'Super League'											AS 'League'
		,1													AS 'Division'
		,HomeTeam											AS 'HomeTeam'
		,AwayTeam											AS 'AwayTeam'
		,FTHG												AS 'FullTimeHomeGoal'
		,FTAG												AS 'FullTimeAwayGoal'
		,FTR												AS 'FullTimeResult'
		,HTHG												AS 'HalfTimeHomeGoal'
		,HTAG												AS 'HalfTimeAwayGoal'
		,HTR												AS 'HalfTimeResult'
		,NULL												AS 'HomeShots'				
		,NULL												AS 'AwayShots'
		,NULL												AS 'HomeShotTarget'
		,NULL												AS 'AwayShotTarget'
		,NULL												AS 'HomeFouls'	
		,NULL												AS 'AwayFouls'
		,NULL												AS 'HomeCorners'
		,NULL												AS 'AwayCorners'
		,NULL												AS 'HomeYellow'
		,NULL												AS 'AwayYellow'
		,NULL												AS 'HomeRed'
		,NULL												AS 'AwayRed'
		,NULL												AS 'Referee'
	
	FROM {{source('Greece','s_0607')}}

-------------------------Super League 05/06---------------------------------------------------------------------

UNION ALL
SELECT 
		ROW_NUMBER () OVER ( ORDER By CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2))	 )						AS 'GameNumber'
		,IIF(		ROW_NUMBER () OVER ( ORDER By CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2)) 	 ) <11
				,1,
				LEFT (	ROW_NUMBER () OVER ( ORDER By CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2)) )-1
				,LEN(	ROW_NUMBER () OVER ( ORDER By CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2)) ))-1)+1)	AS 'GameWeek'		
		,CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2))															AS 'MatchDay'			
		,'2005/2006'										AS 'Season'
		,'Greece'											AS 'Country'
		,'Super League'									AS 'League'	
		,1													AS 'Division'
		,HomeTeam											AS 'HomeTeam'
		,AwayTeam											AS 'AwayTeam'
		,FTHG												AS 'FullTimeHomeGoal'
		,FTAG												AS 'FullTimeAwayGoal'
		,FTR												AS 'FullTimeResult'
		,HTHG												AS 'HalfTimeHomeGoal'
		,HTAG												AS 'HalfTimeAwayGoal'
		,HTR												AS 'HalfTimeResult'
		,NULL												AS 'HomeShots'				
		,NULL												AS 'AwayShots'
		,NULL												AS 'HomeShotTarget'
		,NULL												AS 'AwayShotTarget'
		,NULL												AS 'HomeFouls'	
		,NULL												AS 'AwayFouls'
		,NULL												AS 'HomeCorners'
		,NULL												AS 'AwayCorners'
		,NULL												AS 'HomeYellow'
		,NULL												AS 'AwayYellow'
		,NULL												AS 'HomeRed'
		,NULL												AS 'AwayRed'
 		,NULL												AS 'Referee'
		
	FROM {{source('Greece','s_0506')}}




-------------------------Super League 04/05---------------------------------------------------------------------------
--UNION ALL
--SELECT 
--		ROW_NUMBER () OVER ( ORDER By CAST(CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2)) AS DATE)	 )						AS 'GameNumber'
--		,IIF(		ROW_NUMBER () OVER ( ORDER By CAST(CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2)) AS DATE)	 ) <11
--				,1,
--				LEFT (	ROW_NUMBER () OVER ( ORDER By CAST(CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2)) AS DATE))-1
--				,LEN(	ROW_NUMBER () OVER ( ORDER By CAST(CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2)) AS DATE)))-1)+1)	AS 'GameWeek'		
--		,CAST(CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2)) AS DATE)														AS 'MatchDay'		
--	,'2004/2005'										AS 'Season'
--		,'Greece'											AS 'Country'
--		,'Super League'									AS 'League'
--		,1													AS 'Division'
--		,HomeTeam											AS 'HomeTeam'
--		,AwayTeam											AS 'AwayTeam'
--		,FTHG												AS 'FullTimeHomeGoal'
--		,FTAG												AS 'FullTimeAwayGoal'
--		,FTR												AS 'FullTimeResult'
--		,HTHG												AS 'HalfTimeHomeGoal'
--		,HTAG												AS 'HalfTimeAwayGoal'
--		,HTR												AS 'HalfTimeResult'
--		,NULL												AS 'HomeShots'				
--		,NULL												AS 'AwayShots'
--		,NULL												AS 'HomeShotTarget'
--		,NULL												AS 'AwayShotTarget'
--		,NULL												AS 'HomeFouls'	
--		,NULL												AS 'AwayFouls'
--		,NULL												AS 'HomeCorners'
--		,NULL												AS 'AwayCorners'
--		,NULL												AS 'HomeYellow'
--		,NULL												AS 'AwayYellow'
--		,NULL												AS 'HomeRed'
--		,NULL												AS 'AwayRed'
-- 		,NULL												AS 'Referee'

--	FROM {{source('Greece','s_0405')}}


-------------------------Super League 03/04-----------------------------
----UNION ALL

--SELECT 
--		ROW_NUMBER () OVER ( ORDER By CAST(CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2)) AS DATE)	 )						AS 'GameNumber'
--		,IIF(		ROW_NUMBER () OVER ( ORDER By CAST(CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2)) AS DATE)	 ) <11
--				,1,
--				LEFT (	ROW_NUMBER () OVER ( ORDER By CAST(CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2)) AS DATE))-1
--				,LEN(	ROW_NUMBER () OVER ( ORDER By CAST(CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2)) AS DATE)))-1)+1)	AS 'GameWeek'		
--		,CAST(CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2)) AS DATE)														AS 'MatchDay'			
--	,'2004/2005'										AS 'Season'
--		,'Greece'											AS 'Country'
--		,'Super League'									AS 'League'
--		,1													AS 'Division'
--		,HomeTeam											AS 'HomeTeam'
--		,AwayTeam											AS 'AwayTeam'
--		,FTHG												AS 'FullTimeHomeGoal'
--		,FTAG												AS 'FullTimeAwayGoal'
--		,FTR												AS 'FullTimeResult'
--		,HTHG												AS 'HalfTimeHomeGoal'
--		,HTAG												AS 'HalfTimeAwayGoal'
--		,HTR												AS 'HalfTimeResult'
--		,HS													AS 'HomeShots'				
--		,[AS]												AS 'AwayShots'
--		,HST												AS 'HomeShotTarget'
--		,AST												AS 'AwayShotTarget'
--		,HF													AS 'HomeFouls'	
--		,AF													AS 'AwayFouls'
--		,HC													AS 'HomeCorners'
--		,AC													AS 'AwayCorners'
--		,HY													AS 'HomeYellow'
--		,AY													AS 'AwayYellow'
--		,HR													AS 'HomeRed'
--		,AR													AS 'AwayRed'
--				,NULL												AS 'Referee'
-- 	FROM {{source('Greece','s_0304')}}


-------------------------Super League 02/03-----------------------------
UNION ALL

	SELECT 
		ROW_NUMBER () OVER ( ORDER By CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2))	 )						AS 'GameNumber'
		,IIF(		ROW_NUMBER () OVER ( ORDER By CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2)) 	 ) <11
				,1,
				LEFT (	ROW_NUMBER () OVER ( ORDER By CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2)) )-1
				,LEN(	ROW_NUMBER () OVER ( ORDER By CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2)) ))-1)+1)	AS 'GameWeek'	
		,CAST(CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2)) AS DATE)											AS 'MatchDay'	
		,'2002/2003'										AS 'Season'
		,'Greece'											AS 'Country'
		,'Super League'									AS 'League'
		,1													AS 'Division'
		,HT													AS 'HomeTeam'
		,AT													AS 'AwayTeam'
		,FTHG												AS 'FullTimeHomeGoal'
		,FTAG												AS 'FullTimeAwayGoal'
		,FTR												AS 'FullTimeResult'
		,HTHG												AS 'HalfTimeHomeGoal'
		,HTAG												AS 'HalfTimeAwayGoal'
		,HTR												AS 'HalfTimeResult'
		,NULL												AS 'HomeShots'				
		,NULL												AS 'AwayShots'
		,NULL												AS 'HomeShotTarget'
		,NULL												AS 'AwayShotTarget'
		,NULL												AS 'HomeFouls'	
		,NULL												AS 'AwayFouls'
		,NULL												AS 'HomeCorners'
		,NULL												AS 'AwayCorners'
		,NULL												AS 'HomeYellow'
		,NULL												AS 'AwayYellow'
		,NULL												AS 'HomeRed'
		,NULL												AS 'AwayRed'
		,NULL												AS 'Referee'

	FROM {{source('Greece','s_0203')}}


-------------------------Super League 01/02-----------------------------
/*UNION ALL

	SELECT 
		ROW_NUMBER () OVER ( ORDER By CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2))	 )						AS 'GameNumber'
		,IIF(		ROW_NUMBER () OVER ( ORDER By CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2)) 	 ) <11
				,1,
				LEFT (	ROW_NUMBER () OVER ( ORDER By CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2)) )-1
				,LEN(	ROW_NUMBER () OVER ( ORDER By CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2)) ))-1)+1)	AS 'GameWeek'		
		,CONCAT('20',RIGHT(Date,2),'-',LEFT(RIGHT(Date,5),2),'-',LEFT(RIGHT(Date,8),2))															AS 'MatchDay'		
		,'2001/2002'										AS 'Season'
		,'Greece'											AS 'Country'
		,'Super League'										AS 'League'	
		,1													AS 'Division'
		,HomeTeam											AS 'HomeTeam'
		,AwayTeam											AS 'AwayTeam'
		,FTHG												AS 'FullTimeHomeGoal'
		,FTAG												AS 'FullTimeAwayGoal'
		,FTR												AS 'FullTimeResult'
		,HTHG												AS 'HalfTimeHomeGoal'
		,HTAG												AS 'HalfTimeAwayGoal'
		,HTR												AS 'HalfTimeResult'
		,NULL												AS 'HomeShots'				
		,NULL												AS 'AwayShots'
		,NULL												AS 'HomeShotTarget'
		,NULL												AS 'AwayShotTarget'
		,NULL												AS 'HomeFouls'	
		,NULL												AS 'AwayFouls'
		,NULL												AS 'HomeCorners'
		,NULL												AS 'AwayCorners'
		,NULL												AS 'HomeYellow'
		,NULL												AS 'AwayYellow'
		,NULL												AS 'HomeRed'
		,NULL												AS 'AwayRed'
		,NULL												AS 'Referee'
	
	FROM {{source('Greece','s_0102')}}
*/
-------------------------Super League 00/01-----------------------------
UNION ALL

	SELECT  
		ROW_NUMBER () OVER ( ORDER By date )				AS 'GameNumber'
		,IIF(ROW_NUMBER () OVER ( ORDER By date ) <11,1,LEFT (ROW_NUMBER () OVER ( ORDER By date )-1,	LEN(ROW_NUMBER () OVER ( ORDER By date ))-1)+1)		 AS 'GameWeek'
		,Date												AS 'MatchDay'
		,'2000/2001'										AS 'Season'
		,'Greece'											AS 'Country'
		,'Super League'										AS 'League'
		,1													AS 'Division'
		,Ht													AS 'HomeTeam'
		,AT													AS 'AwayTeam'
		,FTHG												AS 'FullTimeHomeGoal'
		,FTAG												AS 'FullTimeAwayGoal'
		,FTR												AS 'FullTimeResult'
		,HTHG												AS 'HalfTimeHomeGoal'
		,HTAG												AS 'HalfTimeAwayGoal'
		,HTR												AS 'HalfTimeResult'
		,NULL												AS 'HomeShots'				
		,NULL												AS 'AwayShots'
		,NULL												AS 'HomeShotTarget'
		,NULL												AS 'AwayShotTarget'
		,NULL												AS 'HomeFouls'	
		,NULL												AS 'AwayFouls'
		,NULL												AS 'HomeCorners'
		,NULL												AS 'AwayCorners'
		,NULL												AS 'HomeYellow'
		,NULL												AS 'AwayYellow'
		,NULL												AS 'HomeRed'
		,NULL												AS 'AwayRed'
		,NULL												AS 'Referee'

	FROM {{source('Greece','s_0001')}}


