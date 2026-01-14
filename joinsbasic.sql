create database MYSQLrivision;
use MYSQLrivision;

create table students(
  id INT,
  name VARCHAR(50)
  );
  
create table classes(
id INT,
class varchar(20)
);

drop table students;
drop table classes;


insert INTO students values
(1,'GAURAV'),
(2,'Raju'),
(3,'Sam');


insert into classes values
(1,'10th'),
(3,'12th'),
(4,'9th');

select * from students;
select * from classes;

#inner join:
select students.id, name,class
from students
inner join classes
on students.id = classes.id;

#left join:
select students.id , name , class
from students
left join classes
on students.id = classes.id;


#right join:
select students.id , name , class
from students
right join classes
on students.id = classes.id ;

#full outer join :
select students.id , name , class
from students
left join classes
on students.id = classes.id 

UNION

select students.id , name , class
from students
right join classes
on students.id = classes.id ;

