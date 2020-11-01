create table clients
(
    client_id number,    -- id клиента
    client_number number -- номер клиента в бонус-программе
);

insert into clients
select 1, 101 from dual union all
select 2, 102 from dual union all
select 3, 103 from dual union all
select 4, 104 from dual union all
select 5, 105 from dual union all
select 6, 109 from dual;

commit;



create table trans (
    client_id number,       -- id клиента
    txn_id number,          -- id транзакции
    txn_date date,          -- дата транзакции
    txn_type varchar2(10),  -- тип транзакции 
    txn_sts varchar2(10),   -- статус транзакции
    prod_id number,         -- id продукта
    mil_sum number,         -- объём оборачиваемых милль
    balance number          -- баланс клиента после транзакции
);

insert into trans
select 1, 1, to_date('01.01.2019', 'dd.mm.yyyy'), 'Accrual',    'Cancelled', 1, 31000, 41000 from dual union all
select 2, 2, to_date('27.03.2019', 'dd.mm.yyyy'), 'Redemption', 'Processed', 2, 32000, 41000 from dual union all
select 3, 3, to_date('01.01.2020', 'dd.mm.yyyy'), 'Redemption', 'Cancelled', 3, 33000, 41000 from dual union all
select 4, 4, to_date('02.02.2020', 'dd.mm.yyyy'), 'Accrual',    'Processed', 1, 33000, 81000 from dual union all
select 5, 5, to_date('03.03.2020', 'dd.mm.yyyy'), 'Redemption', 'Processed', 1, 34000, 41000 from dual union all
select 6, 6, to_date('04.04.2020', 'dd.mm.yyyy'), 'Accrual',    'Processed', 1, 35000, 91000 from dual union all
select 1, 7, to_date('05.05.2020', 'dd.mm.yyyy'), 'Redemption', 'Cancelled', 1, 31000, 41000 from dual union all
select 2, 8, to_date('06.06.2020', 'dd.mm.yyyy'), 'Accrual',    'Processed', 1, 32000, 40000 from dual union all
select 3, 9, to_date('07.07.2020', 'dd.mm.yyyy'), 'Redemption', 'Processed', 1, 33000, 39000 from dual union all
select 4, 10, to_date('08.08.2020', 'dd.mm.yyyy'), 'Accrual',   'Processed', 1, 34000, 41000 from dual union all
select 5, 11, to_date('09.09.2020', 'dd.mm.yyyy'), 'Accrual',   'Processed', 1, 35000, 40000 from dual union all
select 6, 12, to_date('10.10.2020', 'dd.mm.yyyy'), 'Accrual',   'Cancelled', 1, 31000, 39000 from dual union all
select 1, 13, to_date('11.11.2020', 'dd.mm.yyyy'), 'Accrual',   'Processed', 1, 30100, 41000 from dual union all
select 2, 14, to_date('12.12.2020', 'dd.mm.yyyy'), 'Accrual',   'Processed', 1, 30100, 40000 from dual union all
select 1, 15, to_date('01.01.2019', 'dd.mm.yyyy'), 'Redemption',    'Cancelled', 1, 30200, 39000 from dual union all
select 2, 16, to_date('27.03.2019', 'dd.mm.yyyy'), 'Accrual', 'Processed', 2, 31100, 40000 from dual union all
select 3, 17, to_date('01.01.2020', 'dd.mm.yyyy'), 'Accrual', 'Cancelled', 3, 31200, 41000 from dual union all
select 4, 18, to_date('02.02.2020', 'dd.mm.yyyy'), 'Redemption',    'Processed', 1, 30000, 39000 from dual union all
select 5, 19, to_date('03.03.2020', 'dd.mm.yyyy'), 'Accrual', 'Processed', 1, 30000, 40000 from dual union all
select 6, 20, to_date('04.04.2020', 'dd.mm.yyyy'), 'Redemption',    'Processed', 1, 30000, 41000 from dual union all
select 1, 21, to_date('05.05.2020', 'dd.mm.yyyy'), 'Accrual', 'Cancelled', 1, 30000, 39000 from dual union all
select 2, 22, to_date('06.06.2020', 'dd.mm.yyyy'), 'Redemption',    'Processed', 1, 30000, 40000 from dual union all
select 3, 23, to_date('07.07.2020', 'dd.mm.yyyy'), 'Redemption', 'Processed', 1, 30000, 39000 from dual union all
select 4, 24, to_date('08.08.2020', 'dd.mm.yyyy'), 'Redemption',   'Processed', 1, 31500, 41000 from dual union all
select 5, 25, to_date('09.09.2020', 'dd.mm.yyyy'), 'Redemption',   'Processed', 1, 31400, 40000 from dual union all
select 6, 26, to_date('10.10.2020', 'dd.mm.yyyy'), 'Redemption',   'Cancelled', 1, 30000, 39000 from dual union all
select 1, 27, to_date('11.11.2020', 'dd.mm.yyyy'), 'Redemption',   'Processed', 1, 31300, 41000 from dual union all
select 2, 28, to_date('12.12.2020', 'dd.mm.yyyy'), 'Redemption',   'Processed', 1, 30000, 40000 from dual union all
select 3, 29, to_date('01.01.2021', 'dd.mm.yyyy'), 'Redemption',   'Processed', 1, 30000, 39000 from dual;

commit;


create table products (
   prod_id number,          -- id продукта
   prod_name varchar2(10)   -- название продукта
 );

insert into products
select 1, 'Ticket'  from dual union all
select 2, 'Bank card' from dual union all
select 3, 'Hotel'  from dual union all
select 4, 'Voucher'  from dual union all
select 5, 'Transfer'  from dual;

commit;