create database Insuranceanalysis;
use Insuranceanalysis;
select*from Brokerage;
select*from fees;
select*from budgets;
select*from invoice;
select*from meeting;
select*from opportunity;
 
 -- KPI 1 stage by revenue amount
 SELECT 
    stage,
    COUNT(DISTINCT opportunity_id) AS opportunity_count,
    SUM(revenue_amount) AS total_revenue
FROM opportunity
GROUP BY stage
ORDER BY total_revenue DESC;

-- kPI 2 of opportunity by product distribution
SELECT 
    product_group,
    COUNT(DISTINCT opportunity_id) AS total_opportunities
FROM opportunity
GROUP BY product_group
ORDER BY total_opportunities DESC;

-- KPI 3 - Number of invoice by Account Executive
select Account_Executive,
		sum(case when income_class = "Cross Sell" then 1 else 0 end) as Cross_Sell_Count,
        sum(case when income_class = "New" then 1 else 0 end) as New_Count,
        sum(case when income_class = "Renewal" then 1 else 0 end) as Renewal_Count,
        sum(case when income_class = "-" then 1 else 0 end) as NULL_invoice_Count,
        count(Invoice_number) as invoice_count
from invoice
group by Account_Executive
order by Invoice_count desc;

-- KPI 4 - Yearly Meeting Count
SELECT 
    YEAR(meeting_date) AS meeting_year,
    COUNT(*) AS total_meetings
FROM meeting
GROUP BY YEAR(meeting_date)
ORDER BY meeting_year;

-- KPI 5 No of Meeting by Account Exec
SELECT 
    Account_Executive,
    COUNT(*) AS Meeting_Count
FROM meeting list
GROUP BY Account_Executive
ORDER BY Meeting_Count DESC;

-- KPI 6 for Top open opportunity
SELECT 
   ï»¿opportunity_name,
    SUM(revenue_amount) AS sum_of_revenue_amount,
    COUNT(stage) AS count_of_stage
FROM opportunity
WHERE stage = 'Open'
GROUP BY ï»¿opportunity_name WITH ROLLUP;











    





