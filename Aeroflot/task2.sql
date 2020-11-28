SELECT client_number, txn_num, avg_mil FROM clients INNER JOIN(
    SELECT client_id, COUNT(txn_id) AS txn_num, AVG(mil_sum) AS avg_mil FROM trans
    WHERE txn_sts = 'Processed' 
        AND txn_type = 'Redemption' 
        AND prod_id IN (SELECT prod_id FROM products WHERE prod_name = 'Ticket')
        AND txn_date > '31.12.2019' AND txn_date < '01.01.2021'
        AND client_id IN ( -- большой подзапрос с объединенийм двух условий
            SELECT client_id FROM trans
            WHERE txn_sts = 'Processed' 
                AND txn_type = 'Redemption' 
                AND prod_id IN (SELECT prod_id FROM products WHERE prod_name = 'Ticket')
                AND txn_date > '31.12.2019' AND txn_date < '01.01.2021'
            GROUP BY client_id
            HAVING SUM(mil_sum) > 50000

            INTERSECT -- пересечение выборки по двум условиям
            -- Клиенты, имеющие до первой полетной транзакции в 2020 более 40k миль
            SELECT client_id FROM (
                SELECT client_id, MIN(txn_id) AS txn_id FROM (
                    SELECT client_id, txn_id FROM trans
                    WHERE prod_id IN (SELECT prod_id FROM products WHERE prod_name = 'Ticket')
                        AND txn_sts = 'Processed'
                        AND txn_date > '31.12.2019' AND txn_date < '01.01.2021')
                GROUP BY client_id) first_trans
            INNER JOIN (
                SELECT txn_id FROM trans
                WHERE txn_type = 'Redemption' AND (balance + mil_sum) > 40000
                UNION
                SELECT txn_id FROM trans
                WHERE txn_type = 'Accrual' AND (balance - mil_sum) > 40000) trans_more_40k
            ON first_trans.txn_id = trans_more_40k.txn_id)
    GROUP BY client_id) trans
ON clients.client_id = trans.client_id;