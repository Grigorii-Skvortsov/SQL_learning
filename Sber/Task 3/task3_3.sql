CREATE TABLE ark AS (
SELECT not_unic.id, not_unic.dt, not_unic.curr, not_unic.rate FROM
    (SELECT row_number() over(ORDER BY t.id) num, t.id, t.dt, t.curr, t.rate 
        FROM t INNER JOIN 
            (SELECT t.id, max(t.dt) as dt FROM t
            GROUP BY t.id) t_max_date 
        ON t.id = t_max_date.id AND t.dt = t_max_date.dt) not_unic
INNER JOIN 
    (SELECT max(not_unic.num) as num, not_unic.id FROM
        (SELECT row_number() over(ORDER BY t.id) num, t.id, t.dt, t.curr, t.rate 
        FROM t INNER JOIN 
            (SELECT t.id, max(t.dt) as dt FROM t
            GROUP BY t.id) t_max_date 
        ON t.id = t_max_date.id AND t.dt = t_max_date.dt) not_unic
    GROUP BY not_unic.id) t_max
ON t_max.num = not_unic.num
);
DROP TABLE t;
RENAME ark TO t;
SELECT * FROM t;