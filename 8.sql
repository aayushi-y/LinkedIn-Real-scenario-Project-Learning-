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
/* WITH LAG WINDOW FUNCTION SAME QUERY CAN BE WRITTEN AS 

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


*/
