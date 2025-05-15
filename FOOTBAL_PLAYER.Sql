SELECT *
  FROM [dbo].['Football Players Data$']

GO
--1	Write a query to find all the players in the "Arizona" team.
SELECT *
FROM [dbo].['Football Players Data$']
WHERE Team = 'Arizona'


--2	Write a query to find all the players who play as a "WR" (Wide Receiver).
SELECT*
FROM [dbo].['Football Players Data$']
WHERE Pos = 'WR'


--3	Write a query to list all players taller than 6 feet 2 inches.
SELECT *
FROM ['Football Players Data$']
WHERE [Ft] >=6 AND [In]>2

--4	Write a query to find all players who attended the "Washington" college.
SELECT *
FROM ['Football Players Data$']
WHERE College = 'Washington'


--5	Write a query to list players who are 25 years old or younger 
UPDATE [dbo].['Football Players Data$']
SET Age = NULL
WHERE Age = 'N/A'

ALTER TABLE [dbo].['Football Players Data$']
ALTER COLUMN [Age] INT

SELECT*
FROM ['Football Players Data$']
WHERE Age <=25

--6	Write a query to find all players with missing Age data.
SELECT *
FROM [dbo].['Football Players Data$']
WHERE [Age] IS NULL


--7	Write a query to find players who are rookies (Exp = 'R').
SELECT*
FROM [dbo].['Football Players Data$']
WHERE Exp = 'R'

--8	Write a query to find the tallest player on the "New Orleans" team.

WITH Tallest_Player as (
SELECT *
		,MAX([Inches]) OVER () as [Tallest Player]
FROM [dbo].['Football Players Data$']
WHERE Team = 'New Orleans'
		)
SELECT*
FROM Tallest_Player
WHERE [Inches] = [Tallest Player]

--9	Write a query to find players weighing more than 250 pounds.
SELECT*
FROM [dbo].['Football Players Data$']
WHERE [Wt] >250


--10	Write a query to calculate the average height of players at each position.
SELECT [Team],[NAME ], [Pos]
		,AVG(inches) OVER(PARTITION BY [Pos]) AS [Average Height]
FROM [dbo].['Football Players Data$']

ALTER TABLE [dbo].['Football Players Data$']
ALTER COLUMN [Ht] INT

--11  Write a query to find the heaviest player for each position.

WITH [New Table] As (
SELECT [NAME ],[Pos],[Wt]
		 ,MAX ([Wt]) OVER(PARTITION BY [Pos]) AS [Highest Weight]
FROM ['Football Players Data$']
)
Select *
FROM [New Table]
Where [Highest Weight] =[Wt]

 
--12  Write a query to rank players by age within their team. If two players have the same age, rank them by their weight.

SELECT   [Team]
		,[NAME ]
		,[Age]
,RANK() OVER (PARTITION BY TEAM ORDER BY AGE DESC, WT DESC) AS  Players_Ranking
FROM [dbo].['Football Players Data$']

--13  Write a query to calculate the average height (in inches) for all players older than 25 years.
SELECT*
	,AVG([Inches]) OVER(PARTITION BY [Team]) AS Average_Height
FROM [dbo].['Football Players Data$']
WHERE Age > 25


--14  Write a query to find all players whose height is greater than the average height of their respective team.
WITH AVG2 AS  (
SELECT *
		,AVG([Inches]) OVER (PARTITION BY [Team]) As Average_Height
FROM [dbo].['Football Players Data$']
		)
SELECT *
FROM AVG2
WHERE [Inches] > Average_Height

--15   Write a query to find all players who share the same last name.
WITH Dupp_Lastname AS (
SELECT [FirstName]
		,[LastName]
		,ROW_NUMBER () OVER (PARTITION BY LastName ORDER BY LastName) AS [Dup LASTNAME]
FROM [dbo].['Football Players Data$']
						)
SELECT *
FROM Dupp_Lastname
WHERE [Dup LASTNAME] >=2

--16  Write a query to find the players with the minimum height for each position.
WITH MiniH AS (
SELECT [NAME ],[Pos],[Inches]
		,MIN([Inches]) OVER(PARTITION BY [POS]) As Min_Weight
FROM [dbo].['Football Players Data$']
			)
SELECT *
FROM MiniH
WHERE Inches = Min_Weight

--17  Write a query to get the number of players for each team grouped by their experience level. 
WITH PEL AS (
SELECT [Team], [Exp]
		, COUNT ([Team]) OVER (PARTITION BY [Exp]  ORDER BY [Team] ASC) AS [Number of Players]
FROM [dbo].['Football Players Data$']
		)
SELECT DISTINCT*
FROM PEL

--18 Write a query to find the tallest and shortest players from each college.
WITH TSP AS (
SELECT [College],[NAME ],[Inches]
		, MAX ([Inches]) OVER (PARTITION BY [College])AS Tallest_Player
		, MIN ([Inches])  OVER( PARTITION BY [College]) AS Shortest_Player
FROM [dbo].['Football Players Data$']
			)
SELECT *
FROM TSP
WHERE [Inches] = Tallest_Player
OR [Inches]= Shortest_Player

--19 Write a query to find all players whose weight is above the average weight for their respective position.

WITH ABOVE AS (
SELECT [NAME ],[Pos],[Wt]
		,AVG([Wt]) OVER(PARTITION BY [Pos] ORDER BY [Pos]) AS Average_Weight
FROM [dbo].['Football Players Data$']
	)
SELECT *
FROM ABOVE
WHERE [Wt]> Average_Weight


--20 Write a query to calculate the percentage of players in each position for every team????
SELECT [Pos]
		,[Team]
		,COUNT([NAME ]) Number_of_Players
		,ROUND((COUNT([NAME ]) * 100/ SUM(COUNT([NAME ])) OVER (PARTITION BY [Team])), 2)  Percentage
FROM [dbo].['Football Players Data$']
GROUP BY [Pos], [Team]

