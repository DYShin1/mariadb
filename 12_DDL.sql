CREATE TABLE IF NOT EXISTS tbl (
    pk INT PRIMARY KEY,
    fk INT,
    coll VARCHAR(255),
    CHECK(coll IN ('Y', 'N'))
) ENGINE=INNODB;

DESC tbl;

INSERT
  INTO tbl
VALUES
(
    1, 2, 'Y'
);

-- ---------------------------------------
-- auto_increment
CREATE TABLE IF NOT EXISTS tb2 (
    pk INT PRIMARY KEY AUTO_INCREMENT,
    fk INT,
    coll VARCHAR(255),
    CHECK(coll IN ('Y', 'N'))
) ENGINE=INNODB;

DESC tb2;

INSERT
  INTO tb2
VALUES
(
    NULL, 2, 'Y'
);

SELECT * FROM tb2;

-- --------------------------------------
-- ALTER
-- 컬럼 추가
ALTER TABLE tb2 ADD col2 INT NOT NULL;

desc tb2;

-- 컬럼 삭제
ALTER TABLE tb2 DROP COLUMN col2;

DESC tb2;

-- 컬럼 이름 및 컬럼 정의 변경
ALTER TABLE tb2
CHANGE COLUMN fk change_fk INT NOT NULL;

DESC tb2;