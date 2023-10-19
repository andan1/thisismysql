-- WITH절은 CTE를 표현하기 위한 구문
-- CTE는 기존의 뷰, 파생 테이블, 임시 테이블 등으로 사용되던 것을 대신할 수 있음

-- 비재귀적 CTE
-- 복잡한 쿼리문장을 단순화시키는 데에 적합하게 사용
USE sqldb;
SELECT userid AS '사용자', SUM(price * amount) AS '총구매액'
	FROM buyTBL GROUP BY userid;

WITH abc(userid, total)
AS
(SELECT userid, SUM(price * amount) FROM buytbl GROUP BY userid)
SELECT * FROM abc ORDER BY total DESC;

WITH cte_userTBL(addr, maxHeight)
AS
(SELECT addr, MAX(height) FROM usertbl GROUP BY addr)
SELECT AVG(maxHeight * 1.0) AS '각 지역별 최고키의 평균' FROM cte_usertbl;