CREATE TABLE ark AS (
SELECT no_rate.id, no_rate.dt, no_rate.curr, r.rate FROM
    (SELECT interm.id, interm.dt, interm.curr, MAX(interm.r_dt) AS near_dt FROM
        (SELECT t.id, t.dt, t.curr, t.rate, r.dt AS r_dt FROM t 
        INNER JOIN r ON r.curr = t.curr WHERE r.dt <= t.dt) interm 
    GROUP BY interm.id, interm.dt, interm.curr) no_rate INNER JOIN r
ON no_rate.curr = r.curr AND no_rate.near_dt = r.dt);
DELETE FROM t;
INSERT INTO t (t.id, t.dt, t.curr, t.rate) SELECT * FROM ark;
