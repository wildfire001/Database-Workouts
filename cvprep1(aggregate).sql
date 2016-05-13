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
insert into customer values(8, 'fam' , 60, 'canada', 19700); 
insert into customer values(9, 'jam' , 60, 'canada', 20700); 

select count(name), address from customer group by(address);
/*valid*/
select sum(salary), name from customer group by name having name = 'fam'; 

//wont work as A HAVING condition can refer only to an expression in the SELECT list, or to an expression involving an aggregate function
//WONT WORK select sum(salary), name from customer group by name having salary > 20000; 


select sum(salary), name from customer group by name having sum(salary) > 20000;


//wont work as group by clause must include all non-aggregate expression select sum(salary), name, id from customer group by id; 

select sum(salary), name, id from customer group by id,name having id > 2; 
