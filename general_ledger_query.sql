SELECT	accountName,
	transactionDate,
	beginningBalance,
	endingBalance,
	debit,
	credit
FROM chartOfAccounts cofa
RIGHT JOIN acct_transaction acct_t
ON	cofa.accountID = acct_t.accountID
WHERE acct_t.accountID = 10;
