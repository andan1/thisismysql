DROP DATABASE IF EXISTS sqldb;
CREATE DATABASE sqldb;
USE sqldb;
CREATE TABLE usertbl					  -- 회원 테이블
( userID	CHAR(8) NOT NULL PRIMARY KEY, -- 사용자 아이디
  name 		VARCHAR(10) NOT NULL,		  -- 이름
  birthYear	INT NOT NULL,				  -- 출생연도
  addr		CHAR(2) NOT NULL,			  -- 지역번호
  mobile1	CHAR(3),					  -- 휴대폰 앞자리
  mobile2 	CHAR(8),					  -- 나머지 번호
  height	SMALLINT,					  -- 키
  mDate		DATE						  -- 회원 가입일
);
CREATE TABLE buytbl											-- 회원 구매 테이블
( num			INT AUTO_INCREMENT NOT NULL PRIMARY KEY,	-- 순번
  userID		CHAR(8) NOT NULL,							-- 아이디
  prodName		CHAR(6) NOT NULL,							-- 물품명
  groupName 	CHAR(4),									-- 분류
  price			INT NOT NULL,								-- 단가
  amount		SMALLINT NOT NULL,							-- 수량
  FOREIGN KEY (userID) REFERENCES usertbl (userID)
);
SELECT * FROM usertbl;
SELECT * FROM buytbl;