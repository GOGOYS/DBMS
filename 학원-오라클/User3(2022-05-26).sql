--user3
INSERT INTO tbl_student(st_num, st_name, st_grade, st_addr, st_tel);

DROP TABLE tbl_user;
CREATE TABLE tbl_user(
    username VARCHAR2(30) PRIMARY KEY,
    password VARCHAR2(128) NOT NULL,
    name nVARCHAR2(50),
    email VARCHAR2(125),
    role VARCHAR2(10)
);

SELECT * FROM tbl_user;

UPDATE tbl_student
SET st_tel = '010-111-1111'
WHERE st_num = '20220001';

COMMIT;
