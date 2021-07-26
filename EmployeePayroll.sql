#uc1
#created:database payroll_service,

create database payroll_service;
show databases;
use payroll_service;

#uc2
#created:table for employee_payroll

create table employee_payroll(
	id int unsigned not null auto_increment,
    name varchar(30) not null,
    salary double not null,
    start date not null,
    primary key(id)
);

#uc3
#Inserted:values in the table
insert  into employee_payroll(name,salary, start) values
  ('sanket',400000.0,'2021-04-06'),
  ('pranav',600000.0,'2021-02-06'),
  ('abc',300000.0,'2021-04-06');
  
#uc4
#displayed:All Table information 
select * from employee_payroll;

 #uc5
 #Added:Ability to retrieve salary data for a particular employee as well as all employees who have joined in a particular data range from the payroll service database
 select * from employee_payroll where name='sanket';
  select * from employee_payroll where start between cast('2021-02-06' AS date) and Date(now());
  
#uc6 
#Added:Ability to add Gender to Employee Payroll Table and Update the Rows to reflect the correct Employee Gender
alter table employee_payroll add gender char(1) after name;
update  employee_payroll set gender='M' where name ='sanket';

#Uc7
#Ability to find sum, average, min, max and number of male and female employees
select salary from employee_payroll;
select sum(salary) from employee_payroll;  
select min(salary) from employee_payroll;  
select max(salary) from employee_payroll;  
select count(salary) from employee_payroll;  
select avg(salary) from employee_payroll;  
select sum(salary) from employee_payroll where
	gender='F' group by gender;
    
#Uc8
alter table employee_payroll 
add phone varchar(20), 
add address varchar(200) default 'address1' ,
add department varchar(20)  not null ;

update employee_payroll 
set 
	department='Finance' 
where
	name in ('vaibhav');

select * from employee_payroll;     

#Uc9
alter table employee_payroll 
add basic_pay int, 
add deductions int,
add taxable_pay int  ,
add tax int,
add net_pay int;

#Uc10
insert into employee_payroll (name,department,gender,basic_pay
,deductions,taxable_pay,tax,net_pay,start) values
	('Terissa','Marketing','F',3000000,1000000,
    2000000,500000,1500000,'2021-07-08');
    
insert into employee_payroll (name,department,gender,basic_pay
,deductions,taxable_pay,tax,net_pay,start) values
	('Terissa','Sales','F',3000000,
    0,0,0,0,'2021-06-01');
