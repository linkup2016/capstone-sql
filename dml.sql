-- CSCC Capstone Project 2017
-- Jason Parker

use onthefly;
INSERT INTO chartOfAccounts (accountName) VALUES ('Supply on the Fly');
INSERT INTO acct_transaction (accountID,transactionDate,description,beginningBalance,endingBalance,debit,credit)
VALUES
	(1,NOW(),"Expense",10000,9900,100,0),
    (1,NOW(),"Expense: ",9900,9800,100,0),
    (1,NOW(),"Expense",9800,9700,100,0),
    (1,NOW(),"Expense",9700,9600,100,0),
    (1,NOW(),"Accounts Receivable",9600,9700,0,100),
    (1,NOW(),"Expense",9700,9600,100,0),
    (1,NOW(),"Expense",9600,9500,100,0),
    (1,NOW(),"Expense",9500,9400,100,0),
    (1,NOW(),"Accounts Receivable",9400,9500,0,100),
    (1,NOW(),"Accounts Receivable",9500,9600,0,100);