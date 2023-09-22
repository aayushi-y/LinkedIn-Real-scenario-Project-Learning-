With temp AS (select * from subscriptionsproduct1 where active = 1
	UNION 
select * from  subscriptionsproduct2 where active = 1)

select YEAR(EXPIRATIONDATE) AS EXP_YEAR, COUNT(*) AS SUBSCRIPTIONS from temp
group by EXP_YEAR;
