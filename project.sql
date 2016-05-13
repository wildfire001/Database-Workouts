drop table files;
drop table folders;
drop table relations;
drop table users;
drop table groups;


create table users(
userid number(10),
username varchar(30) unique not null,
userpass varchar(30) not null,
id_type number(1),
designation varchar(30),
roll number(10),
batch varchar(7),
department varchar(30),
primary key(userid)
);

create table groups(
groupid number(10),
groupname varchar(50) unique not null,
adminname varchar(50) unique not null,
adminpass varchar(50),
primary key(groupid)
);

create table relations(
userid number(10) references users(userid) on delete cascade not null,
groupid number(10) references groups(groupid) on delete cascade not null,
id_type number(1) not null,
status number(1) not null
);

create table folders(
folderid number(10),
foldername varchar(50) not null,
timeout varchar(50),
groupid number(10) references groups(groupid) on delete cascade not null,
primary key(folderid)
);

create table files(
filename varchar(50) not null,
filepath varchar(50) not null,
userid number(10) references users(userid) on delete cascade not null,
folderid number(10) references folders(folderid) on delete cascade not null
);

insert into users(userid, username, userpass, id_type, roll, batch, department) values(1,'shubhashis','s',0,1107001,'2k11','cse');
insert into users(userid, username, userpass, id_type, roll, batch, department) values(2,'sun','s',0,1107002,'2k11','cse');

insert into groups values(1,'cse','admin','123');

insert into relations values(1,1,0,1);
insert into relations values(2,1,0,1);

insert into folders values(1,'Database','12-12-14',1);

insert into files values('lab1','C:\Database\lab1',1,1);
insert into files values('lab2','C:\Database\lab2',2,1);


select * from users;
select * from groups;
select * from relations;
select * from folders;
select * from files;
