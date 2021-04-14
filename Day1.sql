-- create database training21;
 use training21;

-- create table dept( deptno int not null ,  dname varchar(20) not null, loc varchar(30) not null);
-- drop table dept;
-- create table dept(
-- deptno int not null primary key, 
-- dname varchar(20) not null,
-- loc varchar(30) not null);
 -- 1. drop and create apply key on table
-- drop table dept;
create table dept(deptno int not null , dname varchar(20) not null,
  loc varchar(30) not null, primary key(deptno));

-- 2. alter table dept 
-- drop table dept;
 -- alter table dept 
-- add constraint pk_deptno primary key (deptno);


INSERT INTO DEPT VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT VALUES (20, 'RESEARCH',   'DALLAS');
INSERT INTO DEPT VALUES (30, 'SALES', 'CHICAGO');
 INSERT INTO DEPT VALUES (40, 'OPERATIONS', 'BOSTON');
 
CREATE TABLE EMP
(
 EMPNO int NOT NULL ,ENAME VARCHAR(20), JOB VARCHAR(9),
   MGR int, HIREDATE DATETIME,SAL NUmeric(7, 2),
    COMM Numeric(7, 2),DEPTNO int 
 );
 
 alter table emp 
add constraint pk_emp_empno primary key(empno);

alter table emp
add foreign key (deptno) references dept(deptno);
alter table emp
 add foreign key (mgr) references emp(empno);
 
INSERT INTO EMP VALUES   (7839, 'KING',   'PRESIDENT', NULL,    str_to_date('11/17/1981','%m/%d/%Y') , 5000, NULL, null);   
INSERT INTO EMP VALUES   (7566, 'JONES',  'MANAGER',   		7839, str_to_date('04/2/1981'	,'%m/%d/%Y'),  2975, NULL, 20);
INSERT INTO EMP VALUES   (7698, 'BLAKE',  'MANAGER',   		7839, str_to_date('05/01/1981'	,'%m/%d/%Y'),  2850, NULL, 30);
INSERT INTO EMP VALUES   (7782, 'CLARK',  'MANAGER',   		7839, str_to_date('06/09/1981'	,'%m/%d/%Y'),  2450, NULL, 10);
INSERT INTO EMP VALUES   (7999, 'RAHUL_DRAVID', 'MANAGER',  7839, str_to_date('01/01/2011'  ,'%m/%d/%Y'), 4000, NULL, 10);
INSERT INTO EMP VALUES   (7788, 'SCOTT',  'ANALYST',   		7566, str_to_date('12/09/1982'  ,'%m/%d/%Y'), 3000, NULL, 20);
INSERT INTO EMP VALUES   (7902, 'FORD',   'ANALYST',   		7566, str_to_date('12/03/1981'  ,'%m/%d/%Y'),  3000, NULL, 20);
INSERT INTO EMP VALUES   (7499, 'ALLEN',  'SALESMAN',  		7698, str_to_date('02/20/1981'  ,'%m/%d/%Y'), 1600,  300, 30);
INSERT INTO EMP VALUES   (7521, 'WARD',   'SALESMAN',  		7698, str_to_date('02/22/1981'  ,'%m/%d/%Y'), 1250,  500, 30);
INSERT INTO EMP VALUES   (7654, 'MARTIN', 'SALESMAN',  		7698, str_to_date('09/28/1981'  ,'%m/%d/%Y'), 1250, 1400, 30);
INSERT INTO EMP VALUES   (7844, 'TURNER', 'SALESMAN',  		7698, str_to_date('09/08/1981'  ,'%m/%d/%Y'),  1500,    0, 30);
INSERT INTO EMP VALUES   (7900, 'JAMES',  'CLERK',			7698, str_to_date('12/03/1981'  ,'%m/%d/%Y'),   950, NULL, 30);
INSERT INTO EMP VALUES   (7369, 'SMITH',  'CLERK',			7902, str_to_date('12/17/1980'  ,'%m/%d/%Y'), 800, NULL, 20);
INSERT INTO EMP VALUES   (7876, 'ADAMS',  'CLERK',			7788, str_to_date('01/12/2003'  ,'%m/%d/%Y'), 1100, NULL, 20);
INSERT INTO EMP VALUES   (7934, 'MILLER', 'CLERK',			7782, str_to_date('01/23/2002'  ,'%m/%d/%Y'), 1300, NULL, 10);
INSERT INTO EMP VALUES   (7901, 'RAHUL_DRAVID', 'MANAGER',  7839, str_to_date('01/23/2012'  ,'%m/%d/%Y'), 3000, NULL, 10);

select * from emp;

-- 1.List all manger data
SELECT EMPNO,ENAME,JOB FROM EMP;

-- 2.LIST EMP WHO ARE WORKING AS MANAGER OR ANALYST OR CLERK
SELECT EMPNO,ENAME,JOB,SAL FROM EMP 
WHERE (JOB='CLERK'OR JOB='MANAGER' OR JOB='ANALYST' );

-- 3 LIST EMP WHO ARE EARNING SAL BETWEEN 3000 AND 5000 (INCLUSIVE OF LIMIT)
SELECT EMPNO,ENAME,SAL FROM EMP WHERE SAL between 3000 AND 5000;

-- 4 LIST EMP WHO ARE WORKING AS MANAGER OR ANALYST OR CLERK AND EARNING SAL BETWEEN 3000 AND 5000
SELECT EMPNO,ENAME,JOB,SAL FROM EMP 
WHERE (JOB='CLERK'OR JOB='MANAGER' OR JOB='ANALYST' )AND
SAL BETWEEN 3000 AND 5000;

-- 5 LIST ALL EMP WHE ARE EARNING COMM
select *from emp where comm >= 0;

-- 6  LIST ALL EMP WHOSE COMM IS NOT NULL
select *from emp where comm is not null;

-- 7 LIST ALL EMP WHOSE NAME STARTS WITH S
SELECT * FROM EMP WHERE ENAME like 'S%';

-- 8 LIST ALL EMP WHOSE NAME ENDS WITH R
SELECT * FROM EMP WHERE ENAME like '%R';

-- 9 LIST ALL EMP WHOSE NAME CONTAINS A
SELECT * FROM EMP WHERE ENAME like '%A%';

-- 10 LIST ALL EMP WHOSE NAME CONTAINS A AS SECOND LETTER
SELECT * FROM EMP WHERE ENAME like '_A%';

-- 11 LIST ALL EMP WHOSE NAME STARTS WITH EITHER M OR S
SELECT * FROM EMP WHERE ENAME like 'M%' OR ENAME like 'S%';

-- 12 LIST ALL EMP WHOSE NAME STARTS BETWEEN A TO M
SELECT * FROM EMP WHERE ENAME BETWEEN 'A' AND 'M';

-- 13 LIST ALL EMP WHOSE NAME CONTAINS _
SELECT * FROM EMP WHERE ENAME like '%_%';

-- 14 LIST ALL EMP WHO ARE WORKING AS MANAGER IN EITHER DEPT 10 OR 20 AND ALL CLERK FOR DEPT3 30
select * from emp WHERE ( job = 'MANAGER' AND (DEPTNO = 10 OR DEPTNO = 20)) OR (JOB ='CLERK' AND DEPTNO = 30);

-- 15 LIST ENAME, SAL AND BONUS AS 10% OF SALARY
SELECT ENAME, SAL, SAL*0.10 AS BONUS FROM EMP;

-- 16 LIST EMP DATA AS PER THE ASCENDING ORDER OF NAME
select * from emp order by ename;

-- 17 LIST ALL AS PER THEIR SALARY HIGHES TO LOWEST
select * from emp order by sal desc;

-- 18 LIST EMP AS PER THEIR DEPT, WITH IN DEPT HIGHEST TO LOWESET SAL
select * from emp order by job,sal desc;

-- 19 list top 3 highest paid emp
Select ename, job, sal from emp
    where sal >=(select max(sal) from emp
    where sal < (select max(sal) from emp
    where sal < (select max(sal) from emp)))
    order by sal;
    
-- 20 RETURN RANK BASED ON SPECIFED CRITERIA IF TWO EMP HAVE SAME SALARY THEY BOTH GET SAME NUMBER AND NEXT NUMBER WILL BE SKIPPED
select empno,ename,deptno,sal, Rank() over(partition by deptno order by sal desc)
 as 'Rank' from emp;
 
    -- 23 LIST THE DIFFERNT JOB NAME
select distinct(JOB) FROM EMP;

-- 24 LIST TOTAL ORGANIZATION SALARY
select sum(SAL) as Total_Org_Sal FROM EMP;

-- 25 LIST DEPTWISE TOTAL SALARY
SELECT DEPTNO, SUM(SAL) as Total_Dept_Sal  FROM EMP GROUP BY DEPTNO;

-- 26 LIST JOBWISE EMP COUNT.
select JOB, count(JOB) FROM EMP group by JOB;

-- 27 LIST ALL EMP WHO HAVE JOINED IN MONTH OF FEB
select * from emp where month(HIREDATE) = 2;

-- 28 LIST EMP COUNT   JOINED BETWEEN 1981 AND 1983
select count(*) as emp_count from emp where HIREDATE between '1981-01-01' and '1983-12-31';

-- 29 LIST HOW MANY YEARS OF SERVICE COMPLETED BY EACH EMP ARRANGE BASED ON TENURE HIGHEST TO LOWEST
select ename, year(now())-year(hiredate) as Year_Ser from emp;

 