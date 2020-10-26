SELECT olds.month_id, olds.old, babes.baby FROM
    (SELECT month_id, count(type_id) baby FROM table3
    WHERE type_id = 1
    GROUP BY month_id) babes
INNER JOIN
    (SELECT month_id, count(type_id) old FROM table3
    WHERE type_id = 1
    GROUP BY month_id) olds
ON olds.month_id = babes.month_id;
