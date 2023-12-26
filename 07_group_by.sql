-- 조회의 6가지 절을 모두 활용한 예제
-- select: gourp by 절에서 gourp을 묶는 조건으로 활용한 컬럼만 조회 또는 그룹 함수를 통해 조회한다.

-- from: 테이블 또는 join을 활용한 result set을 작성한다.

-- where: from절의 각 행 마다 적용될 조건을 작성한다.

-- group by: where절까지 만족하는 행들에 대해 그룹이 될 컬럼을 작성한다.

-- having: 그룹별로 적용할 조건을 group by에서 작성한 컬럼 또는 그룹 함수를 통해 조회한다.

-- order by: 제일 마지막에 해석되며 select의 결과(result set)의 순번, 별칭, 컬럼명 등으로 오름차순 또는 내림차순한다.


SELECT
       category_code
     , COUNT(*)
     , COUNT(category_code)
     , SUM(menu_price)
     , AVG(menu_price)
  FROM tbl_menu JOIN 
 WHERE category_code IS NOT NULL
 GROUP BY category_code
HAVING SUM(menu_price) >= 24000 -- 그룹 필터링 
 ORDER BY 2;
 
 
SELECT
       COUNT(*)
     , COUNT(a.menu_name)
  FROM tbl_menu a
 RIGHT JOIN tbl_category b ON (a.category_code = b.category_code);
 
-- --------------------------------------------------------------------
-- 함수의 종류
-- 단일행 함수: nvl 또는 ifnull과 같이 단일 행마다 적용되어 행의 갯수만큼 결과가 나오는 경우
-- 그룹 함수: count, sum, avg와 같이 그룹마다 적용되어 그룹의 갯수만큼 결과가 나오는 경우 
--            (단, groud by절이 없는 조회는 그룹 함수의 결과가 단일행이다.)

-- ---------------------------------------------------------------------
-- rollup
-- 중간 합계 및 최종 합계를 도출
-- group by에서 두 개 이상의 컬럼으로 그룹 형성 시 

-- 앞의 컬럼을 기준으로 중간 합계가 나오게 된다.
SELECT
       menu_price
     , category_code
     , SUM(menu_price)
  FROM tbl_menu
 GROUP BY menu_price, category_code
  WITH ROLLUP;

CREATE TABLE sales (
    CODE INT auto_increment,
	 YEAR VARCHAR(4),
	 MONTH VARCHAR(2),
	 product VARCHAR(50),
	 amount DECIMAL(10, 2),
	 PRIMARY KEY(CODE) 
);

INSERT
  INTO sales
(
  CODE, YEAR, MONTH
, product, amount
)
VALUES
(
  NULL, '2023', LPAD('1', 2, '0')
, 'Product A', 1000.00
),
(
  NULL, '2023', LPAD('1', 2, '0')
, 'Product B', 1500.00
),
(
  NULL, '2023', LPAD('2', 2, '0')
, 'Product A', 2000.00
),
(
  NULL, '2023', LPAD('2', 2, '0')
, 'Product B', 2500.00
),
(
  NULL, '2023', LPAD('3', 2, '0')
, 'Product A', 1200.00
),
(
  NULL, '2024', LPAD('3', 2, '0')
, 'Product B', 1700.00
);

SELECT * FROM sales;

-- 연, 월, 상품명을 모두 하나의 그룹으로 묶어
-- 연, 월 중간 합계 및 전체 합계를 rollup으로 구해 보자.
SELECT
       year
     , month
     , product
     , SUM(amount) AS total_sales
  FROM sales
 GROUP BY YEAR, MONTH, product
  WITH ROLLUP;