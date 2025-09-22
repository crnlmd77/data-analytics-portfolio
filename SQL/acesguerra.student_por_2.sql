--This dataset was managed from Mode.com | Dataset name acesguerra.student_por_2
--SELECT DATASET
select * from acesguerra.student_por_2;

--SELECT ALL SYNTAX
SELECT * FROM acesguerra.student_por_2;

--SELECT 1 COLUMN ONLY
SELECT school FROM acesguerra.student_por_2;
SELECT sex FROM acesguerra.student_por_2;
SELECT age FROM acesguerra.student_por_2;

--SELECT 2 COLUMNS
SELECT school, sex FROM acesguerra.student_por_2;
SELECT sex, age FROM acesguerra.student_por_2;
SELECT school, age FROM acesguerra.student_por_2;

--SELECT 3 COLUMNS
SELECT school, sex, age FROM acesguerra.student_por_2;

SELECT * FROM acesguerra.student_por_2;

--SQL DISTINCT STATEMENT
--SCHOOL: MS & GP
SELECT DISTINCT school FROM acesguerra.student_por_2;
--SEX: M & F
SELECT DISTINCT sex FROM acesguerra.student_por_2;
--AGE: 19, 18, 15, 22, 21, 20, 16, 17
--AGE [ 15-22 ]
SELECT DISTINCT age FROM acesguerra.student_por_2;

--2 COLUMMS SELECT DISTINCT
SELECT DISTINCT school, sex FROM acesguerra.student_por_2;
SELECT DISTINCT sex, age FROM acesguerra.student_por_1; 
SELECT DISTINCT school, age FROM acesguerra.student_por_2
ORDER BY 1,2; 

--3 COLUMNS SELECT DISTINCT
SELECT DISTINCT school, sex, age FROM acesguerra.student_por_2;

--SQL WHERE CLAUSE
--FILTER ALL STUDENTS
SELECT * FROM acesguerra.student_por_2
WHERE sex = 'M';

SELECT * FROM acesguerra.student_por_2
WHERE sex = 'F';

--GET ALL STUDENTS IN LEGAL AGE [18 and above]
SELECT * FROM acesguerra.student_por_2
WHERE age >= 18;

--CHECKING
SELECT DISTINCT AGE FROM acesguerra.student_por_2
WHERE age >= 18
;

--GET ALL MINOR STUDENTS
SELECT * FROM acesguerra.student_por_2
WHERE age < 18;
--CHECKING
SELECT DISTINCT AGE FROM acesguerra.student_por_2
WHERE age < 18;

--GET ALL STUDENTS IN LEGAL AGE [18 and above] USING GREATER THAN
SELECT * FROM acesguerra.student_por_2
WHERE age > 17;
--CHECKING
SELECT DISTINCT AGE FROM acesguerra.student_por_2
WHERE age > 17;

--GET ALL MINOR STUDENTS USING LESS THAN OR EQUAL TO 
SELECT * FROM acesguerra.student_por_2
WHERE age <= 17;
--CHECKING
SELECT DISTINCT AGE FROM acesguerra.student_por_2
WHERE age <= 17;

--LIMIT CLAUSE
SELECT * FROM acesguerra.student_por_2
LIMIT 5;

--SQL ORDER BY 
--2 COLUMNS
SELECT DISTINCT school, sex FROM acesguerra.student_por_2
ORDER BY school, sex;

--WITH  DESC
SELECT DISTINCT school, sex FROM acesguerra.student_por_2
ORDER BY school DESC, sex DESC;

SELECT DISTINCT sex, age FROM acesguerra.student_por_1; 
SELECT DISTINCT school, age FROM acesguerra.student_por_2
ORDER BY 1,2; 

--SELECT + FROM + WHERE + ORDER BY
--GET ALL FEMALE STUDENTS
--ARRANGE BY SCHOOL, SEX, AGE
--AGE HIGHEST TO LOWEST
SELECT * FROM acesguerra.student_por_2
WHERE SEX= 'F'
ORDER BY SCHOOL, SEX, AGE DESC;


--LOGICAL OPERATOR
--AND Operator
--GET ALL FEMALE WITH LEGAL AGE
SELECT * FROM acesguerra.student_por_2
WHERE sex = 'F'
AND age > 17
ORDER BY age;

--OR
--mjob = teacher OR services
SELECT * FROM acesguerra.student_por_2
WHERE (mjob = 'teacher' OR mjob = 'services');

--Combine AND and OR
--GET ALL FEMALE WITH LEGAL AGE WHOSE PARENTS MJOBS ARE EITHER TEACHER OR SERVICES
SELECT sex, age, mjob FROM acesguerra.student_por_2
WHERE sex = 'F'
AND age > 17
AND (mjob = 'teacher' OR mjob = 'services');


--NOT LEGAL AGE
SELECT * FROM acesguerra.student_por_2
WHERE NOT age > 17;

--NOT MINOR
SELECT * FROM acesguerra.student_por_2
WHERE NOT age <= 17;


--ORDER BY
SELECT 
  DISTINCT school,       --COLUMN 1
  sex                    --COLUMN 2
FROM acesguerra.student_por_2  
ORDER BY school DESC, sex DESC;

--ORDER BY COLUMN NUMBER
SELECT 
  DISTINCT school,       --COLUMN 1
  sex                    --COLUMN 2
FROM acesguerra.student_por_2  
ORDER BY 1 DESC, 2 DESC;


--IN/NOT IN
--mjob = teacher OR services
SELECT * FROM acesguerra.student_por_2
WHERE mjob IN ('teacher', 'services');

SELECT * FROM acesguerra.student_por_2
WHERE mjob NOT IN ('teacher', 'services');


--SQL LIKE and WILDCARD
--contains mother
--GRANDMOTHER, GODMOTHER, MOTHER, BROTHER
SELECT * FROM acesguerra.student_por_2
WHERE guardian LIKE '%mother%';


--BETWEEN/NOT BETWEEN
--AGE 10-19
--WHERE
SELECT * FROM acesguerra.student_por_2
WHERE age BETWEEN 10 AND  19 
ORDER BY age;

SELECT * FROM acesguerra.student_por_2
WHERE age NOT BETWEEN 10 AND  19 
ORDER BY age;

--TEXT VALUES
SELECT * FROM acesguerra.student_por_2
WHERE MJOB BETWEEN 'health' and 'sevices'
ORDER BY MJOB;

--DATE VALUES
SELECT * FROM tutorial.crunchbase_companies_clean_date
WHERE FOUNDED_AT_CLEAN BETWEEN '2013-01-01' AND '2013-01-31';

--IS NULL/IS NOT NULL
--TEST IF SCHOOL HAS NULL VALUES 
SELECT * FROM acesguerra.student_por_2
WHERE SCHOOL IS NULL;

SELECT * FROM acesguerra.student_por_2
WHERE SCHOOL IS NOT NULL;

--IS NULL
SELECT * FROM tutorial.aapl_historical_stock_price
WHERE HIGH IS NULL;

SELECT * FROM acesguerra.student_por_2;

SELECT * FROM acesguerra.student_por_2
WHERE G1 = 15;

SELECT * FROM acesguerra.student_por_2
WHERE GUARDIAN = 'other'
AND TRAVELTIME = 4;

SELECT * FROM acesguerra.student_por_2
WHERE (mjob = 'other' OR mjob = 'health');


SELECT * FROM acesguerra.student_por_2
WHERE G1 > 11;

SELECT sex, age, reason, guardian FROM acesguerra.student_por_2
WHERE TRAVELTIME < 2
AND STUDYTIME > 1;

SELECT DISTINCT MJOB FROM acesguerra.student_por_2;

SELECT DISTINCT FJOB, REASON, GUARDIAN, HEALTH FROM acesguerra.student_por_2;

SELECT 
  month,
  sum(volume) as total_volume
FROM tutorial.aapl_historical_stock_price
GROUP BY month
HAVING sum(volume) > 6000000000
ORDER BY month
;


--Week 2
--SQL Alias
--SEX ALIAS GENDER
SELECT sex from acesguerra.student_por_2;
SELECT SEX AS GENDER FROM acesguerra.student_por_2;

SELECT * FROM acesguerra.student_por_2;

SELECT
  mjob as mother_job,
  fjob as father_job,
  g1 as first_grading_grade,
  g2 as second_grading_grade,
  g3 as third_grading_grade
FROM acesguerra.student_por_2;


--SQL COUNT *
SELECT COUNT(*) FROM acesguerra.student_por_2;

--SQL COUNT(*) + ALIAS
--TOTAL STUDENTS: 649
SELECT COUNT(*) AS student_count from acesguerra.student_por_2;

--SQL COUNT(*) + ALIAS + WHERE
--FEMALE COUNT: 383
SELECT COUNT(*) AS FEMALE_STUDENT_COUNT FROM acesguerra.student_por_2
WHERE SEX = 'F';

--COUNT( specific column )
--SCHOOL: 649 ROWS
SELECT COUNT(SCHOOL) AS STUDENT_COUNT FROM acesguerra.student_por_2;
--SEX: 649 rows
SELECT COUNT(SEX) AS STUDENT_COUNT FROM acesguerra.student_por_2;
--age: 649 rows
SELECT COUNT(age) AS STUDENT_COUNT FROM acesguerra.student_por_2;


--NEW DATASET: 
SELECT * FROM tutorial.aapl_historical_stock_price;

SELECT
  COUNT(*) AS OVERALL_ROW_COUNT,
  COUNT(open) as open_row_count,
  COUNT(close) as close_row_count,
  COUNT(high) as high_row_count,
  COUNT(low) as low_row_count,
  COUNT(volume) as volume_row_count
FROM tutorial.aapl_historical_stock_price;

--checking
select * from tutorial.aapl_historical_stock_price
order by high desc;

--SQL COUNT DISTINCT
SELECT DISTINCT SCHOOL FROM acesguerra.student_por_2;
--UNIQUE SCHOOL COUNT= 2
SELECT COUNT(DISTINCT SCHOOL) AS UNIQUE_SCHOOL_COUNT FROM acesguerra.student_por_2;
--UNIQUE SEX COUNT= 2
SELECT COUNT(DISTINCT SEX) AS UNIQUE_GENDER_COUNT FROM acesguerra.student_por_2;
--UNIQUE AGE=8 = [15,22]
SELECT COUNT(DISTINCT AGE) AS UNIQUE_AGE_COUNT FROM acesguerra.student_por_2;

--SQL COUNT DISTINCT + ALIAS + WHERE
SELECT COUNT(DISTINCT AGE) AS UNIQUE_AGE_COUNT FROM acesguerra.student_por_2
WHERE SCHOOL = 'MS';

--CHECKING
SELECT DISTINCT AGE AS UNIQUE_AGE_COUNT FROM acesguerra.student_por_2
WHERE SCHOOL = 'MS'
ORDER BY 1;

--SQL COUNT DISTINCT + ALIAS + WHERE + AND
--UNIQUE MALE AGE IN MS=8 = [15,22]
SELECT COUNT(DISTINCT AGE) AS UNIQUE_AGE_COUNT FROM acesguerra.student_por_2
WHERE SCHOOL = 'GP'
AND SEX = 'M';

--UNIQUE FEMALE AGE IN MS=7 = [15,21]
SELECT COUNT(DISTINCT AGE) AS UNIQUE_AGE_COUNT FROM acesguerra.student_por_2
WHERE SCHOOL = 'GP'
AND SEX = 'F';

--GOAL: GET THE TOTAL TRAVEL TIME OF THE STUDENTS
SELECT TRAVELTIME FROM acesguerra.student_por_2;
--TRAVEL TIME = 1,018
SELECT SUM(TRAVELTIME) FROM acesguerra.student_por_2;

SELECT
  SUM(TRAVELTIME) AS TOTAL_TRAVEL_TIME,
  SUM(studytime) AS TOTAL_STUDY_TIME
FROM acesguerra.student_por_2;

--GOAL: GET THE TOTAL TRAVEL TIME OF THE STUDENTS FROM GP SCHOOL
SELECT * FROM acesguerra.student_por_2;
SELECT SCHOOL, TRAVELTIME FROM acesguerra.student_por_2;

SELECT SCHOOL, TRAVELTIME FROM acesguerra.student_por_2
WHERE SCHOOL = 'GP';

--605
SELECT SUM(TRAVELTIME) FROM acesguerra.student_por_2
WHERE SCHOOL = 'GP';

--1018 - 605 = 413
--413
SELECT SUM(TRAVELTIME) FROM acesguerra.student_por_2
WHERE SCHOOL = 'MS';

--SUM WITH EXPRESSION
--36,300 HOURS = 605 * 60
SELECT SUM(TRAVELTIME * 60) FROM acesguerra.student_por_2
WHERE SCHOOL = 'GP';

--SQL MIN/MAX
--SCHOOL-WIDE
--MIN: 15 YEARS OLD
--MAX: 22 YEARS OLD
SELECT
  MIN(AGE) AS YOUNGEST,
  MAX(AGE) AS OLDEST
FROM acesguerra.student_por_2;

--MS SCHOOL
--MIN: 15 YEARS OLD
--MAX: 20 YEARS OLD
SELECT
  MIN(AGE) AS YOUNGEST,
  MAX(AGE) AS OLDEST
FROM acesguerra.student_por_2
WHERE SCHOOL = 'MS';

--COMBINATION
--COUNT, SUM, MAX, MIN + alias
SELECT 
  COUNT(*) AS OVERALL_STUDENT_COUNT,
  SUM(absences) as total_absences,
  max(absences) as highest_absences,
  min(absences) as lowest_absences
FROM acesguerra.student_por_2
WHERE SCHOOL = 'GP'
and age > 20;

--SQL AVG
--AVERAGE AGE
--SUM: 10867
--COUNT: 649
--AVG: 16.7442
SELECT
  SUM(AGE) AS TOTAL_AGE,
  COUNT(AGE) AS COUNT_AGE_ROW,
  AVG(AGE) AS AVERAGE_AGE
FROM acesguerra.student_por_2;

--AVERAGE TRAVELTIME
--TRAVELTIME: 1.57 HOURS
SELECT AVG(TRAVELTIME) FROM acesguerra.student_por_2;

--AVG + WHERE
--MALE TRAVELTIME: 1.60 HOURS
SELECT AVG(TRAVELTIME) FROM acesguerra.student_por_2
WHERE SEX = 'M';

--AVG + WHERE
--FEMALE TRAVELTIME: 1.54 HOURS
SELECT AVG(TRAVELTIME) FROM acesguerra.student_por_2
WHERE SEX = 'F';

--SUBQUERY
--HIGHER THAN THE AVERAGE AGE
SELECT * FROM acesguerra.student_por_2
WHERE AGE > (SELECT AVG(AGE) FROM acesguerra.student_por_2)
ORDER BY AGE;

--LOWER OR EQUAL THAN THE AVERAGE AGE
SELECT * FROM acesguerra.student_por_2
WHERE AGE <= (SELECT AVG(AGE) FROM acesguerra.student_por_2)
ORDER BY AGE DESC;

SELECT * FROM tutorial.aapl_historical_stock_price;

SELECT COUNT (DISTINCT date)
FROM tutorial.aapl_historical_stock_price;

SELECT
  MAX(close) 
FROM tutorial.aapl_historical_stock_price;

SELECT SUM(volume) 
FROM tutorial.aapl_historical_stock_price
WHERE month = 3;

SELECT AVG(high) 
FROM tutorial.aapl_historical_stock_price;

--SQL GROUP BY
--GOAL: STUDENT COUNT PER SEX
SELECT SEX, COUNT(*) AS STUDENT_COUNT FROM acesguerra.student_por_2
GROUP BY SEX
;

--STUDENT COUNT PER NOMINATED GUARDIAN
--ADD ALIAS AND ORDER BY LOW TO HIGH
SELECT GUARDIAN, COUNT(GUARDIAN) AS STUDENT_COUNT FROM acesguerra.student_por_2
GROUP BY GUARDIAN
ORDER BY COUNT(GUARDIAN)
;

SELECT SEX, COUNT(*) AS STUDENT_COUNT, AVG(AGE) AS AVERAGE_AGE FROM acesguerra.student_por_2
GROUP BY SEX;

SELECT SEX, COUNT(*) AS STUDENT_COUNT, AVG(AGE) AS AVERAGE_AGE, MIN(absences) AS LOWEST_ABSENT, MAX(absences) AS HIGHEST_ABSENT FROM acesguerra.student_por_2
GROUP BY SEX;

--2 COLUMNS
SELECT SCHOOL, SEX, COUNT(*) AS STUDENT_COUNT FROM acesguerra.student_por_2
GROUP BY SCHOOL, SEX
ORDER BY SCHOOL, SEX
;

--3 COLUMNS 
SELECT
  SCHOOL,   --COLUMN 1
  SEX,      --COLUMN 2
  AGE,      --COLUMN 3
  COUNT(*) AS STUDENT_COUNT --COLUMN 4
FROM acesguerra.student_por_2
GROUP BY SCHOOL, SEX, AGE
ORDER BY SCHOOL, SEX, AGE DESC
;

--USING COLUMN NUMBER INSTEAD OF COLUMN NAME
SELECT
  SCHOOL,
  SEX AS GENDER,
  AGE,
  COUNT(*) AS STUDENT_COUNT
FROM acesguerra.student_por_2
GROUP BY 1,2,3
ORDER BY 1,2,3 DESC
;

--ADD WHERE & AND
--USING COLUMN NUMBER INSTEAD OF COLUMN NAME
SELECT
  SCHOOL,
  SEX AS GENDER,
  AGE,
  COUNT(*) AS STUDENT_COUNT
FROM acesguerra.student_por_2
WHERE guardian = 'mother'
  and mjob = 'teacher' 
GROUP BY 1,2,3
ORDER BY 1,2,3 DESC
--ORDER BY 1 (by defauly), 2 (by default), 3 DESC
;

--SQL HAVING CLAUSE
--2 COLUMNS
SELECT SCHOOL, SEX, COUNT(*) AS STUDENT_COUNT FROM acesguerra.student_por_2
GROUP BY SCHOOL, SEX
HAVING COUNT(*) > 100
ORDER BY SCHOOL, SEX
;

SELECT
  SCHOOL,   --COLUMN 1
  SEX,      --COLUMN 2
  AGE,      --COLUMN 3
  COUNT(*) AS STUDENT_COUNT --COLUMN 4
FROM acesguerra.student_por_2
GROUP BY SCHOOL, SEX, AGE
HAVING COUNT(*) < 10
ORDER BY SCHOOL, SEX, AGE DESC
;

--SUBQUERY
SELECT *
FROM
  (SELECT 
  SCHOOL,   --COLUMN 1
  SEX,      --COLUMN 2
  AGE,      --COLUMN 3
  COUNT(*) AS STUDENT_COUNT --COLUMN 4
FROM acesguerra.student_por_2
GROUP BY 1, 2, 3
--WHERE STUDENT_COUNT< 10
ORDER BY 1, 2, 3 DESC) AS sub
WHERE STUDENT_COUNT< 10
;

--SQL ROLLUP
SELECT
  guardian,
  count(*) as student_count
FROM acesguerra.student_por_2
group by guardian
order by 1;

SELECT
  guardian,
  count(*) as student_count
FROM acesguerra.student_por_2
GROUP BY ROLLUP (guardian)
ORDER BY 1;

--add COALESCE
SELECT
  COALESCE(guardian, 'Total_Students') as guardian,
  count(*) as student_count
FROM acesguerra.student_por_2
group by rollup (guardian)
order by 1;

--NUMERICAL FUNCTIONS
--ABS
SELECT ABS(-243.5);

--CEILING
SELECT
  CEIL(25.35) AS VALUE1,
  CEIL(25.55) AS VALUE2,
  CEIL(25.75) AS VALUE3;
  
--STRING FUNCTIONS
--CONCAT
SELECT CONCAT('AL JUN', ' ', 'ESGUERRA') AS FULL_NAME;
SELECT 'AL JUN' || ' ' || 'ESGUERRA' AS FULL_NAME;

--UPPER/LOWER
SELECT * FROM acesguerra.student_por_2;

SELECT * FROM acesguerra.student_por_2
WHERE GUARDIAN = 'MOTHER';

SELECT UPPER(GUARDIAN),* FROM acesguerra.student_por_2
WHERE UPPER(GUARDIAN) = 'MOTHER';

select * from acesguerra.student_por_2
where lower(sex) = 'f';

select CHAR_LENGTH('al jun');

select trim('al  jun');

--TAKE HOME EXERCISE 2
SELECT * FROM tutorial.aapl_historical_stock_price;
--1
SELECT
  year,
  month,
  sum(volume) AS total_of_volume
FROM tutorial.aapl_historical_stock_price
GROUP BY 1,2
ORDER BY 1,2
;

--2
SELECT
  month,
  MAX(close) 
FROM tutorial.aapl_historical_stock_price
GROUP BY month
ORDER BY MAX(close) DESC
;


--3
SELECT 
  month,
  sum(volume) as total_volume
FROM tutorial.aapl_historical_stock_price
GROUP BY month
HAVING sum(volume) > 6000000000
ORDER BY month
;

--ASSIGNMENT SQL Week 2
SELECT * FROM acesguerra.student_por_2;

--1
SELECT 
  sum(studytime) as total_studytime
FROM acesguerra.student_por_2;

--2
SELECT
  AVG(g1) AS average_g1,
  AVG(g2) AS average_g2,
  AVG(g3) AS average_g3
FROM acesguerra.student_por_2;

--3
--Get the student with most absences and get how old they are
SELECT 
  sex, 
  age, 
  absences
FROM acesguerra.student_por_2
ORDER BY absences DESC
LIMIT 1;

--4
--Student count per Age
SELECT age, COUNT(*) AS student_count
FROM acesguerra.student_por_2
GROUP BY age
ORDER BY age;

--5
--Student could per Gender
SELECT sex, COUNT(*) AS student_count
FROM acesguerra.student_por_2
GROUP BY sex
ORDER BY sex;

--6
--Student count per Guardian
SELECT guardian, COUNT(*) AS student_count
FROM acesguerra.student_por_2
GROUP BY guardian
ORDER BY guardian;

--7
--Student count per Age and Gender 
SELECT age, sex, COUNT(*) AS student_count
FROM acesguerra.student_por_2
GROUP BY age, sex
ORDER BY age, sex, student_count;