USE sqldb;
CREATE TABLE memberTBL (SELECT userID, name, addr FROM usertbl LIMIT 3);
ALTER TABLE memberTBL
	ADD CONSTRAINT pk_memberTBL PRIMARY KEY (userID);
SELECT * FROM memberTBL;

INSERT IGNORE INTO memberTBL VALUES('BBK', '비비코', '미국');
INSERT IGNORE INTO memberTBL VALUES('SJH', '서장훈', '서울');
INSERT IGNORE INTO memberTBL VALUES('HJY', '현주엽', '경기');
SELECT * FROM memberTBL;

INSERT INTO memberTBL VALUES('BBK', '비비코', '미국')
	ON DUPLICATE KEY UPDATE name = '비비코', addr = '미국';
INSERT INTO memberTBL VALUES('DJM', '동짜몽', '일본')
	ON DUPLICATE KEY UPDATE name = '동짜몽', addr = '일본';
SELECT * FROM memberTBL;

-- INSERT의 다양한 방식을 실습
-- IGNORE : 중복되어도 오류 무시
-- ON DUPLICATE KEY UPDATE : 중복이면 UPDATE 수행, 중복되지 않으면 INSERT 수행