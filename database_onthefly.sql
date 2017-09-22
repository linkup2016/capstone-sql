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
    beginningBalance decimal(15,2),
    endingBalance decimal(15,2),
    debit decimal(10,2),
    credit decimal(10, 2),
	PRIMARY KEY (transactionID),
    foreign key (accountID) references chartOfAccounts(accountID)
);

-- SOFT's Item Category list

INSERT INTO category (categoryName, categoryDescription) 
  
VALUES ("Paper", "Printer paper, Three-hole punched paper, Graph paper"),
		
("Envelope and Boxes", "Envelopes,Packaging bubbles, Cardboard boxes, Greeting cards"),
      
("Notebooks and Notepads", "Composition and spiral notebooks, Legal and Steno pads"),
        
("Binder items", "Binders,Binder tabs, Binder pockets, doucment holders, hole punchers"),
      
("Filling cabinets", "Folders, Folder tabs, Hanging hooks"),
        
("Small Office Supplies", "Staplers and stepler accessories, Paper clips, Tapes, Tape dispensers"),
   
("Writing Implements", "Pens,Pencils, Highlighters, Markers, Erasers, Rulers and Sharpners"),
       
("Electrical Items", "Computers and accessories,Telephones, Toners and Cartridges, Speakers"),
		
("Office Storage", "Bookends, In/Out Boxes, Document holder, Trays and Containers"),
    
("Projector", "Scanners, Fax Machines, Shredders, Extension Cords Surge Protectors and Label Makers"),
    
("Furniture", "Desks, Chairs, Filling Cabinets, Tables, Shelves, Safes and Recycling bins");

-- Items in SOFT's Database

-- Category 1 - Papers

-- 1.1 Printer Paper

INSERT INTO item (itemName, categoryID, SKU, description, itemStatus, cost, price, acquisitionDate) 

VALUES ("Printer Paper", 1, "63642220999", "Xerox® Vitality™ Multipurpose Printer Paper 20 lb Case", 
"New", 4.99, 24.99, NOW()),

("Printer Paper", 1, "29532184699","SOFT® Multipurpose Printer Paper 20 lb Case", 
"New", 2.99, 20.99, NOW()),

("Printer Paper", 1, "84504830899","HammerMill® Copy Plus Copy Paper 8 1/2' x 11' Case", 
"New", 9.99, 34.99, NOW()),

("Printer Paper", 1, "84504830899","HammerMill® Copy Plus Copy Paper 8 1/2' x 11' Case", 
"New", 9.99, 34.99, NOW()),

("Printer Paper", 1, "29532184699","SOFT® Multipurpose Printer Paper 20 lb Case", 
"New", 2.99, 20.99, NOW()),

("Printer Paper", 1, "84504830899","HammerMill® Copy Plus Copy Paper 8 1/2' x 11' Case", 
"New", 9.99, 34.99, NOW()),

("Printer Paper", 1, "29527630699","Boise® X-9® Multi-Use Copy Paper Letter Size Paper 20 Lb  White 500 Sheets Per Ream Case Of 10 Reams",
"New", 12.99, 55.99, NOW()),

("Printer Paper", 1, "22855582199","Office Depot® Brand Laser Print Paper 8 1/2' x 11' 24 Lb, 30% Recycled Ream Of 500 Sheets",
"New", 2.99, 12.99, NOW()),

 ("Printer Paper", 1, "81335302999","Domtar EarthChoice® Office Paper Letter-size 92/104+ US/Euro Brightness 20 lbs 8-1/2' x 11' 5000 Sheets/Ct",
"New", 8.99, 47.99, NOW()),

 ("Printer Paper", 1, "14239063499","Xerox Multipurpose Pastel Colored Paper Letter 20 lb. Blue 500 Sheets/Rm",
"New", 3.99, 14.47, NOW()),

("Printer Paper", 1, "57889637899","JAM Paper® Bright Color Legal Paper 8 1/2 x 14 24lb Brite Hue Violet Purple Recycled 100/pack",
"New", 4.99, 19.99, NOW()),

("printer paper", 1, "85556598099","JAM Paper® Matte Paper 8.5 x 11 28lb Salmon Pink 50/pack",
"New", 3.41, 15.99, NOW()),

-- 1.2 Three-hole punched paper

("Three-hole punched paper", 1, "40303147599","Hammermill 3 Hole Punch Laser Copy Paper 8-1/2' x 11' 96 Bright 24 LB 500 Sheets",
"New", 2.11, 13.79, NOW()),

("Three-hole punched paper", 1, "11774222099","  soft Copy Paper 8-1/2' x 11'3-Hole Punched 500/Ream",
"New", 0.70, 8.54, NOW()),

("Three-hole punched paper", 1, "00247781299","  Soft® Multi-Purpose Paper 8-1/2x11'Letter Size 3 Hole Punch",
"New", 34.99, 64.99, NOW()),

("Three-hole punched paper", 1, "25607054799","Hammermill Copy Plus Copy Paper 3-Hole Punch 92 Brightness 20lb Ltr White 500 Shts/Rm",
"New", 2.27, 14.05, NOW()),

-- 1.3 Graph Paper

("Graph paper", 1, "87298271599","Tops Products Quadrille 4 Squares 8.5 x 11 Pads White  50 Sheets",
"New", 6.27, 21.89, NOW()),

("Graph paper", 1, "95395567699","TUL™ Custom Note Taking System Discbound Refill Pages 8 1/2' x 11'Letter Size Graph Ruled 100 Pages 50 Sheets White",
"New", 0.27, 4.99, NOW()),

("Graph paper", 1, "99206375199","Soft Graph Composition Book 9.75' x 7.5' Graph Paper Notebook Black 24 pack",
"New", 35.99, 69.99, NOW()),

("Graph paper", 1, "34504107099","Soft® Reinforced Filler Paper Graph Ruled 4x4 8-1/2' x 11'",
"New", 0.91, 5.99, NOW()),

-- Category 2 - Envelopes and Boxes

-- 2.1 #10 regular envelopes (4 1/8 x 9 1/2 inches)

("Regular envelope", 2, "11538302799", "LUX® #10 (4 1/8 x 9 1/2) Regular Envelopes", 
"New", 9.29, 42.99, NOW()),

("Regular envelope", 2, "49844863099", "LUX #10 Regular Envelopes (4 1/8 x 9 1/2) 50/Box", 
"New", 2.99, 17.49, NOW()),

("Regular envelope", 2, "27230845899", "LUX Moistenable Glue #10 Regular Envelopes (4 1/8 x 9 1/2) 250/Box", 
"New", 5.99, 25.49, NOW()),

("Regular envelope", 2, "27230845899", "LUX #10 Regular Envelopes (4 1/8 x 9 1/2) 1000/Box", 
"New", 15.99, 78.99, NOW()),

-- 2.2 Padded legal envelope mailers

("Padded legal envelope mailer", 2, "32403718899", "SOTF #5 Padded Mailer Gold Kraft 10-3/8 x14-3/4 25/Pack", 
"New", 3.99, 14.69, NOW()),

("Padded legal envelope mailer", 2, "24770139199", "Bubble Cushioned Poly Mailers 8-1/2 x 12 25/Pack", 
"New", 0.99, 7.69, NOW()),

("Padded legal envelope mailer", 2, "60308546899", "Self-Seal Cushioned Mailers Side Seam #1 7 1/4 x 12 100/Ct", 
"New", 7.99, 35.99, NOW()),

("Padded legal envelope mailer", 2, "98509999799", "Poly Bubble Mailer 8-1/2 x 11 8/Pack ", 
"New", 0.99, 7.99, NOW()),

-- 2.3 Packaging bubble

("Packaging bubble", 2, "46976529899", "Perforated Bubble Rolls 1/2 Bubble Height 24' x 125' 2/Bundle ", 
"New", 26.99, 104.99, NOW()),

("Packaging bubble", 2, "43723875299", "Perforated Bubble Rolls 3/16 Bubble Height 12' x 300' 4/Case", 
"New", 52.99, 199.99, NOW()),

("Packaging bubble", 2, "31657468299", "Perforated Bubble Rolls 5/16 Bubble Height 24 x 188 2/Bundle", 
"New", 39.99, 152.99, NOW()),

("Packaging bubble", 2, "56230217699", "Adhesive Bubble Rolls 24 x 300 2/Bundle ", 
"New", 49.99, 205.79, NOW()),

-- 2.4 Cardboard boxes (small, medium, large)
 
("Cardboard box", 2, "26937585999", "Bankers Box® SmoothMove Classic Moving Box Small", 
"New", 4.99, 24.79, NOW()),

("Cardboard box", 2, "66814087499", "Bankers Box SmoothMove Classic Moving Boxes Medium 8 Pack", 
"New", 7.99, 29.79, NOW()),

("Cardboard box", 2, "92345648699", "Bankers Box® SmoothMove Classic Moving Box Large 5 pack", 
"New", 7.99, 29.79, NOW()),

("Cardboard box", 2, "27741592999", "Shipping Boxes 32 ECT Brown 25/Bundle", 
"New", 3.99, 15.49, NOW()),

-- 2.5 Greeting cards and envelopes

("Greeting cards and envelopes", 2, "51914493999", "Avery® Half-Fold Greeting Card White Matte", 
"New", 3.99, 16.99, NOW()),

("Greeting cards and envelopes", 2, "70465447999", "S&S® All Occasion Value Greeting Card 120/Pack", 
"New", 5.99, 26.39, NOW()),

("Greeting cards and envelopes", 2, "99767165699", "JAM Paper® A7 Invitation Envelopes 5.25 x 7.25 White 50/pack", 
"New", 1.99, 6.39, NOW()),

("Greeting cards and envelopes", 2, "57389348299", "Strathmore Blank Greeting Cards With Envelopes 20 pack", 
"New", 3.99, 13.39, NOW()),

-- Category 3 Notebooks and Notepads

-- 3.1 composition notepads

("Composition notepad", 3, "23218948099","Composition Notebook, 9-3/4 x 7-1/2", 
"New", 1.09, 5.99, NOW()),

("Composition notepad", 3, "81339044999","Mini Composition Book 80 sheets", 
"New", 0.49, 2.99, NOW()),

("Composition notepad", 3, "78395561699","Black Marble Composition Book 48 Sheets", 
"New", 0.29, 1.79, NOW()),

("Composition notepad", 3, "25909267199","Marble Composition Book 100 Sheets, Wide Ruled", 
"New", 0.79, 3.59, NOW()),

("Composition notepad", 3, "70689729199","Permanently Bound Composition Book Quadrille Ruled",
"New", 1.29, 4.95, NOW()),

-- 3.2 Spiral-bound notebooks

("Spiral-bound notebooks", 3, "36840617199","Wirebound Notebook Assorted Colors ",
"New", 1.69, 6.99, NOW()),

("Spiral-bound notebooks", 3, "72822700099","Trend Wirebound Notebook 5 Subject College Ruled",
"New", 2.69, 10.99, NOW()),

("Spiral-bound notebooks", 3, "72721505199","1 Subject Notebook College Ruled",
"New", 0.39, 1.49, NOW()),

("Spiral-bound notebooks", 3, "05910253599","Mead Five Star Wirebound Notebook",
"New", 1.29, 4.99, NOW()),

("Spiral-bound notebooks", 3, "60741623199","Notebook 1 Subject College Ruled",
"New", 1.19, 3.99, NOW()),
 
-- 3.3 Legal Pad

("Legal Pad", 3, "08536661899","Wide Ruled Yellow 12/Pack",
"New", 4.29, 17.79, NOW()),

("Legal Pad", 3, "58774864599","Junior Size Narrow Ruled 12/Pack",
"New", 2.39, 9.49, NOW()),

("Legal Pad", 3, "14442768699","Wide Rule 50 Sheets per Pad 12/Pack",
"New", 7.09, 29.99, NOW()),

("Legal Pad", 3, "99832752499","Yellow Legal/Wide Rule 50 Sheets per Pad 12/Pack",
"New", 3.19, 13.99, NOW()),

-- 3.4 Steno Pad

("Steno Pad", 3, "99832752499","Recycled Steno Book 12/pack",
"New", 6.59, 24.99, NOW()),

("Steno Pad", 3, "43593284899","Pitman Rule Greentint 80 Sheets/Pad",
"New", 0.29, 1.79, NOW()),

("Steno Pad", 3, "10390221199","Gregg Ruled 80 Green Tint Sheets",
"New", 0.89, 3.49, NOW()),

("Steno Pad", 3, "85351203999","Gregg Rule Orchid 100% Recycled 80 Sheets/Pad",
"New", 3.29, 15.79, NOW()),

("Steno Pad", 3, "52888201399","Gregg Ruled White 40% Post-Consumer Waste 80 Sheets/Pad",
"New", 1.09, 4.49, NOW()),

-- Category 4 - Binder Items

-- 4.1 Binders

("Binder", 4, "48572071699","Blue 1.5-Inch 3-Ring View Binder", 
"New", 1.99, 9.99, NOW()),

("Binder", 4, "89273386499","Assorted 0.75 Inch Plastic 3 Ring Binders 4/Pack", 
"New", 3.99, 19.99, NOW()),

("Binder", 4, "91907155799","Assorted 0.75 Inch Plastic 3 Ring Binders 4/Pack", 
"New", 3.99, 19.99, NOW()),

("Binder", 4, "80383687699","Simply™ View Binders with Round Rings White 12 Pack", 
"New", 5.99, 29.99, NOW()),

("Binder", 4, "09985486599","SOTF® Standard View Binder with D-Rings Bright Green", 
"New", 0.29, 1.92, NOW()),

-- 4.2 Binders tabs

("Binder tab", 4,"95416177499", "JAM Paper® Premium Crocodile Textured 3 Ring Binders", 
"New", 4.29, 17.49, NOW()),

("Binder tab", 4, "51792050299", "Insertable Big Tab Dividers with Buff Paper", 
"New", 0.29, 1.99, NOW()),

("Binder tab", 4, "28381248899", "Avery Index Maker Clear Label Tab Dividers 8-Tab 5 Sets/Pack", 
"New", 6.29, 29.99, NOW()),

("Binder tab", 4, "09620111499", "SOTF Write-On™ BIG TAB 5-Tab Set Dividersk", 
"New", 0.59, 4.99, NOW()),

-- 4.3 Binder Pockets

("Binder pocket", 4, "21997183499", "SOTF Divider Pockets 3-Hole Punched 5 Set Assorted Colors", 
"New", 0.59, 3.99, NOW()),

("Binder pocket", 4, "61671267899", "Cardinal Zipper Binder Pockets", 
"New", 1.59, 7.38, NOW()),

("Binder pocket", 4, "18389054599", "C-Line® Specialty Binder Pocket", 
"New", 3.49, 17.99, NOW()),

("Binder pocket", 4, "07662716299", "2 Pocket Folder Snap In 3-Hole Punched", 
"New", 0.24, 2.00, NOW()),

-- 4.4 Clear binder document holders

("Clear binder document holder", 4, "43911011499", "Avery Clear Plastic Sleeve Heavyweight Letter 1 Dozen", 
"New", 1.25, 11.99, NOW()),

("Clear binder document holder", 4, "36839736699", "JAM Paper® Clear Plastic Sheet Protector 10/pack", 
"New", 1.00, 4.79, NOW()),

("Clear binder document holder", 4, "61570968899", "Kantek Acrylic Business Card Holder Capacity 80 Cards Clear", 
"New", 1.99, 6.49, NOW()),

-- 4.5 Hole puncher

("Hole puncher", 4, "94441865099", "One-Touch™ 26614 Heavy-Duty 3-Hole Punch 30-Sheet Capacity", 
"New", 4.99, 24.99, NOW()),

("Hole puncher", 4, "42434656399", "Adjustable Hole Punch, 10 Sheet Capacity", 
"New", 2.99, 14.99, NOW()),

("Hole puncher", 4, "78588643599", "Reduced Effort 3-Hole Punch 20 Sheet Punch Capacity", 
"New", 5.99, 27.99, NOW()),

("Hole puncher", 4, "83742152199", "Staples 10573-CC 1-Hole Punch 5 Sheet Capacity Silver", 
"New", 1.29, 1.79, NOW()),

-- Category 5 - Filling Cabinet

-- 5.1 Manila Folder 

("Manila Folder", 5, "99832752499","Assorted Position Manila 250/Box",
"New", 4.59, 19.49, NOW()),

("Manila Folder", 5, "81481454999","with 2 Fasteners Letter 3 Tab Manila 50/Box",
"New", 7.69, 31.99, NOW()),

("Manila Folder", 5, "43645249999","Letter 3 Tab Assorted Position 100/Box",
"New", 1.89, 8.29, NOW()),

("Manila Folder", 5, "21592966899","1.5 in Expansion Letter Manila 25/Pack",
"New", 5.89, 24.99, NOW()),

("Manila Folder", 5, "80903124099","1/3 Cut Manila Letter-Size 24/Pack",
"New", 1.49, 6.89, NOW()),

-- 5.2 Hanging Folder

("Hanging Folder", 5, "47357726099","5-Tab Letter Standard Green 50/Box", 
"New", 4.09, 18.49, NOW()),

("Hanging Folder", 5, "47357726099","5-Tab Letter Assorted Colors 25/Box", 
"New", 3.39, 13.79, NOW()),

("Hanging Folder", 5, "44580324899","5-Tab Legal Standard Green 50/Box", 
"New", 6.99, 29.99, NOW()),

("Hanging Folder", 5, "74250544099","Letter 2 in Capacity Standard Green 25/Box", 
"New", 7.09, 26.99, NOW()),

-- 5.3 Folder Tab

("Folder Tab", 5, "99362400299","Plastic Tabs Clear 25/Pack", 
"New", 0.69, 2.99, NOW()),

("Folder Tab", 5, "50461784599","Plastic Clear Tabs 50/Pack", 
"New", 2.19, 8.99, NOW()),

("Folder Tab", 5, "00782394299","Plastic Assorted Tabs 50/Pack", 
"New", 2.29, 9.49, NOW()),

("Folder Tab", 5, "60768286299","Tab Insert 100/Pack", 
"New", 0.69, 1.79, NOW()),

("Folder Tab", 5, "91662063399","5 Tab Positions Letter Size Teal 25/Box", 
"New", 6.19, 23.49, NOW()),

-- 5.4 Hanging Hook

("Hanging Hook", 5, "43384108699","Clear Medium Hooks Clear 2/Pack", 
"New", 1.09, 4.29, NOW()),

("Hanging Hook", 5, "18319571499","Large 14 hooks/16 strips per pack", 
"New", 7.09, 24.99, NOW()),

("Hanging Hook", 5, "65442319899","Wire Hook Holds 5 lbs", 
"New", 1.09, 4.49, NOW()),
 
("Hanging Hook", 5, "77562755199","Large Tradition Hook Brushed Nickel", 
"New", 1.39, 6.49, NOW()),

("Hanging Hook", 5, "13821932599","Small Wire Hooks Value Pack White 9/Pack", 
"New", 2.19, 9.99, NOW()),

-- Category 6 - Small Office Supplies

-- 6.1 Stapler

("Stapler", 6, "61793583999", "SOTF Desktop Stapler", 
"New", 0.99, 4.39, NOW()),

("Stapler", 6, "17737191799", "Office + Style Automatic Electric Stapler- Green", 
"New", 3.99, 14.39, NOW()),

("Stapler", 6, "54338906199", "Swingline Commercial Desktop Full Strip Stapler 20 Sheet Capacity Black", 
"New", 2.49, 8.99, NOW()),

("Stapler", 6, "47381232699", "Swingline® Optima® Grip Full Strip Stapler 25 Sheet Capacity Silver", 
"New", 0.99, 4.39, NOW()),

-- 6.2 Staples

("Staples", 6, "82427929999", "Standard Staples 1/4' 25,000/Pack", 
"New", 1.99, 7.99, NOW()),

("Staples", 6, "46363802599", "Swingline® S.F.® 4 Premium Staples 1/4", 
"New", 0.99, 4.29, NOW()),

("Staples", 6, "43828754299", "SOTF® Standard Staples 5000/Box x 2 PK 10000 Count", 
"New", 0.99, 4.29, NOW()),

("Staples", 6, "43828754299", "Swingline® Standard Staples", 
"New", 0.49, 3.99, NOW()),

-- 6.3 Stapler remover

("Stapler remover", 6, "74588016899", "Claw Staple Remover 3/Pack", 
"New", 0.49, 3.49, NOW()),

("Stapler remover", 6, "82560757099", "Swingline® Deluxe Staple Remover Extra Wide Finger Grips", 
"New", 2.49, 6.09, NOW()),

("Stapler remover", 6, "82560757099", "Swingline® Deluxe Staple Remover Extra Wide Finger Grips", 
"New", 2.49, 6.09, NOW()),

("Stapler remover", 6, "80618057599", "Swingline® Heavy-Duty Staple Remover", 
"New", 3.49, 12.09, NOW()),

("Stapler remover", 6, "07422038799", "Max® Heavy Duty Staple Remover Black", 
"New", 3.49, 12.39, NOW()),

-- 6.4 Scissors

("Scissors", 6, "54972211199", "Helping Hands Scissors 2 Count Pack Of 3", 
"New", 5.49, 29.49, NOW()),

("Scissors", 6, "38587077999", "Westcott® 13901/Titanium Bonded® Scissors Straight-Handle", 
"New", 3.20, 14.79, NOW()),

("Scissors", 6, "56562957399", "Westcott® 13132/Kids Value Scissors 2 Pack", 
"New", 1.20, 4.79, NOW()),

("Scissors", 6, "00331341499", "Diamond Visions SC-0179 8 in. Cushion Grip Scissors Pack of 48", 
"New", 10.99, 79.49, NOW()),

("Scissors", 6, "14277702999", "Westcott® 8 in Titanium UltraSmooth™ Scissors", 
"New", 6.45, 23.99, NOW()),

-- 6.5 Box cutter

("Box cutter", 6, "10929189199", "SOTF Box Cutter 12 Pack", 
"New", 4.45, 18.99, NOW()),

("Box cutter", 6, "84246350399", "Slice, Inc. Ceramic Auto Retractable Box Cutter", 
"New", 4.45, 19.99, NOW()),

("Box cutter", 6, "49372463899", "BOX Stretch Film Cutter 2/Pack", 
"New", 3.45, 13.99, NOW()),

("Box cutter", 6, "07257399599", "Slice ABS Magnetic & Zirconium Oxide Auto Retractable Box Cutter 6 Pack", 
"New", 22.45, 101.39, NOW()),

-- 6.6 Paperclips (small, medium, large)

("Paperclips", 6, "52954767099", "SOTF® Jumbo Paper Clips Smooth  1000/Pack", 
"New", 1.45, 9.99, NOW()),

("Paperclips", 6, "76642417899", "SOTF® Small Size Vinyl-Coated Paper Clips 1000/Tub", 
"New", 3.45, 10.59, NOW()),

("Paperclips", 6, "17905112899", "SOTF® Medium Size Vinyl-Coated Paper Clips 1000/Tub", 
"New", 4.00, 14.59, NOW()),

("Paperclips", 6, "70931122499", "ACCO Premium Large Paper Clips 100/Box", 
"New", 0.25, 2.79, NOW()),

-- 6.7 Binder clips (small, medium, large)

("Binder clips", 6, "56966255299", "ACCO Premium Large Paper Clips 100/Box", 
"New", 0.25, 2.79, NOW()),

("Binder clips", 6, "87318703599", "Office + Style Colored 32 mm Binder Clips 12 pcs", 
"New", 1.25, 6.59, NOW()),

("Binder clips", 6, "38689699599", "Metal Binder Clips Black Assorted Capacities 60 Pack", 
"New", 1.89, 7.99, NOW()),

("Binder clips", 6, "81797346499", "SOTF® Small Metal Binder Clips Bulk Pack 144 Pack", 
"New", 3.12, 10.29, NOW()),

-- 6.8 Clear cellophane tape dispenser

("Tape dispenser", 6, "81797346499", "Scotch Premium Performance Hand Packing Tape Dispenser 12 Pack", 
"New", 9.12, 48.99, NOW()),

("Tape dispenser", 6, "43652493999", "Scotch Commercial Grade Shipping Packing Tape with Dispenser 2 Pack", 
"New", 3.99, 20.99, NOW()),

("Tape dispenser", 6, "27993419299", "3M™ H-183 Carton Sealing Tape Dispenser", 
"New", 22.45, 110.29, NOW()),

("Tape dispenser", 6, "84692063799", "Scotch Heavy-Duty Shipping Tape Clear 142", 
"New", 0.23, 2.89, NOW()),

-- 6.9 Clear cellophane tape

("Cellophane tape", 6, "57317404999", "Scotch® Transparent Tape 4 Pack", 
"New", 4.02, 12.99, NOW()),

("Cellophane tape", 6, "84820918599", "Scotch® Magic Tape 6 Pack", 
"New", 4.02, 16.49, NOW()),

("Cellophane tape", 6, "08412305399", "Scotch® Removable Tape", 
"New", 0.26, 2.99, NOW()),

("Cellophane tape", 6, "36381964499", "Scotch® Magic Tape 3 Pack", 
"New", 0.89, 5.49, NOW()),

-- 6.10 Packing tape

("Packing tape", 6, "41957787999", "SOTF Moving and Storage Packing Tape 6/Pack", 
"New", 4.45, 23.99, NOW()),

("Packing tape", 6, "72425878099", "SOTF Ultra Heavy-Duty Shipping Tape 6/Pack", 
"New", 4.45, 22.49, NOW()),

("Packing tape", 6, "66247128499", "SOTF Lightweight Moving and Storage Packing Tape 36/Pack", 
"New", 11.23, 56.99, NOW()),

("Packing tape", 6, "20535690899", "Scotch Sure Start Shipping Packing Tape with Dispenser 1 Pack", 
"New", 1.00, 4.59, NOW()),

-- 6.11 Duct tape

("Duct tape", 6, "35909362699", "Basic Strength Duck Brand Duct Tape", 
"New", 0.32, 3.79, NOW()),

("Duct tape", 6, "93694128099", "Duck Tape® Brand Duct Tape Cha Cha Cherry™", 
"New", 0.99, 5.99, NOW()),

("Duct tape", 6, "59981163799", "Scotch® Tough Duct Tape 1.88 x 20 yd. Transparent ", 
"New", 1.99, 7.99, NOW()),

("Duct tape", 6, "84496698199", "Tape Logic™ 10 mil Duct Tape 3/Pack ", 
"New", 7.99, 53.19, NOW()),

-- 6.11 Sticky Notes

("Sticky Notes", 6, "22365022099", "Post-it® Super Sticky Notes 3 x 3 Canary Yellow 10 Pads/Pack  ", 
"New", 4.99, 17.99, NOW()),

("Sticky Notes", 6, "91910056099", "SOTF® Stickies™ Recycled Notes 3 x 3 Yellow 12 Pads/Pack", 
"New", 2.99, 13.99, NOW()),

("Sticky Notes", 6, "42450578999", "Post-it® Super Sticky Notes 3 x 3 24 Pads/Cabinet Pack", 
"New", 4.99, 29.99, NOW()),

("Sticky Notes", 6, "97765516199", "Post-it® Super Sticky Notes 3 x 3 24 Pads/Cabinet Pack", 
"New", 4.99, 29.99, NOW()),

-- Category 7 - Writing Implements

-- 7.1 Pencils

("Pencil", 7, "35906141399","Graphite Pencil pre-sharpened 72 ct", 
"New", 3.39, 14.99, NOW()),

("Pencil", 7, "62411950799","Gripped Mechanical Pencils Medium 0.7mm Assorted Colors 12/pk", 
"New", 0.69, 3.29, NOW()),

("Pencil", 7, "90838811199","Mechanical Pencils 0.7mm HB #2", 
"New", 3.79, 15.99, NOW()),

("Pencil", 7, "48605984899","Dixon Ticonderoga Presharpened #2 Pencil Yellow 18/Pack", 
"New", 3.19, 13.99, NOW()),

("Pencil", 7, "64796373799","HB Woodcased Pencils Black 36/Pack", 
"New", 0.89, 3.99, NOW()),

-- 7.2 Pencil Sharpner

("Pencil Sharpner", 7, "12588022499","Light Duty Electric Pencil Sharpener", 
"New", 4.19, 17.99, NOW()),

("Pencil Sharpner", 7, "93615941199","HEAVY DUTY ELECTRIC PENCIL SHARPENER", 
"New", 10.89, 44.99, NOW()),

("Pencil Sharpner", 7, "20488267499","Manual Dual-Hole Pencil Sharpener Assorted Colors", 
"New", 1.09, 2.49, NOW()),

("Pencil Sharpner", 7, "04624497899","Style Electronic Pencil Sharpener Black", 
"New", 7.19, 29.99, NOW()),

-- 7.3 Mechanical Pencil

("Mechanical Pencil", 7, "18854547199","Mechanical Pencils #2 .9mm 24/Pack", 
"New", 1.89, 7.99, NOW()),

("Mechanical Pencil", 7, "42843050399","Mechanical Pencils, Teal Barrel 0.9mm Dozen", 
"New", 4.19, 16.99, NOW()),

("Mechanical Pencil", 7, "08784285399","III Automatic Mechanical Pencils 0.9mm Each", 
"New", 1.09, 4.59, NOW()),

("Mechanical Pencil", 7, "31997477499","III Automatic Pencils .9mm Assorted Colors 2 Pack", 
"New", 2.09, 10.39, NOW()),

-- 7.4 Mechanical Pencil Lead Refills

("Mechanical Pencil lead refills", 7, "33308730399","Mates Mechanical Pencil Lead Refills 1.3 mm 12/pk", 
"New", 0.39, 1.99, NOW()),

("Mechanical Pencil lead refills", 7, "95827110099","Pentel Super Hi-Polymer Lead Refill 0.9 mm HB, Black 90/Pack", 
"New", 1.09, 4.99, NOW()),

("Mechanical Pencil lead refills", 7, "46418055999","Pentel Red Drafting Lead Refills .5mm 36 Leads", 
"New", 1.49, 6.09, NOW()),

("Mechanical Pencil lead refills", 7, "72644011599","Pentel Super Hi-Polymer Refill Leads H 0.7mm  24/Pack", 
"New", 9.29, 37.49, NOW()),

-- 7.5 Erasers

("Eraser", 7, "16677220299","Pink Wedge Erasers, 3/Pack", 
"New", 0.59, 2.49, NOW()),

("Eraser", 7, "94895110199","Pentel Clic Eraser® with Grip 3/Pack", 
"New", 1.39, 5.99, NOW()),

("Eraser", 7, "43762516199","Sargent Art™ Large Eraser Pink 36/Pack", 
"New", 1.19, 9.39, NOW()),

("Eraser", 7, "64926815999","Pink Pearl Eraser Medium 24/pk", 
"New", 2.29, 11.19, NOW()),

-- 7.6 Pens

("Pen", 7, "23988110799","Pilot G2 Premium Retractable Gel Roller Pens 0.7mm Fine Point Black 36/Pack", 
"New", 9.59, 39.99, NOW()),

("Pen", 7, "89587686899","Gel Pens Medium Point Assorted 14/Pack", 
"New", 6.39, 25.99, NOW()),

("Pen", 7, "66960113599","Retractable Gel Roller Pens Fine Point Black 5/Pk", 
"New", 1.89, 7.99, NOW()),

("Pen", 7, "84460962399","Retractable Ballpoint Pen Medium Point Black 24/Pack", 
"New", 3.09, 12.99, NOW()),

("Pen", 7, "71915491299","Ballpoint Pens 1.2mm Medium Point Black & Blue Ink 36/Pack", 
"New", 1.39, 5.99, NOW()),

-- 7.7 Black All Purpose Markers

("Black all-purpose marker", 7, "16931574399","Window Marker Jumbo Chisel Tip White Each", 
"New", 1.49, 7.29, NOW()),

("Black all-purpose marker", 7, "94606026699","PERMANENT TANK MARKERS CHISEL BLACK 12PK", 
"New", 2.09, 8.49, NOW()),

("Black all-purpose marker", 7, "79426172799","Permanent Tank Markers Chisel Tip Assorted Colors 24/pk", 
"New", 3.89, 15.99, NOW()),

("Black all-purpose marker", 7, "39271242899","Copic Marker Permanent Marker Assorted 12/Pack", 
"New", 15.89, 64.19, NOW()),

-- 7.8 Highlighters

("Highlighter", 7, "95397180699","Chisel Tip Assorted 12/pk", 
"New", 2.09, 8.99, NOW()),

("Highlighter", 7, "50804747799","CHISEL ASSORTED 12PK", 
"New", 1.39, 5.99, NOW()),

("Highlighter", 7, "10831061299","Chisel Point Yellow 24/Pack", 
"New", 2.69, 10.79, NOW()),

("Highlighter", 7, "28408203199","Assorted 5/Pack", 
"New", 0.79, 3.29, NOW()),

-- 7.9 Dry/Wet Erase Board

("Dry/Wet erase board", 7, "10200284699","Flannel/Dry Erase Board 18 in x 24 in", 
"New", 3.49, 14.39, NOW()),

("Dry/Wet erase board", 7, "09235101399","Magnetic Dry-Erase Board", 
"New", 2.29, 9.99, NOW()),

("Dry/Wet erase board", 7, "02879266799","Magnetic Dry-Erase Board Aluminum Frame", 
"New", 22.09, 89.99, NOW()),

("Dry/Wet erase board", 7, "78425947399","18 in x 24 in Dry Erase Board Black", 
"New", 5.19, 21.19, NOW()),

-- 7.10 Dry/Wet Erase Marker

("Dry/Wet erase marker", 7, "39622613199","Fluorescent Wet Erase Markers Bullet Tip Assorted 5/pk", 
"New", 4.09, 16.19, NOW()),

("Dry/Wet erase marker", 7, "53742014099","Wet-Erase Overhead Markers Fine Point Assorted 4/pk", 
"New", 1.59, 6.54, NOW()),

("Dry/Wet erase marker", 7, "27801508199","Wet Erase Markers Chisel Tip Assorted 4/pk", 
"New", 0.69, 2.59, NOW()),

("Dry/Wet erase marker", 7, "51846718599","Low Odor Dry-Erase Markers Chisel Tip Red 12/pk", 
"New", 4.39, 17.99, NOW()),

-- 7.11 Dry/Wet Erase Spray

("Dry/Wet1 erase spray", 7, "33712002399","PAK-IT Botlle With Trigger 32Oz Trigger Spray Purple", 
"New", 1.09, 4.59, NOW()),

("Dry/Wet1 erase spray", 7, "21524632399","Furniture Polish Spray 13.8 oz", 
"New", 2.19, 10.89, NOW()),

("Dry/Wet1 erase spray", 7, "98553885199","M5082 Burn Spray Benzocaine", 
"New", 1.59, 6.69, NOW()),

("Dry/Wet1 erase spray", 7, "25539740299","Disinfectant Spray 19 oz", 
"New", 2.39, 9.99, NOW()),

-- 7.12 Rulers 

("Ruler", 7, "42480561699","Transparent Acrylic 12 in Ruler Clear", 
"New", 0.79, 2.49, NOW()),

("Ruler", 7, "94573267499","Wood Office 12 in Ruler", 
"New", 0.39, 1.79, NOW()),
 
("Ruler", 7, "37725167599","12 in Stainless Steel Office Ruler with Non Slip Cork Base", 
"New", 1.19, 4.79, NOW()),

("Ruler", 7, "19626794099","12 in Flexible Ruler Assorted", 
"New", 0.19, 2.00, NOW()),
 
("Ruler", 7, "72728711499","18 in Stainless Steel Ruler", 
"New", 1.89, 7.79, NOW()),

-- Category 8 - Electrical Items

-- 8.1 Computers

("Desktop Computer", 8, "27362586399","18 in Dell - Inspiron Desktop - Intel Core i3 - 8GB Memory - 1TB Hard Drive - Black", 
"New", 152.45, 429.99, NOW()),

("Desktop Computer", 8, "59472730899","HP - Slimline Desktop - Intel Core i7 - 8GB Memory - 1TB Hard Drive - Black", 
"New", 164.45, 499.99, NOW()),

("Desktop Computer", 8, "61763922099","Lenovo - 510S-08IKL Desktop - Intel Core i3 - 4GB Memory - 1TB Hard Drive - Black", 
"New", 124.99, 379.99, NOW()),

("Desktop Computer", 8, "85809682299","HP - Pavilion Desktop - Intel Core i3 - 8GB Memory - 1TB Hard Drive - HP finish in twinkle black", 
"New", 142.99, 449.99, NOW()),

("Laptop Computer", 8, "48273429999","HP - 17.3 in Laptop - Intel Core i5 - 8GB Memory - 1TB Hard Drive - HP finish in jet black", 
"New", 142.99, 479.99, NOW()),

("Laptop Computer", 8, "23578471799","Apple - MacBook Air® - 13.3 in Display - Intel Core i5 - 8GB Memory - 128GB Flash Storage (Latest Model) - Silver", 
"New", 500.99, 999.99, NOW()),

("Laptop Computer", 8, "00943008899","Apple - MacBook® Pro - 15.4 in Display - Intel Core i7 - 16GB Memory - 256GB Flash Storage - Silver", 
"New", 1500.99, 1999.99, NOW()),

("Laptop Computer", 8, "30660429599","HP - 15.6 in Touch-Screen Laptop - Intel Core i5 - 8GB Memory - 1TB Hard Drive - HP finish in jet black", 
"New", 249.99, 449.99, NOW()),

-- 8.2 Monitors

("Monitor", 8, "53834517499","Acer - H6 Series 23 in IPS LED HD Monitor - Black", 
"New", 56.99, 179.99, NOW()),

("Monitor", 8, "80360078899","LG - 29 in IPS LED WFHD 21:9 UltraWide FreeSync Monitor", 
"New", 64.99, 209.99, NOW()),

("Monitor", 8, "36351087399","Dell - S2418HN 24 in IPS LED FHD Monitor - Black", 
"New", 69.99, 229.99, NOW()),

("Monitor", 8, "53671737999","Dell - UltraSharp U3417W 34.14 in LED Curved HD 21:9 Ultrawide Monitor - Black", 
"New", 224.69, 699.99, NOW()),

-- 8.3 Keyboards

("Keyboard", 8, "69948744899","Logitech - MK270 Wireless Keyboard and Mouse - Black", 
"New", 5.33, 21.99, NOW()),

("Keyboard", 8, "01676966899","Logitech - K400 Plus Wireless Keyboard - Black", 
"New", 6.33, 27.99, NOW()),

("Keyboard", 8, "81701349099","Microsoft - Natural Ergonomic Keyboard 4000 - Black", 
"New", 8.22, 30.99, NOW()),

("Keyboard", 8, "54258396899","Microsoft - Natural Ergonomic Keyboard 4000 - Black", 
"New", 8.22, 30.99, NOW()),

-- 8.4 Mouses

("Mouse", 8, "39993994199", "Logitech - M185 Wireless Mouse - Blue", 
"New", 3.23, 9.99, NOW()),

("Mouse", 8, "77600872699", "Microsoft - Mobile Mouse 1850 Wireless Mouse - Black", 
"New", 3.23, 10.99, NOW()),

("Mouse", 8, "72343132499", "Microsoft - Arc Touch Mouse - Black", 
"New",12.25, 39.99, NOW()),

("Mouse", 8, "00254217599", "Logitech - M325 Wireless Optical Mouse - Silver", 
"New",6.35, 19.99, NOW()),

-- 8.5 Printers

("Printer", 8, "38861624399", "Epson - Expression Home XP-440 Wireless All-In-One Printer", 
"New", 31.23, 59.99, NOW()),

("Printer", 8, "98806102499", "Canon - PIXMA MX492 Wireless All-In-One Printer - Black", 
"New", 22.98, 49.99, NOW()),

("Printer", 8, "26999389999", "HP - ENVY 5660 Wireless All-In-One Instant Ink Ready Printer - Black", 
"New", 66.98, 149.99, NOW()),

("Printer", 8, "24868250599", "HP - OfficeJet 4650 Wireless All-In-One Instant Ink Ready Printer - Black", 
"New", 39.99, 99.99, NOW()),

-- 8.6 Toners/Print Cartridges

("Print Cartridge", 8, "24868250599", "Ricoh 405536 Black Print Cartridge High Yield", 
"New", 39.99, 75.49, NOW()),

("Print Cartridge", 8, "84539191899", "HP 85A Toner Cartridges, Black, 2/Pack", 
"New", 59.99, 129.99, NOW()),

("Print Cartridge", 8, "23636242099", "Brother TN-336BK Black Toner Cartridge, High Yield", 
"New", 59.99, 55.79, NOW()),

("Print Cartridge", 8, "18740255699", "HP 35A Black Toner Cartridge ", 
"New", 32.66, 71.99, NOW()),

-- 8.7 Telephone

("Telephone", 8, "39462624999", "AT&T ML17939 2-Line Corded Telephone with Digital Answering System, Black", 
"New", 32.36, 79.99, NOW()),

("Telephone", 8, "74262980099", "Panasonic KX-TGE232B Telephone System with Answering System, Cordless, Black", 
"New", 24.36, 69.99, NOW()),

("Telephone", 8, "53297578399", "AT&T ML17929 Two-Line Corded Speakerphone", 
"New", 21.22, 59.99, NOW()),

("Telephone", 8, "17362967799", "VTech CM Series 4-Line Small Business Phone System – Office Starter ", 
"New", 121.22, 329.99, NOW()),

-- 8.8 Speakerphones

("Speakerphone", 8, "78271879499", "AT&T ML17928 2-Line Speakerphone ", 
"New", 21.22, 69.99, NOW()),

("Speakerphone", 8, "24389208099", "Jabra SPEAK™ 410 Multidevice Speakerphone (Microsoft Lync Optimized)", 
"New", 56.45, 125.99, NOW()),

("Speakerphone", 8, "08450394199", "Spracht® Conference Mate™ Portable Bluetooth Speakerphone, 4 W, Black", 
"New", 26.45, 78.99, NOW()),

("Speakerphone", 8, "18887041199", "RCA® 25201RE1 2-Line Corded Speakerphone, Black", 
"New", 20.45, 49.19, NOW()),

-- 8.9 Headsets

("Headset", 8, "32291180399", "Plantronics CS540 Wireless Telephone Headset System", 
"New", 8.99, 29.99, NOW()),

("Headset", 8, "17223652799", "Plantronics MX500C Headset for Cordless Telephones", 
"New", 8.75, 20.43, NOW()),

("Headset", 8, "63988216499", "Logitech H111 Over-the-Head Stereo Headset, Black", 
"New", 4.75, 15.79, NOW()),

("Headset", 8, "69771781899", "Jabra® BIZ 2300 QD Duo On-Ear Headset with Noise Canceling Microphone and Control, Black", 
"New", 44.75, 185.99, NOW()),

-- 8.9 Computer screen and keyboard cleaner

("Computer screen", 8, "14958202999", "3M™ Privacy Filter for 19 in Standard Monitor", 
"New", 24.75, 69.29, NOW()),

("Computer screen", 8, "57867798299", "V7® 21.5 in Privacy Screen Filter for Notebooks and Desktop Monitors ", 
"New", 19.65, 54.99, NOW()),

("Computer screen", 8, "03602510099", "Kensington® Snap2™ Privacy Screen, Diagonal LCD Screen Size 17 in", 
"New", 49.65, 124.99, NOW()),

("Computer screen", 8, "82617123299", "Targus® LCD / Notebook 17 in Privacy Screen Filter", 
"New", 24.65, 61.99, NOW()),

-- 8.10 Keyboard Cleaner/ Pressured air (to clean keyboard)

("Keyboard Cleaner", 8, "23802127799","SOTF Electronics Duster 7 oz 4pk", 
"New",7.59, 29.99, NOW()),

("Keyboard Cleaner", 8, "02958696199","Read Right KeyKleen Keyboard Cleaner, Unscented, 24/Box", 
"New",3.59, 13.99, NOW()),

("Keyboard Cleaner", 8, "21608965299","SOTF® Electronics Duster, 7 oz Single", 
"New",2.59, 8.99, NOW()),

("Keyboard Cleaner", 8, "49304336899","Falcon® Dust-Off® Premium Keyboard Cleaning Kit", 
"New",4.12, 18.99, NOW()),

-- Pressured air (to clean keyboard)

("Pressured air", 8, "95892948899","Dust Destroyer Duster 3.5oz, 2/Pack", 
"New",2.12, 10.99, NOW()),

("Pressured air", 8, "34504851199","SOTF Electronics Duster 7 oz 4pk", 
"New",5.01, 29.99, NOW()),

("Pressured air", 8, "75726829599","Dust Destroyer Duster 3.5 oz, Single", 
"New",0.99, 5.99, NOW()),
 
("Pressured air", 8, "45837505099","Dust-Off Duster 7oz, 6/Pack", 
"New",10.23, 49.99, NOW()),

-- Category 9 - Office Storage
-- 9.1 Bookends

("Bookend", 9, "92769006899","MMF Industries™ 9 in High Black Deluxe Bookends", 
"New", 3.99, 11.49, NOW()),

("Bookend", 9, "22365022099","MMF Industries™ STEELMASTER® Soho Collection 9 in Deluxe Bookend Silver", 
"New",1.45, 7.59, NOW()),

("Bookend", 9, "91910056099","Charles Leonard 9 in Bookends Black 2/Set", 
"New",3.45, 16.39, NOW()),

("Bookend", 9, "42450578999","Village Wrought Iron BE 89 Pinecone Bookends", 
"New",8.55, 36.99, NOW()),

-- 9.2 In/Out Box

("In/Out Box", 9, "97765516199","SOTF Black Wire Mesh 3-Tier Desk Shelf", 
"New",5.23, 23.99, NOW()),

("In/Out Box", 9, "95425746699","SOTF Wire Mesh Bookend Black", 
"New",2.50, 9.99, NOW()),

("In/Out Box", 9, "16950894599","MMF Industries™ STEELMASTER® Soho Collection 5 in Economy Bookend Blue", 
"New",1.75, 7.59, NOW()),

("Document sorter/holder", 9, "45879069199","Storex Document Sorter Black", 
"New",23.70, 86.99, NOW()),

("Document sorter/holder", 9, "43495273799","Storex Document Sorter Gray", 
"New",23.70, 86.99, NOW()),

("Document sorter/holder", 9, "15579374799","Staples Black Wire Mesh Step Sorter", 
"New",2.88, 11.49, NOW()),

("Supply trays and containers", 9, "29285020199","Staples® All-in-One Black Wire Mesh Desk Organizer", 
"New",6.25, 24.99, NOW()),

("Supply trays and containers", 9, "23663277599","SOTF Black Wire Mesh 3-Tier Desk Shelf", 
"New",5.70, 23.99, NOW()),

("Supply trays and containers", 9, "40993798399","Mind Reader Census Metal Mesh 3 Tier File Tray Black", 
"New",3.70, 15.99, NOW()),

("Supply trays and containers", 9, "93440197499","OIC® 2200 Series Black Plastic Double Supply Organizer", 
"New",5.99, 18.29, NOW()),

("Supply trays and containers", 9, "02871050999","Crayola®Ultimate Art Supply Kit", 
"New",4.44, 11.99, NOW()),

-- Category 10 - Projector
-- 10.1 Label Maker

("Label maker", 10, "35839734599","Brother P-Touch PT-D400 Label Maker",
"New", 4.91, 29.99, NOW()),

("Label maker", 10, "25690298399","DYMO LetraTag LT-100H Electronic Label Maker",
"New", 14.91, 54.99, NOW()),

("Label maker", 10, "83397131299","Brother QL-800",
"New", 21.99, 59.99, NOW()),

("Label maker", 10, "68318356999","Dymo MobileLabeler",
"New", 23.99, 62.29, NOW()),

-- 10.2 Laminating Machine

("Laminating machine", 10, "51588912899","Fellowes SATURN™ 3i 95 Thermal and Cold Laminating Machine",
"New", 50.99, 169.99, NOW()),

("Laminating machine", 10, "05998290999","Fellowes SATURN™ 3i 125 Thermal and Cold Laminating Machine",
"New", 91.99, 239.99, NOW()),

("Laminating machine", 10, "35554596299","Fellowes Laminator - JUPITER™ 2 125 Laminating Machine",
"New", 101.99, 367.99, NOW()),

("Laminating machine", 10, "18459911199","Royal Sovereign CL-923 9 in Desktop Laminator",
"New", 4.99, 30.19, NOW()),

-- 10. 3 Scanner

("Scanner", 10, "27438212899","Epson WorkForce® ES-400 Duplex Document Scanner",
"New", 111.99, 349.99, NOW()),

("Scanner", 10, "78348824699","FUJITSU Document Scanner ScanSnap iX500",
"New", 150.99, 495.99, NOW()),

("Scanner", 10, "35262991999","Brother® ADS2000E Desktop Scanner",
"New", 99.99, 299.99, NOW()),

("Scanner", 10, "13865397599","Canon CanoScan LiDE 220 Image Scanner",
"New", 38.99, 89.99, NOW()),

-- 10.3 Fax Machine 

("Fax machine", 10, "37514701699","Brother Personal Plain-Paper Fax Machine ",
"New", 11.99, 39.99, NOW()),

("Fax machine", 10, "77815298099","Brother IntelliFAX High-Speed Laser Fax Machine  ",
"New", 87.99, 199.99, NOW()),

("Fax machine", 10, "14770769899","Brother IntelliFAX Refurbished Laser Fax Machine  ",
"New", 45.99, 112.99, NOW()),

("Fax machine", 10, "68693641899","Canon FAXPHONE Laser Fax Machine  ",
"New", 69.99, 199.99, NOW()),

-- 10.4 Shredder

("Shredder", 10, "00329335499","Staples 10-Sheet Cross-Cut Shredder with Lockout Key ",
"New", 21.99, 69.99, NOW()),

("Shredder", 10, "95783726899","Soft 100-Sheet Auto-Feed Micro-Cut Shredder ",
"New", 67.99, 169.99, NOW()),

("Shredder", 10, "38880654399","Soft 15-Sheet Cross-Cut Shredder ",
"New", 57.99, 129.99, NOW()),

("Shredder", 10, "01823368199","Fellowes Powershred 10-Sheet Cross-Cut Shredder ",
"New", 21.99, 69.99, NOW()),

-- 10.5 Extension Cord

("Extension cord", 10, "99463987299","Staples 6' Power Strip ",
"New", 1.99, 12.99, NOW()),

("Extension cord", 10, "86939155099","Staples 3' and 6-Outlet Power Strip, White ",
"New", 0.99, 9.99, NOW()),

("Extension cord", 10, "10396707799","Staples 15' Power Strip ",
"New", 4.99, 24.99, NOW()),

("Extension cord", 10, "92949309199","Fellowes 15ft 6-Outlet Power Strip ",
"New", 5.99, 27.99, NOW()),

-- 10.5 Surge Protectors

("Surge protector", 10, "36905411599","Staples 6-Outlet 1200 Joule Surge Protector ",
"New", 2.99, 19.99, NOW()),

("Surge protector", 10, "81339044999","GE Surge Protector, 6-Outlet, Black ",
"New", 1.99, 15.39, NOW()),

("Surge protector", 10, "23218948099","Belkin Surge Protector 12 Outlets 4320 Joules ",
"New", 8.99, 42.99, NOW()),

("Surge protector", 10, "42696881799","Soft 8-Outlet 3300 Joule Surge Protector ",
"New", 7.99, 29.99, NOW()), 

-- Category 11 - Furniture
-- 11.1 Desks
 
("Desk", 11, "27559290499","Ameriwood® Tiverton Executive Desk, Expert Plum ",
"New", 77.99, 149.99, NOW()), 

("Desk", 11, "88917382599","Altra™ Chadwick Collection L Desk, Nightingale Black ",
"New", 107.99, 249.99, NOW()), 

("Desk", 11, "20974274099","Sauder® Edgewater Collection Executive Desk, Estate Black ",
"New", 137.99, 299.99, NOW()), 

("Desk", 11, "39670623199","Bush Business Cubix 47.51 in x 26.81 in x 29.80 in Desk, Hansen Cherry/Galaxy  ",
"New", 87.99, 194.99, NOW()), 

-- 11.2 Chairs

("Chairs", 11, "68993409399","SOTF Carder Mesh Office Chair Black",
"New", 67.99, 199.99, NOW()), 

("Chairs", 11, "73791602999","SOTF® Vexa Mesh Chair, Black ",
"New", 21.99, 59.99, NOW()),  

 ("Chairs", 11, "42426377399","SOTF Hyken Technical Mesh Task Chair Black  ",
"New", 51.99, 129.99, NOW()), 

("Chairs", 11, "38595507799","OFM Gaming Chair Blue  ",
"New", 53.99, 114.99, NOW()),

-- 11.3 Filing Cabinets
 
("Filing cabinets", 11, "06439564199","Office Designs 2 Drawer Vertical File Charcoal Letter 14.25''W",
"New", 35.99, 89.99, NOW()),

("Filing cabinets", 11, "74804676599","Soft 4-Drawer Letter Size Vertical File Cabinet   ",
"New", 65.99, 197.99, NOW()),

("Filing cabinets", 11, "77568015199","Soft 2-Drawer Letter Size Vertical File Cabinet, Black (26.5-Inch)  ",
"New", 85.99, 215.99, NOW()),

("Filing cabinets", 11, "36360880999","Hirsh Industries 2 Drawer Vertical File, Pearl White,Letter, 14.25''W",
"New", 33.99, 89.99, NOW()),

-- 11.4 Tables

("Table", 11, "14938221699","Soft® 6' Fold in Half Folding table  ",
"New", 23.99, 79.99, NOW()),

("Table", 11, "21281149399","Soft® 4' Folding Table  ",
"New", 13.99, 59.99, NOW()),

("Table", 11, "55937291699","Soft® 8' Folding Table ",
"New", 32.99, 99.99, NOW()),

("Table", 11, "71656318799","Soft® Rectangle Melamine Wood Folding Table Walnut, 29.5'H x 30'W x 72'L ",
"New", 21.99, 81.99, NOW()),

-- 11.5 Book Cases

("Book case", 11, "00373593199","Sauder Premier 36'' 5-Shelf Bookcase Planked cherry  ",
"New", 51.99, 154.99, NOW()),

("Book case", 11, "46626301099","South Shore Work ID 5-Shelf Wood Bookcase Royal Cherry  ",
"New", 41.99, 112.99, NOW()),

("Book case", 11, "55785557899","Sauder Premier 3-Shelf Composite Wood Bookcase Planked Cherry Finish  ",
"New", 40.99, 109.99, NOW()),

("Book case", 11, "58239803899","Hayden 2-Shelf Laminate Bookcase, Midnight Onyx  ",
"New", 4.99, 36.79, NOW()),

-- 11.6 Shelves

("Shelf", 11, "05933718399","Fellowes Designer Suites™ Desk Shelf 6.75' H x 26 in W x 7'D  ",
"New", 5.99, 43.79, NOW()),

("Shelf", 11, "07750666099","IRIS® Medium Long Stacking Shelf Black   ",
"New", 0.99, 9.99, NOW()),

("Shelf", 11, "17369160299","Fellowes Partition Additions™ Shelf  ",
"New", 0.99, 16.99, NOW()),

("Shelves", 11, "00894718699","Tennsco Commercial Steel Shelving 6 Shelves Gray 75'H x 36'W x 12'D  ",
"New", 55.99, 155.99, NOW()),

-- 11.7 Safes

("Safe", 11, "30746615999","HomCom HomCom Electronic Lock Security Safe  ",
"New", 10.99, 51.99, NOW()),

("Safe", 11, "79931674499","Honeywell 300 cu.in. Key Lock Fire Resistant Security Box  ",
"New", 7.99, 35.99, NOW()),

("Safe", 11, "97770340799","MMF Industries™ STEELMASTER® Travel Book Safe, Mutli-Colored, 9 1/2'H x 6'W x 2 1/4'D ",
"New", 4.99, 24.09, NOW()),

("Safe", 11, "80212777199","Caesar Safe Electronic Lock Commercial Safe Box ",
"New", 43.99, 122.99, NOW()),

-- 11.8 Waste Baskets

("Waste Basket", 11, "38953498299","Brighton Professional™ Wastebasket 7 gal, Black  ",
"New", 0.80, 7.49, NOW()),

("Waste Basket", 11, "73455203699","Brighton Professional™ Wastebasket, Black, 10 gal  ",
"New", 0.90, 10.79, NOW()),

("Waste Basket", 11, "13870913999","Brighton Professional™ Wire Mesh Round Wastebasket Black 5 gal.  ",
"New", 1.05, 12.49, NOW()),

("Waste Basket", 11, "30740080499","Brighton Professional™ Wastebasket 3.2 gal Plastic Black ",
"New", 0.15, 5.49, NOW()),

-- 11.9 Recycling Bin

("Recycling Bin", 11, "27633917099","Rubbermaid Recycling Bin Blue 10 gal. ",
"New", 6.15, 21.99, NOW()),

("Recycling Bin", 11, "83204069699","Brighton Professional Recycling Container Blue 7 gal.  ",
"New", 1.05, 7.49, NOW()),

("Recycling Bin", 11, "88633092099","United Solutions Highboy 23 Gallon Recycling bin ",
"New", 9.05, 28.98, NOW()),

("Recycling Bin", 11, "52698830799","Rubbermaid® Desk High Recycling Container 23 gal. ",
"New", 22.41, 69.99, NOW());


select * from item;
