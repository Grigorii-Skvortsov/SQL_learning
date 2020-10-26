SELECT t_num.id, t_num.dt, t_num.curr, t_num.rate FROM
    (SELECT row_number() over(ORDER BY t.id) num, t.id, t.dt, t.curr, t.rate 
    FROM t) t_num
WHERE t_num.num IN
    (SELECT max(not_unic.num) as num FROM
        (SELECT t_num.num, t_num.id, t_num.dt, t_num.curr, t_num.rate FROM 
            (SELECT row_number() over(ORDER BY t.id) num, 
            t.id, t.dt, t.curr, t.rate 
            FROM t) t_num
        INNER JOIN 
            (SELECT t.id, max(t.dt) as dt FROM t
            GROUP BY t.id) t_max_date 
        ON t_num.id = t_max_date.id AND t_num.dt = t_max_date.dt) not_unic
    GROUP BY not_unic.id)
