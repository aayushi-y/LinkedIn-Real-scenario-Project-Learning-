/*﻿

Business problem: Tracking User Payment Funnel Times
A customer has complained that it took too long for them complete their payment process due to there being an error with the system. The customer support team brought this 
issue up and asked the analytics team to investigate the payment funnel time data for subscriptionid= 38844.
As subscriptions move through the payment statuses, they are logged in the paymentstatuslog table using the statusid to show what status they moved to. They can go back and 
forth and move through statuses multiple times.
Each step of the payment process from the user point of view is outlined below:
1. The user opens the widget to initiate the payment process.
2. The user types in their credit card information.
3. The user clicks the "submit" button to complete their part of the payment process.
4. The product sends the data to the third-party payment company.
5. The third-party payment company completes the transaction and reports back. 


﻿

This process is converted into statusids using the following ID to definition mapping below:
select from statusdefinition;
| STATUSID | DESCRIPTION
0          | Error       
1          | PaymentWidgetOpened
2          | PaymentEntered
3          | Payment Submitted 
4          | PaymentSuccess
5          | Complete

﻿

Task:
Using the paymentstatuslog table, pull payment funnel data for subscriptionid 38844. For each status timestamp, calculate the time difference between that timestamp the 
next chronological timestamp in order to show how long the user was in each status before moving to the next status. You can use the window function lead() to pull the 
next chronological timestamp.
Include the following columns:
• SubscriptionMovementid
• Subscriptionid
• Statusid
• MovementDate
• NextStatusMovementDate
• TimeinStatus

 

*/

Select *,
LEAD(MOVEMENTDATE) OVER(PARTITION BY SUBSCRIPTIONID ORDER BY MOVEMENTDATE) AS NEXTSTATUSMOVEMENTDATE, 
(LEAD(MOVEMENTDATE) OVER(PARTITION BY SUBSCRIPTIONID ORDER BY MOVEMENTDATE) - MOVEMENTDATE) AS TIMEINSTATUS
From PAYMENTSTATUSLOG 
Where SUBSCRIPTIONID = 38844
Order by MOVEMENTDATE;
