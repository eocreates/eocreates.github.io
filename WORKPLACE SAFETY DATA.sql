USE [SQL PRACTICE]
GO

SELECT *
  FROM [dbo].[Workplace Safety Data]

--  1	How many incidents occurred at each plant?
SELECT [Plant],COUNT (*) AS Incident_Occured
FROM [Workplace Safety Data]
GROUP BY [Plant]

--2	What is the total incident cost per department?
SELECT [Department]
,SUM([Incident Cost])  As Total_Incident
FROM [dbo].[Workplace Safety Data]
GROUP BY [Department]

--3	Which incident type resulted in the highest total days lost?
SELECT Top (1)[Incident Type],
SUM([Days Lost]) AS Highest_days_Lost
FROM [dbo].[Workplace Safety Data]
GROUP BY [Incident Type]
ORDER BY Highest_days_Lost DESC

--4	What is the distribution of incident types by shift?
SELECT [Incident Type], [Shift]
		,COUNT (*) AS Number_Of_Incidents
FROM [dbo].[Workplace Safety Data]		
GROUP BY [Incident Type], [Shift]

--5	What is the average incident cost for each injury location?

SELECT [Injury Location]
		,AVG([Incident Cost]) AS Average_cost
FROM [dbo].[Workplace Safety Data]
GROUP BY  [Injury Location]

--6	Which age group has the highest number of incidents?
SELECT Top (1) [Age Group] 
		, COUNT (*) AS [Number of Incidents]
FROM [dbo].[Workplace Safety Data]
GROUP BY  [Age Group]
ORDER BY [Number of Incidents] DESC

--7	How many incidents were reported as 'Lost Time' by each plant?
SELECT [Plant]
		,COUNT ([Report Type]) Lost_Time
FROM [dbo].[Workplace Safety Data]
WHERE [Report Type] = 'Lost Time'
GROUP BY [Plant]
 

--8	Which department had the highest number of 'Crush & Pinch' incidents?
SELECT Top (1) [Department]
		,COUNT ([Incident Type]) AS Crush_and_pinich
FROM [dbo].[Workplace Safety Data]
WHERE [Incident Type] = 'Crush & Pinch'
GROUP BY [Department]
ORDER BY Crush_and_pinich DESC

--9	Which plants reported the most "Near Miss" incidents?
SELECT Top (1) [Plant]
		,COUNT([Report Type]) As Near_Miss_Reports
FROM [dbo].[Workplace Safety Data]
WHERE [Report Type] = 'Near Miss'
GROUP BY [Plant]
ORDER BY Near_Miss_Reports DESC

--10	What is the total number of incidents by year and month?
SELECT [Month], [Year]
		,COUNT (*) AS Total_Number_of_Incidents
FROM [dbo].[Workplace Safety Data]
GROUP BY [Month], [Year]

--11	Which gender has the most reported incidents?
SELECT Top (1) [Gender]
		, COUNT(*) as Reported_Incident
FROM [dbo].[Workplace Safety Data]
GROUP BY [Gender]
ORDER BY Reported_Incident DESC

 --12	What is the total cost of incidents per year?
 SELECT [Year]
		,SUM ([Incident Cost]) AS Total_Cost
 FROM [dbo].[Workplace Safety Data]
 GROUP BY [Year]

 
--13	Which incident year resulted in the highest cost?
SELECT Top(1) [Year] 
       ,SUM([Incident Cost]) AS total_cost
FROM [dbo].[Workplace Safety Data]
GROUP BY [Year] 
ORDER BY total_cost DESC

--14	What is the total cost of incidents for each report type?
SELECT	[Report Type]
		, SUM( [Incident Cost]) AS Total_Cost
FROM [dbo].[Workplace Safety Data]
GROUP BY [Report Type]

--15	Which departments had incidents with more than 2 days lost?
SELECT [Department]
		, COUNT (*) AS Days_Lost
FROM  [dbo].[Workplace Safety Data]
WHERE [Days Lost] > 2
GROUP BY [Department]

--16	What is the average number of days lost per incident type?
SELECT  [Incident Type]
		,AVG ([Days Lost]) AS Avg_Daylost
FROM [dbo].[Workplace Safety Data]
GROUP BY [Incident Type]

--17	What is the distribution of incidents by shift (Day, Afternoon, Night)?
SELECT [Shift]
	,COUNT (*) AS Incidents
FROM [dbo].[Workplace Safety Data]
GROUP BY [Shift]
		
--18	Which months have the highest number of incidents?
SELECT Top (1)[Month]
		,COUNT (*) As High_Incidents
FROM [dbo].[Workplace Safety Data]
GROUP BY [Month]
ORDER BY High_Incidents DESC

--19	What is the total cost of "Vehicle" related incidents?
SELECT [Incident Type]
		,SUM([Incident Cost]) AS Total_Cost
FROM [dbo].[Workplace Safety Data]
WHERE [Incident Type] = 'Vehicle'
GROUP BY [Incident Type]

--20	Which age group is most affected by "Falling Object" incidents?
SELECT TOP (1) [Age Group]
		,COUNT ([Incident Type]) AS Falling_Object_incidents
FROM [dbo].[Workplace Safety Data]
WHERE [Incident Type] ='Falling Object'
GROUP BY [Age Group]
ORDER BY Falling_Object_incidents DESC


