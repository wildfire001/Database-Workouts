drop table course_taken;
drop table students;
drop table courses;

create table students(
roll number(10),
name varchar(30) not null,
department varchar(10) not null,
primary key(roll)
);

create table courses(
c_id number(5),
c_name varchar(30) unique,
year number(2) check(year > 0 and year < 5),
term number(2) check(term > 0 and term < 3),
credit number(3,2) default 3.00,
primary key(c_id)
);


create table course_taken(
roll number(10),
c_id number(5),
sessions varchar(10),
foreign key(roll) references students(roll) on delete cascade
);

insert into students values(1107001, 'sk', 'cse');
insert into students values(1107002, 'sun', 'cse');
insert into students values(1107003, 'raju', 'cse');
insert into students values(1109001, 'tahi', 'ece');

insert into courses(c_id, c_name, year, term) values(1, 'a', 1, 1);
insert into courses(c_id, c_name, year, term) values(2, 'Database', 1, 2);
insert into courses(c_id, c_name, year, term) values(3, 'Math', 2, 1);	

insert into course_taken values(1107001, 3, '12-13');
insert into course_taken values(1107002, 2, '12-13');
insert into course_taken values(1107003, 1, '13-14');
insert into course_taken values(1109001, 3, '13-14');

select roll from course_taken where sessions in('12-13', '13-14');

select count(*) from students;

select count(roll), department from students group by department;
select count(roll), department from students group by department having department = 'cse';
select count(roll), department from students where roll > 1107001 group by department;
select max(roll) from students;

select sum(credit), year from courses group by year;
select count(distinct c_id) from course_taken;
select count(c_id) from course_taken;

select name, department from students where roll in (select roll from course_taken where sessions = '12-13');
select name from students where roll in (select roll from course_taken where c_id in(select c_id from courses where c_name = 'Database')); 
select name, roll from students where department = 'cse' UNION select name, roll from students where roll in(select roll from course_taken where c_id in(select c_id from courses where c_name = 'Math'));
select name, roll from students where department = 'cse' INTERSECT select name, roll from students where roll in(select roll from course_taken where c_id in(select c_id from courses where c_name = 'Math'));

select roll,students.name, students.department, course_taken.sessions from students join course_taken using(roll);
select students.roll,students.name, students.department, course_taken.sessions from students join course_taken on students.roll = course_taken.roll;

select roll ,students.department, course_taken.sessions from students natural join(course_taken);

select students.roll, students.department, courses.c_name, course_taken.sessions from students join course_taken on students.roll = course_taken.roll join courses on course_taken.c_id = courses.c_id;

select roll, students.department, courses.c_name, course_taken.sessions from students join course_taken using(roll) join courses using(c_id);


set serveroutput on

declare
tot_course course_taken.c_id%type;
begin
select count(distinct c_id) into tot_course from course_taken where sessions = '13-14'; 
dbms_output.put_line('distinct ' || tot_course);
end;
/

declare
yr number(2);
begin
select year into yr from courses where c_name = 'Database';
if yr = 1 
then dbms_output.put_line('first');
elsif yr = 2 
then dbms_output.put_line('second');
end if;
end;
/




