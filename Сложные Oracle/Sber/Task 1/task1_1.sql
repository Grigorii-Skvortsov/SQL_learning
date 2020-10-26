SELECT t.id, t.dt, t.curr, t.rate FROM t INNER JOIN
(SELECT t.id, COUNT(t.id) AS id_count FROM t
GROUP BY t.id) t_count
ON t.id = t_count.id
WHERE t_count.id_count > 1;