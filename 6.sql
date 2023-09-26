/*﻿

Business problem: Analyzing Subscription Cancelation Reasons
Since the chief growth officer is tackling churn next year, one of her big questions is: "why are users canceling and not renewing their subscriptions?" Knowing why users 
aren't renewing their subscriptions will be a key insight into how to prevent churn in the future. Is it because they don't like the product? Are they leaving for a
competitor? Or maybe it's out of budget and too expensive for them? Only the data can help us know for sure!
When users decide to cancel their subscription, they're able to select up to three reasons for canceling out of a preset list. Users can't select the same reason twice, and 
some users may even select less than three reasons and have null values in some of the cancelation reason columns. Since the economy has been tough lately, you decide to 
first pull the percent of canceled subscriptions that canceled due to the product being too expensive. 
﻿

Task:
Using UNION and the cancelations table, calculate the percent of canceled subscriptions that reported 'Expensive' as one of their cancelation reasons.
*/

WITH temp as (select (select COUNT(*) from cancelations
where cancelationreason1 = 'Expensive'
or cancelationreason2 = 'Expensive'
or cancelationreason3 = 'Expensive') AS count,
count(*) AS total_count from cancelations)
    select (cast(count as float)/cast(total_count as float)) AS PERCENT_EXPENSIVE from temp;
