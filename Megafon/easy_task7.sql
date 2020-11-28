SELECT SUM(calls_date_minutes.sum) result FROM
    (SELECT calls_date.clnt_clnt_id, SUM(calls_date.minuts) sum FROM
        (SELECT * FROM calls
        WHERE call_date = '10.05.06') calls_date
    GROUP BY calls_date.clnt_clnt_id
    HAVING SUM(calls_date.minuts) > 30) calls_date_minutes
