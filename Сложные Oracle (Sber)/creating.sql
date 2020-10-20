create table t
(
    id number,          -- Идентификатор.
    dt date,            -- Дата.
    curr varchar2(3),   -- Валюта.
    rate number         -- Курс валюты.
);

insert into t
select 1, to_date('01.01.2018', 'dd.mm.yyyy'), 'USD', 66 from dual union all
select 2, to_date('01.02.2019', 'dd.mm.yyyy'), 'USD', 66 from dual union all
select 2, to_date('03.01.2019', 'dd.mm.yyyy'), 'EUR', 77 from dual union all
select 2, to_date('03.01.2019', 'dd.mm.yyyy'), 'USD', 99 from dual union all
select 2, null, 'USD', 89 from dual union all
select 3, to_date('11.01.2019', 'dd.mm.yyyy'), 'USD', 66 from dual union all
select 3, to_date('11.01.2019', 'dd.mm.yyyy'), 'EUR', 77 from dual union all
select 4, to_date('12.05.2019', 'dd.mm.yyyy'), 'USD', 66 from dual union all
select 5, to_date('12.05.2019', 'dd.mm.yyyy'), 'USD', 66.1 from dual;

commit;

create table r
(
    dt date,            -- Дата.
    curr varchar2(3),   -- Валюта.
    rate number         -- Курс валюты.
);
create unique index r_pk on r (dt, curr);
alter table r add (constraint r_pk primary key (dt, curr) using index r_pk enable validate);

insert into r
select to_date('25.12.2017', 'dd.mm.yyyy'), 'USD', 66.6 from dual union all
select to_date('15.01.2019', 'dd.mm.yyyy'), 'USD', 66.1 from dual union all
select to_date('02.01.2019', 'dd.mm.yyyy'), 'EUR', 77.9 from dual union all
select to_date('22.05.2019', 'dd.mm.yyyy'), 'USD', 66 from dual union all
select to_date('17.01.2019', 'dd.mm.yyyy'), 'EUR', 77.4 from dual union all
select to_date('12.01.2019', 'dd.mm.yyyy'), 'USD', 66 from dual union all
select to_date('12.05.2019', 'dd.mm.yyyy'), 'USD', 55 from dual;

commit;

select * from t;

select * from r;

DROP TABLE t;

DROP TABLE r;