SELECT FIO, -- записи для себя на будещее, актуальный запрос ниже
substr(
    "FIO",  -- string, откуда берём
    1,      -- start_position, откуда начнём
    instr(  -- [ length ], сколько символов возьмём? считаем до пробела
        "FIO",  -- string, где ищем
        ' '     -- substring, что ищем
        )-1 
    ) F
FROM table1;

SELECT FIO, F,
substr("FIO", length("F")+2, instr(substr("FIO", length("F")+2), ' ')) I
FROM(
    SELECT FIO,
    substr("FIO", 1, instr("FIO", ' ')-1 ) F
    FROM table1);


SELECT F, I,
substr("FIO", length("F")+length("I")+2) O
FROM(
    SELECT FIO, F,
    substr("FIO", length("F")+2, instr(substr("FIO", length("F")+2), ' ')) I
    FROM(
        SELECT FIO,
        substr("FIO", 1, instr("FIO", ' ')-1 ) F
        FROM table1));
    