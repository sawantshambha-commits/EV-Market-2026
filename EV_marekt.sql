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

-- 11 Find the price difference between Tesla’s “Model 3” and “Model Y”.
with Model_3 as (select model, price_usd from ev_market
where brand = "Tesla" and model = "Model 3"
limit 1),
Model_Y as (select model, price_usd from ev_market
where brand = "Tesla" and model = "Model Y"
limit 1)
select abs(round((Model_3.price_usd - Model_Y.Price_usd), 02)) as diff
from Model_3, Model_Y;

-- 12 List all EVs whose price is above the overall average price.
select * from ev_market
where price_usd > (select avg(price_usd) from ev_market);

-- 🚀 Advanced-Level (Real-world & Interview Type)
-- These mimic analytics and decision-making scenarios.

-- 13 Rank all EVs by price within each brand using a window function.
select brand, model, year, price_usd, 
dense_rank() over(partition by brand order by price_usd desc) as Ranking
from ev_market;

-- 14 Find the second most expensive EV for each brand.
with abc as( select *, dense_rank() over (partition by brand order by price_usd desc) as Ranking
from ev_market)
select brand, model, price_usd from abc
where Ranking = 2;

-- 15 Determine which brand has the highest price growth trend between 2022–2025.
with yrly_avg_price as(
select brand, year, avg(price_usd) as avg_price from ev_market
group by brand, year),
growth_trend as(
select brand, max(avg_price) - min(avg_price) as growth
from yrly_avg_price
group by brand)
select * from growth_trend
order by growth desc
limit 1;

-- 16 Create a query to categorize EVs into price segments:
-- “Budget” (< $40,000), “Mid-range” ($40,000–$80,000), “Luxury” (> $80,000)

select brand, model, price_usd,
case when price_usd < 40000 then "Budget"
when price_usd < 80000 then "Mid-range"
else "Luxury"
end as price_category
from ev_market
order by price_category;


-- 17 Find the brand with the most variants launched after 2023.
select brand, count(distinct(variant)) as Total_Variant
from ev_market
where year > "2023"
group by brand
order by Total_Variant desc
limit 1;

-- Using a subquery, list all EVs whose price is greater than Tesla’s average price.

-- Write a query to compare the average price of Tesla vs Mercedes.

-- Display the percentage contribution of each brand’s total price to the overall market value.

-- 💡 Bonus (Analyst-style)
-- Suppose you want to recommend EVs for a mid-income buyer — show models priced between $35,000 and $70,000, sorted by brand and year.

-- Create a view named ev_price_summary that stores brand-wise average, min, and max prices.

-- Write a query to find year-over-year price growth for Tesla models.

-- Identify outlier EVs whose price is more than 1.5× the average of their brand.

-- Generate a report showing brand, model, year, price, and rank (ranked by price descending).

select * from ev_market;
select brand, max(price_usd) from ev_market
group by brand
order by max(price_usd) desc;
