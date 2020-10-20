SELECT t.id, t.dt, t.curr, t.rate FROM t INNER JOIN
(SELECT t.id, COUNT(t.id) AS id_count FROM t
GROUP BY t.id
HAVING COUNT(t.id) > 1) t_count
ON t.id = t_count.id;


