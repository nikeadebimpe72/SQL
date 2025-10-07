USE OrderEntry;

-- Problem set1

SELECT * FROM OrderTbl,Customer, Employee,Product, OrdLine;

SELECT  O.OrdNo , ordDate, C.CustNo, CONCAT(CustFirstName,' ',  CustLastName) AS Customer_Name,E.EmpNo, CONCAT(EmpFirstName,EmpLastName) as Employee_Name 
FROM Customer C JOIN OrderTbl O
ON   C.CustState =  O.OrdState 
JOIN Employee E 
ON E.EmpNo = O.EmpNo
WHERE C.CustState= 'CO' AND O.OrdDate BETWEEN '2021-01-01' AND '2021-01-31'



SELECT  C.CustNo, CONCAT(CustFirstName, ' ', CustLastName) AS Customer_Name, O.OrdNo , ordDate,E.EmpNo, CONCAT(EmpFirstName,EmpLastName) as Employee_Name , P.ProdNo, P.ProdName, (Qty * ProdPrice) AS Order_Cost
FROM Customer C JOIN OrderTbl O
ON   C.CustNo = O.CustNo
FULL JOIN Employee E  
ON E.EmpNo = O.EmpNo
 FULL JOIN OrdLine R
 ON R.OrdNo = O.OrdNo
 INNER JOIN Product p
 ON  P.ProdNo = R.ProdNo
 WHERE O.OrdDate = '2021-01-23' AND (Qty * ProdPrice)>25

SELECT * FROM OrderTbl,OrdLine,  Product

 SELECT O.OrdNo , sum(Qty) * P.ProdPrice AS Total_Amount
FROM  OrdLine O  JOIN PRODUCT P
ON O.ProdNo = P.ProdNo
JOIN OrderTbl R
ON O.OrdNo = R.OrdNo
WHERE R.OrdDate = '2021-01-23'
GROUP BY O.OrdNo ,p.ProdPrice

SELECT O.OrdNo,  O.OrdDate, CONCAT(CustFirstName,  ' ', CustLastName) AS Customer_Name,sum(Qty) * P.ProdPrice AS Total_Amount
FROM OrderTbl O JOIN Customer C
ON O.CustNo = C.CustNo
INNER JOIN OrdLine R
ON R.OrdNo = O.OrdNo
INNER JOIN Product P
ON P.ProdNo = R.ProdNo
WHERE O.OrdDate = '2021-01-23'
GROUP BY O.OrdNo ,P.ProdPrice, O.OrdDate, C.CustFirstName, C.CustLastName

SELECT O.OrdNo, O.OrdDate,CONCAT(CustFirstName, ' ', CustLastName) AS Customer_Name, CONCAT(EmpFirstName, ' ', EmpLastName) AS Employee_Name,
       COUNT(DISTINCT R.ProdNo) AS NumofPro, 
       SUM(R.Qty * P.ProdPrice) AS TotalAmount
FROM OrderTbl O JOIN Customer C
ON O.CustNo = C.CustNo
JOIN Employee E 
ON O.EmpNo = E.EmpNo
JOIN OrdLine R 
ON R.OrdNo = O.OrdNo
JOIN Product P
ON R.ProdNo = P.ProdNo
WHERE O.OrdDate = '2021-01-23'
GROUP BY O.OrdNo, O.OrdDate, C.CustFirstName, C.CustLastName, E.EmpFirstName, E.EmpLastName
HAVING COUNT(DISTINCT R.ProdNo) > 2;

SELECT * FROM CUSTOMER
SELECT * FROM Employee

INSERT INTO Customer (CustNo, CustFirstName, CustLastName, CustStreet, CustCity, CustState,CustZip, CustBal)
VALUES (12345, 'Adenike', 'Oloyede', 'Sherbrooke', 'New Westminster', 'BC','V3L3M5',500);

INSERT INTO Employee (EmpNo, EmpFirstName, EmpLastName,EmpPhone, EmpEMail, SupEmpNo,EmpCommRate)
VALUES ('E54321', 'Israel', 'Doe', '(566) 456-1343','israel@gmail.com','E8843211', '0.020');


UPDATE Product
SET ProdPrice = ProdPrice * 1.10
WHERE ProdName LIKE '%Ink Jet%';

DELETE FROM Customer
WHERE CustNo = '12345';

DELETE FROM Employee
WHERE EmpNo = 'E54321';


--Problem set2



SELECT CustNo,CONCAT(CustFirstName,  CustLastName) AS Customer_Name, CustBal
FROM Customer

SELECT CustNo,CONCAT(CustFirstName,  CustLastName) AS Customer_Name, CustBal
FROM Customer C
WHERE CustState = 'CO'

SELECT *
FROM Product
WHERE ProdPrice > 50
ORDER BY ProdName,ProdMfg

SELECT * FROM Customer

SELECT CustNo, CONCAT(CustFirstName,  CustLastName) AS Customer_Name, CustCity, CustBal
FROM  Customer
WHERE (CustCity = 'Denver' AND CustBal > 150)
OR (CustCity = 'Seattle' AND CustBal > 300)


SELECT  O.OrdNo, O.OrdDate, C.CustFirstName, C.CustLastName
FROM OrderTbl O JOIN Customer C
ON O.CustNo = C.CustNo
WHERE C.CustState='CO' AND O.OrdDate BETWEEN '2021-01-01' AND '2021-01-31'

SELECT CustCity, AVG(CustBal) AS Avg_Bal
FROM Customer
WHERE CustState = 'WA'
GROUP BY CustCity

SELECT CustCity, AVG(CustBal) AS Ave_Bal, COUNT(*) AS CustNo
FROM Customer
WHERE CustState = 'WA'
GROUP BY CustCity
HAVING COUNT(*) >= 2;








