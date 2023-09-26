/* 
﻿Business Problem
The chief growth officer is focused on reducing churn, or the number of customers that don't renew their annual subscription. She is planning to launch multiple product 
experiments and marketing campaigns throughout 2023 to drive users to renew their subscriptions. She's first conducting research to understand the potential impact that the 
churn initiative can have on the business. She reaches out to your team and asks when all active subscriptions are going to expire.
Because of data modeling limitations, your company was prevented from putting both products in the same table, so there are currently separate tables for each product, 
subscriptionsproduct1 and subscriptionsproduct2.
Sometimes, even if it's not the most optimal solution, data can be stored in multiple places due to:
• Data coming from different data sources
• Poor ETL and data modeling
• Technical migrations that don't align with legacy systems
Company or product acquisitions or mergers
Even though you don't need to segment by product, you do need to include BOTH products in your yearly counts. 
UNION will be the best tool to use to combine both products into one table to fulfill the chief growth officer's request.
*/

With temp AS (select * from subscriptionsproduct1 where active = 1
	UNION 
select * from  subscriptionsproduct2 where active = 1)

select YEAR(EXPIRATIONDATE) AS EXP_YEAR, COUNT(*) AS SUBSCRIPTIONS from temp
group by EXP_YEAR;
