USE FlexPhone

-- 1
SELECT
[ID] = CONCAT('Customer', RIGHT(c.CustomerID, 1)),
CustomerName,
CustomerGender,
[Total Amount of Spending] = SUM(PhonePrice * Quantity)
FROM Customer c JOIN SalesTransaction st ON c.CustomerID = st.CustomerID
JOIN SalesTransactionDetail std ON std.SalesTransactionID = st.SalesTransactionID
JOIN Phone p ON p.PhoneID = std.PhoneID
GROUP BY c.CustomerID, CustomerName, CustomerGender

-- 2
SELECT
[Staff ID] = s.StaffID,
[Name] = SUBSTRING(s.StaffName, 1, CHARINDEX(' ', s.StaffName) -1),
[CustomerCount] = COUNT(c.CustomerID)
FROM Staff s JOIN SalesTransaction st ON s.StaffID = st.StaffID
JOIN Customer c ON c.CustomerID = st.CustomerID
WHERE s.StaffName LIKE ('% %')
GROUP BY s.StaffID, StaffName

-- 3
SELECT
[CustomerID] = CONCAT('Customer', RIGHT(c.CustomerID, 1)),
CustomerName,
pb.BrandName,
[Total Spending] = SUM(PhonePrice * Quantity)
FROM Customer c JOIN SalesTransaction st ON c.CustomerID = st.CustomerID
JOIN SalesTransactionDetail std ON std.SalesTransactionID = st.SalesTransactionID
JOIN Phone p ON p.PhoneID = std.PhoneID
JOIN PhoneBrand pb ON pb.PhoneBrandID = p.PhoneBrandID
WHERE c.CustomerName LIKE ('% %')
GROUP BY c.CustomerID, c.CustomerName, p.PhoneBrandID, pb.BrandName
HAVING COUNT(p.PhoneID) > 3

-- 4
SELECT
[Staff ID] = s.StaffID,
[Email] = SUBSTRING(s.StaffEmail, 1, CHARINDEX('@', s.StaffEmail) -1) + '@Ymail.com',
[Phone Brand] = pb.BrandName,
[Total Selling] = SUM(PhonePrice * Quantity)
FROM Staff s JOIN SalesTransaction st ON s.StaffID = st.StaffID
JOIN SalesTransactionDetail std ON std.SalesTransactionID = st.SalesTransactionID
JOIN Phone p ON p.PhoneID = std.PhoneID
JOIN PhoneBrand pb ON pb.PhoneBrandID = p.PhoneBrandID
GROUP BY s.StaffID, s.StaffEmail, pb.BrandName
HAVING COUNT(p.PhoneID) > 2
ORDER BY [Staff ID] ASC

-- 5
SELECT
[Staff Email] = StaffEmail,
[Staff Gender] = StaffGender,
[Date of Birth] = CONVERT(VARCHAR, StaffDOB, 106),
[Salary] = 'Rp.' + CAST(StaffSalary AS VARCHAR) + ',00.'
FROM Staff,
(SELECT SalaryAverage = AVG(StaffSalary) FROM Staff) AS aliasSubQuery
WHERE YEAR(GETDATE()) - YEAR(StaffDOB) > 30 AND StaffSalary > aliasSubQuery.SalaryAverage

-- 6
SELECT
s.StaffID,
StaffName,
[StaffPhone] = REPLACE(StaffPhoneNumber, '+62', '08'),
[Total Selling] = SUM(PhonePrice * Quantity)
FROM Staff s JOIN SalesTransaction st ON s.StaffID = st.StaffID
JOIN SalesTransactionDetail std ON std.SalesTransactionID = st.SalesTransactionID
JOIN Phone p ON p.PhoneID = std.PhoneID,
	(SELECT [Total Selling] = SUM(PhonePrice * Quantity)
		FROM Staff s JOIN SalesTransaction st ON s.StaffID = st.StaffID
		JOIN SalesTransactionDetail std ON std.SalesTransactionID = st.SalesTransactionID
		JOIN Phone p ON p.PhoneID = std.PhoneID) AS aliasSubQuery
WHERE StaffGender LIKE 'Male' AND aliasSubQuery.[Total Selling] BETWEEN 10000000 AND 100000000
GROUP BY s.StaffID, StaffName, StaffPhoneNumber

-- 7
SELECT
[Staff No] = CONCAT('Staff No', RIGHT(s.StaffID, 1)),
StaffName,
[Email] = SUBSTRING(s.StaffEmail, 1, CHARINDEX('@', s.StaffEmail) -1) + '@gmail.com',
[Date Of Birth] = CONVERT(VARCHAR, StaffDOB, 103),
[Customer Count] = COUNT(c.CustomerID)
FROM Staff s JOIN SalesTransaction st ON s.StaffID = st.StaffID
JOIN Customer c ON c.CustomerID = st.CustomerID
GROUP BY s.StaffID, StaffName, StaffEmail, StaffDOB
HAVING COUNT(c.CustomerID) = 
	(SELECT MAX(aliasSubQuery.CustomerCount) FROM
		(SELECT [CustomerCount] = COUNT(st.CustomerID)
			FROM Staff s JOIN SalesTransaction st ON s.StaffID = st.StaffID
			JOIN Customer c ON c.CustomerID = st.CustomerID
			GROUP BY s.StaffID, StaffName, StaffEmail, StaffDOB) AS aliasSubQuery)

-- 8
SELECT
pb.PhoneBrandID,
[PhoneBrand] = BrandName,
c.CustomerID,
CustomerName,
[Customer Email] = SUBSTRING(CustomerEmail, 1, CHARINDEX('@', CustomerEmail) -1) + '@Gmail.com',
[Qty] = SUM(Quantity)
FROM PhoneBrand pb JOIN Phone p ON pb.PhoneBrandID = p.PhoneBrandID
JOIN SalesTransactionDetail std ON std.PhoneID = p.PhoneID
JOIN SalesTransaction st ON st.SalesTransactionID = std.SalesTransactionID
JOIN Customer c ON c.CustomerID = st.CustomerID
WHERE CustomerEmail LIKE '%bluejack.com' AND RIGHT(c.CustomerID, 1) % 2 = 0
GROUP BY pb.PhoneBrandID, BrandName, c.CustomerID, CustomerName, CustomerEmail
HAVING SUM(Quantity) = 
	(SELECT MAX(aliasSubQuery.QtyCount) FROM
		(SELECT [QtyCount] = SUM(Quantity)
		FROM PhoneBrand pb JOIN Phone p ON pb.PhoneBrandID = p.PhoneBrandID
			JOIN SalesTransactionDetail std ON std.PhoneID = p.PhoneID
			JOIN SalesTransaction st ON st.SalesTransactionID = std.SalesTransactionID
			JOIN Customer c ON c.CustomerID = st.CustomerID
			GROUP BY pb.PhoneBrandID, BrandName, c.CustomerID, CustomerName, CustomerEmail) AS aliasSubQuery)
ORDER BY pb.PhoneBrandID ASC

-- 9
GO
CREATE VIEW [Vendor_Brand_Transaction_View] AS
SELECT
[VendorID] = LEFT(v.VendorID, 4) + 'Vendor' + RIGHT(v.VendorID, 1),
VendorName,
[PhoneNumber] = REPLACE(VendorPhoneNumber, '+62', '08'),
[PhoneBrand] = pb.BrandName,
[Transaction Count] = COUNT(pt.PurchaseTransactionID),
[Total Transaction] = SUM(PhonePrice * Quantity)
FROM Vendor v JOIN PurchaseTransaction pt ON v.VendorID = pt.VendorID
JOIN PurchaseTransactionDetail ptd ON ptd.PurchaseTransactionID = pt.PurchaseTransactionID
JOIN Phone p ON p.PhoneID = ptd.PhoneID
JOIN PhoneBrand pb ON pb.PhoneBrandID = p.PhoneBrandID
GROUP BY v.VendorID, VendorName, VendorPhoneNumber, pb.BrandName
GO
SELECT * FROM Vendor_Brand_Transaction_View

-- 10
GO
CREATE VIEW [Staff_Selling_View] AS
SELECT
s.StaffID,
StaffName,
[Sold Phone Count] = CAST(SUM(Quantity) AS VARCHAR) + 'pc(s)',
[Total Transaction] = 'Rp.' + CAST(SUM(PhonePrice * Quantity) AS VARCHAR) + ',00.',
[Count Brand] = aliasSubQuery.BrandCount
FROM Staff s JOIN SalesTransaction st ON s.StaffID = st.StaffID
JOIN SalesTransactionDetail std ON std.SalesTransactionID = st.SalesTransactionID
JOIN Phone p ON p.PhoneID = std.PhoneID
JOIN PhoneBrand pb ON pb.PhoneBrandID = p.PhoneBrandID,
(SELECT [BrandCount] = COUNT(pb.PhoneBrandID)
	FROM Staff s JOIN SalesTransaction st ON s.StaffID = st.StaffID
	JOIN SalesTransactionDetail std ON std.SalesTransactionID = st.SalesTransactionID
	JOIN Phone p ON p.PhoneID = std.PhoneID
	JOIN PhoneBrand pb ON pb.PhoneBrandID = p.PhoneBrandID) AS aliasSubQuery
WHERE StaffEmail LIKE '%@bluejack.com'
GROUP BY s.StaffID, StaffName, aliasSubQuery.BrandCount
GO
SELECT * FROM Staff_Selling_View