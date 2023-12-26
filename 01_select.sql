SELECT 
		  menu_code
		, menu_name
		, category_code
	FROM tbl_menu;

DESC tbl_category;


SELECT
		 category_code
		,category_name
		, ref_category_code
	FROM tbl_category;
	
SELECT
		 menu_name
		,category_name
	FROM tbl_menu a
	JOIN tbl_category b ON (a.category_code = b.category_code);
	
-- 	--------------------------------------------------------------------

SELECT 7 + 3;
SELECT 10 * 2;
SELECT 7 + 3 AS '합', 10 * 2 AS '곱';
SELECT 7 + 3 '합', 10 * 2 '곱';
SELECT 7 + 3 합, 10 * 2 곱;
SELECT 7 + 3 '합 입니다.', 10 * 2 '곱 입니다.';
-- SELECT 7 + 3 합 입니다., 10 * 2 곱 입니다.;

SELECT CONCAT('유 ', ' ', '관순'); -- select '유 관순';

SELECT NOW() AS '현재시'; 




