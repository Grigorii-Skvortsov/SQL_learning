DELETE FROM t
WHERE (t.id, t.dt, t.curr, t.rate) IN (
    SELECT t.id, t.dt, t.curr, t.rate FROM t INNER JOIN
        (SELECT t.id, t.dt, t.curr FROM t
        WHERE t.id = '5'
        INTERSECT
        SELECT 5 AS id, r.dt, r.curr FROM r 
        WHERE r.dt IN ('17.01.2019', '12.05.2019')) tr_intersect
    ON t.id = tr_intersect.id 
    AND t.dt = tr_intersect.dt AND t.curr = tr_intersect.curr);

INSERT INTO t
(t.id, t.dt, t.curr, t.rate)
    SELECT 5 AS id, r.dt, r.curr, r.rate FROM r 
    WHERE r.dt IN ('17.01.2019', '12.05.2019');

SELECT * FROM t;