/*﻿
Business problem: Tracking Sales Quota Progress over Time
The sales team works diligently to sell the product, and they have quotas that they must reach in order to earn all of their commission. Because these goals are so intimately
tied to revenue, the manager of the team wants to track each sales member's performance throughout the year. You suggest a % of quota reached metric that could be displayed 
on a dashboard, but the sales manager expresses her concern that a single metric won't give her visibility into their progress throughout the year. You suggest providing a 
running_total of sales revenue and a percent_quota metric that will be recalculated every time a sales member makes another sale. She agrees, and you get started!
Task:
Calculate the running total of sales revenue, running_total, and the % of quota reached, percent_quota, for each sales employee on each date they make a sale. 
Use the sales and employees table to pull in and create the following fields:
salesemployeeid
saledate
saleamount
quota
running_total
percent_quota
Order the final output by sales employeeid and saledate. */

WITH SALES_DATA AS (select salesemployeeid, saledate, saleamount, QUOTA, 
SUM(SALEAMOUNT) OVER(PARTITION BY SALESEMPLOYEEID ORDER BY SALEDATE) as RUNNING_TOTAL
from employees join sales 
on employees.EMPLOYEEID = sales.SALESEMPLOYEEID
ORDER BY SALESEMPLOYEEID)

SELECT salesemployeeid, saledate, saleamount, RUNNING_TOTAL , CAST(RUNNING_TOTAL AS FLOAT) / QUOTA AS PERCENT_QUOTA FROM SALES_DATA
