/*
	CSCC Capstone Project Autumn 2017
	Programmer: Jason Parker
    Description: Views for the required reports
*/
use onthefly;

DROP VIEW IF EXISTS general_ledger;
CREATE VIEW general_ledger
AS
SELECT	transactionDate,
		accountName,
        debit,
        credit
FROM chartOfAccounts cofa
RIGHT JOIN acct_transaction acct_t
ON	cofa.accountID = acct_t.accountID;

DROP VIEW IF EXISTS acct_payable;
CREATE VIEW acct_payable
AS
SELECT	accountName,
		transactionDate,
		debit,
		credit
FROM chartOfAccounts cofa
RIGHT JOIN acct_transaction acct_t
ON	cofa.accountID = acct_t.accountID
WHERE acct_t.description = 'Accounts Payable';

DROP VIEW IF EXISTS acct_receivable;
CREATE VIEW acct_receivable
AS
SELECT	accountName,
		transactionDate,
		debit,
		credit
FROM chartOfAccounts cofa
RIGHT JOIN acct_transaction acct_t
ON	cofa.accountID = acct_t.accountID
WHERE acct_t.description = 'Accounts Receivable';

