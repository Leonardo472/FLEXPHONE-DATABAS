USE FlexPhone

-- MASTER TABLE
-- Customer
INSERT INTO Customer VALUES
('CU001', 'Budi Subandi', 'budi123@bluejack.com', '1999-01-20', 'Male', '+621234567890', 'Jalan Asri 1 No 1'),
('CU002', 'Ani Susanti', 'aniani@sunib.edu', '1995-02-23', 'Female', '+621272946103', 'Jalan Buana 2 No 3'),
('CU003', 'Ahmad Subagus', 'Ahmaddahmha@bluejack.com', '1992-06-01', 'Male', '+621301874284', 'Jalan Cemara 8 No 8'),
('CU004', 'Charlie', 'eilrahc@sunib.edu', '2005-08-04', 'Male', '+622173920465', 'Jalan Delima 10 No 3'),
('CU005', 'Alvyn Cimpang', 'alvyntanaya@bluejack.com', '2000-10-30', 'Male', '+621201928374', 'Jalan Elok 6 No 39'),
('CU006', 'Adeline', 'adeline000@sunib.edu', '2009-09-09', 'Female', '+621273625109', 'Jalan Feronia 4 No 5'),
('CU007', 'Tasha', 'natasha2204@bluejack.com', '2002-04-22', 'Female', '+621316696933', 'Jalan Flamboyan 9 No 63'),
('CU008', 'Martin Suartin', 'martin8@sunib.edu', '2000-10-10', 'Male', '+621265748392', 'Jalan Gardenia 7 No 8'),
('CU009', 'James', 'jamesbluejack@bluejack.com', '1997-03-16', 'Male', '+621201019292', 'Jalan Harmoni Utama No 1'),
('CU010', 'Chloe Merah', 'chloe@sunib.edu', '2008-07-16', 'Female', '+621300995543', 'Jalan Intan 3 No 9');

-- Staff
INSERT INTO Staff VALUES
('ST001', 'Bambang Tubagus', 'bambang@bluejack.com', '1975-12-01', 'Male', '+623879142323', 'Jalan Merpati No.3', '3500000'),
('ST002', 'Budi', 'budi@bluejack.com', '1990-10-12', 'Male', '+622812349988', 'Perumahan Citra 10 E1 no.8', '5500000'),
('ST003', 'Jane Joddy', 'jane@sunib.edu', '2001-06-08', 'Female', '+623812314822', 'Jalan Harimau No.6', '2500000'),
('ST004', 'Surya', 'surya@bluejack.com', '1983-12-03', 'Male', '+621821094232', 'Jalan Teratai No.4', '3500000'),
('ST005', 'Santi', 'santi@sunib.edu', '1992-11-23', 'Female', '+621858559212', 'Perumahan Green Garden A5 no.2', '10000000'),
('ST006', 'Joko Timang', 'joko@sunib.edu', '1998-08-17', 'Male', '+623810274727', 'Jalan Simpang Macan No.10', '2300000'),
('ST007', 'Aisyah Syah', 'aisyah@bluejack.com', '2002-06-13', 'Female', '+622841982245', 'Jalan Girang No.2', '4250000'),
('ST008', 'Stefani', 'stefani@bluejack.com', '2000-02-02', 'Female', '+622899664412', 'Jalan Sentosa No.1', '2500000'),
('ST009', 'Yolanda Yodah', 'yolanda@bluejack.com', '1977-11-18', 'Female', '+623821302010', 'Perumahan Melody J2 no.15', '2500000'),
('ST010', 'Bolang', 'bolang@sunib.edu', '1999-02-16', 'Male', '+623814561200', 'Apartemen Laguna Lantai 4 no.13', '7300000');

-- Vendor
INSERT INTO Vendor VALUES
('VE001', 'Tubagus Jaya', 'TubagusJaya33@sunib.edu', '+629912347890', 'Jalan Budi Doremi 2 no 99'),
('VE002', 'Markas Handphone', 'HandphoneMarkas1@bluejack.com', '+628875682915', 'Jalan Setia Abadi no 1'),
('VE003', 'Jaya Abadi', 'AbadiJaya@bluejack.com', '+621872518346', 'Perumahan Budi Indah 3'),
('VE004', 'Sucipta Phone', 'Sucipta2Phone@sunib.edu', '+620199567235', 'Ruko Abadi Surya Blok J no 33'),
('VE005', 'Siomay Phone', 'SiomayBest@bluejack.com', '+621928453671', 'Ruko Surya Kencana no 48'),
('VE006', 'Tukang Handphone', 'Tukang10Handphone@bluejack.com', '+628875682915', 'Jalan Setia Abadi no 1'),
('VE007', 'Rajanya Handphone', 'RajaHandphone99@sunib.edu', '+621573517384', 'Ruko Kencana 2'),
('VE008', 'Surya Cahaya', 'CahayaSurya15@bluejack.com', '+621928456672', 'Bisma Anggrek 30 no 22'),
('VE009', 'Apel Kuat', 'IniApelKuat1@bluejack.com', '+620111228877', 'Pasar Jaya Indah'),
('VE010', 'Sinar Jaya', 'JayaSinar21@sunib.edu', '+628776892335', 'Ruko Palem Indah Blok F5');

-- Phone
INSERT INTO PhoneBrand VALUES
('PB001', 'Apple'),
('PB002', 'Vivo'),
('PB003', 'Xiaomi'),
('PB004', 'OPPO'),
('PB005', 'Samsung'),
('PB006', 'Realme'),
('PB007', 'Infinix'),
('PB008', 'Sony '),
('PB009', 'Nokia'),
('PB010', 'Asus');

-- PhoneBrand
INSERT INTO Phone VALUES
('PO001', 'PB001', 'IPhone XR', '6300000'),
('PO002', 'PB002', 'Vivo Y20', '1500000'),
('PO003', 'PB003', 'Xiaomi Poco M3', '1800000'),
('PO004', 'PB004', 'OPPO Reno6', '5100000'),
('PO005', 'PB005', 'Samsung Galaxy A12', '2133000'),
('PO006', 'PB006', 'Realme c25', '2000000'),
('PO007', 'PB007', 'Infinix Hot 10S', '1550000'),
('PO008', 'PB008', 'Sony Xperia XZ3', '6300000'),
('PO009', 'PB009', 'Nokia 6', '1700000'),
('PO010', 'PB010', 'Asus ROG Phone 5', '8700000');


-- TRANSACTION TABLE
-- PurchaseTransaction
INSERT INTO PurchaseTransaction VALUES
('PH001', 'ST001', 'VE002', '2020-10-10'),
('PH002', 'ST003', 'VE004', '2009-05-03'),
('PH003', 'ST005', 'VE006', '2015-04-25'),
('PH004', 'ST009', 'VE008', '2017-06-22'),
('PH005', 'ST007', 'VE010', '2019-12-22'),
('PH006', 'ST002', 'VE001', '2012-12-12'),
('PH007', 'ST008', 'VE003', '2018-01-05'),
('PH008', 'ST006', 'VE005', '2013-10-21'),
('PH009', 'ST004', 'VE007', '2008-09-09'),
('PH010', 'ST010', 'VE009', '2011-01-13'),
('PH011', 'ST001', 'VE007', '2014-07-07'),
('PH012', 'ST002', 'VE003', '2007-02-21'),
('PH013', 'ST010', 'VE004', '2010-10-18'),
('PH014', 'ST009', 'VE002', '2019-08-19'),
('PH015', 'ST007', 'VE006', '2021-10-21');

-- SalesTransaction
INSERT INTO SalesTransaction VALUES
('SH001', 'ST004', 'CU004', '2020-11-12'),
('SH002', 'ST008', 'CU005', '2020-12-08'),
('SH003', 'ST001', 'CU002', '2021-12-10'),
('SH004', 'ST002', 'CU001', '2020-12-23'),
('SH005', 'ST007', 'CU001', '2021-01-05'),
('SH006', 'ST003', 'CU001', '2021-09-16'),
('SH007', 'ST004', 'CU003', '2021-02-17'),
('SH008', 'ST009', 'CU007', '2020-10-12'),
('SH009', 'ST010', 'CU003', '2021-06-29'),
('SH010', 'ST010', 'CU008', '2020-07-15'),
('SH011', 'ST005', 'CU009', '2021-09-08'),
('SH012', 'ST004', 'CU010', '2020-10-28'),
('SH013', 'ST008', 'CU010', '2021-10-28'),
('SH014', 'ST007', 'CU006', '2020-11-04'),
('SH015', 'ST005', 'CU004', '2021-12-21');

-- TRANSACTION DETAIL TABLE
-- PurchaseTransactionDetail
INSERT INTO PurchaseTransactionDetail VALUES
('PH001', 'PO001', '1'),
('PH002', 'PO002', '2'),
('PH003', 'PO003', '2'),
('PH004', 'PO004', '1'),
('PH005', 'PO005', '3'),
('PH006', 'PO006', '7'),
('PH007', 'PO007', '1'),
('PH008', 'PO008', '1'),
('PH009', 'PO009', '4'),
('PH010', 'PO010', '2'),
('PH011', 'PO001', '2'),
('PH012', 'PO002', '2'),
('PH013', 'PO003', '1'),
('PH014', 'PO004', '3'),
('PH015', 'PO005', '2'),
('PH004', 'PO005', '2'),
('PH010', 'PO001', '1'),
('PH014', 'PO005', '1'),
('PH003', 'PO004', '1'),
('PH007', 'PO008', '1'),
('PH001', 'PO002', '2'),
('PH008', 'PO005', '3'),
('PH005', 'PO006', '4'),
('PH002', 'PO003', '1'),
('PH009', 'PO010', '2');

--SalesTransactionDetail
INSERT INTO SalesTransactionDetail VALUES
('SH001','PO003','1'),
('SH003','PO008','1'),
('SH015','PO010','1'),
('SH002','PO002','2'),
('SH006','PO003','4'),
('SH001','PO004','3'),
('SH004','PO002','1'),
('SH003','PO010','2'),
('SH005','PO004','1'),
('SH013','PO005','4'),
('SH008','PO003','1'),
('SH002','PO005','1'),
('SH010','PO006','2'),
('SH008','PO006','2'),
('SH006','PO004','2'),
('SH005','PO007','2'),
('SH002','PO006','3'),
('SH007','PO005','4'),
('SH012','PO006','2'),
('SH005','PO008','3'),
('SH011','PO009','1'),
('SH008','PO010','1'),
('SH009','PO005','3'),
('SH011','PO001','2'),
('SH014','PO008','2');