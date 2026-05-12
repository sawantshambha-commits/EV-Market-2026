create database EV_Market;
use ev_market;
show tables;
select * from ev_market_2026;
alter table ev_market_2026
rename ev_market;
-- ⚙️ Basic-Level (Data Familiarity)
-- 1.Retrieve all Tesla models launched after 2023.
 select * from ev_market
 where brand = "Tesla" and year > 2023
 order by year;

-- 2. List all distinct EV brands available in the dataset.
select brand from ev_market
group by brand
order by brand;

-- 3. Show the model name and price of the most expensive EV.
select brand, model, price_usd from ev_market
order by price_usd desc
limit 1;

-- 4. Find all EVs priced below $50,000.
select * from ev_market
where price_usd < 50000
order by price_usd;

-- 5 Count how many EVs were launched in each year.
select year, count(*) as Total_EVs_Launch
from ev_market
group by year
order by year;

-- 📊 Intermediate-Level (Aggregations & Analysis)
-- These simulate business insights questions.

-- 6 Calculate the average price of EVs by brand.
select brand, round(avg(price_usd), 02) as avg_price
from ev_market
group by brand
order by avg_price;

-- 7 Find the cheapest variant for each brand.
with abc as (select brand,model, variant, price_usd , 
rank() over (partition by brand order by price_usd asc) as lowest_price from ev_market)
select * from abc
where lowest_price = 1
order by brand;

SELECT brand,
       variant,
       price_usd
FROM ev_market
WHERE (brand, price_usd) IN (
    SELECT brand,
           MIN(price_usd)
    FROM ev_market
    GROUP BY brand
)
ORDER BY price_usd ASC;



-- 8 Display the top 3 most expensive EVs overall.
select * from ev_market
order by price_usd desc
limit 3;

-- 9 Identify which year had the highest average EV price.
select year, round(avg(price_usd), 02) as avg_price from ev_market
group by year
order by avg_price desc
limit 1;

-- 10 Show the total number of models per brand and sort by count descending.
select brand, count(model) as Total_Numbers
from ev_market
group by brand
order by Total_Numbers desc;

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

