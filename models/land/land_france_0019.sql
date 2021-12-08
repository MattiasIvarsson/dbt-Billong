{{config(materialized='view', tags='football')}}

SELECT
	CONCAT(MatchDay,HomeTeam,AwayTeam) AS match_key
	,GameNumber
	,GameWeek
	,CAST(MatchDay AS DATE)    AS MatchDay
	--,MatchTime
	,Season
	,Country
	,REPLACE(REPLACE(League,' "',''),'"','') AS League
	,Division
	,HomeTeam
	,AwayTeam
	,CASE WHEN Referee			='NULL' THEN NULL ELSE Referee				END AS Referee
	,CASE WHEN FullTimeHomeGoal	='NULL' THEN NULL ELSE FullTimeHomeGoal		END AS FullTimeHomeGoal
	,CASE WHEN FullTimeAwayGoal	='NULL' THEN NULL ELSE FullTimeAwayGoal		END AS FullTimeAwayGoal
	,CASE WHEN FullTimeResult	='NULL' THEN NULL ELSE FullTimeResult		END AS FullTimeResult
	,CASE WHEN HalfTimeHomeGoal	='NULL' THEN NULL ELSE HalfTimeHomeGoal		END AS HalfTimeHomeGoal
	,CASE WHEN HalfTimeAwayGoal	='NULL' THEN NULL ELSE HalfTimeAwayGoal		END AS HalfTimeAwayGoal
	,CASE WHEN HalfTimeResult	='NULL' THEN NULL ELSE HalfTimeResult		END AS HalfTimeResult
	,CASE WHEN HomeShots		='NULL' THEN NULL ELSE HomeShots			END AS HomeShots
	,CASE WHEN AwayShots		='NULL' THEN NULL ELSE AwayShots			END AS AwayShots
	,CASE WHEN HomeShotTarget	='NULL' THEN NULL ELSE HomeShotTarget		END AS HomeShotTarget
	,CASE WHEN AwayShotTarget	='NULL' THEN NULL ELSE AwayShotTarget		END AS AwayShotTarget
	,CASE WHEN HomeFouls		='NULL' THEN NULL ELSE HomeFouls			END AS HomeFouls
	,CASE WHEN AwayFouls		='NULL' THEN NULL ELSE AwayFouls			END AS AwayFouls
	,CASE WHEN HomeCorners		='NULL' THEN NULL ELSE HomeCorners			END AS HomeCorners
	,CASE WHEN AwayCorners		='NULL' THEN NULL ELSE AwayCorners			END AS AwayCorners
	,CASE WHEN HomeYellow		='NULL' THEN NULL ELSE HomeYellow			END AS HomeYellow
	,CASE WHEN AwayYellow		='NULL' THEN NULL ELSE AwayYellow			END AS AwayYellow
	,CASE WHEN HomeRed			='NULL' THEN NULL ELSE HomeRed				END AS HomeRed
	,CASE WHEN AwayRed			='NULL' THEN NULL ELSE AwayRed				END AS AwayRed

FROM
    {{source('football_land', 'france_0019')}}