#Top 5 occupations that borrowed the most in 2016
SELECT 
	#Select the Occupation , take a Count of BookIDs borrowed (group by Occupation further down)
    Client.Occupation,
    COUNT(Borrower.BookID) AS BorrowCount
FROM 
    Client
JOIN 
	#Join the Borrower table
    Borrower ON Client.ClientID = Borrower.ClientID
WHERE 
	#Filter down to Borrows from 2016 using the YEAR function and Borrow Date 
    YEAR(Borrower.BorrowDate) = 2016
GROUP BY 
	#Group all into their Occupation
    Client.Occupation
ORDER BY 
	#Order by amount of Borrowing
    BorrowCount DESC
#Limit 5 to get the Top 5 
LIMIT 5;
