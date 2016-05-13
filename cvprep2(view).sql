drop table customers;
drop table customers1;

create table customers(
id number(3),
name varchar(10),
age number(3),
address varchar(10),
salary varchar(8),
primary key(id)
);

create table customers1(
name varchar(3),
address varchar(10),
testfield varchar(10)
);

insert into customers values(1, 'aam' , 40, 'london', 20000);
insert into customers values(2, 'bam' , 50, 'ny', 40000);
insert into customers values(55,'bam' , 50, 'ny', 40000);
insert into customers values(3, 'cam' , 10, 'seattle', 50000);
insert into customers values(4, 'dam' , 20, 'australia', 70000); 
insert into customers values(5, 'eam' , 60, 'canada', 20700); 
insert into customers values(6, 'kam' , 50, 'london', 24000);
insert into customers values(7, 'lam' , 60, 'canada', 20700); 
insert into customers values(8, 'fam' , 60, 'canada', 19700); 
insert into customers values(9, 'jam' , 60, 'canada', 20700); 


insert into customers1 values('bam', 'ny', 'test');
insert into customers1 values('bam', 'ny', 'test');
/*
create view test as
select * from customers where address = 'canada';

//inserted into view but automatically inserted to table
insert into test values(10, 'gam' , 60, 'canada', 20700);

//inserted into view but violates view but does not violate the table, thus inserted to table, does not show up on view
insert into test values(11, 'uam' , 60, 'london', 20700);

//wont be inserted insert into test values(1, 'uam' , 60, 'london', 20700);

//if we update on the view then view will be updated as well as main table, but if the condition of view is violated then the rows will not be visible by the view


update test set address = 'seattle' where address = 'canada';

select * from test;

drop view test;
*/


/*
//now if i do want to check what should be allowed on the views then should do this
create view test as
select * from customers where address = 'canada'
with check option;


insert into test values(12, 'gam' , 60, 'canada', 20700);

//wont insert because of check
insert into test values(13, 'gam' , 60, 'london', 20700);

//wont update because of check
update test set address = 'london' where address = 'canada';

update test set name = 'bam' where address = 'canada';	
*/

/*
drop view joinedview;

create view joinedview as
select c1.id, c2.name, c1.address from customers c1, customers c2;
*/

drop view jv;

create view jv as
select customers.id, name, address, customers1.testfield from customers join customers1 using(name, address);
