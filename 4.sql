-- Proses Transaksi

INSERT INTO Vendor VALUES
('VE011', 'Jaya Indah', 'indahjaya1@sunib.edu', '081182733661', 'Jalan Indah 11'),

INSERT INTO PhoneBrand VALUES
('PB011', 'Samsung R'),

INSERT INTO Phone VALUES
('PO011', 'PB011', 'Samsung', '3800000'),

INSERT INTO Staff VALUES
('ST011', 'Surya', 'surya33@bluejack.com', '1989-02-28', 'Male', '083811472947', 'Jalan Benda 9', '1200000'),

INSERT INTO PurchaseTransaction VALUES
('PH015', 'ST006', 'VE004', '2020-10-10'),

INSERT INTO PurchaseTransactionDetail VALUES
('PH009', 'PO003', '2'),

INSERT INTO Customer VALUES
('CU011', 'Asep', 'asep11@bluejack.com', '1997-10-21', 'Male', '081217452845', 'Jalan Surya Kencana 1');

INSERT INTO SalesTransaction VALUES
('SH016', 'ST007', 'CU003', '2020-11-12'),

INSERT INTO SalesTransactionDetail VALUES
('SH007','PO004','3'),