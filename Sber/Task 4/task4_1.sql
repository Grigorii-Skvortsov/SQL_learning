UPDATE t SET t.rate = 
    (SELECT r.rate FROM r 
    WHERE r.dt IN ('17.01.2019', '12.05.2019') AND r.curr IN
        (SELECT t.curr FROM t WHERE t.id = 5 
                                AND t.dt IN ('17.01.2019', '12.05.2019'))
    )
WHERE t.id = '5';

INSERT INTO t
(t.id, t.dt, t.curr, t.rate)
    SELECT 5 AS id, r.dt, r.curr, r.rate FROM r 
    WHERE r.dt IN ('17.01.2019', '12.05.2019') AND r.curr NOT IN
        (SELECT t.curr FROM t WHERE t.id = 5 
                                AND t.dt IN ('17.01.2019', '12.05.2019'));

SELECT * FROM t;