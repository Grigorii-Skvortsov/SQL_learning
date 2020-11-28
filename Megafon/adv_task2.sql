SELECT account FROM (SELECT DISTINCT account, rtpl_id FROM table2)
GROUP BY account
HAVING COUNT(account) = 1;
