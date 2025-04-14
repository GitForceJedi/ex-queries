SELECT DISTINCT 
	AuthorFirstName, 
    AuthorLastName
FROM 
	Author
#JOIN Book to have access to Genre information, correlating AuthorID + Genre
JOIN 
	Book ON Author.AuthorID = Book.AuthorID
#Group By AuthorID
GROUP BY 
	Author.AuthorID
#Filter using Having as using aggregate function
HAVING 
	#Using COUNT to count the # of genres, use DISTINCT in case Author wrote more than 1 book in same genre
	COUNT(DISTINCT Book.Genre) > 1;
