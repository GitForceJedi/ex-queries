#Create a VIEW and display the titles that were borrowed by at least 20% of clients
#Create the View
CREATE VIEW PopularBooks AS
#Start the Select after AS
SELECT 
    Book.BookTitle
FROM 
    Book
#JOIN Twice since 2 relationships are needed to complete the relationship
JOIN 
    Borrower ON Book.BookID = Borrower.BookID
JOIN 
    Client ON Borrower.ClientID = Client.ClientID
#Group
GROUP BY 
    Book.BookID, Book.BookTitle
#Filter for the 20% of clients, select unique client IDs and set greater= to 20% of all Clients
HAVING 
    COUNT(DISTINCT Client.ClientID) >= (0.2 * (SELECT COUNT(*) FROM Client));
