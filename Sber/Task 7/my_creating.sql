create table employees
(
    id_emp number,          -- Идентификатор сотрудника.
    name_emp varchar2(42),  -- Имя сотрудника.
    id_dep number,          -- Идентификатор отдела.
    salary number           -- Зарплата сотрудника
);

create table bosses
(
    id_dep number,          -- Идентификатор отдела.
    name_dep varchar2(42),  -- Название отдела.
    id_emp number           -- Идентификатор сотрудника - начальника.
);

insert into employees
select 1,   'Тим Бернерс-Ли',       8, 190000 from dual union all
select 2,   'Овальный Алексей',     7, 100000 from dual union all
select 3,   'Джеймс Гослинг',       6, 180000 from dual union all
select 4,   'Андерс Хейлсберг',     5, 170000 from dual union all
select 5,   'Марк Цукерберг',       4, 160000 from dual union all
select 6,   'Брэм Коэн',            3, 200000 from dual union all
select 7,   'Брендан Айк',          2, 150000 from dual union all
select 8,   'Тимаков Инкогнито',    1, 190000 from dual union all
select 9,   'Падме Амидала',        8, 60000 from dual union all
select 10,  'Утин Вова',            7, 101000 from dual union all
select 11,  'Энакин Скайуокер',     6, 171000 from dual union all
select 12,  'Кайло Рен',            5, 160000 from dual union all
select 13,  'Хан Соло',             4, 160000 from dual union all
select 14,  'Лея Органа',           3, 90000 from dual union all
select 15,  'Квай-Гон Джинн',       2, 200000 from dual union all
select 16,  'Скворцов Григорий',    1, 90000 from dual union all
select 17,  'Оби-Ван Кеноби',       2, 200000 from dual union all
select 18,  'Боба Фетт',            3, 160000 from dual union all
select 19,  'Мейс Винду',           4, 90000 from dual;


insert into bosses
select 1, 'Благосостояния',         8 from dual union all
select 2, 'Маркетинга',             7 from dual union all
select 3, 'Кадров',                 6 from dual union all
select 4, 'Планирования',           5 from dual union all
select 5, 'Защиты',                 4 from dual union all
select 6, 'Нападения',              3 from dual union all
select 7, 'Борьбы с коррупцией',    2 from dual union all
select 8, 'Мёртвые души',           1 from dual;

commit;

select * from employees;

select * from bosses;