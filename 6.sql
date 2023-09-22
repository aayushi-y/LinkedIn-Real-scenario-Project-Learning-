WITH temp as (select (select COUNT(*) from cancelations
where cancelationreason1 = 'Expensive'
or cancelationreason2 = 'Expensive'
or cancelationreason3 = 'Expensive') AS count,
count(*) AS total_count from cancelations)
    select (cast(count as float)/cast(total_count as float)) AS PERCENT_EXPENSIVE from temp;
