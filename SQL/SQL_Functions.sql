CREATE TABLE IF NOT EXISTS sales (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    quantity INT,
    price_per_unit DECIMAL(10, 2)
);
-- Section 2: Insert Sample Data
-- 3. Insert at least five sample records:

INSERT INTO sales (id, product_name, quantity, price_per_unit) VALUES
(1, 'Laptop', 5, 899.99),
(2, 'Smartphone', 10, 499.50),
(3, 'Desk Chair', 7, 149.95),
(4, 'Wireless Mouse', 15, 29.99),
(5, 'Monitor', 4, 219.75);



-- 4. Count the total number of sales records in the table:

SELECT COUNT(*) AS total_sales_records
FROM sales;
-- 5. Count how many products have a quantity greater than 5:

SELECT COUNT(*) AS products_with_quantity_gt_5
FROM sales
WHERE quantity > 5;
-- 6. Find the total quantity of products sold:

SELECT SUM(quantity) AS total_quantity_sold
FROM sales;
-- 7. Calculate the total sales amount across all products:

SELECT SUM(quantity * price_per_unit) AS total_sales_amount
FROM sales;
-- 8. Calculate the total sales amount for products where the price per unit is greater than 1,000:

SELECT SUM(quantity * price_per_unit) AS high_value_sales_amount
FROM sales
WHERE price_per_unit > 1000;

