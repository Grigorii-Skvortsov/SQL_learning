SELECT thisdate.subs_id, thisdate.number_history, 
thisdate.start_date, thisdate.end_date, nextdate.start_date AS next_date, 
thisdate.rtpl_id
FROM
    (SELECT row_number() over(ORDER BY table6.subs_id)+1 AS num, 
    table6.subs_id, table6.number_history, 
    table6.start_date, table6.end_date, table6.rtpl_id
    FROM table6) thisdate
INNER JOIN
    (SELECT row_number() over(ORDER BY table6.subs_id) AS num,
    start_date 
    FROM table6) nextdate
    ON nextdate.num = thisdate.num
WHERE nextdate.start_date > thisdate.end_date;

SELECT * FROM table6
WHERE start_date > end_date