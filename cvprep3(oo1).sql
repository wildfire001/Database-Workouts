create or replace type address as object(
street number(5),
house varchar(10)
);
/

create or replace type person_info as object(
name varchar(10),
adr address
);
/
set serveroutput on;

create table info_person(
id number(2),
person person_info
);

insert into  info_person values(1,person_info('matt', address(1,'london')));

select * from info_person;
select person from info_person;


declare
testad address;
testpi person_info;
begin
testad := address(2,'seattle');
testpi := person_info('bratt', testad);

dbms_output.put_line('street ' || testad.street);
dbms_output.put_line('House ' || testad.house);

dbms_output.put_line('Name ' || testpi.name);
dbms_output.put_line('Address street ' || testpi.adr.street);
dbms_output.put_line('Address house ' || testpi.adr.house);
end;
/

drop table info_person;
drop type person_info;
drop type address;
