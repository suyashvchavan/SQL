use employees;

SELECT first_name, last_name FROM employees;

select dept_no from departments;

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'denis';                          #using 'where' clause to find for specific condition
    
    
    select * from employees where first_name='elvis';
    
    
    SELECT 
    *
FROM
    employees
WHERE
    first_name = 'denis' AND gender = 'M';                 # using 'AND along with 'WHERE' to filter
    
    
    SELECT * FROM employees WHERE first_name='kellie' AND gender='F';
    
    
    
    SELECT 
    *
FROM
    employees
WHERE
    first_name = 'denis'
        OR first_name = 'elvis';                                # using 'OR' along with 'WHERE'
        
        
        
        SELECT * FROM employees WHERE first_name='kellie' OR first_name='aruna';
        
        
        
  #      
        SELECT 
    *
FROM
    employees
WHERE
    last_name = 'denis' AND (gender = 'M' OR gender = 'F');                              #operator precedence******
    
 
 
 SELECT * FROM employees 
 WHERE gender='F' AND (first_name='kellie' OR first_name='Aruna');
 
 
 # Use of 'IN' operator where more than 2 conditions are present
 
 SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('cathie' , 'mark', 'nathan');
    
    
    # Use of 'NOT  IN' operator where more than 2 conditions are present 
    
    SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('cathie' , 'mark', 'nathan');
    
    
    # Use of 'LIKE ' operator to filter table with pattern
    
    
    SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('mar%');
    
    
     SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%mar');
    
    
     SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('mar_');
    
    
    
     # Use of 'NOT LIKE ' operator to filter table with pattern
   
    
     SELECT 
    *
FROM
    employees
WHERE
    first_name NOT LIKE ('mar%');
    
    
    
# using WILDCARD characters *,%,_
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%jack%');    
    
    
# using BETWEEN ......AND operator

SELECT 
    *
FROM
    employees
WHERE
    hire_date BETWEEN '1990-01-01' AND '2000-01-01';
    
    
SELECT 
    *
FROM
    employees
WHERE
    hire_date NOT  BETWEEN '1990-01-01' AND '2000-01-01';    
    
    
SELECT 
    *
FROM
    departments
WHERE
    dept_no BETWEEN 'd003' AND 'd006';
    
    
    
    
SELECT 
    *
FROM
    employees
WHERE
    first_name BETWEEN 'mark' AND 'nathan';
    
    
    
# 'IS NOT NULL' & 'IS NULL'

SELECT 
    *
FROM
    employees
WHERE
    first_name IS NOT NULL;


SELECT 
    dept_name
FROM
    departments
WHERE
    dept_no IS NOT NULL;
    
    
    
# Other comparison operators

SELECT 
    *
FROM
    employees
WHERE
hire_date >= '2000-01-01';


SELECT 
    *
FROM
    employees
WHERE
hire_date <= '1985-02-01';



SELECT 
    *
FROM
    employees
WHERE
    hire_date >= '2000-01-01'
        AND gender = 'F';
        
        
SELECT 
    *
FROM
    salaries
WHERE
    salary > 150000;
    
    
    
    #using SELECT DISTINCT 
    
SELECT DISTINCT
    gender
FROM
    employees;
    

SELECT DISTINCT
    first_name
FROM
    employees;
    
    
    
# Aggregate functions               never use whitespace between agrregate function and parenthesses
#COUNT()
#SUM()
#MAX()
#MIN()
#AVG()


SELECT 
    COUNT(emp_no)
FROM
    employees;
  
SELECT 
    COUNT(DISTINCT first_name)
FROM
    employees;
    
    
#How many annual contracts with a value higher than or equal to $100,000 have been registered in the salaries table?

SELECT 
    COUNT(*)
FROM
    salaries
WHERE
    salary >= 10000;

   # Selecting the data in order by 'ORDER BY' query
   
   
   SELECT 
    *
FROM
    employees
ORDER BY first_name;

# by ascending order

  SELECT 
    *
FROM
    employees
ORDER BY first_name ASC;

# by descending order

  SELECT 
    *
FROM
    employees
ORDER BY first_name desc;



 SELECT 
    *
FROM
    employees
ORDER BY first_name , last_name ASC;



SELECT 
    *
FROM
    employees
ORDER BY emp_no DESC;


# gropu by statement to see a distict data count in data


SELECT 
    first_name, COUNT(first_name)
FROM
    employees
GROUP BY FIRST_NAME 
order by first_name ASC;


#Using Aliases(givng column a name) using 'AS' key

SELECT 
    first_name, COUNT(first_name) as names_count
FROM
    employees
GROUP BY FIRST_NAME 
order by first_name ASC;


#Write a query that obtains two columns. The first column must contain annual salaries higher than 80,000 dollars. 
#The second column, renamed to “emps_with_same_salary”,
# must show the number of employees contracted to that salary. Lastly, sort the output by the first column.
 
 SELECT 
    salary, COUNT(emp_no) AS emps_with_same_salary
FROM
    salaries
    where salary >=80000
GROUP BY salary
ORDER BY salary ASC;


#using 'HAVING' clause,       WHERE clause in place of HAVING will give error ,HAVING function is used when condition is about aggregate function such as count, max, avg
# its important to put HAVING statement in between GROUP BY & ORDER BY


SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
GROUP BY first_name
HAVING COUNT(first_name) > 250
ORDER BY first_name;



SELECT

    emp_no, AVG(salary)

FROM

    salaries

GROUP BY emp_no

HAVING AVG(salary) > 120000

ORDER BY emp_no;



# WHERE vs HAVING
# extract group of names encountered less than 200 times and hired after january 1,1999

SELECT 
    first_name, COUNT(first_name)
FROM
    employees
WHERE
    hire_date >= '1999-01-01'
GROUP BY first_name
HAVING COUNT(first_name) < 200
ORDER BY first_name;



#Select the employee numbers of all individuals who have signed more than 1 contract after the 1st of January 2000.
#Hint: To solve this exercise, use the “dept_emp” table.


SELECT 
    emp_no, count(from_date)
FROM
    dept_emp
where from_date > '2000-01-01'
GROUP BY (emp_no)
HAVING COUNT(from_date) > 1
ORDER BY emp_no;


# LIMIT

SELECT 
    *
FROM
    salaries;

# show the employee numbers of 10 highest paid employees in database

SELECT 
    *
FROM
    salaries
ORDER BY salary DESC
LIMIT 10;

use employees;


SELECT 
    *
FROM
    employees
LIMIT 10;

# using 'INSERT' statement

insert into employees ( emp_no,birth_date,first_name,Last_name,gender,hire_date)
values(999901,'1986-04-21','john','smith','m','2011-01-01');


SELECT 
    *
FROM
    employees
ORDER BY emp_no DESC
LIMIT 10;




#we can use INSERT statement without mentioning columns after table name;
# but we need to insert every value for each column with same order as columns



INSERT INTO employees
VALUES
( 
     999902,
     '1977-09-14',
	'Jonathan',
	'Creek',
     'm',
'1999-01-01'
) ;


# Using 'INSERT' by importing values from other existing table
use employees;
SELECT 
    *
FROM
    departments;
    
    
CREATE TABLE departments_duplicate (
    dept_no CHAR(4) NOT NULL,
    dept_name VARCHAR(40) NOT NULL
);




insert into departments_duplicate
( dept_no,dept_name)
select * from departments;

SELECT 
    *
FROM
    Departments_duplicate
ORDER BY dept_no;





# 'UPDATE' querry to update existing set of information,    always use where clause otherwise u will update whole table
use employees;
UPDATE employees 
SET 
    first_name = 'stella',
    last_name = 'parkinson',
    birth_date = '1990-12-31',
    gender = 'f'
WHERE
    emp_no = 999901;
  
use employees;

SELECT 
    *
FROM
    employees
ORDER BY emp_no DESC;



SELECT 
    *
FROM
    departments_duplicate
ORDER BY dept_no;

COMMIT;

UPDATE departments_duplicate 
SET 
    dept_no = 'd011',
    dept_name = 'Quality Control';
    
use employees;

# using DELETE querry 
COMMIT;
delete from employees
where emp_no=999903;



# Aggregate functions

#COUNT

SELECT 
    COUNT( salary)
FROM
    salaries;
    
    
SELECT 
    COUNT(DISTINCT salary)
FROM
    salaries;
    
    
#How many departments are there in the “employees” database? Use the ‘dept_emp’ table to answer the question.

SELECT 
    COUNT(DISTINCT dept_no)
FROM
    dept_emp;
    
    
#SUM

SELECT 
    SUM(salary)
FROM
    salaries;
    
    
# What is the total amount of money spent on salaries for all contracts starting after the 1st of January 1997?


SELECT 
    SUM(salary)
FROM
    salaries
WHERE
    from_date > '199701-01';
    
    
    
#MAX() & MIN()

SELECT 
    MAX(salary)
FROM
    salaries;



SELECT 
    MIN(salary)
FROM
    salaries;
    
    
    
#AVG()
SELECT 
    AVG(salary)
FROM
    salaries;


#What is the average annual salary paid to employees who started after the 1st of January 1997?

SELECT 
    AVG(salary)
FROM
    salaries
WHERE
    from_date >'1997-01-01';
    
    
#ROUND()
SELECT 
    ROUND(AVG(salary))
FROM
    salaries
WHERE
    from_date > '1997-01-01';

SELECT 
    ROUND(AVG(salary),2)
FROM
    salaries
WHERE
    from_date > '1997-01-01';
    
    
    
#IF NULL()

SELECT 
    *
FROM
    departments_duplicate
ORDER BY dept_no;

alter table departments_duplicate
modify dept_name varchar(40);

insert into departments_duplicate(dept_no)
values('d010');



SELECT 
    dept_no,
    IFNULL(dept_name,
            'Departments Name Not Provided') AS Dept_name
FROM
    departments_duplicate
ORDER BY dept_no;


alter table departments_duplicate
add column  dept_manager varchar(255); 

##COALESCE()           coalesce can be used to put hypothetical temporary result in table
SELECT 
    dept_no, dept_name, COALESCE(dept_manager, dept_name, 'N/A')
FROM
    departments_duplicate
ORDER BY dept_no ASC;

select * from departments_duplicate;



# JOIN querry

use employees;

alter table departments_duplicate
drop column dept_manager;

alter table departments_duplicate
change column dept_no dept_no char(4) NULL;

alter table departments_duplicate
change column dept_name dept_name varchar(40) null;

insert into departments_duplicate(dept_no)
values ('d010');


insert into departments_duplicate(dept_no)
values ('d011');


insert into departments_duplicate(dept_name)
values ('public relations');


DELETE FROM departments_duplicate 
WHERE
    dept_no = 'd002';
    
    
create table dept_manager_dup
(emp_no int(11) NOT NULL,

  dept_no char(4) NULL,

  from_date date NOT NULL,

  to_date date NULL
  );


INSERT INTO dept_manager_dup

select * from dept_manager;




iNSERT INTO dept_manager_dup (emp_no, from_date)

VALUES                (999904, '2017-01-01'),

                                (999905, '2017-01-01'),

                               (999906, '2017-01-01'),

                               (999907, '2017-01-01');


DELETE FROM dept_manager_dup

WHERE

    dept_no = 'd001';
    
    
 SELECT 
    *
FROM
    dept_manager_dup
ORDER BY dept_no;


SELECT 
    *
FROM
    departments_duplicate
ORDER BY dept_no;


delete from departments_duplicate
where dept_no='d010';


insert into departments_duplicate(dept_no)
values('d010');

###INNER JOIN
#USE ALIASES for Manager table "M",for departments table "D".

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        INNER JOIN
    departments_duplicate d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;
 
 #Extract a list containing information about all managers’ employee number, first and last name, department number, and hire date.    

SELECT 
    m.emp_no, e.first_name, e.last_name, m.dept_no, e.hire_date
FROM
    employees e
        INNER JOIN
    dept_manager_dup m ON m.emp_no = e.emp_no
ORDER BY emp_no;



#DUPLICATE RECORDs

SELECT 
    *
FROM
    dept_manager_dup;
    
    
    insert into dept_manager_dup
    values(110228,'d003','1992-03-21','9999-01-01');
    
    insert into departments_duplicate
    values('d009','customer service');
    
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        INNER JOIN
    departments_duplicate d ON m.dept_no = d.dept_no
ORDER BY dept_no;
 
 
 # as there are duplicates present in both tables instead of 20 rows in the output, there are 25 rows in the output. to avoid this
 # use GROUP BY for the most differing column in this case employee name 
 
 SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
     JOIN
    departments_duplicate d ON m.dept_no = d.dept_no
 group by m.emp_no
order by m.dept_no;
 
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));         #querry used to rectify error 1055, which was arising in last code


#LEFT JOIN


#removing the duplicates 
DELETE FROM departments_duplicate 
WHERE
    dept_no = 'd009';
    
Delete from dept_manager_dup
where emp_no= 110228;    

# add original records in them

insert into departments_duplicate
values('d009','customer service');
insert into dept_manager_dup
 values(110228,'d003','1992-03-21','9999-01-01');
 
 ##LEFT JOIN
 
     
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        LEFT JOIN
    departments_duplicate d ON m.dept_no = d.dept_no
ORDER BY dept_no;
 
 
 
 SELECT 
    d.dept_no, m.emp_no, d.dept_name
FROM
    departments_duplicate d
        LEFT JOIN
    dept_manager_dup m ON m.dept_no = d.dept_no
ORDER BY dept_no;
 
 
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        LEFT JOIN
    departments_duplicate d ON m.dept_no = d.dept_no
WHERE
    dept_name IS NULL
ORDER BY dept_no;



#Join the 'employees' and the 'dept_manager' tables to return a subset of all the employees whose last name is Markovitch. 
#See if the output contains a manager with that name.  
#Hint: Create an output containing information corresponding to the following fields: ‘emp_no’, ‘first_name’, ‘last_name’, ‘dept_no’, ‘from_date’. 
#Order by 'dept_no' descending, and then by 'emp_no'.


SELECT 
    e.emp_no, e.first_name, e.last_name, m.dept_no, m.from_date
FROM
    employees e
        LEFT JOIN
    dept_manager m ON e.emp_no = m.emp_no
HAVING e.last_name = 'markovitch'
ORDER BY m.dept_no DESC , e.emp_no; 

##RIGHT JOIN

SELECT 
    d.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        RIGHT JOIN
    departments_duplicate d ON m.dept_no = d.dept_no
ORDER BY dept_no;


#Select the first and last name, the hire date, and the job title of all employees 
#whose first name is “Margareta” and have the last name “Markovitch”.

SELECT 
    e.emp_no, e.first_name, e.last_name, e.hire_date, t.title
FROM
    employees e
        JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    e.first_name = 'margareta'
        AND e.last_name = 'markovitch'
ORDER BY e.emp_no;


#used to connect all the values of both the tables

SELECT 
    dm.*, d.*
FROM
    dept_manager dm
        CROSS JOIN
    departments d
ORDER BY dm.emp_no , d.dept_no;


# similar output can be obtained without cross join
SELECT 
    dm.*, d.*
FROM
    dept_manager dm,
    departments d
ORDER BY dm.emp_no , d.dept_no;




SELECT 
    dm.*, d.*
FROM
    dept_manager dm
        CROSS JOIN
    departments d
WHERE
    dm.dept_no != d.dept_no
ORDER BY dm.emp_no , d.dept_no;



# we can connect more than 2 tables with the help of JOIN querry

SELECT 
    e.*, d.*
FROM
    dept_manager dm
        CROSS JOIN
    departments d
      JOIN 
      employees e     ON  dm.emp_no = e.emp_no
WHERE
    dm.dept_no != d.dept_no
ORDER BY dm.emp_no , d.dept_no;


#using AGGREGATE fuctions in JOIN

select * from salaries limit 50;

SELECT 
    e.gender, AVG(s.salary) AS avg_salary
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
GROUP BY e.gender;


#joining more than 2 tables

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    e.hire_date,
    m.from_date,
    d.dept_name
FROM
    employees e
        JOIN
    dept_manager m ON e.emp_no = m.emp_no
        JOIN
    departments d ON m.dept_no = d.dept_no
ORDER BY e.emp_no;




#Select all managers’ first and last name, hire date, job title, start date, and department name.
SELECT

    e.first_name,

    e.last_name,

    e.hire_date,

    t.title,

    m.from_date,

    d.dept_name

FROM

    employees e

        JOIN

    dept_manager m ON e.emp_no = m.emp_no

        JOIN

    departments d ON m.dept_no = d.dept_no

        JOIN

    titles t ON e.emp_no = t.emp_no

WHERE t.title = 'Manager'

ORDER BY e.emp_no;

#find the average salaries of managers of each department


SELECT 
    d.dept_name, AVG(s.salary)
FROM
    departments d
        JOIN
    dept_manager m ON d.dept_no = m.dept_no
        JOIN
    salaries s ON m.emp_no = s.emp_no
GROUP BY d.dept_no
ORDER BY AVG(salary) DESC;



#How many male and how many female managers do we have in the ‘employees’ database?

SELECT 
    gender, COUNT(d.emp_no)
FROM
    employees e
        JOIN
    dept_manager d ON e.emp_no = d.emp_no
GROUP BY gender;



#UNION QUERRY


CREATE TABLE IF NOT EXISTS employees_dup (
    emp_no INT(11),
    birth_date DATE,
    first_name VARCHAR(40),
    last_name VARCHAR(40),
    gender ENUM('m', 'f'),
    hire_date DATE
);

INSERT INTO employees_dup
SELECT e.*
FROM employees  e
LIMIT 20;

INSERT INTO employees_dup
VALUES ('10001','1953-09-02','georgi','facello', 'm','1986-06-26');

select * from employees_dup;

#UNION QUERRY


SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    NULL AS dept_no,
    NULL AS from_date
FROM
    employees_dup e
WHERE
    e.emp_no = 10001 
UNION ALL SELECT 
    NULL AS emp_no,
    NULL AS first_name,
    NULL AS last_name,
    m.dept_no,
    m.from_date
FROM
    dept_manager m;



#using SUBQUERRIES, Using NESTED insert
# select the frist name & last name from employees table
#for the same employee no cn be found in 'department manager' table

use employees;

SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
    e.emp_no IN (SELECT 
            dm.emp_no
        FROM
            dept_manager dm);



#similar result can be found using JOIN statement
SELECT 
    e.first_name, e.last_name
FROM
    employees e
        JOIN
    dept_manager dm ON e.emp_no = dm.emp_no;
    
    

SELECT 
    e.first_name, e.last_name,t.title
FROM
    employees e,
    titles t
WHERE
    e.emp_no IN (SELECT 
            dm.emp_no
        FROM
            dept_manager dm);
            
            
 #Extract the information about all department managers who were hired between the 1st of January 1990 and the 1st of January 1995.           
 
 SELECT 
    e.*
FROM
    employees e
WHERE
    e.emp_no IN (SELECT 
            dm.emp_no
        FROM
            dept_manager dm)
        AND (e.hire_date >= '1990-01-01'
        AND e.hire_date <= '1995-01-01');
 
 
 # similar can be done using
 
 SELECT

    *

FROM

    dept_manager

WHERE

    emp_no IN (SELECT

            emp_no

        FROM

            employees

        WHERE

            hire_date BETWEEN '1990-01-01' AND '1995-01-01');
            
            
            
# EXISTS instead of IN,      IN larger dataserts EXISTS works faster


select
e.first_name, e.last_name 
from employees e
where 
 exists(select * from dept_manager dm
                                       where dm.emp_no = e.emp_no)
order by e.emp_no ;




#Select the entire information for all employees whose job title is “Assistant Engineer”. 

SELECT 
    e.*
FROM
    employees e
WHERE
    EXISTS( SELECT 
            *
        FROM
            titles t
        WHERE
            t.title = 'assistant engineer'
                AND t.emp_no = e.emp_no);
 
 #similar querry using nested IN
 SELECT 
    e.*
FROM
    employees e
WHERE
    e.emp_no IN (SELECT 
            t.emp_no
        FROM
            titles t
        WHERE
            t.title = 'assistant engineer');
            
            
            
            
select * from dept_emp;


SELECT 
    A.*
FROM
    (SELECT 
        e.emp_no AS employee_id,
            MAX(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no) AS A 
UNION SELECT 
    B.*
FROM
    (SELECT 
        e.emp_no AS employee_id,
            MAX(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no BETWEEN 10021 AND 10040
    GROUP BY e.emp_no) AS B;
           
            
            
 CREATE TABLE IF NOT EXISTS emp_manager (
    employee_id INT(6),
    department_code VARCHAR(4),
    manager_ID INT(6)
);

# SELF JOIN

insert into emp_manager 
SELECT 
    A.*
FROM
    (SELECT 
        e.emp_no AS employee_id,
            MAX(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no) AS A 
UNION SELECT 
    B.*
FROM
    (SELECT 
        e.emp_no AS employee_id,
            MAX(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no BETWEEN 10021 AND 10040
    GROUP BY e.emp_no) AS B
           ;
           
           SELECT 
    *
FROM
    emp_manager;
    
    
 Insert into emp_manager
 values ( 110022,'d001',110039),
             (110039,'d001',110022);
           
   
 ## SELF JOIN   
   
  SELECT 
    *
FROM
    emp_manager
WHERE
    employee_id IN (SELECT 
            manager_id
        FROM
            emp_manager);
            
 #VIEWS Queery
 
 CREATE OR REPLACE VIEW v_dept_emp_latest_date AS
    SELECT 
        emp_no, MAX(from_date) AS from_date, MAX(to_date) AS to_Date
    FROM
        dept_emp
    GROUP BY emp_no;
    
    
    
#Create a view that will extract the average salary of all managers registered in the database. Round this value to the nearest cent.

#If you have worked correctly, after executing the view from the “Schemas” section in Workbench, you should obtain the value of 67047.29.    
    
CREATE OR REPLACE VIEW v_avg_salary AS
    SELECT 
        ROUND(AVG(salary), 2)
    FROM
        salaries s
            JOIN
        dept_manager dm ON s.emp_no = dm.emp_no;
   




#######STORED ROUTINES
# 2 types
##1.STORED PROCEDURE
##2.STORED FUNCTIONS


#CREating a procedure which calls 1000 employees

DROP procedure if exists select_employees;
use employees;

DELIMITER $$ 
                  ##assisgning $$ as a temporary delimiter

create procedure select_employees ( )
begin 
           select * from employees
           limit 1000;
end$$


delimiter ;                         
##re-assigning ; as delimiter


call employees.select_employees();
call select_emplyees();




#Create a procedure that will provide the average salary of all employees.

#Then, call the procedure.

use employees;
delimiter $$

create procedure show_avg_salaries ()
begin 
                select  emp_no, AVG(SALARY) from salaries
                group by emp_no;
end $$

delimiter ;


call select_salaries();


call show_avg_salaries();

# drop procedure
drop procedure employees.select_salaries ;


## CREATING THE PROCEDURE WITH 'IN' PARAMETER i.e. we have to give input
use employees;


DELIMITER $$
USE employees $$
CREATE PROCEDURE emp_salary(IN p_emp_no INT)
BEGIN

 SELECT  
          e.emp_no, e.first_name,e.last_name,s.salary, s.from_date,s.to_date
           FROM 
           employees e 
           JOIN 
           salaries s     ON e.emp_no = s.emp_no
           WHERE
           e.emp_no = p_emp_no ;
           
END$$


DELIMITER ;


DELIMITER $$


use employees $$

CREATE PROCEDURE EMP_AVG_SALARY(IN p_emp_no INT)
BEGIN 
           SELECT 
           e.emp_no, e.first_name, e.last_name, AVG(S.SALARY)
           FROM 
           employees e
           JOIN
           salaries s ON e.emp_no = s.emp_no
           WHERE
           e.emp_no = p_emp_no ;
END $$

DELIMITER ;

    call emp_avg_salary(11015);       
           


DELIMITER $$



##CREATING A PROCEDURE WITH OUT PARAMETER
## IN OUT PARAMETER SYNTAX 'INTO' IS INSERTED AFTER SELECT STATEMENT

use employees $$

CREATE PROCEDURE emp_avg_salary_out( IN p_emp_no INT, OUT Avg_salary DECIMAL(10,2))

BEGIN

 SELECT
  AVG(s.salary)
  INTO Avg_salary
  FROM
  Salaries s
  where 
  s.emp_no = p_emp_no;
  
END $$

DELIMITER ;


  
##Create a procedure called ‘emp_info’ that uses as parameters the 
#first and the last name of an individual, and returns their employee number.
 
 
DELIMITER $$

USE EMPLOYEES $$

CREATE PROCEDURE emp_info( IN p_first_name varchar(255), IN p_last_name varchar(255), OUT p_emp_no INT)

BEGIN 

  SELECT e.emp_no
  INTO p_emp_no
  FROM employees e
  WHERE  p_first_name = e.first_name  AND p_last_name = e.last_name;
  
ENd $$

delimiter ;


use employees;


##CREATING A VARIABLE

SET  @v_avg_salary = 0;

call  employees.emp_avg_salary_out(11300, @v_avg_salary);

select @v_avg_salary;


## CREATING A FUNCTION, instead of using 'OUT' 'RETURN' is used and variable is declared inside BEGIN

DELIMITER $$
create function f_avg_salary(p_emp_no INT) RETURNS DECIMAL(10,2)

BEGIN

DECLARE v_avg_salary DECIMAL(10,2);
SELECT 
    AVG(s.salary)
INTO v_avg_salary FROM
    salaries s
WHERE
    s.emp_no = p_emp_no;
    
RETURN v_avg_salary;
END $$

DELIMITER ;


SET GLOBAL log_bin_trust_function_creators = 1;

# we can not call the function with call querry

SELECT f_avg_salary(11300);


#setting a 'GLOBAL VARIABLE'

##max_connections
##max_join_size

SET GLOBAL max_connections = 100;


use employees;

# TRIGGERS
#Before INSERT
#UPDATE
#After INSERT

#1.Before INSERT
COMMIT;
DELIMITER $$

CREATE TRIGGER before_salaries_insert
BEFORE INSERT ON salaries
FOR EACH ROW
BEGIN 
	IF NEW.salary < 0 THEN 
		SET NEW.salary = 0 ; 
	END IF;
END $$

DELIMITER ;


SELECT 
    *
FROM
    salaries
WHERE
    emp_no = '10001';
    
    INSERT INTO salaries VALUES ('10001', -92891, '2010-06-22', '9999-01-01');
    
    SELECT 
    *
FROM
    salaries
WHERE
    emp_no = '10001';
    


#2.UPDATE


DELIMITER $$

CREATE TRIGGER trig_upd_salary
BEFORE UPDATE ON salaries
FOR EACH ROW
BEGIN 
	IF NEW.salary < 0 THEN 
		SET NEW.salary = OLD.salary; 
	END IF; 
END $$

DELIMITER ;

UPDATE salaries 
SET 
    salary = - 50000
WHERE
    emp_no = '10001'
        AND from_date = '2010-06-22';
        
        
        
        SELECT 
    *
FROM
    salaries
WHERE
    emp_no = '10001'
        AND from_date = '2010-06-22';
        
        
#3.After INSERT

DELIMITER $$

CREATE TRIGGER trig_ins_dept_mng
AFTER INSERT ON dept_manager
FOR EACH ROW
BEGIN
	DECLARE v_curr_salary int;
    
    SELECT 
		MAX(salary)
	INTO v_curr_salary FROM
		salaries
	WHERE
		emp_no = NEW.emp_no;

	IF v_curr_salary IS NOT NULL THEN
		UPDATE salaries 
		SET 
			to_date = SYSDATE()
		WHERE
			emp_no = NEW.emp_no and to_date = NEW.to_date;

		INSERT INTO salaries 
			VALUES (NEW.emp_no, v_curr_salary + 20000, NEW.from_date, NEW.to_date);
    END IF;
END $$

DELIMITER ;


SELECT 
    *
FROM
    dept_manager
WHERE
    emp_no = 111534;
    
SELECT 
    *
FROM
    salaries
WHERE
    emp_no = 111534;
    
    
 ROLLBACK;
 
 
 ##Create a trigger that checks if the hire date of an employee is higher than the current date. 
 #If true, set this date to be the current date. Format the output appropriately (YY-MM-DD).
 
 
 DELIMITER $$

CREATE TRIGGER trig_hire_date

BEFORE INSERT ON employees

FOR EACH ROW

BEGIN

                IF NEW.hire_date > date_format(sysdate(), '%Y-%m-%d') THEN

                                SET NEW.hire_date = date_format(sysdate(), '%Y-%m-%d');

                END IF;

END $$

DELIMITER ;

 

INSERT employees VALUES ('999904', '1970-01-31', 'John', 'Johnson', 'M', '2025-01-01');

SELECT

    *

FROM

    employees

ORDER BY emp_no DESC;

rollback;

#INDEX

SELECT 
    *
FROM
    employees
WHERE
    hire_date > '2000-01-01';
    
    
 CREATE INDEX i_hire_date on employees(hire_date);
 
#CASE Statement


Select first_name,last_name,
Case 
when gender = 'M' THEN 'Male'
else 'female'
end as GENDER

from Employees;


## Can be done by If statement


SELECT 
    e.first_name,
    e.last_name,
    IF(gender = 'M', 'Male', 'Female') AS GEnder
FROM
    employees e;
    
    
    
    SELECT e.emp_no,e.first_name, e.last_name,MAX(s.salary)-MIN(s.salary) as  salary_difference,
    CASE
    When MAX(s.salary) - MIN(s.salary) > 30000 then 'salary increased by 30000' 
    when MAX(s.salary)- MIN(s.salary) between 20000 and 30000 then 'salary increased between 20000 and 30000'  
    else  'salary increased by less than 20000' 
    END as increase_in_salary
    FROM employees e
    JOIN salaries s ON e.emp_no = s.emp_no
    JOIN dept_manager dm ON s.emp_no = dm.emp_no
    Group by s.emp_no;

#Similar to the exercises done in the lecture, obtain a result set containing the employee number, first name, and last name of all employees with a number higher than 109990. 
#Create a fourth column in the query, indicating whether this employee is also a manager, according to the data provided in the dept_manager table, or a regular employee. 

SELECT 
    e.emp_no,
    e.first_name,
    e.Last_name,
    CASE
        WHEN dm.emp_no IS NOT NULL THEN 'MANAGER'
        ELSE ' EMPLOYEE'
    END AS is_manager
FROM
    employees e
        LEFT JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
WHERE
    e.emp_no > 10990; 



#Extract the employee number, first name, and last name of the first 100 employees, 
#and add a fourth column, called “current_employee” saying “Is still employed” if the employee is still working in the company, or “Not an employee anymore” if they aren’t.

Hint: You’ll need to use data from both the ‘employees’ and the ‘dept_emp’ table to solve this exercise. 

SELECT

    e.emp_no,

    e.first_name,

    e.last_name,

    CASE

        WHEN MAX(de.to_date) > SYSDATE() THEN 'Is still employed'

        ELSE 'Not an employee anymore'

    END AS current_employee

FROM

    employees e

        JOIN

    dept_emp de ON de.emp_no = e.emp_no

GROUP BY de.emp_no

LIMIT 100;


 