-- CSCC Capstone Project Autumn 2017
-- Jason Parker 

select * from general_ledger;

SELECT	transactionDate,
		accountName,
		description,
        beginningBalance,
		debit,
		credit,
		endingBalance
FROM chartOfAccounts cofa
RIGHT JOIN acct_transaction acct_t
ON	cofa.accountID = acct_t.accountID;

SELECT	transactionDate,
		accountName,
		description,
        beginningBalance,
		debit,
		credit,
		endingBalance
FROM chartOfAccounts cofa
RIGHT JOIN acct_transaction acct_t
ON	cofa.accountID = acct_t.accountID
WHERE acct_t.description = "Accounts Receivable";