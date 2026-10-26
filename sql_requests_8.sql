-- JOIN operators (CROSS, NATURAL, UNION)

-- CROSS JOIN ------------------
SELECT
	*
FROM
	students CROSS JOIN `groups` 
    -- Same as just using a 'comma' or just 'JOIN' (used for compatability reasons)
;

-- JOIN on values --------------
-- NATURAL JOIN ----------------
SELECT
	*
FROM
	test_db.teachers JOIN
    test_db.subj_teachers USING (id_teacher) -- Column names must be the same for this to work
;

SELECT
	*
FROM
	test_db.teachers NATURAL JOIN test_db.subj_teachers 
    -- Works the same as previous (in case your table have columns with the same name)
;

-- INNER, LEFT, RIGHT JOIN ----
SELECT
	teachers.name AS 't_name',
    teachers.city AS 't_city',
	students.name AS 's_name',
    students.city AS 's_city'
    
FROM
	test_db.teachers LEFT JOIN students ON students.city = teachers.city -- All from left (missing right sets to NULL)
    -- teachers LEFT OUTER JOIN students ON students.city = teachers.city -- same but semanticaly better
    -- teachers RIGHT JOIN students ON students.city = teachers.city -- All from right (missing left sets to NULL)
    -- teachers  RIGHT OUTER JOIN students ON students.city = teachers.city -- same but semanticaly better 
    -- teachers INNER JOIN students ON students.city = teachers.city -- INNER = LEFT and RIGHT
    -- teachers JOIN students ON students.city = teachers.city -- equivalent to INNER
    -- anythig doesn't work for me properly for some reason ----------------------
;

-- JOIN chaining --------------
SELECT 
    students.name as 'student', 
    exams.mark,
    subjects.name as 'subject',
    teachers.name as 'teacher'
FROM
    students
        LEFT JOIN -- use whatever #1 (different results) 
    exams ON exams.student = students.id_student
		RIGHT JOIN -- use whatever #2 (different results)
	subjects ON exams.subject = subjects.id_subject
		JOIN -- use whatever #3 (different results)
	teachers ON exams.teacher = teachers.id_teacher
;



