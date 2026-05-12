create database EV_Market;
use ev_market;
show tables;
select * from ev_market_2026;
alter table ev_market_2026
rename ev_market;
-- ⚙️ Basic-Level (Data Familiarity)
-- Retrieve all Tesla models launched after 2023.


-- List all distinct EV brands available in the dataset.

-- Show the model name and price of the most expensive EV.

-- Find all EVs priced below $50,000.

-- Count how many EVs were launched in each year.

-- 📊 Intermediate-Level (Aggregations & Analysis)
-- These simulate business insights questions.

-- Calculate the average price of EVs by brand.

-- Find the cheapest variant for each brand.

-- Display the top 3 most expensive EVs overall.

-- Identify which year had the highest average EV price.

-- Show the total number of models per brand and sort by count descending.

-- Find the price difference between Tesla’s “Model 3” and “Model Y”.

-- List all EVs whose price is above the overall average price.

-- 🚀 Advanced-Level (Real-world & Interview Type)
-- These mimic analytics and decision-making scenarios.

-- Rank all EVs by price within each brand using a window function.

-- Find the second most expensive EV for each brand.

-- Determine which brand has the highest price growth trend between 2022–2025.

-- Create a query to categorize EVs into price segments:

-- “Budget” (< $40,000)

-- “Mid-range” ($40,000–$80,000)

-- “Luxury” (> $80,000)

-- Find the brand with the most variants launched after 2023.

-- Using a subquery, list all EVs whose price is greater than Tesla’s average price.

-- Write a query to compare the average price of Tesla vs Mercedes.

-- Display the percentage contribution of each brand’s total price to the overall market value.

-- 💡 Bonus (Analyst-style)
-- Suppose you want to recommend EVs for a mid-income buyer — show models priced between $35,000 and $70,000, sorted by brand and year.

-- Create a view named ev_price_summary that stores brand-wise average, min, and max prices.

-- Write a query to find year-over-year price growth for Tesla models.

-- Identify outlier EVs whose price is more than 1.5× the average of their brand.

-- Generate a report showing brand, model, year, price, and rank (ranked by price descending).

