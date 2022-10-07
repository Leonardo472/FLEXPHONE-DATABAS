CREATE DATABASE FlexPhone
GO
USE FlexPhone
GO

CREATE TABLE Staff(
	StaffID CHAR(5) PRIMARY KEY CHECK(StaffID LIKE 'ST[0-9][0-9][0-9]'),
	StaffName VARCHAR(255),
	StaffEmail VARCHAR(255) CHECK(StaffEmail LIKE '%@bluejack.com' OR StaffEmail LIKE '%sunib.edu'),
	StaffDOB DATE CHECK(YEAR(StaffDOB) >= 1960),
	StaffGender VARCHAR(6) CHECK(StaffGender LIKE 'Male' OR StaffGender LIKE 'Female'),
	StaffPhoneNumber VARCHAR(15),
	StaffAddress VARCHAR(255),
	StaffSalary INT
);

CREATE TABLE Vendor(
	VendorID CHAR(5) PRIMARY KEY CHECK(VendorID LIKE 'VE[0-9][0-9][0-9]'),
	VendorName VARCHAR(255),
	VendorEmail VARCHAR(255) CHECK(VendorEmail LIKE '%@bluejack.com' OR VendorEmail LIKE '%sunib.edu'),
	VendorPhoneNumber VARCHAR(15),
	VendorAddress VARCHAR(255)
);

CREATE TABLE PhoneBrand(
	PhoneBrandID CHAR(5) PRIMARY KEY CHECK(PhoneBrandID LIKE 'PB[0-9][0-9][0-9]'),
	BrandName VARCHAR(255)
);

CREATE TABLE Phone(
	PhoneID CHAR(5) PRIMARY KEY  CHECK(PhoneID LIKE 'PO[0-9][0-9][0-9]'),
	PhoneBrandID CHAR(5),
	PhoneName VARCHAR(255),
	PhonePrice INT CHECK(PhonePrice BETWEEN 10000 AND 40000000),
	CONSTRAINT FKPhoneBrandID FOREIGN KEY (PhoneBrandID) REFERENCES PhoneBrand(PhoneBrandID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Customer(
	CustomerID CHAR(5) PRIMARY KEY CHECK(CustomerID LIKE 'CU[0-9][0-9][0-9]'),
	CustomerName VARCHAR(255) CHECK(LEN(CustomerName) >= 3),
	CustomerEmail VARCHAR(255) CHECK(CustomerEmail LIKE '%@bluejack.com' OR CustomerEmail LIKE '%sunib.edu'),
	CustomerDOB DATE,
	CustomerGender VARCHAR(255) CHECK(CustomerGender LIKE 'Male' OR CustomerGender LIKE 'Female'),
	CustomerPhoneNumber VARCHAR(15),
	CustomerAddress VARCHAR(255)
);

CREATE TABLE PurchaseTransaction(
	PurchaseTransactionID CHAR(5) PRIMARY KEY CHECK(PurchaseTransactionID LIKE 'PH[0-9][0-9][0-9]'),
	StaffID CHAR(5),
	VendorID CHAR(5),
	TransactionDate DATE,
	CONSTRAINT FKStaffID FOREIGN KEY (StaffID) REFERENCES Staff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT FKVendorID FOREIGN KEY (VendorID) REFERENCES Vendor(VendorID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE SalesTransaction(
	SalesTransactionID CHAR(5) PRIMARY KEY CHECK(SalesTransactionID LIKE 'SH[0-9][0-9][0-9]'),
	StaffID CHAR(5),
	CustomerID CHAR(5),
	TransactionDate DATE,
	CONSTRAINT FKStaffIDtr FOREIGN KEY (StaffID) REFERENCES Staff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT FKCustomerIDtr FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE PurchaseTransactionDetail(
	PurchaseTransactionID CHAR(5) CHECK(PurchaseTransactionID LIKE 'PH[0-9][0-9][0-9]'),
	PhoneID CHAR(5) CHECK(PhoneID LIKE 'PO[0-9][0-9][0-9]'),
	Quantity INT,
	CONSTRAINT PKPurchaseDetail PRIMARY KEY (PurchaseTransactionID, PhoneID),
	CONSTRAINT FKPurchaseDetailIDtd FOREIGN KEY (PurchaseTransactionID) REFERENCES PurchaseTransaction(PurchaseTransactionID) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT FKPhineIDtd FOREIGN KEY (PhoneID) REFERENCES Phone(PhoneID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE SalesTransactionDetail(
	SalesTransactionID CHAR(5) CHECK(SalesTransactionID LIKE 'SH[0-9][0-9][0-9]'),
	PhoneID CHAR(5) CHECK(PhoneID LIKE 'PO[0-9][0-9][0-9]'),
	Quantity INT,
	CONSTRAINT PKSalesDetails PRIMARY KEY (SalesTransactionID, PhoneID),
	CONSTRAINT FKPurchaseDetailIDstd FOREIGN KEY (SalesTransactionID) REFERENCES SalesTransaction(SalesTransactionID) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT FKPhineIDstd FOREIGN KEY (PhoneID) REFERENCES Phone(PhoneID) ON UPDATE CASCADE ON DELETE CASCADE
);