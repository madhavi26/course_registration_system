
create table Course(
course_id int primary key,
course_name varchar(50) not null,
course_prereq varchar(50) not null,
course_description varchar(50) not null,
course_professor varchar(50) not null,
course_technologies varchar(50) not null,
course_min_gpa int not null,
emp_id int references professor(emp_id),
dept_id int references department(dept_id));

Insert into Course values(101, 'DBMS', 100, 'Databases', 'Hernando Hoyos', 'SQL, Access, Visio',3,1,201);
Insert into Course values(110, 'Datawarehouse', 101, 'Advanced concepts', 'Taber, M.Fudge', 'SQL, Access, Visio, Data Warehouse',4,3,301) 
Insert into Course values(201, 'Data Viz', 200, 'Intro to DS', 'Michael Tan', 'R',2,1,401) 
Insert into Course values(301, 'Advanced Info Security', 300, 'Information Security', 'Jackson', 'Advanced concepts of info sec',2,4,101) 
Insert into Course values(401, 'Data Analytics', 100, 'Databases', 'Hernando Hoyos', 'R, Weka, Shiny',3,2,501) 
Insert into Course values(404, 'Data Analytics', 100, 'Databases', 'Yang Wang', 'R, Weka, Shiny',3,2,501) 
Insert into Course values(304, 'DBMS', 100, 'Databases', 'Yang Wang', 'R, Weka, Shiny',3,2,501) 
Insert into Course values(305, 'DBMS', 100, 'Databases', 'Yang Ling', 'R, Weka, Shiny',3,2,501)

Select * from course;

create table Student(
net_id int primary key,
password varchar(10) not null,
fname varchar(10) not null,
lname varchar(10) not null,
GPA int  
	constraint chk_gpa_type CHECK (GPA IN (3.0,3.1,3.2,3.3,3.4,3.5,3.6,3.7,3.8,3.9,4.0) ) not null,
course_id int references course(course_id));

insert into Student values(123, 'firebolt','Nidhi','Pathak',1.2,101);
insert into Student values(234, 'nimbus','Madhvi','Sawant',2.6,201);
insert into Student values(345, 'crucio','Devansh','Shinde',2.9,110);
insert into Student values(456, 'avada','Yash','Patel',3.0,301);
insert into Student values(567, 'kedavra','Shwet','Salvi',4.0,401);
insert into Student values(425, 'firebolt','Nidhi','Pathak',1.2,201);
insert into Student values(457, 'nimbus','Madhvi','Sawant',2.6,301);
insert into Student values(235, 'crucio','Devansh','Shinde',2.9,110);
insert into Student values(457, 'avada','Yash','Patel',4.0,101);
insert into Student values(141, 'kedavra','Shwet','Salvi',4.0,401);
insert into Student values(134, 'firebolt1','Ajaj','Pathak',1.2,101);
insert into Student values(235, 'nimbus1','Tanu','Sawant',2.6,201);
insert into Student values(467, 'crucio1','Esha','Shinde',2.9,110);
insert into Student values(583, 'avada1','tanaya','Patel',3.0,301);
insert into Student values(587, 'kedavra1','Alia','Salvi',4.0,401);
insert into Student values(124, 'firebolt2','Aliaa','Pathak',1.2,101);
insert into Student values(486, 'nimbus2','Ranbir','Sawant',2.6,201);
insert into Student values(325, 'crucio2','Deepika','Shinde',2.9,110);
insert into Student values(347, 'avada2','Arjun','Patel',3.0,301);
insert into Student values(586, 'kedavra2','Shahrukh','Salvi',4.0,401);
insert into Student values(245, 'firebolt3','Varun','Pathak',1.2,101);
insert into Student values(578, 'nimbus3','Karan','Sawant',2.6,201);
insert into Student values(235, 'crucio3','Nikhil','Shinde',2.9,110);
insert into Student values(486, 'avada3','Yash','Patel',4.0,201);
insert into Student values(579, 'kedavra3','Shwet','Salvi',4.0,401);
insert into Student values(123, 'firebolt4','Nidhi','Pathak',1.2,101);
insert into Student values(234, 'nimbus4','Madhvi','Sawant',2.6,201);
insert into Student values(345, 'crucio4','Devansh','Shinde',2.9,110);
insert into Student values(4896, 'avada4','Yash','Patel',3.7,401);
insert into Student values(567, 'kedavra4','Shwet','Salvi',4.0,401);
insert into Student values(46636, 'crucio5','Aashish','Shinde',3.9,404);
insert into Student values(4846, 'avada5','Jay','Patel',3.7,404);
insert into Student values(23525, 'kedavra6','Nakul','Salvi',4.0,404);

select * from student;

Create table Professor(
emp_id int PRIMARY KEY,
f_name varchar(30) not null,
l_name varchar(30) not null,
address varchar(40) not null,
salary int not null,
gender varchar(6) not null,
B_date date not null,
Ph_no int not null,
);

Insert into Professor values(1,'John','Abbot','ABQ',200000,'Male','20-Nov-89',81352);
Insert into Professor values(2,'Daisy','Hopkins','ABQ',10000,'Female','30-Dec-79',89322)
Insert into Professor values(3,'Serena','White','CBA',40000,'Female','11-June-85',894425)
Insert into Professor values(4,'Jesse','Pinkmax','TX',50000,'Male','24-Feb-86',892325);
Insert into Professor values(5,'Hernando','Hoyos','ABQ',200000,'Male','20-Nov-89',81352);
Insert into Professor values(6,'Yang','Wang','ABQ',10000,'Female','30-Dec-79',89322)

Select * from Professor;

create table department(
dept_id int primary key,
dept_name varchar(50),
dept_advisor varchar(40),
college_id varchar(10) references college(college_id));

Insert into department values(101,'IM','Murali',3);
Insert into department values(201,'ADS','Ingrid',2)
Insert into department values(301,'CS','Hoyos',1)
Insert into department values(401,'EM','Tess',4);
Insert into department values(501,'CE','Murali',2);
Insert into department values(601,'Architecture','Yash',1);

Select * from department;

create table waitlist(
waitlist_id int primary key,
course_id int references Course(course_id),
net_id int references Student(net_id),
GPA_1 decimal(18,10) 
	constraint chk_gpa CHECK (GPA_1 IN (3.5,3.6,3.7,3.8,3.9,4.0) ) not null,);

Insert into waitlist values(1,101,457,4.0)
Insert into waitlist values(2,201,457,3.8)
Insert into waitlist values(3,401,4846,3.9)
Insert into waitlist values(4,201,456,3.5)
Insert into waitlist values(5,301,567,3.6)

Select * from waitlist;
 
create table College(
college_id varchar(10) primary key,
college_name varchar(10) not null,
college_location varchar(10));

insert into College values(1,'iSchool','Syracuse');
insert into College values(2,'Whitman', 'Syracuse');
insert into College values(3,'Physics', 'Syracuse');
insert into College values(4,'Geology', 'Syracuse');

select * from college;


CREATE TRIGGER Stutrigger1 
ON Student  
AFTER INSERT, UPDATE   
AS RAISERROR ('Notify Admin', 16, 10);  
GO  

insert into Student values(123, 'fire','NidhiSS','Kapoorrr',4,101);


SET IMPLICIT_TRANSACTIONS ON;

BEGIN TRANSACTION;

--Put multiple insert in a single transaction
insert into Student values(1563, 'pass','Pooja','Kapoor',4,101);
insert into Student values(14763, 'pass1','Ranbir','Kapoor',3.7,101);
