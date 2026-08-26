/* Basic SQL
---- CREATE table is a statement that creates a new table in a satabase
---- DROP table removes a table in database
---- SELECT allows you to read data and display it. Called querey
---- SELECT specifies which columns you want o be given data for
---- FROM specifies which tabel you want to sleect columns from
---- astricks means all 
---- ORDER by allows you to order by dare */
---- WHERE allows you to filter a set of results based on specific criteria
--------- > Greater than 
--------- < Less than
--------- >= Greater than or equal to 
--------- <= Less than or equal to
--------- = equal to 
--------- != not equal to 

SELECT id, account_id
-- OR
  SELECT *
FROM orders
ORDER BY ascending Desc  
  LIMIT 10;


----PRACTICE

-- Write a query to return the 10 earliest orders in the orders table. Include the id, occurred_at, and total_amt_usd.

SELECT id, occurred_at, total_amt_usd
From orders
ORDER BY occurred_at
Limit 10;

-- Write a query to return the top 5 orders in terms of largest total_amt_usd. Include the id, account_id, and total_amt_usd.

SELECT id, account_id, total_amt_usd
From orders
ORDER BY total_amt_usd Desc
Limit 5;

-- Write a query to return the lowest 20 orders in terms of smallest total_amt_usd. Include the id, account_id, and total_amt_usd

SELECT id, account_id, total_amt_usd
From orders
ORDER BY total_amt_usd
Limit 20;

-- Write a query that displays the order ID, account ID, and total dollar amount for all the orders, sorted first by the account ID (in ascending order), and then by the total dollar amount (in descending order).

Select id,account_id, total_amt_usd
From orders 
ORDER BY account_id, total_amt_usd desc;

-- Now write a query that again displays order ID, account ID, and total dollar amount for each order, but this time sorted first by total dollar amount (in descending order), and then by account ID (in ascending order).

Select id,account_id, total_amt_usd
From orders 
ORDER BY total_amt_usd  desc, account_id;

-- Compare the results of these two queries above. How are the results different when you switch the column you sort on first?
------ In query #1, all of the orders for each account ID are grouped together, and then within each of those groupings, the orders appear from the greatest order amount to the least. In query #2, since you sorted by the total dollar amount first, the orders appear from greatest to least regardless of which account ID they were from. Then they are sorted by account ID next. (The secondary sorting by account ID is difficult to see here, since only if there were two orders with equal total dollar amounts would there need to be any sorting by account ID.)

-- Pulls the first 5 rows and all columns from the orders table that have a dollar amount of gloss_amt_usd greater than or equal to 1000.
SELECT *
FROM orders
WHERE gloss_amt_usd >= 1000
LIMIT 5;

-- Pulls the first 10 rows and all columns from the orders table that have a total_amt_usd less than 500.
SELECT *
FROM orders
WHERE total_amt_usd <= 500
LIMIT 10


-- SQL Joins
-- Aggregations
-- SQL Subqueries * Temporary Tables
