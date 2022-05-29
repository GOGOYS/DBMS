SELECT 30 + 40 FROM DUAL;
CREATE TABLE tbl_book(
    b_name varchar2(100)
);

-- tbl_book의 속성을 보여달라
DESC tbl_book;

SELECT * FROM tbl_book;

INSERT INTO tbl_book(b_name)
VALUES('자바야놀자');

--이곳은 user1 작업 화면이다.