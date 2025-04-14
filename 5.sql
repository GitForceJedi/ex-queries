#First and last names of the top 5 authors clients borrowed in 2017
SELECT
	Author.AuthorFirstName,		
    Author.AuthorLastName
FROM 
    Author
#JOIN Book to have access to Book ID & Author Correlation
JOIN 
	Book ON Author.AuthorID = Book.AuthorID
#JOIN Borrower to have access to Borrow Dates 
JOIN
    Borrower ON Book.BookID = Borrower.BookID 
#Filter by the Year of BorrowDate using YEAR function
WHERE 
	YEAR(Borrower.BorrowDate) = 2017
#Group results into the Author IDs
GROUP BY
	Author.AuthorID
#Order Top to Bottom by the Count of Book ID in Borrow table 
ORDER BY 
	COUNT(Borrower.BookID) DESC
#Use Limit to return the Top 5 results
LIMIT 5;
	