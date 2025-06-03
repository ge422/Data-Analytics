USE sql_final;

-- Retrieve all transactions with valid customer and product data.
-- Order by transaction date to understand the chronological flow of
-- purchases.

SELECT *
FROM retail;

-- Clean the dataset by ensuring that numeric fields like Quantity,
-- Price per Unit, and Total Amount are properly formatted.
-- Remove duplicates or null values if any exist.

SELECT DISTINCT `Customer ID`, Quantity, `Price Per Unit`, `Total amount`
FROM retail;

-- Calculate the total and average revenue for each product
-- category.
-- Which categories bring in the most and least revenue?

SELECT  `Product Category`,
SUM(`Total Amount`) AS Total_Revenue,
AVG(`Total Amount`) AS Average_Revenue
FROM retail
GROUP BY `Product Category`;

-- Analyze the monthly sales trend over the entire dataset period.
-- Summarize total revenue per month and order the results
-- chronologically.


-- Identify the top 10 customers by total spending.
-- Rank customers based on how much they’ve spent across all
-- transactions.

SELECT `Customer ID`, `Total Amount` AS Total_spending
FROM retail
ORDER BY `Customer ID`
LIMIT 10;

-- Calculate the average transaction value for each customer.
-- How much does each customer spend per transaction on
-- average?

SELECT `Transaction ID`, AVG(`Total Amount`) AS Average_transaction
FROM retail
GROUP BY `Transaction ID`;

-- Group customers by gender and age brackets (e.g., 18–25, 26–35,
-- 36–50, etc.).
-- Summarize total revenue and transaction count for each group.

SELECT `Gender`, `Age`
FROM retail
WHERE `Age` BETWEEN 26 AND 35;

-- Compare the number of one-time buyers versus repeat buyers.
-- Group customers by purchase frequency to determine repeat
-- behavior.

SELECT 
    `Customer ID`,
    COUNT(DISTINCT `Transaction ID`) AS Purchase_frequency
FROM 
    retail
GROUP BY 
    `Customer ID`;
    
   --  Identify inactive customers who have not made a purchase in the
-- last 6 months.
-- Use the most recent date in the dataset as the reference point.

SELECT  `Customer ID`, `Transaction ID`,`Date`
FROM retail
WHERE `Date` BETWEEN'2023-06-01' AND '2024-01-01' AND `Transaction ID` IS NULL;

-- Perform RFM (Recency, Frequency, Monetary) analysis for
-- customer segmentation.
-- Recency: Days since last purchase; Frequency: Number of
-- purchases; Monetary: Total amount spent.

SELECT `Customer ID`, COUNT(`Date`) AS Recency, COUNT(`Transaction ID`) AS Frequeny,
 COUNT(`Total Amount`) AS Monetary_spent
FROM retail
GROUP BY `Customer ID`;


