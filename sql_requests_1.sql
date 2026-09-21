-- Simple select query
SELECT 
    student
FROM
    exams;
    
SELECT 
    `students`.`name`,
    `students`.`group`
FROM `test_db`.`students`;

-- distinct kword
SELECT DISTINCT
    `group`
FROM
    `students`;

-- conditional select
SELECT 
    `exams`.`student`, 
    `exams`.`subject`
FROM
    `exams`
WHERE
    `mark` = 5;

-- LIKE operator
-- % ~ *
-- _ ~ ?
SELECT 
    `students`.`name`,
    `students`.`group`
FROM `test_db`.`students`
where `name` like 'М%'; -- selects all student whos name starts with M

SELECT 
    `students`.`name`,
    `students`.`group`
FROM `test_db`.`students`
where `name` like '$%' escape '$';
-- escape defines an escapement symbol (e.g. '\' in '\n', but you can define any symbol)

