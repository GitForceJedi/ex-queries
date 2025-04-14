#The top month of borrows in 2017
SELECT 
	#Use Extract to Extract additional columns from the BorrowDate Column
    EXTRACT(MONTH FROM BorrowDate) AS Month, 
	EXTRACT(YEAR FROM BorrowDate) AS Year,
    COUNT(*) AS BorrowCount
FROM 
    Borrower
WHERE
	#Extrat year again for comparison of year, to make all 2017
    EXTRACT(YEAR FROM BorrowDate) = 2017
GROUP BY 
	#Group by both Month and Year from above
    Month, Year
ORDER BY 
    BorrowCount DESC
    #Limit to 1 to Return the top
LIMIT 1;
