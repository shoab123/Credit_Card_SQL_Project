# Credit Card Customer Behaviour & Financial Analysis using SQL

## Project Overview

This project analyses credit card customer behaviour and financial information using SQL Server.

The analysis covers customer demographics, income, credit limits, credit scores, monthly spending, transactions, payment behaviour, credit utilisation, category-wise spending and financial risk classification.

The project progresses from basic SQL queries to advanced SQL concepts such as subqueries, CASE statements, CTEs, window functions and SQL Views.

---

## Dataset

The dataset contains customer-level credit card information including:

- Customer ID
- Age
- Gender
- Annual Income
- Occupation
- Card Type
- Credit Limit
- Card Age
- Monthly Spending
- Monthly Transactions
- Average Transaction Value
- Online Shopping Spending
- Grocery Spending
- Fuel Spending
- Dining Spending
- Travel Spending
- Entertainment Spending
- Utility Bill Spending
- Outstanding Balance
- Statement Balance
- Payment Ratio
- Credit Score
- Cash Advance Amount

---

## Tools Used

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- Microsoft Excel

---

## Data Cleaning & Validation

Before performing the analysis, customer records were checked for duplicate Customer IDs.

Duplicate records were identified using `GROUP BY` and `HAVING`.

Duplicates were removed using a CTE with `ROW_NUMBER()`.

The `Customer_ID` column was also checked for NULL values and its data type was validated.

After validation, `Customer_ID` was defined as the Primary Key of the table.

---

## SQL Analysis Performed

### 1. Customer Analysis

- Find the total number of unique customers.
- Display customers whose age is greater than 30.
- Find minimum, maximum and average customer age.
- Find the number of customers by gender.
- Find the number of customers by occupation.
- Find the number of customers by card type.

### 2. Income & Credit Analysis

- Find minimum, maximum and average annual income.
- Find minimum, maximum and average credit limit.
- Find customers whose annual income is greater than 1,000,000.
- Find customers whose credit score is greater than 750.

### 3. Spending & Transaction Analysis

- Find the average monthly spending.
- Find customers whose monthly transactions are greater than 20.
- Find customers whose monthly spending is greater than the overall average monthly spending.

### 4. Customer Segmentation using CASE

Customers were categorised into Low, Medium and High categories based on:

- Credit Score
- Monthly Spending

The number of customers in each spending category was also calculated.

### 5. Grouped Business Analysis

The project analyses:

- Average annual income by occupation.
- Average credit limit by card type.
- Average monthly spending by card type.
- Total monthly spending by occupation.
- Occupations having more than 20 customers.

### 6. Top Customer Analysis

- Find the top 10 customers based on monthly spending.
- Find the top 10 customers based on credit limit.
- Find the average transaction value for each card type.
- Find total online shopping spending for each occupation.

### 7. Customer Financial Behaviour

The project identifies:

- Customers whose online shopping spending is greater than monthly spending.
- Customers whose outstanding balance is greater than statement balance.
- Average payment ratio by card type.
- Customers whose payment ratio is below 50%.
- Average credit score by occupation.
- Occupation with the highest average credit score.

### 8. Advanced SQL Analysis

The project uses SQL Window Functions and CTEs for advanced customer analysis.

- Rank customers based on monthly spending using `RANK()`.
- Find the top 3 highest-spending customers within each card type.
- Find customers whose monthly spending is above the average spending of their card type.
- Find the highest-credit-score customer in each occupation.

### 9. Credit Utilisation Analysis

Credit utilisation was calculated using:

`Outstanding Balance / Credit Limit × 100`

The project also identifies customers whose credit utilisation is greater than 80%.

### 10. Category-wise Spending Analysis

A CTE was created to calculate total spending across:

- Online Shopping
- Grocery
- Fuel
- Dining
- Travel
- Entertainment
- Utility Bills

The project then identifies the top 10 customers based on total category spending.

### 11. SQL View

A SQL View named `Customer_Financial_Profile` was created containing:

- Customer ID
- Annual Income
- Credit Limit
- Monthly Spending
- Outstanding Balance
- Payment Ratio
- Credit Score

### 12. Financial Risk Categorisation

Customers were categorised into:

- High Risk
- Medium Risk
- Low Risk

The classification uses multiple financial indicators including:

- Credit Score
- Payment Ratio
- Outstanding Balance
- Credit Limit
- Cash Advance Amount

This demonstrates the use of multiple conditions with `CASE`, `AND` and `OR` to create a rule-based financial risk classification.

---

## SQL Concepts Used

- SELECT
- DISTINCT
- WHERE
- ORDER BY
- TOP
- COUNT()
- SUM()
- AVG()
- MIN()
- MAX()
- GROUP BY
- HAVING
- CASE WHEN
- Subqueries
- CTE (Common Table Expression)
- ROW_NUMBER()
- RANK()
- OVER()
- PARTITION BY
- DELETE
- ALTER TABLE
- PRIMARY KEY
- CREATE VIEW

---

## Project Workflow

Raw Dataset  
↓  
Data Validation  
↓  
Duplicate Detection & Removal  
↓  
NULL & Data Type Check  
↓  
Primary Key Creation  
↓  
Basic Customer Analysis  
↓  
Income & Credit Analysis  
↓  
Spending & Transaction Analysis  
↓  
Customer Segmentation  
↓  
Advanced SQL Analysis  
↓  
Credit Utilisation Analysis  
↓  
Category-wise Spending Analysis  
↓  
Financial Risk Categorisation

---

## Key Learning Outcomes

Through this project, I gained practical experience in:

- Data validation and cleaning using SQL.
- Writing SQL queries for business questions.
- Aggregating and analysing customer data.
- Using subqueries for comparative analysis.
- Using CTEs for complex analysis.
- Applying window functions for ranking.
- Performing customer segmentation.
- Analysing credit utilisation and payment behaviour.
- Creating SQL Views.
- Building rule-based financial risk categories.

---

## Project Structure

```text
Credit-Card-SQL-Project/
│
├── Credit_Card_Customer_Dataset.xlsx
├── Credit_Card_Customer_Analysis.sql
└── README.md