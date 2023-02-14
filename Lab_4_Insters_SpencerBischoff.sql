-- Instert Values 

INSERT INTO Customers ( CustomerID, FirstName, MiddleName, LastName, PIN, StreetAddress, City, [State], ZipCode)
Values ('1234','Spencer','Davis','Bischoff','1111','14317 Samoa St','Fishers','IN','46038'),
	   ('1235','Alexandria','Kate','Gains','1112','14316 Steve Rd','Noblesville','IN','46039'),
	   ('1236','Griffin', NULL,'Bischoff','1113','14315 Whatever Ln','Indianapolis','46030');

Insert INTO CustomerEmails (CustomerID, EmailAddress, PrimaryEmailFlag)
	SELECT CustomerID
	FROM Customers
INSERT INTO CustomerEmails (EmailAddress, PimaryEmailFlag)
VALUES ('','bischspe@gmail.com', Y),
	   ('', 'bischallie@gmail.com', Y);

Insert Into Orders (OrderID, EmployeeID, CustomerID, OrderDate, 'OrderTime')
VALUES ('1111','1234','4321','10-10-10','5:56'),
	   ('1112','1235','4322','6-16-16','3:30'),
	   ('1113','1236','4333','7-8-08','2:40');

Insert Into Employees (EmployeeID, SSN, FirstName, MiddleName, LastName, StreetAddress, City, [State], ZipCode,  Title, Salary)
Values ('1234','222222222','James',NULL,'Jack','123 seventh ave','Boulder','CO','88888','Manager','80000'),
	   ('1235','333333333','Jack',NULL,'Johnson','765 eight ave','Florida','FL','77777','Cashier','20000'),
	   ('1236','444444444','Jill',NULL,'James','444 twentieth ave','James','IN','11111','CEO','9000');

Insert Into Dependents (EmployeeID)
	Select EmployeeID	
	From Employees
Insert Into Dependents (DependentNumber, FirstName, LastName. BirthDate, SSN)
Values ('1','Sophie','Jack','08-09-2020','111111111'),
	   ('2','Allie','Mutt','09-09-1909','222222222'),
	   ('3','Stephanie','Alexander','07-07-1776','333333333');

Insert Into Statuses (StatusID, StatusName, StatusDescription)
Values ('3','Shipped','Your Jacket is on the way'),
	   ('2','Label Printed','Your shoes should arrive on Thursday'),
	   ('1','Delivered','Check your front door!');

Insert Into OrderStatuses (OrderID, StatusID, StatusDate, StatusTime)
	Select OrderID
	From Orders
	Select StatusID
	From Statuses 
Values ('08-08-2020','2:30'),
	   ('07-07-1975','1:00'),
	   ('06-06-1977','3:00');


Insert into Products (ProductID, ProductName, ProductDescription, SalesPrice, InventoryOnHand)
Values ('1','Clock','Brass Clock','20.00','30'),
	   ('2','Shelf','Large','25.00','20'),
	   ('3','Bed','Used','10.00','10');


Insert Into OrderLines (OrderID, ProductID, Price, Quantity)
	Select OrderID
	From Orders
	Select ProductID
	From Products 
Values ('20.00','3'),
	   ('25.00','4'),
	   ('10.00','5');

Insert Into Vendor (VendorID, VendorName, VenforDescription)
Values ('7','Steeves','Lazy'),
	   ('6','Julias','On time'),
	   ('5','Walmart','biggest vendor');

Insert Into ProductVendors (ProductID, VendorID, UnitCost)
	Select ProductID
	From Products
	Select VendorID
	From Vendor 
Values ('7.00'),
	   ('2.32'),
	   ('9.75');

Insert Into ProductPriceHistory (ProductID, PriceChangeDate, SalesPrice)
	Select ProductID 
	From Products
Values ('08-09-1998','17.25'),
	   ('09-09-1998','30.50'),
	   ('10-10-1780','2.99');
