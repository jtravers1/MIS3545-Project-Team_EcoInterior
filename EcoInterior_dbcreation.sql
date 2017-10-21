CREATE DATABASE EcoInteriorDb;
GO

USE EcoInteriorDb;
GO

CREATE TABLE Customer(
  CustomerID bigint NOT NULL PRIMARY KEY,
  FirstName varchar(50) NOT NULL,
  LastName varchar(50) NOT NULL,
  StreetAddress varchar(50) NOT NULL,
  City varchar(50) NOT NULL,
  State varchar(2) NOT NULL,
  ZipCode varchar(15) NOT NULL,
  Email varchar(50) NOT NULL,
  PhoneNumber varchar(50) NOT NULL);

CREATE TABLE Supplier(
  SupplierID bigint NOT NULL PRIMARY KEY,
  SupplierName varchar(50) NOT NULL,
  StreetAddress varchar(50) NOT NULL,
  City varchar(50) NOT NULL,
  State varchar(2) NOT NULL,
  ZipCode varchar(15) NOT NULL,
  Email varchar(50) NOT NULL,
  PhoneNumber varchar(50) NOT NULL,
  BrandName varchar(50) NOT NULL);

CREATE TABLE Product(
  ProductID bigint NOT NULL PRIMARY KEY,
  ProductName varchar(50) NOT NULL,
  Description varchar(50) NOT NULL,
  ProductCost float(50) NOT NULL,
  Weight float(50) NOT NULL,
  Category varchar(100) NOT NULL,
  Color varchar(50) NOT NULL,
  Height float(50) NOT NULL,
  Width float(50) NOT NULL,
  Depth float(50) NOT NULL,
  Material varchar(50) NOT NULL,
  SupplierID bigint NOT NULL);

  CREATE TABLE OrderHeader(
  OrderID bigint NOT NULL PRIMARY KEY,
  OrderDate date NOT NULL,
  ShipDate date NOT NULL,
  OrderStatus varchar(50) NOT NULL,
  Subtotal float(50) NOT NULL,
  ShippingAmount float(50) NOT NULL,
  TotalDue float(50) NOT NULL,
  CustomerID bigint NOT NULL);
  
  CREATE TABLE OrderDetail(
  OrderID bigint REFERENCES OrderHeader(OrderID) NOT NULL,
  ProductID bigint REFERENCES Product(ProductID) NOT NULL,
  PRIMARY KEY(OrderID, ProductID),
  Quantity bigint NOT NULL,
  UnitPrice float(50) NOT NULL,
  LineTotal float(50) NOT NULL);


-- Add CustomerID Foreign Key to Order Header
ALTER TABLE OrderHeader ADD CONSTRAINT FK_OrderHeader_Customer 
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID);
GO
--Add SupplierID Foreign Key to Product
ALTER TABLE Product ADD CONSTRAINT FK_Product_Supplier 
FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID);
GO


-- We will use designer view to create another relationship: the second FK in CourseEnrollment


-- Add Customer Information
INSERT INTO Customer(CustomerID, FirstName, LastName, StreetAddress, city, State, ZipCode, Email, PhoneNumber) VALUES 
(1000,'David','Smith','100 Christopher Street','Manhattan','NY','10014','dsmith1@gmail.com','617-971-6827'),
(1001, 'Barry', 'Berryman', '231 West Broadway', 'Brimstone', 'CT','06011', 'bberryman1@gmail.com','781-690-1041'),
(1002, 'Carl', 'Compress', '242 Prospect Avenue', 'Brooklyn', 'NY','02152', 'ccompress2@gmail.com','666-555-4444'),
(1003, 'Delilah', 'Dilman', '667 Piccadilly Circus', 'Newark', 'NJ','02703', 'ddilman1@gmail.com','111-222-3333'),
(1004, 'Felix', 'Frank', '124 Rocky Hill', 'Brimstone', 'CT', '02744', 'ffrank1@gmail.com','828-593-4567'),
(1005, 'Tina', 'Bella', '346 Eagle Park', 'San Jose', 'CA', '02481', 'tbella@yahoo.com', '945-777-9087'),
(1006, 'Eddie', 'Lin', '89 Pine St', 'Dallas', 'TX', '56081', 'elin@gmail.com', '654-289-0121'),
(1007, 'Alex', 'Eva', '31 Forest St', 'Boston', 'MA', '02481', 'aeva@gmail.com', '777-990-1234'),
(1008, 'Stephanie', 'Sasa', '22 Maple Avenue', 'Fresno', 'CA', '12345', 'ssasa@gmail.com', '209-111-2345'),
(1009, 'Ellie', 'Muse', '245 First St', 'Cambridge', 'MA', '34367', 'emuse@gmail.com', '435-111-6756'),
(1010, 'Alex', 'Chart', '32 Oxford St', 'Auburn', 'AL', '57690', 'achart@gmail.com', '205-890-4562');
GO

-- Add Supplier Information
INSERT INTO Supplier(SupplierID, SupplierName, StreetAddress, City, State, ZipCode, Email, PhoneNumber, BrandName) VALUES 
(12345,'Bameco','666 Cherry Lane','Acton', 'MA','02998','bamboo@bameco.com','229-444-5678','Bamboo'),
(12346,'VivaTerra','898 Strawberry Road','Miami', 'FL','98767','viva@vivaterra.com','342-955-4267','Vive'),
(12347,'West Elm','782 Cucumber Circle','Madison', 'AL','98332','westelm@elm.com','463-764-9832','West'), 
(12348,'Inmod','356 Watermelon Drive','San Francisco', 'CA','86345','inmod@inmod.com','823-432-0932','Mod'),
(12349,'Stem','432 Cantaloupe Road','Providence', 'RI','85387','stem@stem.com','734-092-5386','Stemmy'),
(12342,'Eco Balanza','732 Raspberry Road','Dallas', 'TX','32456','eco@balanza.com','634-972-2456','EB'),
(12453,'Haiku Designs','872 Apple Street','Montgomery', 'AL','73698','haiku@design.com','674-982-6543','HD'),
(12543,'Eco Chic','231 Carrot Circle','Manhattan', 'NY','93450','ecochic@chic.com','923-327-4356','EC'),
(19876, 'Myakka','432 Cake Street','Auburn', 'AL','43256','myakka@my.com','345-872-0976','MY'),
(19654,'Urban Woods','921 Water Avenue', 'Brooklyn', 'NY','11207', 'urbanwoods@urban.com','834-923-7402','woods');
GO

-- Add Product Information
INSERT INTO Product(ProductID, ProductName, Description, ProductCost, Weight, Category, Color, Height, Width, Depth, Material, SupplierID) VALUES 
(1500,'Bamboo Pure Bay Cabinet','Versatile storage solution', '1499', '75', 'Cabinets and Shelving', 'Brown','40','39','19','Bamboo', 12345),
(1501,'Traverse Carved Wood Console','Beautiful Mango Wood Storage Console','999', '80','Cabinets and Shelving','Caramel','30', '17.75', '70','Mango Wood',12346),
(1502,'Andes Sofa', 'Modern Form Deep Seating Sofa', '1699', '90', 'Sofas', 'Natural', '32', '76.5', '40', 'Velvet',12347),
(1503,'Thompson Bed','Contemporary Luxurious Bed', '2500', '110', 'Bedding','Grey', '45', '86', '94', 'Teak',12348),
(1504,'Rondi Chair', 'Kiln-dried domestic Alder Hardwood chair', '1695', '45', 'Chairs', 'Beige', '33', '36', '31', 'Alder Hardwood',12349),
(1505,'Chill Sleeper Sofabed','Contemporary Sofa designed for great versatility','1370', '65', 'Sofas', 'Coastal Seal Grey', '40', '82', '35', 'Orange wood', 12453), 
(1506,'Mallani Drawer and Store Coffee Table', 'Hand-waxed coffee table', '400', '35', ' Tables', 'Black', '17', '43', '23', 'Indian Rosewood', 19876),
(1507,'Buoy Crazy Round Table', 'Cheerful table perfect for patio or breakfast nook', '2199', '35', 'Tables', 'Grey', '30', '48.5', '48.5', 'Marine-Grade Teak',12543),
(1508,'Sloane Lounge Chair', 'Hand-crafted for luxurious deep-seating', '2095', '50', 'Chairs','Ivory', '34', '29', '33', 'Fishing Boat Wood', 12345),
(1509, 'Jasmeen Large Bookshelf', 'Designed Elegantly with hand-waxed wood', '699', '65', 'Cabinets and Shelving', 'Wheat', '90', '45', '20', 'Indian Rosewood', 19876),
(1510, 'Oceanic Coffee Table', 'Reclaimed wood', '809', '25', 'Tables','Brown','17', '27', '47','Marine-grade wood', 12543);
GO

-- Add OrderHeader Information
INSERT INTO OrderHeader(OrderID, OrderDate, ShipDate,OrderStatus, Subtotal, TotalDue, ShippingAmount, CustomerID) VALUES 
(7654,'2017-01-05','2017-01-10','Processed',15200,15900,750, 1009),
(6732,'2017-02-10','2017-02-15','Shipped',14500,15000,500, 1007),
(3245,'2017-05-25','2017-05-30','Not Processed',5000,5300,300, 1005),
(9376,'2017-04-06','2017-04-10','Shipped',1500,2000,500, 1004),
(2673,'2017-09-20','2017-09-25','Shipped',19200,20000,800, 1009),   
(5298,'2017-10-11','2017-10-20','Shipped',8500,9500,1000, 1002), 
(2097,'2017-10-15','2017-11-5','Not Processed',5750,6350,500, 1005),
(3456,'2017-05-20','2017-07-01','Shipped',3750,4100,350, 1003),
(9276,'2017-10-01','2017-11-01','Processed',2000,2500,500, 1001),
(8376,'2017-09-01','2017-09-05','Not Processed',3000,3400,400, 1003) 
;
GO

-- Add OrderDetail Information
INSERT INTO OrderDetail(OrderID, ProductID, Quantity, LineTotal, UnitPrice) VALUES 
('7654','1500','4','9000','2250'),
('7654','1501','2','3000','1500'),
('7654','1502','1','3200','3200') ,  
('6732','1503','2','10000','5000') ,
('6732','1500','2','4500','2250') ,
('3245','1501','1','1500','1500') ,
('3245','1505','1','3500','3500'),
('9376','1506','2','1500','750') ,
('2673','1501','4','6000','1500'),
('2673','1507','4','10000','2500'),
('2673','1502','1','3200','3200')  ,    
('5298','1506','2','1500','750') ,
('5298','1505','2','7000','3500') ,
('2097','1508','6','30000','5000'),
('2097','1505','2','1500','750'),
('3456','1506','2','1500','750'),
('3456','1508','1','3000','3000'), 
('9276','1509','4','4000','1000'),
('9276','1510','3','3000', '1000'),
('8376','1508','1','3000','3000')
;
GO



