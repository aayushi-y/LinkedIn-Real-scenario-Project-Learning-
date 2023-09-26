/*﻿
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
