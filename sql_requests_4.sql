-- Aggregated functions (COUNT, SUM, AVG, MAX, MIN)
-- Later... grouping of aggregated funcs (GROUP BY)

-- SUM ------------------------
SELECT 
    SUM(`time(hours)`) AS `Total hours`
FROM
    test_db.subjects
WHERE
    TRUE; -- For whole column
    
SELECT 
    SUM(`time(hours)`) AS `Total hours for depts 1, 4`
FROM
    test_db.subjects
WHERE
    department IN (1, 4); -- For some columns which satisfy a condition
    
-- sum of non-int ----
SELECT 
    SUM(`group_num`) AS `Whatever this is`
FROM
    test_db.teachers
WHERE
    TRUE; -- Sum does not check types and interprets however it can

   
-- COUNT ----------------------
SELECT 
    COUNT(`department`) AS `# of subj for depts`
FROM
    test_db.subjects
WHERE
    TRUE; -- For whole column (NULL does not count!!!!)
    
SELECT 
    COUNT(DISTINCT `department`) AS `# of diffrent dept's in subjects`
FROM
    test_db.subjects
WHERE
    TRUE;
    
SELECT 
    COUNT(*) AS `# of entries (rows)`
FROM
    test_db.subjects
WHERE
    TRUE;
    
SELECT 
    COUNT(group_num) AS `# of teachers with groups attached`
FROM
    test_db.teachers
WHERE
    TRUE;
    
-- AVG --------------------
SELECT 
    AVG(`years_of_exp`) AS `Average expierience (years)`
FROM
    test_db.teachers
WHERE
    TRUE;
-- MAX/MIN ------------------
SELECT 
    MAX(`time(hours)`) AS `Max hours`
FROM
    test_db.subjects
WHERE
    TRUE; -- For whole column

-- Epression altering -----
SELECT 
    AVG(`years_of_exp` * 12) AS `Average expierience (months)`
FROM
    test_db.teachers
WHERE
    TRUE;
-- or --
SELECT 
    AVG(`years_of_exp`) * 12 AS `Average expierience (months)`
FROM
    test_db.teachers
WHERE
    TRUE;
-- --------------------------------------------------------
-- GROUP BY -----------------
SELECT 
    department,
    SUM(`time(hours)`) AS `Total hours per department`
FROM
    test_db.subjects
GROUP BY department;

SELECT 
    `date`,
    AVG(`mark`) AS `Average mark per day`
FROM
    test_db.exams
GROUP BY `date`;

SELECT 
    `subject`,
    MIN(`mark`) AS `Minimum mark per subject`
FROM
    test_db.exams
GROUP BY `subject`;

SELECT 
	`date`,
    `subject`,
    AVG(`mark`) AS `Minimum mark per subject per day`
FROM
    test_db.exams
GROUP BY `date`, `subject`;

-- HAVING -------------------
SELECT 
	`date`,
    `teacher`,
    COUNT(`mark`) AS `Count`
FROM
    test_db.exams
GROUP BY `date`, `teacher`
HAVING COUNT(`mark`) <> 0; -- analogous to WHERE but with GROUP BY

SELECT 
	`date`,
    `teacher`,
    COUNT(`mark`) AS `Count`
FROM
    test_db.exams
WHERE
	`date` BETWEEN '2026-09-01' AND '2027-01-01'
GROUP BY `date`, `teacher`
HAVING COUNT(`mark`) <> 0; -- analogous to WHERE but with GROUP BY

