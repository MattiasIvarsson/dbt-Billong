
	SELECT
		match_key
		,GameNumber
		,GameWeek
		,MatchDay
		,Season
		,Country
		,League
		,Division
		,HomeTeam
		,AwayTeam
		,1											AS 'Match'
		,FullTimeResult
		,HalfTimeResult
		,FullTimeHomeGoal							AS 'HomeGoal'
		,FullTimeAwayGoal							AS 'AwayGoal'
		,CASE	WHEN FullTimeResult = 'H' THEN 3
				WHEN FullTimeResult = 'D' THEN 1
				WHEN FullTimeResult = 'A' THEN 0 END AS 'HomePoint'
		,CASE	WHEN FullTimeResult = 'A' THEN 3
				WHEN FullTimeResult = 'D' THEN 1
				WHEN FullTimeResult = 'H' THEN 0 END AS 'AwayPoint'
		,HalfTimeHomeGoal							AS 'HT_HomeGoal'
		,HalfTimeAwayGoal							AS 'HT_AwayGoal'
		,CASE	WHEN HalfTimeResult = 'H' THEN 3
				WHEN HalfTimeResult = 'D' THEN 1
				WHEN HalfTimeResult = 'A' THEN 0 END AS 'HT_HomePoint'
		,CASE	WHEN HalfTimeResult = 'A' THEN 3
				WHEN HalfTimeResult = 'D' THEN 1
				WHEN HalfTimeResult = 'H' THEN 0 END AS 'HT_AwayPoint'
		,HomeShots
		,AwayShots
		,HomeShotTarget
		,AwayShotTarget
		,HomeFouls
		,AwayFouls
		,HomeFoulsConceded
		,AwayFoulsConceded
		,HomeCorners
		,AwayCorners
		,HomeYellow
		,AwayYellow
		,HomeRed
		,AwayRed
		,CASE WHEN Country IN ('England','Italy','France','Germany','Spain') THEN 1 ELSE 0 END AS 'BigFive'

		FROM
			{{ref('countries_union')}}