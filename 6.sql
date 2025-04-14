#Nationalities of the LEAST (asending, ASC) 5 authors that clients borrowed during the years 2015-2017
SELECT
	#Start with Author Nationality
	Author.AuthorNationality
FROM 
    Author
#JOIN Book to have access to BookID and Author Nationality Correlation
JOIN 
	Book ON Author.AuthorID = Book.AuthorID
#JOIN Borrower for BorrowDate and BookID Correlation
JOIN
    Borrower ON Book.BookID = Borrower.BookID
#Filter by BorrowDate Year using YEAR Function
WHERE 
	YEAR(Borrower.BorrowDate) BETWEEN 2015 AND 2017
#Group results by Nationality
GROUP BY
	Author.AuthorNationality
#Order from Bottom to Top by the amount of times the BookID was Borrowed
ORDER BY 
	COUNT(Borrower.BookID) ASC
#Limit to 5 to return the TOP 5 results, which are actually the least 5 
LIMIT 5;
	