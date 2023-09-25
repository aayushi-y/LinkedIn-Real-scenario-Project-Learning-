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
