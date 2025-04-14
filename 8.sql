#Top borrowed genres for client born in years 1970-1980
SELECT 
	#Select the Book Genere and create column for Count (group by Genre futher down)
    Book.Genre,
    COUNT(Borrower.BookID) AS BorrowCount
FROM 
    Client
#Join Borrower Table to get access to Borrows
JOIN 
    Borrower ON Client.ClientID = Borrower.ClientID
#Join Book table to get access to Genres
JOIN 
    Book ON Borrower.BookID = Book.BookID
WHERE 
	#Filter by ClientDOB 
    Client.ClientDOB BETWEEN 1970 AND 1980
GROUP BY 
	#Group results by Genre 
    Book.Genre
ORDER BY 
	#Order to get top to bottom 
    BorrowCount DESC
#Limit to 5 to return top 5
LIMIT 5;
