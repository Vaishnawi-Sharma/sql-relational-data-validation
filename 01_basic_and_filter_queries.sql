/* Microsoft SQL Server Studio 2021 */

/*For Creating Database*/
CREATE DATABASE EMPLOYEE ;

/*For Creating Table */
CREATE TABLE EMPINFO(
FIRST VARCHAR(50),
LAST VARCHAR(50),
ID INT PRIMARY KEY ,
AGE INT ,
CITY VARCHAR(50) ,
STATE VARCHAR(50) );

/*For inserting Data into Table */
INSERT INTO EMPINFO (FIRST,LAST,ID,AGE,CITY,STATE) VALUES ('John' ,'Jones',99980,45,'Payson','Arizona');
INSERT INTO EMPINFO (FIRST,LAST,ID,AGE,CITY,STATE) VALUES ('Mary' ,'Jones',99982,25,'Payson','Arizona');
INSERT INTO EMPINFO (FIRST,LAST,ID,AGE,CITY,STATE) VALUES ('Eric' ,'Edwards',88232,32,'San Diego','California');
INSERT INTO EMPINFO (FIRST,LAST,ID,AGE,CITY,STATE) VALUES ('Mary Ann' ,'Edwards',88233,32,'Phonix','Arizona');
INSERT INTO EMPINFO (FIRST,LAST,ID,AGE,CITY,STATE) VALUES ('Ginger' ,'Howell',98002,42,'Cottonwood','Arizona');
INSERT INTO EMPINFO (FIRST,LAST,ID,AGE,CITY,STATE) VALUES ('Sebastian' ,'Smith',92001,23,'Gila Bend','Arizona');
INSERT INTO EMPINFO (FIRST,LAST,ID,AGE,CITY,STATE) VALUES ('Gus' ,'Gray',22322,35,'Bagdad','Arizona');
INSERT INTO EMPINFO (FIRST,LAST,ID,AGE,CITY,STATE) VALUES ('Mary Ann' ,'May',32326,52,'Tuscon','Arizona');
INSERT INTO EMPINFO (FIRST,LAST,ID,AGE,CITY,STATE) VALUES ('Erica' ,'William',32327,60,'Show','Low Arizona');
INSERT INTO EMPINFO (FIRST,LAST,ID,AGE,CITY,STATE) VALUES ('Leoroy' ,'Brown',32380,22,'Pinetop','Arizona');
INSERT INTO EMPINFO (FIRST,LAST,ID,AGE,CITY,STATE) VALUES ('Elroy' ,'Cleaver',32382,22,'Globe','Arizona');

/*For Selecting all the data from the Table */
SELECT * FROM EMPINFO ;

/*For Selecting First , Last and City Column where first name starts with 'Er' */
SELECT FIRST,LAST,CITY FROM EMPINFO WHERE FIRST LIKE 'Er%' ;

/*For Selecting First , Last Column where last name starts with 'Er' */
SELECT FIRST , LAST FROM EMPINFO WHERE LAST LIKE '%s' ;

/*For Selecting all Columns where first name equal to  'Eric' */
SELECT * FROM EMPINFO WHERE FIRST = 'Eric' ;

/*For Selecting First , Age Column */
SELECT FIRST, AGE FROM EMPINFO ;

/*For Selecting First , Last and City Column where is not equal to 'Payson' */
SELECT FIRST , LAST , CITY FROM EMPINFO WHERE CITY <> 'Payson' ;

/*For Selecting all the Columns where age is greater than 40 */
SELECT * FROM EMPINFO WHERE AGE > 40 ;

/*For Selecting First , Last Column where last name ends with 'ay' */
SELECT FIRST , LAST FROM EMPINFO WHERE LAST LIKE '%ay' ;

/*For Selecting all the Column where first name equals to 'Mary' */
SELECT * FROM EMPINFO WHERE FIRST = 'Mary' ;

/*For Selecting all the  Columns where first contains 'Mar' */
SELECT * FROM EMPINFO WHERE FIRST LIKE '%Mar%' ;

/*For Selecting all the  Columns where last name contains 'illia' */
SELECT * FROM EMPINFO WHERE LAST LIKE '%illia%' ;

/*For Selecting First , Last , City, State Column where first name starts with 'J' */
SELECT FIRST  , LAST , CITY , STATE FROM EMPINFO WHERE FIRST LIKE 'J%' ;

/*For Selecting  Last and City Column where state is 'Arizona' and age is greater than 25  */
SELECT LAST , CITY FROM EMPINFO WHERE STATE ='Arizona' AND  AGE >25 ;

/*For Selecting all the  Columns where IDs are 32382,32326,99980 */
SELECT * FROM EMPINFO WHERE ID IN (32382,32326,99980) ;

/*For Selecting the count of employees where city equal to 'Payson' or 'Tuscon' */
SELECT COUNT(ID) AS NO_OF_EMPLOYEES FROM EMPINFO WHERE CITY ='Payson' OR CITY='Tuscon' ;

/*For Selecting First , Last name in a single column with a space between them  */
SELECT FIRST+' '+LAST FROM EMPINFO ;

/*For Selecting the first , city column for all the employees in a format like Hello John welcome to Payson City */
SELECT 'Hello ' + FIRST+ ' welcome to '+CITY + ' city' FROM EMPINFO ;

/*For Selecting all the Columns where the first and last name starts with the same alphabet */
SELECT * FROM EMPINFO WHERE SUBSTRING(FIRST , 1,1) = SUBSTRING(LAST , 1,1) ;

/*For Selecting distinct Cities */
SELECT DISTINCT CITY FROM EMPINFO ;

/*For Selecting the count of employees group by state */
SELECT STATE , COUNT(ID) AS TOTAL FROM EMPINFO GROUP BY STATE ;

/*For Selecting all the Columns order by age in descending order */
SELECT * FROM EMPINFO ORDER BY AGE DESC ;

/*For Selecting all the employees where age is between 30 and 50*/
SELECT * FROM EMPINFO WHERE AGE > 30 AND AGE <50 ;
 --or 
SELECT * FROM EMPINFO WHERE AGE BETWEEN 30 AND 50 ;

/*For updating the city where city equals to Phonix */
UPDATE EMPINFO
SET CITY = 'Phoenix' WHERE CITY='Phonix' ;

/*For Deleting the record where id equals to 22322 */
DELETE FROM EMPINFO WHERE ID=22322 ;

/*For Selecting the first employee order by age ascending */
SELECT TOP 1 * FROM EMPINFO ORDER BY AGE ASC ;

/*For Selecting the count of employees group by id having count more than 1 */
SELECT ID , COUNT(*) AS TOTAL FROM EMPINFO GROUP BY ID HAVING COUNT(*) >1 ;

/*For Selecting count and average age of all the employees */
SELECT COUNT(*) AS TOTAL , AVG(AGE) AS AVERAGE FROM EMPINFO ;

/*For Altering the Table*/
ALTER TABLE EMPINFO ADD DEPARTMENT VARCHAR(50) ;

/*For Updating the column */
UPDATE EMPINFO SET DEPARTMENT = 'HR' WHERE AGE >40 ;

/*For renaming the table name */
EXEC SP_RENAME 'EMPINFO' ,'EMP_DETAILS' ;

/*For Renaming the column Name */
EXEC SP_RENAME 'EMPINFO.AGE' ,'EMP_AGE','COLUMN' ;

/* Sub Query*/
SELECT * FROM EMPINFO WHERE AGE > (SELECT AVG(AGE) FROM EMPINFO ) ;

/* For name in Upper case */
SELECT UPPER(FIRST +' '+LAST) FROM EMPINFO ;

/*For selecting the employees whose first name ends with y and last name starts with S */
SELECT * FROM EMPINFO WHERE FIRST LIKE '%y' OR LAST LIKE 'S%' ;

/*For counting the employees group by city*/
SELECT CITY ,COUNT(*) AS TOTAL FROM EMPINFO GROUP BY CITY HAVING COUNT(*) >1 ;

/*For adding a column*/
ALTER TABLE EMPINFO 
ADD GENDER CHAR(1) ;

/*For updating the column */
UPDATE EMPINFO 
SET GENDER = NULL WHERE FIRST ='Mary' OR FIRST= 'Mary Ann' ;

/*For updating the column */
UPDATE EMPINFO 
SET GENDER = 'F' WHERE FIRST IN ('Mary','Mary Ann' );

/*Sub Query */
SELECT COUNT(*) FROM EMPINFO WHERE AGE > (SELECT AGE FROM EMPINFO WHERE ID=22322) ;

/*For selecting max age from all the employees */
SELECT MAX(AGE) FROM EMPINFO ;

/*For selecting the  details of employee having id 22322*/
SELECT * FROM EMPINFO WHERE ID = 22322 ;

/*For updating the column */
UPDATE EMPINFO 
SET CITY='Globecity' WHERE CITY='Globe' ;

/*For deleting the row*/
DELETE FROM EMPINFO WHERE STATE='Low Arizona' ;

/*For counting employees whose first name starts with an vowel */
SELECT COUNT(*) FROM EMPINFO WHERE FIRST LIKE '[AEIOUaeiou]%';

/*For selecting the employees whose name have more than 10 characters */
SELECT * FROM EMPINFO WHERE LEN(FIRST+' '+LAST) >10 ;

/*Sub Query */
SELECT FIRST FROM EMPINFO WHERE AGE IN (SELECT AGE  FROM EMPINFO GROUP BY AGE HAVING COUNT(*) >1 ) ;

/*For selecting employees whose last name and city name is same */
SELECT * FROM EMPINFO WHERE CITY = LAST ;

/*For selecting employees order by state and city */
SELECT * FROM EMPINFO ORDER BY STATE , CITY ;

/*For selecting the maximum age group by state*/
SELECT STATE , MAX(AGE)  FROM EMPINFO GROUP BY STATE ;
