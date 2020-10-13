{{ config(tags=["football"])}}

with cte as (

---- HOME TEAM-----------

		SELECT
			 match_key											AS 'match_key'
			,MatchDay											AS 'MatchDay'
			,GameWeek											AS 'GameWeek'
			,GameNumber											AS 'GameNumber'
			,Season												AS 'Season'
			,Country											AS 'Country'
			,League												AS 'League'
			,'Home'												AS 'Location'
			,HomeTeam											AS 'Team'
			,AwayTeam											AS 'Opponent'
			,HomePoint											AS 'Points'
			,HomeGoal											AS 'Goals'
			,CASE	WHEN FullTimeResult = 'H' THEN 'Home'
					WHEN FullTimeResult = 'D' THEN 'Draw'
					WHEN FullTimeResult = 'A' THEN 'Away'	END AS 'Result'
			,HomeShots											AS 'Shots'
			,HomeShotTarget										AS 'ShotTarget'
			,HomeCorners										AS 'Corners'
			,HomeFouls											AS 'Fouls'
			,HomeFoulsConceded									AS 'FoulsConceded'
			,HomeRed											AS 'Red'
			,HomeYellow											AS 'Yellow'
			,BigFive											AS 'BigFive'

		FROM
			{{ref('results_games')}}


   UNION ALL

   ----------AWAY TEAM

		SELECT
			match_key											AS 'match_key'
			,MatchDay											AS 'MatchDay'
			,GameWeek											AS 'GameWeek'
			,GameNumber											AS 'GameNumber'
			,Season												AS 'Season'
			,Country											AS 'Country'
			,League												AS 'League'
			,'Away'												AS 'Location'
			,AwayTeam											AS 'Team'
			,HomeTeam											AS 'Opponent'
			,AwayPoint											AS 'Points'
			,AwayGoal											AS 'Goals'
			,CASE	WHEN FullTimeResult = 'H' THEN 'Home'
					WHEN FullTimeResult = 'D' THEN 'Draw'
					WHEN FullTimeResult = 'A' THEN 'Away'	END AS 'Result'
			,AwayShots											AS 'Shots'
			,AwayShotTarget										AS 'ShotTarget'
			,AwayCorners										AS 'Corners'
			,AwayFouls											AS 'Fouls'
			,AwayFoulsConceded									AS 'FoulsConceded'
			,AwayRed											AS 'Red'
			,AwayYellow											AS 'Yellow'
			,BigFive											AS 'BigFive'

		FROM
			{{ref('results_games')}}

	)

		SELECT
			match_key
			,MatchDay
			,ROW_NUMBER() OVER (PARTITION BY Country,Season,Team order by matchday) AS 'GameWeek'
			,GameNumber
			,Season
			,Country
			,League
			,Location
			,Team
			,Opponent
			,Points
			,SUM(Points) OVER(PARTITION BY Team,Season ORDER BY MatchDay,Season ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS Points_RT
			,Goals
			,Result
			,Shots
			,ShotTarget
			,Corners
			,Fouls
			,FoulsConceded
			,Red
			,Yellow
			,BigFive

		FROM
			cte





