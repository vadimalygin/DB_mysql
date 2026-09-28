-- Using expressions in SQL queries
-- Evaluation of salary rate per subject
SELECT 
    `subjects`.`id_subject`,
    `subjects`.`name`,
    `subjects`.`time(hours)` / 950 AS 'salary rate',
    `subjects`.`department`
FROM
    `test_db`.`subjects`;

SELECT 
    SUM(`subjects`.`time(hours)`) / 950 * 100 AS 'SUM of all salary rates(%)'
FROM
    `test_db`.`subjects`;

-- Additonal columns with explanations
SELECT 
    SUM(`subjects`.`time(hours)`) / 950 * 100 AS 'SUM of all salary rates',
    '%'
FROM
    `test_db`.`subjects`;
    
SELECT 
    `subjects`.`id_subject`,
    `subjects`.`name`,
    `subjects`.`time(hours)` / 950 * 100 AS 'salary rate', '%',
    `subjects`.`department`
FROM
    `test_db`.`subjects`;

-- INTERVAL

SELECT 
	`name`,
    birthday
FROM
    students
WHERE
    birthday BETWEEN '2001-01-01' AND '2001-01-01' + INTERVAL 9 MONTH;

-- CURDATE() (current date)
SELECT 
    *
FROM
    exams
WHERE
    `date` BETWEEN CURDATE() - INTERVAL 7 MONTH AND CURDATE();
    
-- Conditional statements
-- CASE
Select 
	CASE `name` 
		when 'Андриенко Елена Васильевна' then 'Ондриенко Елена Васильевна' ELSE `name`  
	END AS `name`
From teachers;

-- Sorting
-- ORDER BY
SELECT 
    *
FROM
    teachers
ORDER BY `years_of_exp`; -- ascending order

SELECT 
    *
FROM
    teachers
ORDER BY `years_of_exp` DESC; -- descending order

SELECT 
    *
FROM
    exams
ORDER BY 
	`date`,
    `mark`; -- multiple columns
    
SELECT 
    *
FROM
    students
ORDER BY 
	`group` DESC, -- DESC applies only to specific column
	`birthday`; -- multiple columns
    
SELECT 
    teacher, COUNT(`mark`)
FROM
    exams
GROUP BY teacher
ORDER BY COUNT(`mark`) DESC;

-- Sorting by selecting a column by its #
SELECT 
    teacher, COUNT(`mark`)
FROM
    exams
GROUP BY teacher
ORDER BY 2 DESC; -- Same as previous query