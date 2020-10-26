SELECT * FROM t
WHERE t.id IN
    (SELECT t.id FROM t
    GROUP BY t.id
    HAVING COUNT(t.id) > 1);