-- Step 1: Calculate total unique clients
WITH TotalClients AS (
    SELECT COUNT(DISTINCT ClientID) AS ClientCount
    FROM Borrower
),

-- Step 2: Calculate 20% threshold based on total clients
Threshold AS (
    SELECT ROUND(0.2 * ClientCount) AS TwentyPercentClients
    FROM TotalClients
),

-- Step 3: Count unique clients per book and filter by threshold
BooksMeetingThreshold AS (
    SELECT 
        BookID,
        COUNT(DISTINCT ClientID) AS UniqueClientCount
    FROM 
        Borrower
    GROUP BY 
        BookID
)

-- Step 4: Select books with UniqueClientCount >= 20% of clients
SELECT 
    BookID
FROM 
    BooksMeetingThreshold, Threshold
WHERE 
    UniqueClientCount >= TwentyPercentClients;
																