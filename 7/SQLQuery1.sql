----1
select FACULTY.FACULTY_NAME, PULPIT.PULPIT_NAME, PROFESSION.PROFESSION_NAME
	from FACULTY, PULPIT, PROFESSION
	where FACULTY.FACULTY = PULPIT.FACULTY and PROFESSION.PROFESSION_NAME in (
		select PROFESSION.PROFESSION_NAME
			from PROFESSION
			where (PROFESSION.PROFESSION_NAME like  '%����������%') or (PROFESSION.PROFESSION_NAME like  '%����������%')
	);

----2
select FACULTY.FACULTY_NAME, PULPIT.PULPIT_NAME, PROFESSION.PROFESSION_NAME
	from PROFESSION, FACULTY inner join PULPIT
	on FACULTY.FACULTY = PULPIT.FACULTY
	where PROFESSION.PROFESSION_NAME in (
		select PROFESSION.PROFESSION_NAME
			from PROFESSION
			where (PROFESSION.PROFESSION_NAME like  '%����������%') or (PROFESSION.PROFESSION_NAME like  '%����������%')
	);

----3
select FACULTY.FACULTY_NAME, PULPIT.PULPIT_NAME, PROFESSION.PROFESSION_NAME
	from FACULTY inner join PULPIT
	on FACULTY.FACULTY = PULPIT.FACULTY
		inner join PROFESSION
		on PULPIT.FACULTY = PROFESSION.FACULTY
			where (PROFESSION.PROFESSION_NAME like  '%����������%') or (PROFESSION.PROFESSION_NAME like  '%����������%')

----4
select AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY
	from AUDITORIUM a
	where AUDITORIUM_NAME = (
		select top(1) AUDITORIUM_NAME
		from AUDITORIUM aa
		where aa.AUDITORIUM_TYPE = a.AUDITORIUM_TYPE
		order by AUDITORIUM_CAPACITY desc);

----5
select FACULTY.FACULTY_NAME
	from FACULTY
	where not exists (
		select * from PULPIT
		where FACULTY.FACULTY = PULPIT.FACULTY );

----6
select top(1)
	(select avg(NOTE) from PROGRESS
		where PROGRESS.SUBJECT like '����') [����],
	(select avg(NOTE) from PROGRESS
		where PROGRESS.SUBJECT like '��') [��],
	(select avg(NOTE) from PROGRESS
		where PROGRESS.SUBJECT like '����') [����] from PROGRESS;

----7
select AUDITORIUM_NAME, AUDITORIUM_CAPACITY,AUDITORIUM_TYPE
	from AUDITORIUM
	where AUDITORIUM_CAPACITY <= all(
		select AUDITORIUM_CAPACITY
			from AUDITORIUM
			where AUDITORIUM_CAPACITY >= 50)

----8
select AUDITORIUM_NAME, AUDITORIUM_CAPACITY,AUDITORIUM_TYPE
	from AUDITORIUM
	where AUDITORIUM_CAPACITY <= any(
		select AUDITORIUM_CAPACITY
			from AUDITORIUM
			where AUDITORIUM_CAPACITY >= 50)