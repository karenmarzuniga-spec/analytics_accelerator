/* Basic SQL
-- NOTES
---- CREATE table is a statement that creates a new table in a satabase
---- DROP table removes a table in database
---- SELECT allows you to read data and display it. Called querey
---- SELECT specifies which columns you want o be given data for
---- FROM specifies which tabel you want to sleect columns from
---- astricks means all 
---- ORDER by allows you to order by dare */
---- WHERE allows you to filter a set of results based on specific criteria
------ Can use non numerical values with operator but you need to put value in SINGLE Quotes
--------- > Greater than 
--------- < Less than
--------- >= Greater than or equal to 
--------- <= Less than or equal to
--------- = equal to 
--------- != not equal to 
---- Derived Column a new column that is a manipulation of the existing columns in your database
--------- * Multiplication 
--------- + addition
--------- - subtraction 
--------- / division
--------- PEMDAS
---- LIKE This allows you to perform operations similar to using WHERE and =, but for cases when you might not know exactly what you are looking for.
---- IN This allows you to perform operations similar to using WHERE and =, but for more than one condition.
---- NOT This is used with IN and LIKE to select all of the rows NOT LIKE or NOT IN a certain condition.
---- AND & BETWEEN These allow you to combine operations where all combined conditions must be true.
---- OR This allows you to combine operations where at least one of the combined conditions must be true.


SELECT id, account_id
-- OR
  SELECT * (all)
FROM orders
  WHERE name != 'baby' 
ORDER BY ascending Desc  
  LIMIT 10;


----  PRACTICE

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
WHERE total_amt_usd < 500
LIMIT 10

-- Filter the accounts table to include the company name, website, and the primary point of contact (primary_poc) just for the Exxon Mobil company in the accounts table.
SELECT name, website, primary_poc
FROM accounts
WHERE name = 'Exxon Mobil';

-- Create a column that divides the standard_amt_usd by the standard_qty to find  the unit price for standard paper for each order. Limit the results to the first 10 orders, and include the id and account_id fields.
SELECT id,
account_id,
standard_amt_usd/standard_qty AS standard_unit_price
FROM orders
limit 10;
-- Write a query that finds the percentage of revenue that comes from poster paper for each order. You will need to use only the columns that end with _usd. (Try to do this without using the total column.) Display the id and account_id fields also.
SELECT id,
account_id,
(poster_amt_usd/(standard_amt_usd + gloss_amt_usd +poster_amt_usd))*100 AS Poster_percent
FROM orders
limit 10;

-- All the companies whose names start with 'C'.
SELECT * 
FROM  accounts
WHERE name like 'C%';

-- All companies whose names contain the string 'one' somewhere in the name.
SELECT * 
FROM  accounts
WHERE name like '%one%';

-- All companies whose names end with 's'.
SELECT * 
FROM  accounts
WHERE name like '%s';

-- Use the accounts table to find the account name, primary_poc, and sales_rep_id for Walmart, Target, and Nordstrom.
SELECT name, primary_poc, sales_rep_id
FROM accounts
WHERE name IN ('Walmart', 'Target', 'Nordstrom');

-- Use the web_events table to find all information regarding individuals who were contacted via the channel of organic or adwords.
SELECT *
FROM web_events
WHERE channel IN ('organic', 'adwords');

-- Use the accounts table to find the account name, primary poc, and sales rep id for all stores except Walmart, Target, and Nordstrom.
SELECT name, primary_poc, sales_rep_id
From accounts
WHERE name NOT IN ('Walmart', 'Target', 'Nordstrom');

-- Use the web_events table to find all information regarding individuals who were contacted via any method except using organic or adwords methods.
SELECT *
From web_events
WHERE channel NOT IN ('organic', 'adwords');

-- Write a query that returns all the orders where the standard_qty is over 1000, the poster_qty is 0, and the gloss_qty is 0.
SELECT *
FROM orders
WHERE standard_qty > 1000 AND poster_qty = 0 AND gloss_qty = 0;

-- Using the accounts table, find all the companies whose names do not start with 'C' and end with 's'.
SELECT *
FROM accounts
WHERE name NOT LIKE 'C%' AND name LIKE '%s';

-- When you use the BETWEEN operator in SQL, do the results include the values of your endpoints, or not? Figure out the answer to this important question by writing a query that displays the order date and gloss_qty data for all orders where gloss_qty is between 24 and 29. Then look at your output to see if the BETWEEN operator included the begin and end values or not.
SELECT occurred_at, gloss_qty
FROM orders
WHERE gloss_qty BETWEEN 24 AND 29

--Use the web_events table to find all information regarding individuals who were contacted via the organic or adwords channels, and started their account at any point in 2016, sorted from newest to oldest.
SELECT *
FROM web_events
WHERE channel IN ('organic', 'adwords') AND occurred_at BETWEEN '2016-01-01' AND '2017-01-01'
ORDER BY occurred_at DESC;

-- Find list of orders ids where either gloss_qty or poster_qty is greater than 4000. Only include the id field in the resulting table.
SELECT id
FROM orders
WHERE gloss_qty > 4000 OR poster_qty > 4000;

-- Write a query that returns a list of orders where the standard_qty is zero and either the gloss_qty or poster_qty is over 1000.
SELECT *
FROM orders
WHERE standard_qty =0 AND (gloss_qty > 1000 OR poster_qty > 1000);

-- Find all the company names that start with a 'C' or 'W', and the primary contact contains 'ana' or 'Ana', but it doesn't contain 'eana'.
SELECT *
FROM accounts
WHERE (name LIKE 'C%' OR name LIKE 'W%') 
              AND ((primary_poc LIKE '%ana%' OR primary_poc LIKE '%Ana%') 
              AND primary_poc NOT LIKE '%eana%');
-- SQL Joins
---- INNER JOIN only returns rows that appear in both tables

SELECT orders.* ( This says to pull al comulms from order table only)
FROM orders
JOIN accounts
ON orders.accounts_id = accounts.id; ( only for rows where the accounts_id in orders matches the id in accounts)

OR

SELECT * ( All columns from both tables)
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;

OR

SELECT accounts.name, orders.occurred_at (Pulls only select columns)
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;

---  Try pulling all the data from the accounts table, and all the data from the orders table.
SELECT *
From orders ( STarting table)
JOIN accounts (connecting table)
ON orders.accounts_id = accounts.id;

-- Try pulling standard_qty, gloss_qty, and poster_qty from the orders table, and the website and the primary_poc from the accounts table.
SELECT orders.standard_qty,
       orders.gloss_qty,
       orders.poster_qty,
       accounts.website,
       accounts.primary_poc
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;

-- Join multiple tables ( pull all columns )
SELECT *
FROM web_events
JOIN accounts
ON web_events.account_id = accounts.id
JOIN orders
ON accounts.id = orders.account_id

-- Join multiple tables pull specific columns 
SELECT web_events.channel, accounts.name, orders.total
FROM web_events
JOIN accounts
ON web_events.account_id = accounts.id
JOIN orders
ON accounts.id = orders.account_id

-- Allias 
FROM tablename t1
JOIN tablename2 t2
SELECT col1 + col2 total, col3

-- Provide a table for all web_events associated with account name of Walmart. There should be three columns. Be sure to include the primary_poc, time of the event, and the channel for each event. Additionally, you might choose to add a fourth column to assure only Walmart events were chosen.
--MY ANSWER
  SELECT accounts.primary_poc,
web_events.occurred_at,
web_events.channel,
accounts.name,
FROM accounts
JOIN web_events
ON accounts.id = web_events.account_id
WHERE name IN ('Walmart')
-- CORRECT ANSWER
SELECT a.primary_poc, w.occurred_at, w.channel, a.name 
  FROM web_events w 
  JOIN accounts a 
  ON w.account_id = a.id 
  WHERE a.name = 'Walmart';

-- Provide a table that provides the region for each sales_rep along with their associated accounts. Your final table should include three columns: the region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) according to account name.
SELECT r.name AS region_name, sr.name AS sales_rep_name, a.name AS account_name
FROM region r
JOIN sales_reps sr
ON r.id = sr.region_id
JOIN accounts a
ON sr.id = a.sales_rep_id
ORDER BY a.name

-- Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order. Your final table should have 3 columns: region name, account name, and unit price. A few accounts have 0 for total, so I divided by (total + 0.01) to assure not dividing by zero.
SELECT r.name AS region, a.name AS account, (o.total_amt_usd/(o.total +0.01)) AS unit_price
FROM orders o
JOIN accounts a 
ON o.account_id = a.id
JOIN sales_reps s
ON s.id = a.sales_rep_id
JOIN region r 
ON r.id = s.region_id

---- Outter Join This will return the inner join result set, as well as any unmatched rows from either of the two tables being joined.
---- INNER JOIN only returns rows that appear in both tables
---- LEFT JOIN (Inner changeable with RIght joins)
SELECT 
FROM left table 
LEFT JOIN right table

--Provide a table that provides the region for each sales_rep along with their associated accounts. This time only for the Midwest region. Your final table should include three columns: the region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) according to account name.



-- Aggregations
-- SQL Subqueries * Temporary Tables
