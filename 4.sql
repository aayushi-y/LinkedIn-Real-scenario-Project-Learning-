select userid,
sum(case when frontendeventlog.eventid = 1 then 1 else 0 END) AS ViewedHelpCenterPage,
 sum(   case when frontendeventlog.eventid = 2 then 1 else 0 END) AS ClickedFAQs,
  sum(  case when frontendeventlog.eventid = 3 then 1 else 0 END) AS ClickedContactSupport,
  sum(  case when frontendeventlog.eventid = 4 then 1 else 0 END) AS SubmittedTicket
  from frontendeventlog join frontendeventdefinitions
  on frontendeventlog.eventid = frontendeventdefinitions.eventid
  where eventtype = 'Customer Support'
    group by userid 
    
