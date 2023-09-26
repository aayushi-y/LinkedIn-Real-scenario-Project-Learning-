/*﻿

Business problem: Tracking user activity with frontend events
The design team recently redesigned the customer support page on the website, and they want to run an AB test to see how the newly designed page performs compared to the 
original. An AB test is a statistical test used frequently in data science to measure the impact changes have on specified metrics. The users will be randomly assigned into 
two groups: control and treatment. The users in control group will see the current customer support page, and the users in treatment will see the new page design. The analytics
team needs to track user activity via frontend events (button clicking, page viewing, etc.) to inform the product team for future iterations. At the end of the experiment, the 
results of the control and treatment group will be compared to make a final product recommendation. 
﻿

Task:
Using the Frontend Event Log table and CASE, count the number of times a user completes the following events:
• ViewedHelpCenterPage (eventid = 1)
• Clicked FAQs (eventid = 2)
• ClickedContact Support (eventid = 3)
· SubmittedTicket (eventid = 4)
• Filter the events with eventtype = 'Customer Support' from the
frontendeventdefinitions table to pull only the events related to customer support.
*/

select userid,
sum(case when frontendeventlog.eventid = 1 then 1 else 0 END) AS ViewedHelpCenterPage,
 sum(   case when frontendeventlog.eventid = 2 then 1 else 0 END) AS ClickedFAQs,
  sum(  case when frontendeventlog.eventid = 3 then 1 else 0 END) AS ClickedContactSupport,
  sum(  case when frontendeventlog.eventid = 4 then 1 else 0 END) AS SubmittedTicket
  from frontendeventlog join frontendeventdefinitions
  on frontendeventlog.eventid = frontendeventdefinitions.eventid
  where eventtype = 'Customer Support'
    group by userid 
    
