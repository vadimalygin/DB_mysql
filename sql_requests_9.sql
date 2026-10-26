-- Working with subqueries (WITH keyword)

-- simple subquery
select
	*
from
	exams
where
	teacher_id = (select teacher_id from teachers where `name` = 'Петров Андрей Николаевич')
;

-- Using agregate funcs
select
	*
from
	teachers
where
	experience > (select avg(expierience) from teachers where city = "Новосибирск")
;

select
	*
from
	exams
where
	mark > (select avg(mark) from exams)
;

-- Multivalue (multirow) subqueries
select
	*
from
	exams
where
	teacher_id in (select teacher_id from teachers where `name` like 'С%')
;

-- GROUP BY in main query (subquery in HAVING clause)
select
	expierience,
    count(teacher_id)
from
	teachers
group by
	expierience
having
	expierience > (select avg(expierience) from teachers where city = "Новосибирск")
;

-- Corelated subqueries (linked subqueries)
select
	*
from
	teachers as `outer`
where
	'2026-09-09' in (select date_exam from exams as `inner` where `outer`.teacher_id = `inner`.teacher_id)
;

select
	`name`
from
	teachers as main
where
	1 < (select count(*) from exams where exams.teacher_id = main.teacher_id)
;
    
select
	*
from
	exams as `outer`
where
	mark > (select avg(mark) from exams as `inner` where `outer`.student_id = `inner`.students_id)
    
    
    
    