-- Logical operators with predicates
-- NOT
SELECT 
    `name`
FROM
    test_db.students
WHERE
    `group` IS NOT NULL; -- null can be checked only with IS operator (= or <> don't work (empty output in either case))

-- OR
SELECT 
    `name`
FROM
    test_db.students
WHERE
    `group` = '3.008.2.23' OR '3.008.2.24';

-- AND
SELECT 
    `name`, birthday
FROM
    test_db.students
WHERE
    `group` = '3.008.2.23'
        AND birthday > '2001-12-31';
        
-- Order of operations (1. NOT, 2. AND, 3. OR)
SELECT 
    *
FROM
    test_db.exams
WHERE
    NOT `subject` > 10 AND teacher = 1001
        OR teacher = 1000 AND mark IS NOT NULL;
/*
	{[(NOT `subject` > 10) AND teacher = 1001]
        OR [teacher = 1000 AND (mark IS NOT NULL)]};
*/ 
-- but we want:
SELECT 
    *
FROM
    test_db.exams
WHERE
    NOT (`subject` > 10 
		AND (teacher = 1001 OR teacher = 1000))
        AND mark IS NOT NULL;
