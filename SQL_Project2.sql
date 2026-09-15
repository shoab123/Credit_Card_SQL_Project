SELECT*FROM Credit_Cust

-- Check for duplicate customers
SELECT Customer_ID, COUNT(*) As cnt from Credit_Cust
GROUP BY Customer_ID
HAVING COUNT(*)>1

SELECT COUNT(*)from Credit_Cust

-- Delete all duplicates customers
WITH CTE AS
(
SELECT*, ROW_NUMBER() OVER ( PARTITION BY Customer_ID order by Customer_ID) as rn
FROM Credit_Cust
)
DELETE FROM CTE 
WHERE rn>1

-- Make customer_id as primary key


SELECT*FROM Credit_Cust
WHERE Customer_ID IS NULL

SELECT 
    COLUMN_NAME,
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH,
    IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Credit_Cust'
  AND COLUMN_NAME = 'Customer_ID';

  ALTER TABLE Credit_Cust
  ALTER COLUMN Customer_ID
  NVARCHAR(255) NOT NULL

 ALTER TABLE Credit_Cust
ADD CONSTRAINT Pk_Credit_Cust
PRIMARY KEY (Customer_ID)

-- Table data
Select*from Credit_Cust

-------------------------------------------------------------------------------------------------------------------------------------------

-- Find the total number of unique customers.

SELECT COUNT(DISTINCT(Customer_ID)) AS Total_Customer FROM Credit_Cust

-- Display all the details of customers whose age is greater than 30.
SELECT*FROM Credit_Cust
Where Age>30

-- Find the minimum, maximum and average age of customers.
SELECT max(Age) As Max_Age, min(Age) as Min_Age, avg(Age) as Avg_Age FROM Credit_Cust

-- Find the total number of customers in each gender category.
SELECT Gender, COUNT(Gender) Customer_Count FROM Credit_Cust
Group by Gender

-- Find the number of customers in each occupation category.
SELECT Occupation, COUNT(Occupation) Total_count FROM Credit_Cust
Group by Occupation

-- Find the number of customers in each card type.
SELECT Card_Type,COUNT(Card_Type) Card_Type_Count FROM Credit_Cust
Group by Card_Type

-- Find the minimum, maximum and average annual income.
SELECT min(Annual_Income) Min_Annual_Income, max(Annual_Income) Max_Annual_Income, avg(Annual_Income) Avg_Annual_Income FROM Credit_Cust

-- Find the minimum, maximum and average credit limit.
SELECT min(Credit_Limit) Min_Credit_Limit, max(Credit_Limit) Max_Credit_Limit, avg(Credit_Limit) Avg_Credit_Limit FROM Credit_Cust

-- Find the average monthly spending of customers.
SELECT avg(Monthly_Spending) Avg_Monthly_Spending FROM Credit_Cust

-- Find customers whose annual income is greater than 1,000,000.
SELECT Customer_ID, Annual_Income FROM Credit_Cust
Where Annual_Income> 1000000

-- Find customers whose credit score is greater than 750.
SELECT*FROM Credit_Cust
WHERE Credit_Score> 750





--- 🟡 Level 2 — GROUP BY, HAVING, CASE

-- Find the average annual income for each occupation.
SELECT Occupation, avg(Annual_Income) Avg_Annual_Income FROM Credit_Cust
Group By Occupation

-- Find the average credit limit for each card type.
SELECT Card_Type, avg(Credit_Limit) Avg_Credit_Limit FROM Credit_Cust
Group by Card_Type

-- Find the average monthly spending for each card type.
SELECT Card_Type, avg(Monthly_Spending) Avg_Monthly_Spending FROM Credit_Cust
Group By Card_Type

-- Find the total monthly spending for each occupation.
SELECT Occupation, sum(Monthly_Spending) Total_Monthly_Spending FROM Credit_Cust
Group By Occupation

-- Find occupations having more than 20 customers.
SELECT Occupation, count(Occupation) Total_Customer FROM Credit_Cust
Group By Occupation
Having count(Occupation)>20

-- Find customers whose monthly transactions are greater than 20.
SELECT*FROM Credit_Cust
Where Monthly_Transactions>20

-- Find customers whose monthly spending is greater than the average monthly spending.
SELECT Customer_ID, Monthly_Spending FROM Credit_Cust
Where Monthly_Spending> (SELECT avg(Monthly_Spending)FROM Credit_Cust)

-- Categorize customers into Low, Medium and High credit-score categories
SELECT 
    Customer_ID,
    Credit_Score,
    CASE
        WHEN Credit_Score BETWEEN 400 AND 500 THEN 'Low'
        WHEN Credit_Score BETWEEN 501 AND 600 THEN 'Medium'
        ELSE 'High'
    END AS Categories
FROM Credit_Cust

-- Categorize customers into Low, Medium and High spending categories based on Monthly_Spending.
SELECT 
    Customer_ID,
    Monthly_Spending,
    CASE
        WHEN Monthly_Spending BETWEEN 2000 AND 30000 THEN 'Low'
        WHEN Monthly_Spending BETWEEN 30001 AND 40000 THEN 'Medium'
        ELSE 'High'
    END AS Categories
FROM Credit_Cust

-- Find the number of customers in each spending category.
SELECT
    CASE
        WHEN Monthly_Spending BETWEEN 20000 AND 30000 THEN 'Low'
        WHEN Monthly_Spending BETWEEN 30001 AND 40000 THEN 'Medium'
        ELSE 'High'
    END AS Categories,
    COUNT(*) AS Customer_Count
FROM Credit_Cust
GROUP BY
    CASE
        WHEN Monthly_Spending BETWEEN 20000 AND 30000 THEN 'Low'
        WHEN Monthly_Spending BETWEEN 30001 AND 40000 THEN 'Medium'
        ELSE 'High'
    END


------------------------------------------
-- 🟠 Level 3 — Intermediate

-- Find the top 10 customers based on monthly spending.
SELECT TOP 10 Customer_ID, Age, Gender, Annual_Income, Monthly_Spending FROM Credit_Cust
Order By Monthly_Spending desc

-- Find the top 10 customers based on credit limit.
SELECT TOP 10 Customer_ID, Age, Gender, Card_Type, Credit_Limit FROM Credit_Cust
Order by Credit_Limit desc

-- Find the average transaction value for each card type.
SELECT Card_Type, avg(Avg_Transaction_Value) Average_Transaction_Value FROM Credit_Cust
Group By Card_Type

-- Find the total online spending for each occupation.
SELECT Occupation, sum(Online_Shopping_Spending) as Total_Online_Shopping_Spending FROM Credit_Cust
Group By Occupation

-- Find customers whose online spending is greater than their monthly spending.
SELECT*FROM Credit_Cust
Where Online_Shopping_Spending>Monthly_Spending 

-- Find customers whose outstanding balance is greater than their statement balance.
SELECT*FROM Credit_Cust
Where Outstanding_Balance> Statement_Balance 

-- Find the average payment ratio for each card type.
SELECT Card_Type, avg(Payment_Ratio) as Average_Payment_Ratio FROM Credit_Cust
Group By Card_Type


-- Find customers whose payment ratio is below 50%.
SELECT Customer_ID, Payment_Ratio FROM Credit_Cust
WHERE Payment_Ratio < 0.50


-- Find the average credit score for each occupation.
SELECT Occupation, avg(Credit_Score) as Average_Credit_Score FROM Credit_Cust
Group By Occupation

-- Find the occupation with the highest average credit score.
SELECT Top 1 Occupation, avg(Credit_Score) as Average_Credit_Score FROM Credit_Cust
Group By Occupation
Order By avg(Credit_Score) desc


----------------------------------------------------------------
-- 🔴 Level 4 — Advanced SQL

-- Rank customers based on their monthly spending using RANK().

SELECT Customer_ID, Monthly_Spending,
    RANK() OVER(ORDER BY Monthly_Spending DESC) AS Spending_Rank
FROM Credit_Cust

-- Find the top 3 highest-spending customers within each card type.

WITH Ranked_Customers AS
(
SELECT Customer_ID, Card_Type, Monthly_Spending,
        RANK() OVER( PARTITION BY Card_Type ORDER BY Monthly_Spending DESC) AS Spending_Rank
FROM Credit_Cust
)
SELECT*FROM Ranked_Customers
Where Spending_Rank <=3

-- Find customers whose monthly spending is above the average spending of their card type.

WITH Customer_Spending AS
(
    SELECT Customer_ID, Card_Type, Monthly_Spending,
        AVG(Monthly_Spending) OVER(PARTITION BY Card_Type) AS Card_Avg_Spending
    FROM Credit_Cust
)
SELECT Customer_ID, Card_Type, Monthly_Spending,Card_Avg_Spending
FROM Customer_Spending
WHERE Monthly_Spending > Card_Avg_Spending

-- Find the highest-credit-score customer in each occupation.

WITH Ranked_Customers AS
(
SELECT Customer_ID, Occupation, Credit_Score,
        RANK() OVER( PARTITION BY Occupation ORDER BY Credit_Score DESC) AS Credit_Rank
FROM Credit_Cust
)
SELECT*FROM Ranked_Customers
Where Credit_Rank =1

-- Calculate each customer's credit utilization percentage using Outstanding_Balance and Credit_Limit.
SELECT Customer_ID,Credit_Limit,Outstanding_Balance,CONCAT(ROUND(
(Outstanding_Balance / Credit_Limit) * 100, 2 ), '%') AS Credit_Utilization_Percentage
FROM Credit_Cust

-- Find customers whose credit utilization is greater than 80%.
SELECT*FROM Credit_Cust
Where Credit_Utilization>0.80

--Create a CTE that calculates total spending across different spending categories for each customer
WITH Customer_Spending AS
(SELECT
        Customer_ID,Online_Shopping_Spending,Grocery_Spending,Fuel_Spending,Dining_Spending,Travel_Spending,Entertainment_Spending,Utility_Bill_Spending,
        (
            Online_Shopping_Spending
            + Grocery_Spending
            + Fuel_Spending
            + Dining_Spending
            + Travel_Spending
            + Entertainment_Spending
            + Utility_Bill_Spending) AS Total_Category_Spending
 FROM Credit_Cust
)
SELECT * FROM Customer_Spending

-- Using the CTE from Q37, find the top 10 customers based on total category spending.

WITH Customer_Spending AS
(SELECT
        Customer_ID,Online_Shopping_Spending,Grocery_Spending,Fuel_Spending,Dining_Spending,Travel_Spending,Entertainment_Spending,Utility_Bill_Spending,
        (
            Online_Shopping_Spending
            + Grocery_Spending
            + Fuel_Spending
            + Dining_Spending
            + Travel_Spending
            + Entertainment_Spending
            + Utility_Bill_Spending) AS Total_Category_Spending
 FROM Credit_Cust
)
SELECT Top 10 * FROM Customer_Spending
Order By Total_Category_Spending desc


-- Create a view containing Customer_ID, Annual_Income, Credit_Limit, Monthly_Spending, Outstanding_Balance, Payment_Ratio, and Credit_Score.

CREATE VIEW Customer_Financial_Profile AS
SELECT
    Customer_ID,Annual_Income,Credit_Limit,Monthly_Spending,Outstanding_Balance, Payment_Ratio,Credit_Score
FROM Credit_Cust

SELECT * FROM Customer_Financial_Profile


-- Identify high-risk customers using multiple financial indicators.

SELECT
    Customer_ID, Credit_Score, Credit_Limit, Outstanding_Balance,Payment_Ratio,Cash_Advance_Amount,
    CASE
        WHEN
            Credit_Score < 600
            AND Payment_Ratio < 50
            AND Outstanding_Balance > Credit_Limit * 0.80
            AND Cash_Advance_Amount > 0
        THEN 'High Risk'
        WHEN
            Credit_Score < 700
            OR Payment_Ratio < 70
            OR Outstanding_Balance > Credit_Limit * 0.60
        THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS Risk_Category
FROM Credit_Cust