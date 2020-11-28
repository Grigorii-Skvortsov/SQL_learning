create table table6 (
    subs_id number, 
    number_history number, 
    start_date date, 
    end_date date, 
    rtpl_id number
);

insert into table6
select 100, 1, to_date('01.02.2017', 'dd.mm.yyyy'), to_date('03.02.2017', 'dd.mm.yyyy'), 301  from dual union all
select 100, 2, to_date('03.02.2017', 'dd.mm.yyyy'), to_date('01.03.2017', 'dd.mm.yyyy'), 302  from dual union all
select 100, 3, to_date('28.02.2017', 'dd.mm.yyyy'), to_date('31.12.2999', 'dd.mm.yyyy'), 301  from dual union all
select 101, 1, to_date('01.01.2016', 'dd.mm.yyyy'), to_date('01.01.2017', 'dd.mm.yyyy'), 401  from dual union all
select 101, 2, to_date('01.01.2017', 'dd.mm.yyyy'), to_date('31.12.2999', 'dd.mm.yyyy'), 301  from dual union all
select 102, 1, to_date('01.01.2017', 'dd.mm.yyyy'), to_date('01.02.2017', 'dd.mm.yyyy'), 401  from dual union all
select 102, 2, to_date('02.02.2017', 'dd.mm.yyyy'), to_date('04.02.2017', 'dd.mm.yyyy'), 302  from dual union all
select 102, 3, to_date('04.02.2017', 'dd.mm.yyyy'), to_date('01.02.2017', 'dd.mm.yyyy'), 401  from dual union all
select 102, 4, to_date('05.02.2017', 'dd.mm.yyyy'), to_date('31.12.2999', 'dd.mm.yyyy'), 405  from dual;

commit;

create table table3 (
   month_id	number, -- Месяц (например, 201501 - январь 2015 г)
   type_id	number, -- Признак абонента (2 значения: 1 - старый абонент, 2 - новый абонент)
   cnt		number  -- Кол-во абонентов
 );

insert into table3
select 201501, 1, 1  from dual union all
select 201501, 1, 1  from dual union all
select 201501, 1, 1  from dual union all
select 201501, 2, 2  from dual union all
select 201501, 2, 3  from dual union all
select 201502, 1, 3  from dual union all
select 201502, 1, 3  from dual union all
select 201503, 1, 3  from dual union all
select 201503, 2, 4  from dual union all
select 201503, 1, 4  from dual union all
select 201503, 2, 5  from dual union all
select 201513, 1, 5  from dual;

commit;


create table table2 
(
    account number, -- лицевой счет абонента. 
    subs_id	number, -- уникальный идентификатор абонента. 
    rtpl_id	number  -- тариф.
);

insert into table2
select 10001, 101, 300  from dual union all
select 10001, 102, 300  from dual union all
select 10002, 201, 405  from dual union all
select 10001, 103, 300  from dual union all
select 10002, 202, 300  from dual union all
select 10003, 301, 206  from dual union all
select 10003, 302, 405  from dual union all
select 10001, 104, 300  from dual;

commit;


create table table1 
(
    FIO varchar2(100)  -- наименование региона.
);

insert into table1
select 'Иванов Иван Иванович'  from dual union all
select 'Павлов Павел Павлович'  from dual union all
select 'Александров Александр Александрович'  from dual;

commit;


create table calls
(
    clnt_clnt_id number, -- внешний ключ на таблицу клиентов.
    call_date date,      -- дата совершения вызова.
    money number,        -- стоимость вызова.
    minuts number        -- тарифицировано минут.
);

insert into calls
select 1, to_date('10.05.2006', 'dd.mm.yyyy'), 10, 31 from dual union all
select 2, to_date('10.05.2006', 'dd.mm.yyyy'), 10, 15 from dual union all
select 2, to_date('10.05.2006', 'dd.mm.yyyy'), 10, 16 from dual union all
select 3, to_date('10.05.2006', 'dd.mm.yyyy'), 10, 11 from dual union all
select 3, to_date('10.05.2006', 'dd.mm.yyyy'), 10, 11 from dual union all
select 3, to_date('10.05.2006', 'dd.mm.yyyy'), 10, 11 from dual union all
select 4, to_date('10.05.2006', 'dd.mm.yyyy'), 10, 5 from dual union all
select 4, to_date('10.05.2006', 'dd.mm.yyyy'), 10, 5 from dual union all
select 5, to_date('10.05.2006', 'dd.mm.yyyy'), 10, 30 from dual union all
select 1, to_date('11.05.2006', 'dd.mm.yyyy'), 10, 31 from dual union all
select 2, to_date('11.05.2006', 'dd.mm.yyyy'), 10, 15 from dual union all
select 2, to_date('11.05.2006', 'dd.mm.yyyy'), 10, 16 from dual union all
select 3, to_date('11.05.2006', 'dd.mm.yyyy'), 10, 11 from dual union all
select 3, to_date('11.05.2006', 'dd.mm.yyyy'), 10, 11 from dual union all
select 3, to_date('11.05.2006', 'dd.mm.yyyy'), 10, 11 from dual union all
select 4, to_date('11.05.2006', 'dd.mm.yyyy'), 10, 5 from dual union all
select 4, to_date('11.05.2006', 'dd.mm.yyyy'), 10, 5 from dual union all
select 5, to_date('11.05.2006', 'dd.mm.yyyy'), 10, 30 from dual;

commit;


create table clients
(
    clnt_id number,      -- идентификатор клиента.
    brnc_brnc_id number, -- внешний ключ на таблицу регионов.
    name varchar2(100),   -- имя клиента.
    adress varchar2(100)  -- адрес клиента.
);

insert into clients
select 1, 1, 'Сидоров', 'ул.Пушкина, д.Колотушкина' from dual union all
select 2, 1, 'Сидоров', 'ул.Пушкина, д.Колотушкина' from dual union all
select 3, 2, 'Петров', 'ул.Пушкина, д.Колотушкина' from dual union all
select 4, 2, 'Сидоров', 'ул.Пушкина, д.Колотушкина' from dual union all
select 5, 2, 'Сидоров', 'ул.Пушкина, д.Колотушкина' from dual union all
select 6, 3, 'Петров', 'ул.Пушкина, д.Колотушкина' from dual union all
select 7, 4, 'Сидоров', 'ул.Пушкина, д.Колотушкина' from dual union all
select 8, 5, 'Петров', 'ул.Пушкина, д.Колотушкина' from dual union all
select 9, 5, 'Петров', 'ул.Пушкина, д.Колотушкина' from dual;

commit;


create table branches
(
    brnc_id number,    -- идентификатор региона.
    name varchar2(100)  -- наименование региона.
);

insert into branches
select 1, 'Адыгея' from dual union all
select 2, 'Башкирия' from dual union all
select 3, 'Бурятия' from dual union all
select 4, 'Алтай' from dual union all
select 5, 'Дагестан' from dual union all
select 6, 'Ингушетия' from dual union all
select 7, 'Кабардино-Балкария' from dual union all
select 8, 'Калмыкия' from dual;

commit;