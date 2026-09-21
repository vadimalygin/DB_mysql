-- Operators: IN, BETWEEN, LIKE, IS NULL

-- IN (basically like python) ---------------------------
SELECT 
    *
FROM
    test_db.exams
WHERE
    student IN (101 , 103); 

SELECT 
    *
FROM
    test_db.exams
WHERE
    `date` IN ('2026-09-09');
    
-- BETWEEN ---------------------------------------------
SELECT 
    *
FROM
    test_db.subjects
WHERE
    `time(hours)` between 45 and 100; -- end points(values) are included by default
    
SELECT 
    *
FROM
    test_db.teachers
WHERE
    years_of_exp BETWEEN 7 AND 10
        AND years_of_exp NOT IN (7 , 10); -- end points exluded
    
-- between with strings
SELECT 
    *
FROM
    test_db.teachers
WHERE
    `name`  BETWEEN 'Л' and 'У';
--  `name`  NOT BETWEEN 'Л' and 'У';

-- LIKE, IS NULL with IN/BETWEEN -----------------------------
SELECT 
    *
FROM
    test_db.teachers
WHERE
    `name` BETWEEN 'Л' AND 'У'
        OR `name` LIKE 'Кла%';
    
SELECT 
    *
FROM
    test_db.teachers
WHERE
    `name` BETWEEN 'Л' AND 'У'
		OR `name` IN ('Классов Александр Борисович');

