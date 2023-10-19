-- 숫자 데이터 형식
-- SMALLINT : 정수 (-128 ~ 127)
-- INT : 정수 (-21억 ~ 21억)
-- BIGINT : 정수 (-900경 ~ 900경)
-- FLOAT : 소수점 아래 7자리까지 표현
-- DECIMAL(m, [d]) : 전체 자릿수(m)와 소수점 이하 자릿수(d)를 가진 숫자형

-- 문자 데이터 형식
-- CHAR(n) : 고정길이 문자형, CHAR(1)과 동일 (1 ~ 255)
-- VARCHAR(n) : 가변길이 문자형 (1 ~ 65535)
-- LONGTEXT : 최대 4GB 크기의 TEXT 데이터 값 (TEXT 형식), 대량의 데이터를 저장하기 위해 
-- LONGBLOB : 최대 4GB 크기의 BLOB 데이터 값 (BLOB 형식), 대량의 데이터를 저장하기 위해

-- 날짜와 시간 데이터 형식
-- DATE : 날짜 형식, 'YYYY-MM-DD' 형식으로 사용됨
-- DATETIME : 날짜 형식, 'YYYY-MM-DD HH:MM:SS' 형식으로 사용됨

-- 기타 데이터 형식 
-- GEOMETRY : 공간 데이터 형식으로 선, 점 및 다각형 같은 공간 데이터 개체를 저장하고 조작
-- JSON : JavaScript Object Notation 문서를 저장

-- 변수의 사용
-- 변수의 선언 및 값 대입 : SET @변수이름 = 변수의 값;
-- 변수의 값 출력 : SELECT @변수이름;

-- 데이터 형식 변환 함수
-- CAST ( expression AS 데이터형식 [ (길이) ] )
-- CONVERT ( expression, 데이터형식 [ (길이) ] )

-- USE sqldb;
SELECT AVG(amount) AS '평균 구매 개수' FROM buytbl;
SELECT CAST(AVG(amount) AS SIGNED INTEGER) AS '평균 구매 개수' FROM buytbl;
SELECT CONVERT(AVG(amount), SIGNED INTEGER) AS '평균 구매 개수' FROM buytbl;

-- 날짜 형식으로 변경
SELECT CAST('2020$12$12' AS DATE);
SELECT CAST('2020/12/12' AS DATE);
SELECT CAST('2020%12%12' AS DATE);
SELECT CAST('2020@12@12' AS DATE);

-- 결과를 보기 좋도록 처리할 때 사용
SELECT num, CONCAT(CAST(price AS CHAR(10)), ' X ', CAST(amount AS CHAR(4)), ' = ') AS '단가X수량', 
price * amount AS '구매액' FROM buytbl;

-- 암시적인 형 변환
SELECT '100' + '200';
SELECT CONCAT('100', '200');
SELECT CONCAT(100, '200');
SELECT 1 > '2mega';		-- 정수인 2로 변환되어서 비교
SELECT 3 > '2MEGA';		-- 정수인 2로 변환되어서 비교
SELECT 0 = 'mega2';		-- 문자는 0으로 변환됨

-- 제어 흐름 함수
-- IF(수식, 참, 거짓)
SELECT IF (100 > 200, '참이다', '거짓이다');

-- IFNULL(수식1, 수식2)
-- 수식1이 NULL이 아니면 수식1이 반환되고, 수식1이 NULL이면 수식2가 반환된다
SELECT IFNULL(NULL, '널이군요'), IFNULL(100, '널이군요');

-- NULLIF(수식1, 수식2)
-- 수식1과 수식2가 같으면 NULL을 반환하고 다르면 수식1을 반환한다
SELECT NULLIF(100, 100), NULLIF(200, 100);

-- CASE ~ WHEN ~ ELSE ~ END
SELECT CASE 10
	WHEN 1 THEN '일'
    WHEN 5 THEN '오'
    WHEN 10 THEN '십'
    ELSE '모름'
END AS 'CASE연습';