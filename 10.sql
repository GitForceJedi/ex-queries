#Average number of borrowed books by job title
#Must Use a Querry within Querry 
#The Reference the new querry, reference within AVG() function 
#Create new column to hold the AVG of BorrowCountPerClient.BookCount
SELECT 
    BorrowCountPerClient.Occupation,
    AVG(BorrowCountPerClient.BookCount) AS AverageBooksBorrowed
FROM (
    SELECT 
        Client.ClientID,
        Client.Occupation,
        COUNT(Borrower.BookID) AS BookCount
    FROM 
        Client
    LEFT JOIN 
        Borrower ON Client.ClientID = Borrower.ClientID
    GROUP BY 
        Client.ClientID, Client.Occupation
) AS BorrowCountPerClient
GROUP BY 
    BorrowCountPerClient.Occupation;
