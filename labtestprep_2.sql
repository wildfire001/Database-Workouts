drop table employees;

create table employees(
job_id varchar(10),
job_title varchar(30),
first_name varchar(30),
salary number(10)
);

insert into employees values('admin' , 'Administrator', 'sk', 10000);
insert into employees values('ad_pres', 'general manager', 'sun', 20000);
insert into employees values('ad_gen', 'Secretary', 'setu', 20000);

set serveroutput on

create or replace procedure update_title(jb_title in varchar, jb_id in varchar)
	as
begin
update employees set job_title = jb_title where job_id = jb_id;
end;
/

create or replace function get_job(jb_id in varchar)
	return varchar 
	is
	jb_title varchar(30);
begin
select job_title into jb_title from employees where job_id = jb_id;
return jb_title;
end;
/

declare 
jb_title varchar(30);
begin
jb_title := get_job('admin');
dbms_output.put_line(jb_title);
end;
/

create or replace function get_annual_salary(sal in number)
	return number is
	annual_salary number(12);
begin
annual_salary := sal * 12;
return annual_salary;
end;
/

select first_name, get_annual_salary(salary) from employees;

declare
cursor info_employee is select first_name, salary from employees;
f_name employees.first_name%type;
sal employees.salary%type;
begin
open info_employee;
loop
fetch info_employee into f_name,sal;
dbms_output.put_line(f_name || ' ' || sal);
exit when info_employee%notfound;
end loop;
close info_employee;
end;
/

create or replace trigger update_trigger
before update on employees
for each row
begin
dbms_output.put_line(:new.job_id);
dbms_output.put_line(:old.job_id);
end;
/

