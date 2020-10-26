SELECT num_t.id, num_t.dt, num_t.curr, num_t.rate FROM
    (SELECT row_number() over(ORDER BY t.id) num, t.id, t.dt, t.curr, t.rate
        FROM t INNER JOIN
            (SELECT t.curr, MAX(t.rate) AS rate FROM t
            GROUP BY t.curr) t_max
        ON t.curr = t_max.curr AND t.rate = t_max.rate) num_t
INNER JOIN
    (SELECT MIN(num_t.num) AS num FROM
        (SELECT row_number() over(ORDER BY t.id) num, t.id, t.dt, t.curr, t.rate
        FROM t INNER JOIN
            (SELECT t.curr, MAX(t.rate) AS rate FROM t
            GROUP BY t.curr) t_max
        ON t.curr = t_max.curr AND t.rate = t_max.rate) num_t
    GROUP BY num_t.curr) num_min_t
ON num_min_t.num = num_t.num