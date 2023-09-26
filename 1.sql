/* ﻿

Business problem:
The leadership team at your company is making goals for 2023 and wants to understand how much revenue each of the product subscriptions, basic and expert, are generating each
month. More specifically, they want to understand the distribution of monthly revenue across the past year, 2022.
They've asked you the following questions:
1. How much revenue does each product usually generate each month?
2. Which product had the most success throughout all of last year?
3. Did either product fluctuate greatly each month or was the month-to-month trend fairly consistent?
﻿

Task:
Using a CTE and the subscriptions and products tables, calculate the:
• minimum monthly revenue: min_rev • maximum monthly revenue: max_rev
• average monthly revenue: avg_rev
• standard deviation of monthly revenue: std_dev_rev
for each product, ProductName.
*/
WITH temp as (select MONTH(s.ORDERDATE) as monthly,
                    s.PRODUCTID, SUM(s.REVENUE) AS total_revenue
                FROM Subscriptions s
                    WHERE YEAR(s.ORDERDATE) = 2022
                        GROUP BY monthly,s.PRODUCTID
)
select 
    p.PRODUCTNAME,
    MAX(t.total_revenue) AS MAX_REV, 
    MIN(t.total_revenue) AS MIN_REV, 
    AVG(t.total_revenue) AS AVG_REV,
    STDDEV(t.total_revenue) AS STD_DEV_REV
    from temp t JOIN products p
    ON t.PRODUCTID = p.PRODUCTID
    GROUP BY p.PRODUCTNAME;
            
