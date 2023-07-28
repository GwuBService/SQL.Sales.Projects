-- EMMANUEL OGAR PERSONAL SALES SQL PROJECT
-- Analyze the relationship between sales and the different
-- macroeconomic variables in the dataset.

select *
from SQLclass..Walmart

-- Selecting the Datas that will be used

select Date, Weekly_sales, Holiday_Flag, Temperature 
from SQLclass..Walmart

--
select Year(date) as Sales_Year, 
Weekly_sales, Holiday_Flag, Temperature 
from SQLclass..Walmart
order by Sales_Year asc

-- Total Revenue

Select SUM(Weekly_sales) AS Total_Revenue
from SQLclass..Walmart

--Year with the hightest Revenue 

SELECT YEAR(Date) AS Sales_Year, SUM(Weekly_sales) AS Total_Revenue
FROM SQLclass..Walmart
--where YEAR(Date) = '2011'
GROUP BY YEAR(Date)
order by Total_Revenue desc

-- Which year had the highest sales and Percentage?

	 select Year(date) as Sales_Year, MAX(Weekly_sales) 
	 as Highestsales
from SQLclass..Walmart
group by Year(date)
order by Highestsales desc

--
 select Year(date) as Sales_Year, MAX(Weekly_sales) 
	 as Highestsales, (max(Weekly_sales)/sum(Weekly_sales))*100
	 as SalesPercentage
from SQLclass..Walmart
group by Year(date)
order by Highestsales desc

--
 select Year(date) as Sales_Year, MAX(Weekly_sales) 
	 as Highestsales, (max(Weekly_sales)/sum(Weekly_sales))*100
	 as SalesPercentage
from SQLclass..Walmart
where YEAR(Date) = '2011'
group by Year(date)
order by Highestsales desc

-- SalesPercentage

select Year(date) as Sales_Year, MAX(Weekly_sales) 
	 as Highestsales,
	 sum(Weekly_sales) as Total_sales,
	 (max(Weekly_sales)/sum(Weekly_sales))*100 as SalesPercentage
from SQLclass..Walmart
group by Year(date)
order by Highestsales desc

-- How was the weather during the year of highest sales?

select Year(date) as Sales_Year, MAX(Weekly_sales) as Highest_sales, 
avg(Temperature) as Weather 
from SQLclass..Walmart
group by Year(date)
order by Highest_sales desc

-- Conclude whether the weather has an essential impact on sales

select Year(date) as Sales_Year, min(Weekly_sales) as Lowest_sales, 
avg(Temperature) as Weather 
from SQLclass..Walmart
group by Year(date)
order by Lowest_sales desc

-- Do the sales always rise near the holiday season for all the years?

Select YEAR(Date) AS Sales_Year, 
       AVG(case when Holiday_flag = 1 then 
	   Weekly_sales else 0 end) as Avg_Sales_During_Holidays,
       AVG(case when Holiday_flag = 0 then 
	   Weekly_sales else 0 end) as Avg_Sales_Not_During_Holidays
from SQLclass..Walmart
group by YEAR(Date)
order by Sales_Year

-- Weather Reading Percentage During Weather

select Year(date) as Sales_Year, 
MAX(Weekly_sales) as Highest_sales, 
avg(Temperature) as Weather, 
avg(Temperature)/sum(Temperature)*100 as Weather_Reading
from SQLclass..Walmart
group by Year(date)
order by Highest_sales desc

-- SalesPercentage between each year

select Year(date) as Sales_Year, 
max(Weekly_sales) as Highest_sales,
sum(Weekly_sales) as Total_sales,
(max(Weekly_sales)/sum(Weekly_sales))*100 as SalesPercentage
from SQLclass..Walmart
group by Year(date)
order by Highest_sales desc