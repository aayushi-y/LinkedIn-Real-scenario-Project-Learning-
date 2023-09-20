WITH temp AS (select USERID, COUNT(USERID) as num_link_clicks 
                from FrontendEventLog
                Where EVENTID = 5
                    GROUP BY USERID
                    )
Select COUNT(NUM_LINK_CLICKS) AS num_users, NUM_LINK_CLICKS 
    FROM temp 
        GROUP BY NUM_LINK_CLICKS
            ORDER BY NUM_LINK_CLICKS ASC;
