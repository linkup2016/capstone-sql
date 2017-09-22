-- CSCC Capstone Project Autumn 2017
-- Jason Parker 

SELECT	accountName,
	transactionDate,
    description,
	debit,
	credit,
    endingBalance
FROM chartOfAccounts cofa
RIGHT JOIN acct_transaction acct_t
ON	cofa.accountID = acct_t.accountID
WHERE acct_t.accountID = 1;
