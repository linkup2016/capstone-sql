-- CSCC Capstone Project 2017
-- Jason Parker

use onthefly;

-- accounts
INSERT INTO chartOfAccounts (accountName) 
VALUES 	('3M'),
		('Bostitch'),
        ('MEAD'),
        ('Voxim'),
        ('Trapper Keeper'),
        ('Dixon');
        
-- transactions
INSERT INTO acct_transaction (accountID,transactionDate,description,beginningBalance,endingBalance,debit,credit)
VALUES
	(1,NOW(),"Accounts Payable",10000,9900,100,0),
    (1,NOW(),"Accounts Payable: ",9900,9800,100,0),
    (3,NOW(),"Accounts Payable",9800,9700,100,0),
    (3,NOW(),"Accounts Payable",9700,9600,100,0),
    (5,NOW(),"Accounts Receivable",9600,9700,0,100),
    (5,NOW(),"Accounts Payable",9700,9600,100,0),
    (2,NOW(),"Accounts Payable",9600,9500,100,0),
    (2,NOW(),"Accounts Payable",9500,9400,100,0),
    (4,NOW(),"Accounts Receivable",9400,9500,0,100),
    (4,NOW(),"Accounts Receivable",9500,9600,0,100);