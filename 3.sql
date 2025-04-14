#First names, last names, ages and occupations of all clients
SELECT 
	ClientFirstName AS 'First Name',
	ClientLastName AS 'Last Name',
    #Get the Current Year and subtract the DOB year to find Client Age
	FLOOR(YEAR(CURDATE()) - ClientDOB) AS Age,
	Occupation
FROM
	Client;
