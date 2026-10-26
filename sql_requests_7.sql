-- Multitable queries
-- Table unification (UNION)

-- Nessecity of outer unification
-- No NULL values being selected
SELECT 
    *
FROM
    `students`,
    `groups`
WHERE
    students.`group` = `groups`.id_group;

-- Select 'the old way' + Null value rows via UNION
SELECT 
    `name` AS 'Name',
    `group` AS 'Group',
    `major` AS 'Major'
FROM
    `students`,
    `groups`
WHERE
    students.`group` = `groups`.id_group 
UNION SELECT 
    `name`,
    `group`,
    ' '
FROM
    students
WHERE
    `group` IS NULL;
    
-- Union of three (or more) tables (basically the same)
SELECT 
	students.`name` AS 'Student',
    teachers.`name` AS 'Teacher',
    subjects.`name` AS 'Subject',
    exams.`date` AS 'Date',
    exams.`mark` AS 'Mark'
FROM
	students,
    teachers,
    subjects,
    exams
WHERE
	exams.student = students.id_student
    AND exams.teacher = teachers.id_teacher
    AND exams.`subject` = subjects.id_subject;

-- Uniting table with itself
-- Using aliasses
SELECT
	s1.name,
    s2.name,
    s1.city
FROM
	students AS s1,
    students AS s2
WHERE
	s1.city = s2.city
    AND s1.name < s2.name; -- s1.name <> s2.name works but doesn't exlude duplicate pairs like (john, bob) ~ (bob, john)
    
-- Union of a table with a cyclical dependency
SELECT
	teach.id_teacher AS 'Employee id',
	teach.name AS 'Employee name',
    boss.name AS 'Boss name'
FROM
	teachers AS teach,
    teachers AS boss
WHERE
	boss.id_teacher = teach.boss 
    OR (teach.boss is NULL AND boss.boss is NULL);

-- Searching for incorrect entries via query
SELECT
	teachers.name AS 'Teacher',
    subjects.name AS 'Subject'
FROM
	teachers,
    subjects,
    subj_teachers
WHERE
	teachers.id_teacher = subj_teachers.id_teacher
    AND subjects.id_subject = subj_teachers.id_subject;
    
SELECT 
	*
FROM
	exams,
    subj_teachers
WHERE
	exams.`subject` = subj_teachers.id_subject
	AND exams.teacher <> subj_teachers.id_teacher; -- doesn't quite work 
    
SELECT 
	*
FROM
	exams,
    subj_teachers
WHERE 
	exams.`subject` = subj_teachers.id_subject
	AND exams.teacher = subj_teachers.id_teacher; -- all correct entries 

-- Unification for example search
SELECT
	a.name as '3.008.2.23',
    b.name as '3.008.2.24',
    c.name as '3.008.2.25'
FROM
	students as a,
    students as b,
    students as c
WHERE
	a.group = '3.008.2.23'
    AND b.group = '3.008.2.24'
    AND c.group = '3.008.2.25';