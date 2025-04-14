#The oldest and the youngest clients of the library
#Create 2 and Union All
#Select for Youngest
SELECT 
	'Youngest' AS ClientType, ClientID, ClientFirstName, ClientLastName, ClientDOB
FROM 
	Client
#Use Max for Highest DOB value. which is youngest (the higher the birth year, the younger)
WHERE 
	ClientDOB = (SELECT MAX(ClientDOB) FROM Client)

UNION ALL

#Select for Oldest
SELECT 
	'Oldest' AS ClientType, ClientID, ClientFirstName, ClientLastName, ClientDOB
FROM 
	Client
#Select Min for Lowest DOB value, which is Oldest / Most Years
WHERE 
	ClientDOB = (SELECT MIN(ClientDOB) FROM Client);