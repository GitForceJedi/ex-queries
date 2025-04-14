#The book that was MOST (decending, DESC) borrowed during the years 2015-2017
SELECT
	#Start with book to have access to Title
	Book.BookTitle
FROM 
    Book
#JOIN Borrower to have access to amount of Borrows
JOIN
    Borrower ON Book.BookID = Borrower.BookID 
WHERE 
	#Filter Borrows by target Years using the YEAR Function on BorrowDate
	YEAR(Borrower.BorrowDate) BETWEEN 2015 AND 2017
GROUP BY
	#Group results by their title
	Book.BookTitle
ORDER BY 
	#Order most to least the count / amount of times borrowed 
	COUNT(Borrower.BookID) DESC
#Limit to one to return the TOP result 
LIMIT 1;