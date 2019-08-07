DROP TABLE IF EXISTS OrderDetails;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS customer;

CREATE TABLE customer(
CustomerID varchar(30) not null, 
CompanyName varchar(50) not null, 
ContactName varchar(50), 
ContactTitle varchar(20), 
Address varchar(50), 
city varchar(30), 
region varchar(30), 
PostalCode varchar(10), 
country varchar(15), 
phone varchar(25), 
fax varchar(25),
PRIMARY KEY (CustomerID));

CREATE TABLE Orders(
OrderID smallint not null, 
customerID varchar(30), 
employeeID smallint, 
OrderDate date, 
RequiredDate date, 
ShippedDate date, 
ShipVia smallint, 
freight real, 
ShipName varchar(50), 
ShipAddress varchar(50), 
ShipCity varchar(20), 
ShipRegion varchar(20), 
ShipPostalCode varchar(10), 
ShipCountry varchar(15),
PRIMARY KEY (OrderID));

ALTER TABLE Orders
ADD FOREIGN KEY (customerID) REFERENCES customer(customerID);

CREATE TABLE OrderDetails(
OrderID smallint not null, 
ProductID smallint not null, 
UnitPrice real not null, 
Quantity smallint not null, 
Discount real not null, 
PRIMARY KEY (OrderID), 
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID));

CREATE TABLE Products(
ProductID smallint not null, 
ProductName varchar (40), 
SuplierID smallint, 
CategoryID smallint, 
QuantityPerUnit varchar(30), 
UnitPrice real, 
UnitsInStock smallint,
UnitsOnOrder smallint, 
RecorderLevel smallint, 
Discontinud integer,
PRIMARY KEY (ProductID));


INSERT INTO customer values('2', 'Azaz kft', 'KIMÁS', 'naplopó', 'Azta utca', 'Miskolc', 'BAZ', '1111', 'Kína', '1231', '44444');
INSERT INTO customer values('1', 'Miaz Rt', 'Kis János', 'hóhányó', 'Elm utca', 'Budapest', 'Passz', '12341', 'USA', '06201212121', '0612121212');

INSERT INTO Orders values(12, '2', 121, '2011.11.11', '2012.12.12', '2020.11.11', 34, 10000, 'Santa Cruz', 'Valami cím', 
						  'Putnok', 'BAZ','1111', 'USA');
INSERT INTO Orders values(11, '2', 34, '2011.11.11', '2012.12.12', '2020.11.11', 40, 1100, 'Santa Fé', 'Ismeretlen cím', 
						  'TIszi', 'BAZ','3333', 'Kína');

INSERT INTO orderdetails VALUES(12, 22345, 1000, 5, 2000);
INSERT INTO orderdetails VALUES(11, 21212, 4000, 10, 3000);

 INSERT INTO products VALUES(22345, 'UZI', 13, 22101, 'passz', 120, 10, 10, 10, 100 );
 INSERT INTO products VALUES(21212, 'Knife', 11, 134, 'akármi', 111,3,3,3,3);
