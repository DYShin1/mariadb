-- 1. 문자열 관련 함수
-- ASCII(아스키 코드), CHAR(숫자)
SELECT ASCII('A'), CHAR(97);

-- BIT_LENGTH(문자열), CHAR_LENGTH(문자열), LENGTH(문자열)
-- 영어, 숫자, 특수기호 제외 한 문자당 3바이트 할당
SELECT
         BIT_LENGTH('한글')
       , CHAR_LENGTH('한글')
       , LENGTH('한글');

-- CONCAT(문자열1, 문자열2, ...), CONCAT_WS(구분자, 문자열1, 문자열2)
SELECT CONCAT('nice', ' to', ' meet', ' you!');
SELECT CONCAT_WS(' ', 'nice', 'to', 'meet', 'you!');
SELECT CONCAT(CAST(menu_price as char), '원') FROM tbl_menu;

-- ELT(위치, 문자열1, 문자열2, ...ADD, FIELD(찾을 문자열, 문자열1, 문자열2, ...),
-- FIND_IN_SET(찾을 문자열, 문자열 리스트), INSTR(기준 문자열, 부분 문자열),
-- LOCATE(부분 문자열, 기준 문자열)
SELECT
         ELT(2, '축구', '야구', '농구')
       , FIELD('축구', '야구', '농구', '축구')
       , FIND_IN_SET('축구', '야구,농구,축구')
       , INSTR('축구농구야구', '농구')
       , LOCATE('야구', '축구농구야구');  -- INSTR과 LOCATE는 서로 인자가 반대

-- insert(기준문자열, 위치, 해당 위치에서 지울 길이, 삽입할 문자열)
SELECT INSERT('나와라 피카츄!', 5, 3, '꼬부기');

-- left(문자열, 길이), right(문자열, 길이)
SELECT LEFT('hello world!', 5), RIGHT('nice shot!', 5);

-- upper(문자열), lower(문자열)
SELECT UPPER('hello world!'), LOWER('hello world!');

-- lpad(문자열, 길이, 채울 문자열), rpad(문자열, 길이, 채울 문자열)
SELECT LPAD('왼쪽', 10, '#'), RPAD('오른쪽', 10, '#');

-- ltrim(문자열), rtrim(문자열)
-- trim(문자열), trim(방향 자를_문자열 from 문자열)
SELECT LTRIM('               왼   쪽'), RTRIM('   오른      쪽       ');
SELECT
         TRIM('      mariadb           ')
       , TRIM(BOTH '@' FROM '@@@@mariadb@@@@')
       , trim(LEADING '@' FROM '@@@@@@mariadb@@@@@@')
       , trim(TRAILING '@' FROM '@@@@@@mariadb@@@@@@');

SELECT CONCAT(menu_name, '의 가격은 ', menu_price, '입니다.') FROM tbl_menu;
-- 2. 숫자 관련 함수



-- 3. 날짜 및 시간 관련 함수

