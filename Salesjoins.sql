USE [SQL PRACTICE]
GO

SELECT [Customer_ID]
      ,[Customer_Name]
      ,[City]
      ,[Grade]
      ,[Salesman_ID]
  FROM [dbo].[Customer$]

GO

SELECT [Salesman_id]
      ,[Name]
      ,[city]
      ,[commission]
  FROM [dbo].[Salesman$]

GO

SELECT [Order Number]
      ,[Purchase_Amount]
      ,[Order Date]
      ,[Customer ID]
      ,[Salesman_id]
  FROM [dbo].[Order$]

GO

--1	write a SQL query to find the salesperson and customer who reside in the same city. Return Salesman, cust_name and city.
SELECT  C.[Customer_Name]
        ,S.[Name] AS Salesman
	   ,C.[City]	  
FROM [dbo].[Customer$] AS C
LEFT JOIN [dbo].[Salesman$] AS S
ON C.Salesman_ID = S.Salesman_ID
WHERE C.City =  S.City

--2	write a SQL query to find those orders where the order amount exists between 500 and 2000. Return ord_no, purch_amt, cust_name, city.
SELECT O.[Order Number]
		,C.[Customer_Name]
		,C.[City]
		,O.[Purchase_Amount]
FROM [dbo].[Order$] AS O
LEFT JOIN [dbo].[Customer$] AS C
ON C.Salesman_ID =  O.Salesman_ID
WHERE O.[Purchase_Amount] BETWEEN 500 and 2000


--3	write a SQL query to find the salesperson(s) and the customer(s) he represents. Return Customer Name, city, Salesman, commission.

SELECT S.[Name] AS Salesperson
		,C.[Customer_Name]
		,C.[City]
		,S.[commission]
FROM [dbo].[Customer$] AS C
LEFT JOIN [dbo].[Salesman$] AS S
ON S.[Salesman_id] = C.[Salesman_id]

--4	write a SQL query to find salespeople who received commissions of more than 12 percent from the company. Return Customer Name, customer city, Salesman, commission.  
SELECT S.[Name] AS Salesperson
		,C.[Customer_Name]
		,C.[City]
		,S.[commission]
FROM [dbo].[Customer$] AS C
LEFT JOIN [dbo].[Salesman$] AS S
ON S.[Salesman_id] = C.[Salesman_id]
WHERE [commission] > 0.12

--5	write a SQL query to locate those salespeople who do not live in the same city where their customers live and have received a commission of more than 12% from the company. Return Customer Name, customer city, Salesman, salesman city, commission.  
SELECT		S.[Name] AS Salesperson
			,S.[city]
			,C.[Customer_Name]
			, C.[City]
			,S.[commission]
FROM [dbo].[Salesman$] AS S
LEFT JOIN [dbo].[Customer$] AS C
ON  C.[Salesman_id] = S.[Salesman_id]
WHERE C.[city] <> S.[city]
AND [commission] > 0.12

--6	write a SQL query to find the details of an order. Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman, commission.
SELECT   O.[Order Number]
		,O.[Order Date]
	     ,O. [Purchase_Amount]
		 ,C.[Customer_Name]
		 ,C.[Grade]
		 ,S.[Name] AS Salesman
		,S.[commission]
FROM [dbo].[Order$] AS O
 JOIN [dbo].[Customer$] AS C ON  C.[Customer_ID] = O.[Customer ID]
 JOIN[dbo].[Salesman$] AS S  ON  S.[Salesman_ID] = O.[Salesman_ID]


--7	Write a SQL statement to join the tables salesman, customer and orders so that the same column of each table appears once and only the relational rows are returned. 
SELECT C.[Customer_ID]
		,C.[Customer_Name]
		,C.[City]
		,C.[Grade]
		,C.[Salesman_ID]
		,O.[Order Number]
		,O.[Purchase_Amount]
		,O.[Order Date]
		,S.[Salesman_id]
		,S.[Name]
		,S.[city]
		,S.[commission]
FROM [dbo].[Order$] AS O
 JOIN [dbo].[Customer$] AS C ON  C.[Customer_ID] = O.[Customer ID]
 JOIN[dbo].[Salesman$] AS S  ON  S.[Salesman_ID] = O.[Salesman_ID]


--8	write a SQL query to display the customer name, customer city, grade, salesman, salesman city. The results should be sorted by ascending customer_id.
SELECT	C.[Customer_Name]
		,C.[City]
		,C.[Grade]
		,S.[Salesman]
		,S.[Salesman City]
FROM [dbo].[Customer$] AS C
LEFT JOIN [dbo].[Salesman$] AS S
ON S.[Salesman_id] = C.Salesman_ID
ORDER BY C.Customer_ID ASC
		
--9	write a SQL query to find those customers with a grade less than 300. Return cust_name, customer city, grade, Salesman, salesmancity. The result should be ordered by ascending customer_id.
SELECT C.[Customer_Name]
		,C.[City]
		,C.[Grade]
		,S.[Salesman]
		,S.[Salesman City]
FROM [dbo].[Customer$] AS C
LEFT JOIN [dbo].[Salesman$] AS S 
ON  S.[Salesman_id] = C.Salesman_ID
WHERE C.[Grade] < 300
ORDER BY C.[Customer_ID] ASC

--10	Write a SQL statement to make a report with customer name, city, order number, order date, and order amount in ascending order according to the order date to determine whether any of the existing customers have placed an order or not.
SELECT C.[Customer_Name]
	  ,C.[City]
	  ,O.[Order Number]
	  ,O.[Order Date]
	  ,O.[Purchase_Amount]
FROM [dbo].[Order$] AS O
LEFT JOIN [dbo].[Customer$]AS C
ON O.[Customer ID] = C.[Customer_ID]
ORDER BY O.[Order Date] ASC

--11	SQL statement to generate a report with customer name, city, order number, order date, order amount, salesperson name, and commission to determine if any of the existing customers have not placed orders or if they have placed orders through their salesman or by themselves.
SELECT C.[Customer_Name]
	  ,C.[City]
	  ,O.[Order Number]
	  ,O.[Order Date]
	  ,O.[Purchase_Amount]
	  ,S.[Salesman]
	  ,S.[commission]
FROM Order$ AS O
LEFT JOIN Customer$ AS C ON C.Customer_ID = O.[Customer ID]
LEFT JOIN Salesman$ AS S ON S.Salesman_id = O.Salesman_id

--12	Write a SQL statement to generate a list in ascending order of salespersons who work either for one or more customers or have not yet joined any of the customers.
SELECT DISTINCT S.[Salesman]
				,S.[Salesman_id]
FROM [dbo].[Salesman$] AS S
LEFT JOIN [dbo].[Customer$] AS C 
ON S.[Salesman_id] = S.[Salesman_ID]
ORDER BY S.[Salesman] ASC

--13	write a SQL query to list all salespersons along with customer name, city, grade, order number, date, and amount.
SELECT DISTINCT  S.[Salesman]
		,C.[Customer_Name]
		,C.[City]
		,C.[Grade]
		,O.[Order Number]
		,O.[Order Date]
		,O.[Purchase_Amount]
FROM Customer$ as C
LEFT JOIN Salesman$ AS S ON S.Salesman_id = C.Salesman_ID
LEFT JOIN Order$ AS O ON O.[Customer ID] = C.Customer_ID

--14	Write a SQL statement to make a list for the salesmen who either work for one or more customers or yet to join any of the customer. The customer may have placed, either one or more orders on or above order amount 2000 and must have a grade, or he may not have placed any order to the associated supplier.
SELECT DISTINCT S.[Salesman]
		,C.Customer_Name
		,O.[Purchase_Amount]
		,C.[Grade]
FROM [dbo].[Salesman$] AS S
JOIN [dbo].[Order$] AS O ON O.[Salesman_id]= S.[Salesman_id]
JOIN [dbo].[Customer$] AS C ON C.[Salesman_id]= S.[Salesman_id]
WHERE ([Purchase_Amount] >= 2000 and c.grade IS NOT NULL)
OR C.customer_id IS NULL 


--15	For those customers from the existing list who put one or more orders, or which orders have been placed by the customer who is not on the list, create a report containing the customer name, city, order number, order date, and purchase amount
SELECT C.[Customer_Name]
		,C.[City]
		,O.[Order Number]
		,O.[Order Date]
		,O.[Purchase_Amount]
FROM Customer$ AS C
JOIN Order$ AS O 
ON C.[Customer_ID]=  O.[Customer ID]


--16	Write a SQL statement to generate a report with the customer name, city, order no. order date, purchase amount for only those customers on the list who must have a grade and placed one or more orders or which order(s) have been placed by the customer who neither is on the list nor has a grade.
SELECT	C.[Customer_Name]
		,C.[City]
		,O.[Order Number]
		,O.[Order Date]
		,O.[Purchase_Amount]
FROM [dbo].[Order$] AS O
LEFT JOIN [dbo].[Customer$] AS C 
ON  C.[Customer_ID]=  O.[Customer ID]
WHERE ([Grade] IS NOT NULL AND [Purchase_Amount] >1)

--17	Write a SQL query to combine each row of the salesman table with each row of the customer table.
SELECT S.[Salesman_id]
		,S.[Salesman]
		,S.[commission]
		,C.[Customer_ID]
		,C.[Customer_Name]
		,C.[City]
		,C.[Grade]
	FROM Salesman$ AS S
CROSS JOIN Customer$ AS C
ORDER BY S.[Salesman_ID], C.[Salesman_ID]

--18	Write a SQL statement to create a Cartesian product between salesperson and customer, i.e. each salesperson will appear for all customers and vice versa for that salesperson who belongs to that city.
SELECT S.[Salesman_id]
		,S.[Salesman]
		,C.[Customer_ID]
		,C.[Customer_Name]
		,C.[City]
FROM [dbo].[Salesman$]AS S
CROSS JOIN [dbo].[Customer$] AS C 
ORDER BY C.[City], S.[Salesman]
    
--19	Write a SQL statement to create a Cartesian product between salesperson and customer, i.e. each salesperson will appear for every customer and vice versa for those salesmen who belong to a city and customers who require a grade.
SELECT S.[Salesman_id]
		,S.[Salesman]
		,S.[Salesman City]
		,C.[Customer_Name]
		,C.City
		,C.[Grade]
		FROM [dbo].[Salesman$] AS S
CROSS JOIN [dbo].[Customer$] AS C
WHERE S.[Salesman City] IS NOT NULL
AND C.Grade IS NOT NULL


--20	Write a SQL statement to make a Cartesian product between salesman and customer i.e. each salesman will appear for all customers and vice versa for those salesmen who must belong to a city which is not the same as his customer and the customers should have their own grade.
SELECT S.[Salesman_id]
		,S.[Salesman]
		,S.[Salesman City]
		,C.[Customer_Name]
		,C.City
		,C.[Grade]
		FROM [dbo].[Salesman$] AS S
CROSS JOIN [dbo].[Customer$] AS C
WHERE S.[Salesman City] <> C.City
AND C.Grade IS NOT NULL