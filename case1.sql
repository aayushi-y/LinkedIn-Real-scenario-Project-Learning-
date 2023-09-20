WITH temp as (select MONTH(s.ORDERDATE) as monthly,
                    s.PRODUCTID, SUM(s.REVENUE) AS total_revenue
                FROM Subscriptions s
                    WHERE YEAR(s.ORDERDATE) = 2022
                        GROUP BY monthly,s.PRODUCTID
)
select 
    p.PRODUCTNAME,
    MAX(t.total_revenue) AS MAX_REV, 
    MIN(t.total_revenue) AS MIN_REV, 
    AVG(t.total_revenue) AS AVG_REV,
    STDDEV(t.total_revenue) AS STD_DEV_REV
    from temp t JOIN products p
    ON t.PRODUCTID = p.PRODUCTID
    GROUP BY p.PRODUCTNAME;
            
