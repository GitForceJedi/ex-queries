#Average number of borrows by age
#Querry Within Querry
SELECT 
	#Compare current year to DOB year for age
    (YEAR(CURDATE()) - Client.ClientDOB) AS Age,
    #Average the Borrow Count, will use inner select
    AVG(BorrowCountPerClient.BorrowCount) AS AverageBorrows
FROM 
    Client
JOIN 
	#2nd SELECT Statement to form BorrowCountPerClient referenced above
    (SELECT 
        ClientID, 
        #Count All to get Borrow Count, must group by Client ID further down
        COUNT(*) AS BorrowCount
     FROM 
        Borrower
     GROUP BY 
        ClientID) AS BorrowCountPerClient
ON 
    Client.ClientID = BorrowCountPerClient.ClientID
GROUP BY 
	#Group by Age
    Age
ORDER BY 
	#Order by age youngest to oldest
    Age;
