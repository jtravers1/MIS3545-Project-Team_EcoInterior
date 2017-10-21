/*Teamname : Eco-Interior Group Members: Jamie Traverso, Gyda Sumadi, and Eshika Agarwal */

USE EcoInteriorDb;
GO

/*1. View all rows for each table*/
SELECT * FROM Customer;
SELECT * FROM Supplier;
SELECT * FROM Product;
SELECT * FROM OrderHeader;
SELECT * FROM OrderDetail;

/*2. Use aggregate function to find total quantity sold for each product*/
SELECT d.ProductID,
p.ProductName,
SUM(d.Quantity) AS Total_Quantity
FROM OrderDetail as d 
JOIN Product as p
ON p.ProductID = d.ProductID
GROUP BY d.ProductID, p.ProductName;

/*3. Use inner join to show number of orders per customer*/
SELECT c.FirstName,
c.LastName,
COUNT(h.OrderID) AS Number_of_Orders
FROM Customer AS c 
INNER JOIN OrderHeader AS h
ON c.CustomerID = h.CustomerID
GROUP BY c.CustomerID,c.FirstName, c.LastName;

/*4. Use outer join to display total spent per customer*/
SELECT c.FirstName,
c.LastName,
SUM(h.TotalDue) AS Total_Amount
FROM Customer AS c 
LEFT JOIN OrderHeader AS h
ON c.CustomerID = h.CustomerID
GROUP BY c.CustomerID, c.FirstName,c.LastName
ORDER BY SUM(h.TotalDue) DESC;
/*Outer join is necessary for this query because for some customers we do not have any order information, they may not have ordered anything in the time frame we have data for */

/*5. Use a subquery  to show orders where the total due was above the average total due */
SELECT OrderID
, TotalDue
FROM OrderHeader
WHERE TotalDue > 
      (
	  SELECT AVG(TotalDue)
	  FROM OrderHeader
	  )
ORDER BY TotalDue DESC;
