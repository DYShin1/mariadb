-- Active: 1703639117901@@127.0.0.1@3307@menudb
-- 명시적 형변환
SELECT AVG() FROM tbl_menu;
-- 1) 숫자 -> 숫자
-- 소수점에서 반올림해 정수까지 변환
SELECT CAST(AVG(menu_price) AS unsigned integer) as '가격평균' FROM tbl_menu;

-- 소수점 이하 한자리까지 변환
SELECT CAST(AVG(menu_price) AS FLOAT) as '가격평균' FROM tbl_menu;
-- 소수점 이하 12자리까지 변환
SELECT CAST(AVG(menu_price) AS DOUBLE) as '가격평균' FROM tbl_menu;

-- 2) 문자 -> 날짜
-- 2023년 12월 27일을 date형으로 변환
SELECT CAST('2023$12$27' AS DATE);
SELECT CONVERT('2023/12/27' AS DATE);
SELECT CONVERT('2023-12-27' AS DATE);
SELECT CONVERT('2023#12#27' AS DATE);

-- 3) 숫자 -> 문자
SELECT CONCAT(CAST(1000 as CHAR), '원');

-- 암시적 형변환
-- 연산자 사용 시 자동 형변환이 되는데 주의해야 한다.

SELECT 1 + '2'; -- '2'가 숫자 2로 변환
SELECT '1' + '2'; -- 모든 문자는 산술연산자 또는 비교 연산을 만나면 0이 된다.

SELECT '안녕' + '하세요';
SELECT 5 > '반가워'; -- true의 의미인 1이 반환된다.
