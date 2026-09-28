-- Multitable queries
-- Union
SELECT 
    *
FROM
    `students`,
    `groups`;

-- Filtered union
SELECT 
    *
FROM
    `students`,
    `groups`
WHERE
    `students`.`group` = `groups`.`id_group`;
-- ------------------------------
SELECT 
    teachers.name, teachers.group, students.name
FROM
    teachers,
    students
WHERE
    teachers.group = students.group;
    
SELECT 
    `teachers`.`name`, 
    `teachers`.`group`, 
    COUNT(`students`.`name`)
FROM
    `teachers`,
    `students`
WHERE
    `teachers`.`group` = `students`.`group`
GROUP BY `teachers`.`name`, `teachers`.`group`;

SELECT 
    `teachers`.`name`, 
    `students`.`name`,
    `teachers`.`city`
FROM
    `teachers`,
    `students`
WHERE
    `teachers`.`city` = `students`.`city` -- choosing by non-key argument
ORDER BY `teachers`.`city`;

-- Complicated condition
SELECT 
    `teachers`.`name`, 
    `students`.`name`,
    `teachers`.`city`
FROM
    `teachers`,
    `students`
WHERE
	`teachers`.`group` is not Null AND
    `teachers`.`city` = `students`.`city`
ORDER BY `teachers`.`city`;