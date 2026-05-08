create database deneme
use deneme

drop table X

create table X (
id int identity(1,1),
name varchar(20)
)

alter table X add constraint pk_X primary key (id) 
alter table X add surname varchar(20) 
alter table X drop column surname
alter table X alter column surname char(30)

alter table X drop column surname
alter table X add soyad char(30) 

alter table X alter column name varchar(20) not null
alter table X add sira int
alter table X add unique(sira)
alter table X add constraint U_sira unique(sira) 
alter table X drop U_sira

create table Y (
y_id int identity(1,1) primary key,
age int,
constraint C_age check(age>=18)
)

alter table X add check(sira>100)
alter table X drop CK__X__sira__52593CB8
alter table X add constraint C_sira check(sira>100)

create table Z (
id_Z int primary key,
name varchar(30) default 'abuzer'
)

alter table X add constraint DF_name default 'şaziye' for name 


--constraints 
-- 1 primary key
-- 2 foreign key
-- 3 not null
-- 4 unique
-- 5 check 
-- 6 default


-- index 
create index name_index on X (name)
create unique index name_unique_index on X (name)



