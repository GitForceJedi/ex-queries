#First and last names of clients that borrowed books in March 2018
SELECT DISTINCT #Using Distinct to return 1 result per name
    Client.ClientFirstName,
    Client.ClientLastName
FROM 
    Client
#JOIN Borrower to have access to BorrowDate 
JOIN 
    Borrower ON Client.ClientID = Borrower.ClientID
#Filter using date range 
WHERE 
    Borrower.BorrowDate BETWEEN '2018-03-01' AND '2018-03-31';
