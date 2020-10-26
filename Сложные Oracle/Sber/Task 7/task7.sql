SELECT employees.id_emp, employees.name_emp, employees.salary,
        bosses_salary.salary AS boss_salary
FROM employees INNER JOIN (
    SELECT bosses.id_dep, employees.salary FROM bosses INNER JOIN employees
    ON bosses.id_emp = employees.id_emp) bosses_salary
ON employees.id_dep = bosses_salary.id_dep
WHERE employees.salary > bosses_salary.salary