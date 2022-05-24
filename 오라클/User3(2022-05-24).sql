--  여기는 user3 화면
--학생 entity 설계를 기준으로 tbl_student table 생성하기
DROP TABLE tbl_student;
CREATE TABLE tbl_student(
    st_num VARCHAR2(8) PRIMARY KEY,
    st_name nVARCHAR2(15) NOT NULL,
    st_grade NUMBER(1) DEFAULT NULL,
    st_tel VARCHAR2(13),
    st_addr nVARCHAR2(255)
);
--칼럼 바로 뒤에 PRIMARY KEY를 넣어서 식별자로 지정한다.
--PRIMARY KEY는 설정시 NOT NULL과 UNIQUE 속성을 자동적으로 가지게된다.(따로 안써줘도 된다)
-- 제약조건: NOT NULL 과 UNIQUE, 데이터베이스에 INSERT 시 데이터베이스의 무결성 유지 도움을 준다.
--UNIQUE가 설정된 칼럼은 절대 같은 데이터가 중복될수가 없다.
--DEFAULT NULL은 생략 가능 기본값이 NULL 이다.

INSERT  INTO tbl_student(st_num, st_name)
VALUES('20220001', '홍길동');

SELECT * FROM tbl_student;

--학과 테이블
--학과 코드는 PK로 선언하고
--학과 이름은 NULL 이거나 중복되지 않도록 설정
DROP TABLE tbl_dept;
CREATE TABLE tbl_dept(
    d_code VARCHAR2(5) PRIMARY KEY,
    d_name nVARCHAR2(20) NOT NULL UNIQUE,
    d_pro NVARCHAR2(15),
    d_class VARCHAR2(5)
);


-- 학생의 학과 소속 정보 Relation을 table로 생성
--Relation을 테이블로 설계할때 가장 유의 해야할 부분
--Entity table의 칼럼과 DOMAIN(TYPE과 길이: nVARCHAR2(20)-이런거 )를 반드시 일치 시켜야 한다.
--두개의 칼럼의 데이터를 묶어서 PK가 되어야한다. 중복값이 없어야 하므로.

--복수의 칼럼이 UNIQUE, NOT NULL로 선언되었다.
-- 이러한 경우 복수의 칼럼을 묶어 PK로 선언하기도 한다.
--테이블에 INSERT를 수행할때는 데이터 검증이 잘되어서 잘못된 데이터가 추가되는 것을 방지할 수 있다.
-- 하지만 UPDATE, DELETE를 수행할때는 복수의 칼럼으로 조건절을 수행해야 한다.
--이때 칼럼을 누락시키거나 잘못된 값으로 조건을 수행하여 데이터 무결성이 파괴될 수 있다.
--이럴때는 실제 데이터와 관련없는 단일 칼럼을 추가하고 PK로 설정하는 설계를 할 필요가 있다.
DROP TABLE tbl_belong;
CREATE TABLE tbl_belong(
    b_seq NUMBER PRIMARY KEY,
    b_stnum VARCHAR2(8) NOT NULL,
    b_dcode VARCHAR2(5) NOT NULL,
    UNIQUE(b_stnum, b_dcode)
);

SELECT * FROM tbl_student;

--전체 칼럼에 데이터포함하여 INSERT하기
INSERT INTO tbl_dept(d_code, d_name,d_pro,d_class)
VALUES('D0001','컴퓨터공학','홍길동','505');

--전체 칼럼에 정보를 입력할때는 ()를 생략가능하다
--하지만 정확히 칼럼순서와 데이터를 입력한 순서가 일치하는 보장이 없기때문에 권장하지 않는다.
INSERT INTO tbl_dept
VALUES('D0002','전자공학','이몽룡','506');

INSERT INTO tbl_belong(b_seq, b_stnum, b_dcode)
VALUES(1,'20220001','D0001');


INSERT INTO tbl_student(st_num, st_name)
VALUES ('20220001','홍길동');

INSERT INTO tbl_belong(b_seq,b_stnum,b_dcode)
VALUES(1,'20220001','D0001');

INSERT INTO tbl_dept(d_code, d_name)
VALUES('D0001', '컴퓨터 공학');



SELECT ST.st_num, ST.st_name, B.b_dcode, ST.st_grade
FROM tbl_student ST
    LEFT JOIN tbl_belong B
        ON ST.st_num = B.b_stnum;
        
SELECT ST.st_num, ST.st_name, B.b_dcode, ST.st_grade, D.d_name
FROM tbl_student ST
    LEFT JOIN tbl_belong B
        ON ST.st_num = B.b_stnum
    LEFT JOIN tbl_dept D
        ON B.b_dcode = D.d_code;









