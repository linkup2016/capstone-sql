/*
	CSCC Capstone Project Autumn 2017
	Yonas Milos
		9.22.2017: Jason Parker - Added description field to acct_transaction table
*/

drop database if exists onthefly;
create database if not exists onthefly;
use onthefly;
create table user(
	userID varchar (60) NOT NULL,
    password varchar(65) NOT NULL, 
    registrationDate DATETIME NOT NULL,
    PRIMARY KEY (userID)
);
create table customer(
	customerID int unsigned auto_increment,
    userID int unsigned NOT NULL,
    itemID int unsigned,
    firstName varchar(20) NOT NULL,
    lastName varchar(40) NOT NULL,
    address varchar(300) NOT NULL,
    city varchar(80),
    state char(2),
    zip_code varchar(5),
    email varchar(60) NOT NULL,
    phone varchar(10) NOT NULL,
    PRIMARY KEY (customerID)
);
create table category(
	categoryID int unsigned auto_increment,
    categoryName varchar(140) NOT NULL,
    categoryDescription varchar(400),
	PRIMARY KEY (categoryID)
);
create table item(
	itemID int unsigned auto_increment,
    SKU varchar(11) NOT NULL,
    itemName varchar(80),
    categoryID int unsigned NOT NULL,
    description varchar(200),
    itemStatus varchar (45) NOT NULL,
	cost decimal(8,2) NOT NULL,
    price decimal(8,2) NOT NULL,
    acquisitionDate DATETIME NOT NULL,
    PRIMARY KEY (itemId),
    foreign key (categoryID) references category(categoryID)
);
create table shipment(
	shipmentID int unsigned auto_increment,
    itemID int unsigned,
    customerID int unsigned,
    shipper varchar(140) NOT NULL,
    shippingPriority varchar(50),
    shippingFee decimal(5,2),
    trackingNumber int unsigned,
    deliveryStatus varchar(50),
    deliveryDate DATETIME,
    PRIMARY KEY (shipmentID),
    foreign key (itemID) references item(itemID),
    foreign key (customerID) references customer(customerID)
);
create table sales(
	saleID int unsigned auto_increment,
    salesAmount decimal(8,2) NOT NULL,
    tax decimal(8,2),
    totalSales decimal(8,2) NOT NULL,
    itemID int unsigned,
    customerID int unsigned,
    PRIMARY KEY (saleId),
    foreign key (itemID) references item(itemID),
    foreign key (customerID) references customer(customerID)
);
create table chartOfAccounts(
	accountID int unsigned auto_increment,
    accountName varchar(140) NOT NULL,
	PRIMARY KEY (accountID)
);
create table acct_transaction(
	transactionID int unsigned auto_increment,
    accountID int unsigned,
    transactionDate DATETIME,
    description varchar(100),
    beginningBalance decimal(15,2),
    endingBalance decimal(15,2),
    debit decimal(10,2),
    credit decimal(10, 2),
	PRIMARY KEY (transactionID),
    foreign key (accountID) references chartOfAccounts(accountID)
);
