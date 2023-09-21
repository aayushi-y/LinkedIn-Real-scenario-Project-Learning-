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
