-- INSERT문
-- INSERT [INTO] 테이블 [(열1, 열2, ...)] VALUES (값1, 값2, ...)
USE SQLDB;
CREATE TABLE testTbl1 (id int, userName char(3), age int);
INSERT INTO testTbl1 VALUES (1, '홍길동', 25);
INSERT INTO testTbl1(id, userName) VALUES (2, '설현');
INSERT INTO testTbl1(userName, age, id) VALUES ('하니', 26, 3);

-- 자동으로 증가하는 AUTO_INCREMENT
USE SQLDB;
CREATE TABLE testTbl2
	(id int AUTO_INCREMENT PRIMARY KEY,
	 userName char(3),
     age int );
INSERT INTO testTbl2 VALUES (NULL, '지민', 25);
INSERT INTO testTbl2 VALUES (NULL, '유나', 22);
INSERT INTO testTbl2 VALUES (NULL, '유경', 21);
SELECT * FROM testTbl2;

-- 현재 어느 숫자까지 증가되었는지 확인할 때
SELECT LAST_INSERT_ID();

-- 특정값 이후부터 입력되도록 할 때
ALTER TABLE testTbl2 AUTO_INCREMENT = 100;
INSERT INTO testTbl2 VALUES (NULL, '찬미', 23);
SELECT * FROM testTbl2;

-- 초기값 설정 후 증가값 지정
USE SQLDB;
CREATE TABLE testTbl3
	(id int AUTO_INCREMENT PRIMARY KEY,
     userName char(3),
     age int );
ALTER TABLE testTbl3 AUTO_INCREMENT = 1000;
SET @@auto_increment_increment = 3;
INSERT INTO testTbl3 VALUES (NULL, '나연', 20);
INSERT INTO testTbl3 VALUES (NULL, '정연', 18);
INSERT INTO testTbl3 VALUES (NULL, '모모', 19);
SELECT * FROM testTbl3;

-- 한번에 여러개를 삽입
-- INSERT INTO 테이블이름 VALUES (값1, 값2, ...) , (값3, 값4, ...) , (값5, 값6, ...);

-- 대량의 샘플 데이터 생성
-- INSERT INTO 테이블이름 (열 이름1, 열 이름2, ...) SELECT문;
USE SQLDB;
CREATE TABLE testTbl4 (id int, Fname varchar(50), Lname varchar(50));
INSERT INTO testTbl4
	SELECT emp_no, first_name, last_name
		FROM employees.employees;

USE SQLDB;
CREATE TABLE testTbl5
	(SELECT emp_no, first_name, last_name FROM employees.employees);
    
-- 데이터의 수정 : UPDATE
UPDATE testTbl4
	SET Lname = '없음'
    WHERE Fname = 'Kyoichi';

UPDATE buytbl SET price = price * 1.5;

-- 데이터의 삭제 : DELETE FROM
USE SQLDB;
DELETE FROM testTbl4 WHERE Fname = 'Aamer';
DELETE FROM testTbl4 WHERE Fname = 'Aamer' LIMIT 5;