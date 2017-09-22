SELECT accountName,transactionDate,beginningBalance,endingBalance,debit,credit
FROM chartOfAccounts cof
right join acct_transaction at
on	cof.accountID = at.accountID
where at.accountID = 10;
