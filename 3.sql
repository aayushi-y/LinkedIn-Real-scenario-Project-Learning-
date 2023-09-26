/*
Business Problem: Flagging upsell opportunities for the sales team
The product team is launching a new product offering that can be added on top of a current subscription for an increase in the customer's annual fee. The sales team has decided
that they first want to reach out to a select group of customers to offer the new product and get feedback before offering it to the entire customer base.
﻿

They've decided it would be best to reach out to customers who meet the following conditions:
1. Have at least 5,000 registered users. Companies with large amounts of users are a significant upsell opportunity, because they can lead to more potential revenue. 
(More users = More $)
2. Only have one product subscription. Based on conversations the sales team has had with customers, the companies that already have subscriptions for two products are not 
going to be willing to spend more and add onto their current subscriptions. You decide to help out the sales team by providing them a report with all current customers and 
the number of product subscriptions and registered users they currently have. To make it extra easy for the sales team to identify customers that are upsell opportunity,
you also include a binary column that flags the customers that meet these conditions.

*/

With temp1 As (select customerID, Sum(Numberofusers) AS total_users from subscriptions
group by customerID),

temp2 As (select customerId, count(*) as Num_products from subscriptions  group by customerId)

select temp1.customerID, Num_products, total_users,
CASE 
    WHEN Num_products = 1 OR total_users >=5000 THEN 1 
    ELSE 0 
END AS UPSELL_Opportunity
from temp1 left join temp2
on temp1.customerID = temp2.customerID
