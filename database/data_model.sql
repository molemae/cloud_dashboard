--lets Start 
DROP TABLE IF EXISTS categories;
CREATE TABLE categories(
	categoryID INT PRIMARY KEY,
	categoryName VARCHAR (255),
	description VARCHAR (255),
	picture TEXT
);
\copy categories FROM '/data/categories.csv' DELIMITER ',' CSV HEADER;

DROP TABLE IF EXISTS orders;
CREATE TABLE orders(
	orderID INT PRIMARY KEY,
	customerID VARCHAR (255),
	employeeID INT,
	orderDate VARCHAR (255),
	requiredDate VARCHAR (255),
	shippedDate VARCHAR (255),
	shipVia INT,
	freight FLOAT,
	shipName VARCHAR (255),
	shipAddress VARCHAR (255),
	shipCity VARCHAR (255),
	shipRegion VARCHAR (255),
	shipPostalCode VARCHAR (255),
	shipCountry VARCHAR (255)
);
\copy orders FROM '/data/orders.csv' DELIMITER ',' CSV HEADER;

DROP TABLE IF EXISTS order_details;
CREATE TABLE order_details(
	orderID INT,
	productID INT,
	unitPrice FLOAT,
	quantity INT,
	discount FLOAT,
	PRIMARY KEY (orderID,productID)
);
\copy order_details FROM '/data/order_details.csv' DELIMITER ',' CSV HEADER;

DROP TABLE IF EXISTS employee_territories;
CREATE TABLE employee_territories(
	employeeID INT,
	territoryID INT PRIMARY KEY
);
\copy employee_territories FROM '/data/employee_territories.csv' DELIMITER ',' CSV HEADER;

DROP TABLE IF EXISTS customers;
CREATE TABLE customers(
	customerID VARCHAR (255) PRIMARY KEY,
	companyName VARCHAR (255),
	contactName VARCHAR (255),
	contactTitle VARCHAR (255),
	address VARCHAR (255),
	city VARCHAR (255),
	region VARCHAR (255),
	postalCode VARCHAR (255),
	country VARCHAR (255),
	phone VARCHAR (255),
	fax VARCHAR (255)
);
\copy customers FROM '/data/customers.csv' DELIMITER ',' CSV HEADER;

DROP TABLE IF EXISTS products;
CREATE TABLE products(
	productID INT PRIMARY KEY,
	productName VARCHAR (255),
	supplierID INT,
	categoryID INT,
	quantityPerUnit VARCHAR (255),
	unitPrice FLOAT,
	unitsInStock INT,
	unitsOnOrder INT,
	reorderLevel INT,
	discontinued INT
);
\copy products FROM '/data/products.csv' DELIMITER ',' CSV HEADER;

DROP TABLE IF EXISTS suppliers;
CREATE TABLE suppliers(
	supplierID INT PRIMARY KEY,
	companyName VARCHAR (255),
	contactName VARCHAR (255),
	contactTitle VARCHAR (255),
	address VARCHAR (255),
	city VARCHAR (255),
	region VARCHAR (255),
	postalCode VARCHAR (255),
	country VARCHAR (255),
	phone VARCHAR (255),
	fax VARCHAR (255),
	homePage VARCHAR (255)
);
\copy suppliers FROM '/data/suppliers.csv' DELIMITER ',' CSV HEADER;

DROP TABLE IF EXISTS territories;
CREATE TABLE territories(
	territoryID INT PRIMARY KEY,
	territoryDescription VARCHAR (255),
	regionID INT
);
\copy territories FROM '/data/territories.csv' DELIMITER ',' CSV HEADER;

DROP TABLE IF EXISTS Country_Names_with_Abbreviations;
CREATE TABLE Country_Names_with_Abbreviations(
	country VARCHAR (255) PRIMARY KEY,
	abbreviation VARCHAR (255)
);
\copy Country_Names_with_Abbreviations FROM '/data/Country_Names_with_Abbreviations.csv' DELIMITER ',' CSV HEADER;

DROP TABLE IF EXISTS employees;
CREATE TABLE employees(
	employeeID INT PRIMARY KEY,
	lastName VARCHAR (255),
	firstName VARCHAR (255),
	title VARCHAR (255),
	titleOfCourtesy VARCHAR (255),
	birthDate VARCHAR (255),
	hireDate VARCHAR (255),
	address VARCHAR (255),
	city VARCHAR (255),
	region VARCHAR (255),
	postalCode VARCHAR (255),
	country VARCHAR (255),
	homePhone VARCHAR (255),
	extension INT,
	photo TEXT,
	notes VARCHAR (255),
	reportsTo FLOAT,
	photoPath VARCHAR (255)
);
\copy employees FROM '/data/employees.csv' DELIMITER ',' CSV HEADER;

DROP TABLE IF EXISTS shippers;
CREATE TABLE shippers(
	shipperID INT PRIMARY KEY,
	companyName VARCHAR (255),
	phone VARCHAR (255)
);
\copy shippers FROM '/data/shippers.csv' DELIMITER ',' CSV HEADER;

DROP TABLE IF EXISTS regions;
CREATE TABLE regions(
	regionID INT PRIMARY KEY,
	regionDescription VARCHAR (255)
);
\copy regions FROM '/data/regions.csv' DELIMITER ',' CSV HEADER;

