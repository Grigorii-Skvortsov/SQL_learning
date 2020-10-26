CREATE TABLE ark AS (
SELECT no_rate.id, no_rate.dt, no_rate.curr, r.rate FROM r INNER JOIN
    (SELECT interm.id, interm.dt, interm.curr, MAX(interm.r_dt) AS near_dt FROM
        (SELECT DISTINCT t.id, t.dt, t.curr, t.rate, r.dt AS r_dt 
        FROM r INNER JOIN t ON r.curr = t.curr
        WHERE t.dt >= r.dt) interm
    GROUP BY interm.id, interm.dt, interm.curr) no_rate
ON no_rate.near_dt = r.dt AND no_rate.curr = r.curr);
DROP TABLE t;
RENAME ark TO t;
