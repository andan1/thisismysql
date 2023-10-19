-- SELECT문
-- 원하는 데이터를 가져와 주는 기본적인 <SELECT...FROM>

-- USE 구문
-- USE 데이터베이스_이름;
USE employees;

-- SELECT와 FROM
SELECT * FROM titles;
SELECT * FROM employees.titles;
SELECT first_name, last_name, gender FROM employees;

-- 특정한 조건의 데이터만 조회하는 <SELECT...FROM...WHERE>

-- WHERE절
-- SELECT 필드이름 FROM 테이블이름 WHERE 조건식;
SELECT * FROM usertbl WHERE name = '김경호';

-- 관계 연산자 사용
SELECT userID, Name FROM usertbl WHERE birthYear >= 1970 AND height >= 182;
SELECT userID, Name FROM usertbl WHERE birthYear >= 1970 OR height >= 182;

-- BETWEEN, AND, IN, LIKE
SELECT name, height FROM usertbl WHERE height >= 180 AND HEIGHT <= 183;
SELECT name, height FROM usertbl WHERE height BETWEEN 180 AND 183;
SELECT name, addr FROM usertbl WHERE addr = '경남' OR addr = '전남' OR addr = '경북';
SELECT name, addr FROM usertbl WHERE addr IN ('경남', '전남', '경북');
SELECT name, height FROM usertbl WHERE name LIKE '김%';
SELECT name, height FROM usertbl WHERE name LIKE '_종신';

-- ANY, ALL, SOME, 서브쿼리
SELECT name, height FROM usertbl WHERE height > 177;
SELECT name, height FROM usertbl WHERE height > (SELECT height FROM usertbl WHERE Name = '김경호');
SELECT name, height FROM usertbl WHERE height >= (SELECT height FROM usertbl WHERE addr = '경남');	-- 하위쿼리가 둘 이상의 값을 반환하기 때문
SELECT name, height FROM usertbl WHERE height >= ANY (SELECT height FROM usertbl WHERE addr = '경남');
SELECT name, height FROM usertbl WHERE height >= ALL (SELECT height FROM usertbl WHERE addr = '경남');
SELECT name, height FROM usertbl WHERE height = ANY (SELECT height FROM usertbl WHERE addr = '경남');	-- =ANY는 IN과 동일한 구문

-- ORDER BY
SELECT name, mDate FROM usertbl ORDER BY mDate;			-- 오름차순
SELECT name, mDate FROM usertbl ORDER BY mDate DESC;	-- 내림차순
SELECT name, height FROM usertbl ORDER BY height DESC, name ASC;

-- DISTINCT (중복 삭제)
SELECT addr FROM usertbl;
SELECT addr FROM usertbl ORDER BY addr;
SELECT DISTINCT addr FROM usertbl;

-- LIMIT (출력하는 개수 제한)
SELECT emp_no, hire_date FROM employees ORDER BY hire_date LIMIT 5;
SELECT emp_no, hire_date FROM employees ORDER BY hire_date LIMIT 0, 5;		-- LIMIT 5 OFFSET 0 과 동일

-- CREATE TABLE ... SELECT (테이블 복사)
-- CREATE TABLE 새로운테이블 (SELECT 복사할열 FROM 기존테이블)
-- Primary Key 및 Foreign Key등의 제약조건은 복사가 안됨
CREATE TABLE buytbl2 (SELECT * FROM buytbl);
SELECT * FROM buytbl2;
CREATE TABLE buytbl3 (SELECT userID, prodName FROM buytbl);
SELECT * FROM buytbl3;

-- GROUP BY 및 HAVING 그리고 집계 함수

-- GROUP BY절
SELECT userID, amount FROM buytbl ORDER BY userID;
SELECT userID, SUM(amount) FROM buytbl GROUP BY userID;
SELECT userID, SUM(amount * price) FROM buytbl GROUP BY userID;

-- 집계 함수
-- AVG() : 평균
-- MIN() : 최소값
-- MAX() : 최대값
-- COUNT() : 행의 개수
-- COUNT(DISTINCT) : 행의 개수(중복 제외)
-- STDEV() : 표준편차
-- VAR_SAMP() : 분산
SELECT AVG(amount) FROM buytbl;
SELECT userID, AVG(amount) FROM buytbl GROUP BY userID;
SELECT name, height FROM usertbl WHERE height = (SELECT MAX(height) FROM usertbl) OR height = (SELECT MIN(height) FROM usertbl);
SELECT COUNT(mobile1) FROM usertbl;

-- HAVING절 (조건 제한)
SELECT userID, SUM(price * amount) FROM buytbl GROUP BY userID;
SELECT userID, SUM(price * amount) FROM buytbl GROUP BY userID HAVING SUM(price * amount) > 1000;

-- ROLLUP (총합 또는 중간 합계)
SELECT num, groupName, SUM(price * amount) FROM buytbl GROUP BY groupName, num WITH ROLLUP;

-- SQL의 분류
-- DML : 데이터 조작 언어, 데이터를 조작(선택, 삽입, 수정, 삭제)하는데 사용되는 언어, 트랜잭션이 발생하는 SQL
-- SELECT, INSERT, UPDATE, DELETE
-- DDL : 데이터 정의 언어, 데이터베이스 개체를 생성/삭제/변경하는 역할		 
-- CREATE, DROP, ALTER
-- DCL : 데이터 제어 언어, 어떤 권한을 부여하거나 빼앗을 때
-- GRANT, REVOKE, DENY