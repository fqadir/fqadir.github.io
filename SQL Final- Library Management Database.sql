Create Database db_Library_Managment_System;
GO

Create Table Library_Branch (
	BranchID Int Primary Key Not Null Identity (1,1),
	Branch_Name Varchar(20) Not Null,
	Branch_Address Varchar(50) Not Null);

Insert Into Library_Branch
	(Branch_Name, Branch_Address)
	Values
	('Central', '1308 NE Dekum St'),
	('Sharpstown', '2811 NE Holman St'),
	('Senior', '2400 NE 29th Ave'),
	('Junior', '1600 NE 27th Ave');

Create Table Borrower (
	CardNo Int Primary Key Not NUll Identity (200,1),
	Name Varchar(20) Not Null,
	Address VarChar(50) Not Null,
	Phone Varchar(10) Not Null);


Insert Into Borrower
	(Name, Address, Phone)
	Values
	('Moh Salah', '11 Anfield Road', '1234567891'),
	('Sadio Mane', '10 Anfield Road', '1234567892'),
	('Roberto Firmino', '9 Anfield Road', '1234567893'),
	('Trent Arnold', '66 Anfield Road', '1234567894'),
	('Andy Robertson', '26 Anfield Road', '1234567895'),
	('Virgil VanDijk', '4 Anfield Road', '1234567896'),
	('Jordan Henderson', '14 Anfield Road', '1234567897'),
	('Gini Wijnaldum', '5 Anfield Road', '1234567898');


Create Table Publisher (
	PublisherName VARCHAR(20) PRIMARY KEY NOT NULL,
	Address VARCHAR(10) NOT NULL,
	Phone varchar(10) NOT NULL);

Insert Into Publisher
	(PublisherName, Address, Phone)
	Values
	('Premier League', 'England', '1234567890'),
	('FA Cup', 'United Kingdom', '1234567899'),
	('Champions League', 'Europe', '1234567888');


Create Table Books (
	BookID Int Primary Key Not Null Identity (100,1),
	Title Varchar(50) Not Null,
	Publisher_Name Varchar(50) Not Null );

Insert Into Books
	(Title, Publisher_Name)
	Values
	('LiverpoolvNorwich', 'Premier League'),
	('LiverpoolvChelsea', 'Premier League'),
	('LiverpoolvSouthampton', 'Premier League'),
	('LiverpoolvArsenal', 'Premier League'),
	('LiverpoolvBurnley', 'Premier League'),
	('ChelseavLiverpool', 'FA Cup'),
	('SheffieldvLiverpool', 'Premier League'),
	('ManUvLiverpool', 'Premier League'),
	('LiverpoolvSpurs', 'FA Cup'),
	('PalacevLiverpool', 'Premier League'),
	('LiverpoolvCity', 'FA Cup'),
	('LiverpoolvEverton', 'FA Cup'),
	('BournemouthvLiverpool', 'FA Cup'),
	('The Lost Tribe', 'Champions League'),
	('LiverpoolvFlamengo', 'Champions League'),
	('AtleticovLiverpool', 'Champions League'),
	('WatfordvLiverpool', 'Champions League'),
	('LiverpoolvWolves', 'Premier League'),
	('LiverpoolvManU', 'Premier League'),
	('LiverpoolvWestHam', 'FA Cup'),
	('LiverpoolvChelsea', 'FA Cup');


Create Table Book_Authors (
	BookID Int Not Null Constraint fk_BookID Foreign Key References Books(BookID),
	AuthorName VarChar(20) Not Null);

Insert Into Book_Authors
	(BookID, AuthorName)
	Values
		(100, 'Salah'),
		(101, 'Mane'),
		(102, 'Matip'),
		(103, 'Salah'),
		(104, 'Wood'),
		(105, 'Mane'),
		(106, 'Milner'),
		(107, 'Lallana'),
		(108, 'Henderson'),
		(109, 'Firmino'),
		(110, 'Fabinho'),
		(111, 'Origi'),
		(112, 'Salah'),
		(113, 'Mark Lee'),
		(114, 'Firmino'),
		(115, 'Stephen King'),
		(116, 'Stephen King'),
		(117, 'Mane'),
		(118, 'Salah'),
		(119, 'Gini'),
		(120, 'Stephen King');



Create table Book_Copies (
	BookID Int Not Null Constraint fk_bookID Foreign Key References Books(BookID),
	BranchID Int Not Null Constraint fk_BranchID Foreign Key References library_branch(BranchID),
	Number_of_Copies INT Not Null);

Insert Into Book_Copies
		(BookID, Number_of_Copies, BranchID)
		Values
		(100,2,3),
		(101,2,2),
		(102,2,3),
		(103,4,4),
		(104,2,2),
		(105,2,3),
		(106,3,4),
		(107,2,1),
		(108,3,2),
		(109,4,3),
		(110,3,4),
		(111,2,1),
		(112,2,3),
		(113,2,2),
		(114,2,4),
		(115,4,1),
		(116,3,1),
		(117,2,1),
		(118,2,2),
		(119,3,3),
		(120,3,1);


Create Table Book_Loans (
	BookID Int Not Null Constraint fk_BookID Foreign Key References Books(BookID),
	BranchID Int Not Null Constraint fk_BranchID Foreign Key References Library_Branch(BranchID),
	CardNo Int Not Null Constraint fk_CardNo Foreign Key References Borrower(CardNo),
	Checkout Date Not Null,
	Due Date Not Null);

Insert into Book_Loans
	(BookID, BranchID, CardNo, Checkout, Due)
	Values
	(100, 1, 200, '02/29/2020', '04/01/2020'),
	(101, 2, 201, '02/29/2020', '04/01/2020'),
	(102, 4, 202, '02/29/2020', '04/01/2020'),
	(103, 2, 203, '02/29/2020', '04/01/2020'),
	(104, 3, 204, '02/29/2020', '04/01/2020'),
	(105, 2, 205, '02/29/2020', '04/01/2020'),
	(106, 1, 206, '02/29/2020', '04/01/2020'),
	(107, 3, 201, '02/29/2020', '04/01/2020'),
	(108, 3, 200, '02/29/2020', '04/01/2020'),
	(109, 4, 201, '02/29/2020', '04/01/2020'),
	(110, 3, 202, '02/29/2020', '04/01/2020'),
	(111, 2, 203, '02/29/2020', '04/01/2020'),
	(112, 2, 204, '02/29/2020', '04/01/2020'),
	(113, 2, 205, '02/29/2020', '04/01/2020'),
	(114, 4, 206, '02/29/2020', '04/01/2020'),
	(115, 2, 202, '02/29/2020', '04/01/2020'),
	(116, 1, 200, '02/29/2020', '04/01/2020'),
	(117, 4, 201, '02/29/2020', '04/01/2020'),
	(118, 4, 202, '02/29/2020', '04/01/2020'),
	(119, 4, 203, '02/29/2020', '04/01/2020'),
	(120, 2, 204, '02/29/2020', '04/01/2020'),
	(111, 3, 205, '02/29/2020', '04/01/2020'),
	(112, 4, 206, '02/29/2020', '04/01/2020'),
	(113, 4, 203, '02/29/2020', '04/01/2020'),
	(114, 2, 200, '02/29/2020', '04/01/2020'),
	(115, 1, 201, '02/29/2020', '04/01/2020'),
	(116, 1, 202, '02/29/2020', '04/01/2020'),
	(117, 1, 203, '02/29/2020', '04/01/2020'),
	(118, 2, 204, '02/29/2020', '04/01/2020'),
	(119, 3, 205, '02/29/2020', '04/01/2020'),
	(120, 4, 206, '02/29/2020', '04/01/2020'),
	(101, 1, 204, '02/29/2020', '04/01/2020'),
	(102, 1, 200, '02/29/2020', '04/01/2020'),
	(103, 2, 201, '02/29/2020', '04/01/2020'),
	(104, 2, 202, '02/29/2020', '04/01/2020'),
	(105, 3, 203, '02/29/2020', '04/01/2020'),
	(106, 1, 204, '02/29/2020', '04/01/2020'),
	(107, 1, 205, '02/29/2020', '04/01/2020'),
	(108, 1, 206, '02/29/2020', '04/01/2020'),
	(109, 3, 206, '02/29/2020', '04/01/2020'),
	(110, 4, 200, '02/29/2020', '04/01/2020'),
	(101, 4, 201, '02/29/2020', '04/01/2020'),
	(112, 4, 202, '02/29/2020', '04/01/2020'),
	(103, 2, 203, '02/29/2020', '04/01/2020'),
	(114, 3, 204, '02/29/2020', '04/01/2020'),
	(115, 3, 205, '02/29/2020', '04/01/2020'),
	(106, 2, 206, '02/29/2020', '04/01/2020'),
	(107, 2, 205, '02/29/2020', '04/03/2020'),
	(118, 3, 200, '02/29/2020', '04/01/2020'),
	(109, 4, 201, '02/29/2020', '04/01/2020');



	/*****
	Procs
	*****/

/* 1) */

	Create Proc LostTribe
	As
	Select Number_of_Copies From Book_Copies
	Where BookID = 113 And BranchID = 2;

/* 2) */
	
	Create Proc Copies
	As
	Select Number_of_Copies And BranchID
	From Book_Copies Where BookID = 113;

/* 3) */
	
	Create Proc 3_NoCheckout
	As
	Select Name from Borrower Where CardNo is Null Select CardNo From Book_loans; 

	SELECT B.Name, B.CardNo, BL.Due
	FROM Borrower AS B INNER JOIN Book_Loans AS BL
	ON B.CardNo=BL.CardNo
	WHERE Due IS NULL


/* 4) */
	
	Create Proc 4_Due
	As
	Select a1.title, a2.Name, a2.Address
	From Books a1, Borrower a2, Book_Loans a3, Library_Branch a4
	Where a4.Branch_Name = 'Sharpstown' and a4.BranchID= '04/03/2020'
	and a3.CardNo = a2.CardNo 

/* 5) */

	Create Proc 5_TotalOut
	As
	Select L.BranchID = BranchID
	Group by L.Branch_Name

/* 6) */

	Create Proc 6_FivePlus
    Select a1.Name, a1.Address, Count(*)
	From Borrower a1, Book_Loans a2
	Where a1.CardNO = a2.CardNo 
	Group by a1.CardNo, a1.Name, a1.Address
	Having Count(*) > 5;

/* 7) */
	
	Create Proc 7_SKCentral
	As
	Select Distinct a1.Title, a2.Number_of_Copies
	From Books a1
	Inner Join Book_copies a2 at a1.BookID = a2.BookID
	Inner Join Book_Authors a3 at a1.BookID = a3.BookID
	Inner Join Book_Loans a4 at a1.BookID = a4.BookID
	Inner Join Library_Branch a5 at a4.BranchD = a5.BranchID
	Where
	a3.AuthorName = 'Stephen King' AND a4.BranchID = 2


	