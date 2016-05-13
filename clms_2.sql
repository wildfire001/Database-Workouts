drop table customer;

create table customer(
id number(3),
name varchar(10),
age number(3),
address varchar(10),
salary varchar(8),
primary key(id)
);

insert into customer values(1, 'aam' , 40, 'london', 20000);
insert into customer values(2, 'bam' , 50, 'ny', 40000);
insert into customer values(3, 'cam' , 10, 'seattle', 50000);
insert into customer values(4, 'dam' , 20, 'australia', 70000); 
insert into customer values(5, '' , 60, 'canada', 20700); 
insert into customer values(6, '' , 50, 'london', 24000);
insert into customer values(7, '' , 60, 'canada', 20700); 

select count(name), address from customer group by(address);
/*
set serveroutput on;
declare
nme varchar(10);
addr varchar(10);
cursor test is select name,address from customer;
begin
open test;
loop 
fetch test into nme, addr;
exit when test%notfound;
dbms_output.put_line(nme || ' ' ||addr);
end loop;
close test;
end;
/

create or replace function compute_bonus (x in number)
return number is 
z number(10);
begin
z := x * 2;
return z;
end;
/ 

select compute_bonus(salary) from customer;

create or replace procedure greet (x in varchar)
  as
  huda number(2);
begin
dbms_output.put_line('hello');
end;
/

execute greet('hel');

begin
greet('he');
end;
/

create or replace trigger update_stat
  before insert on customer
  for each row when (new.id > 0)
  begin
  dbms_output.put_line('updated');
  end;
  /
  insert into customer values(8, 'sam' , 50, 'london', 24000);
*/

