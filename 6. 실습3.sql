USE sqldb;
CREATE TABLE bigTbl1 (SELECT * FROM employees.employees);
CREATE TABLE bigTbl2 (SELECT * FROM employees.employees);
CREATE TABLE bigTbl3 (SELECT * FROM employees.employees);

DELETE FROM bigTbl1;
DROP TABLE bigTbl2;
TRUNCATE TABLE bigTbl3;

-- 대용량 테이블을 삭제
-- DML문인 DELETE는 트랜잭션 로그를 기록하는 작업 때문에 삭제가 오래 걸림
-- DDL문인 DROP문은 테이블 자체를 삭제하고 트랜잭션을 발생시키지 않음
-- DDL문인 TRUNCATE문은 DELETE와 동일하지만 트랜잭션 로그를 기록하지 않아서 속도가 빠름
-- 테이블 자체가 필요 없을 경우에 DROP
-- 테이블 구조는 남겨놓고 싶다면 TRUNCATE로 삭제해야 효율적