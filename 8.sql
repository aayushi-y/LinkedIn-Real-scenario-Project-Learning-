/*﻿

Business problem: Comparing MoM Revenue
It's time for end-of-year reporting, and your manager wants you to put together a slide deck summarizing the top revenue highlights of the year and present it to the whole 
company on the all-hands call. Among other metrics and insights, your manager suggests that you highlight months where revenue was up month-over- month (MoM). In other words,
she wants you to highlight the months where revenue was up from the previous month. You know this can be done with window functions using lead or lag (see the window 
functions chapter of this course), but you decide to exercise your self join skills to accomplish the task. 
﻿

Using the monthly_revenue CTE joined to itself, pull a report that includes the following fields:
• current_month: the current month
• previous_month: the previous month from the current month
• current_revenue: the monthly revenue of the current month
• previous_revenue: the monthly revenue of the previous month
• Only pull rows where the monthly revenue for the current month is greater than the revenue for the previous month.
• Filter the data so that the date difference (in months) between the current month and previous month is 1.
*/

With monthly_CTE AS (
select date_trunc('month', orderdate) as month,
sum(revenue) as revenue from subscriptions 
group by month
order by month)

select current.month as current_month,
current.revenue as current_revenue,
previous.month as previous_month, 
previous.revenue as previous_revenue
from monthly_cte current
    JOIN 
monthly_cte previous
where datediff('month', previous.month, current.month) = 1 AND 
(current.revenue - previous.revenue) > 0
/* WITH LAG WINDOW FUNCTION SAME QUERY CAN BE WRITTEN AS */

With temp1 as (select date_trunc('month', orderdate) as order_date, 
sum(revenue) as revenue from subscriptions 
group by order_date
order by order_date),
temp2 AS (
select order_date AS current_month, revenue AS current_revenue, 
LAG(revenue, 1 ) OVER(ORDER BY order_date) AS previous_revenue, 
LAG(order_date, 1) OVER(ORDER BY order_date) AS previous_month, 
 from temp1 )

select * from temp2 where 
current_revenue - previous_revenue > 0 
AND 
previous_revenue IS NOT NULL
AND 
previous_month IS NOT NULL
AND 
datediff("month", previous_month, current_month) =1


