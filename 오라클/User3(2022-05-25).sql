--user3로 접속한 화면

DROP TABLE tbl_student;
DROP TABLE tbl_dept;
DROP TABLE tbl_belong;

--학생 정보 테이블
CREATE TABLE tbl_student(
    ST_NUM	VARCHAR2(8)	PRIMARY KEY,
    ST_NAME	NVARCHAR2(15)	NOT NULL,
    ST_GRADE	NUMBER(1,0),
    ST_TEL	VARCHAR2(13),
    ST_ADDR	NVARCHAR2(255)
);

--학과 정보 테이블
CREATE TABLE tbl_dept(
    D_CODE	VARCHAR2(5)	PRIMARY KEY,
    D_NAME	NVARCHAR2(20) NOT NULL,
    D_PRO	NVARCHAR2(15),
    D_CLASS	VARCHAR2(5)
);

--소속 정보 테이블
CREATE TABLE tbl_belong(
    B_SEQ	NUMBER	PRIMARY KEY,
    B_STNUM	VARCHAR2(8) NOT NULL,
    B_DCODE	VARCHAR2(5) NOT NULL,
    UNIQUE(b_stnum, b_dcode)
);

--학생정보 샘플데이터 추가
INSERT INTO tbl_student(st_num,st_name,st_grade)
VALUES('20220001','홍길동',1);
INSERT INTO tbl_student(st_num,st_name,st_grade)
VALUES('20220002','이몽룡',2);
INSERT INTO tbl_student(st_num,st_name,st_grade)
VALUES('20220003','성춘향',3);


--학과 정보 샘플데이터 추가
INSERT INTO tbl_dept(d_code,d_name,d_pro,d_class)
VALUES('D0001','컴퓨터공학','장영실','505');
INSERT INTO tbl_dept(d_code,d_name,d_pro,d_class)
VALUES('D0002','컴퓨터조립공학','임꺽정','506');
INSERT INTO tbl_dept(d_code,d_name,d_pro,d_class)
VALUES('D0003','컴퓨터분해공학','이소룡','507');

--소속정보 샘플데이터 추가
INSERT INTO tbl_belong(b_seq,b_stnum,b_dcode)VALUES(1,'20220003','D0003');
INSERT INTO tbl_belong(b_seq,b_stnum,b_dcode)VALUES(2,'20220001','D0001');
INSERT INTO tbl_belong(b_seq,b_stnum,b_dcode)VALUES(3,'20220001','D0002');
INSERT INTO tbl_belong(b_seq,b_stnum,b_dcode)VALUES(4,'20220002','D0001');
INSERT INTO tbl_belong(b_seq,b_stnum,b_dcode)VALUES(5,'20220002','D0003');
INSERT INTO tbl_belong(b_seq,b_stnum,b_dcode)VALUES(6,'20220003','D0002');


/*
 테이블에 일련번호 칼럼이 있을경우 
 중복되지 않은 일련번호를 사용하여 PK로 설정한다.
 오라클 이외의 다른 DBMS에서는 AUTO INCREMENT라는 속성을 사용하여 
 데이터를 INSERT할때 자동으로 칼럼 데이터를 추가한다.
 하지만 오라클에는 그런 속성이 없어서 불편하다.
 
 오라클에서는 SEQUENCE라는 특별한 객체가 있어서
 그 객체를 사용하여 같은 효과를 발휘한다.
 
 또는 PK 해당하는 칼럼을 문자열 32byte 크기로 설정하고
 UUID를 사용하기도 한다.
 프로그래밍언어 (JAVA, C언어,  python: 호스트 언어)와 함께
 프로젝트를 할때는 UUID를 사용한다.
*/

--seq_belong 이라는 SEQUENCE 객체를 생성하고
--시작값을 1로 자동 증가 옵션을 1로 설정하였다.
CREATE SEQUENCE seq_belong
INCREMENT BY 1 START WITH 1;

--seq_belong SEQUENCE의 NEXTVAL 값을 조회 하라
--NEXTVAL 값은 호출(SELECT)등을 할때마다 항상 1씩 증가된 값을 보여준다.
SELECT seq_belong.NEXTVAL FROM DUAL;

--표준 sql에서 간단한 사칙 연산을 수행하는 방법
--오라클에서는 SELECT 명령문이 FROM 절 없이 수행하는 것이 불가능 하다.
--그래서 의미 없는(DUMY)table인 DUAL 테이블을 사용하여 FROM 절을 붙여준다.
SELECT 10 + 20 FROM DAUL;
SELECT 100 * 100 FROM DAUL;
SELECT 100 - 10 FROM DAUL;

--SEQUENCE를 사용하여 자동 증가하는 SEQ를 만들고 INSERT에서 사용하기
INSERT INTO tbl_belong(b_seq, b_stnum,b_dcode)VALUES(seq_belong.NEXTVAL, '20220003','D0004');
INSERT INTO tbl_belong(b_seq, b_stnum,b_dcode)VALUES(seq_belong.NEXTVAL, '20220003','D0005');
INSERT INTO tbl_belong(b_seq, b_stnum,b_dcode)VALUES(seq_belong.NEXTVAL, '20220003','D0006');

SELECT * FROM tbl_belong;

--tbl_student, tbl_dept, tbl_dept 3개의 table을 LEFT JOIN하여
--학번, 이름, 학과코드, 학과명, 학년을 표시하는 SELECT문 작성

SELECT st.st_num, ST.st_name,B.b_dcode,D.d_name,ST.st_grade
FROM tbl_student ST
    LEFT JOIN tbl_belong B
        ON ST.st_num = B.b_stnum
    LEFT JOIN tbl_dept D
        ON B.b_dcode = D.d_code;

--projection 칼럼을 제한하여 보여주기
SELECT st_num, st_name, st_grade
FROM tbl_student;

--학생정보를 확인하면서 어떤 학과에 소속되었는지를 알고 싶다.
--소속은 tbl_belong에 저장되어 있다
SELECT st_num, st_name, st_grade
FROM tbl_student;
--20220001 학생이 어떤 학과 소속인지 알고 싶다
SELECT *
FROM tbl_belong
WHERE b_stnum = '20220001';

--20220001 학생이 D0001 인것을 확인했다
--D0001 학과이름이 무엇인지 궁금하다
SELECT *
FROM tbl_dept
WHERE d_code = 'D0001';



SELECT ST.st_num, ST.st_name,B.b_dcode,D.d_name,ST.st_grade
FROM tbl_student ST
    LEFT JOIN tbl_belong B
        ON ST.st_num = B.b_stnum
    LEFT JOIN tbl_dept D
        ON B.b_dcode =D.d_code
ORDER BY st_num, b_dcode;
        
        
SELECT ST.st_num, ST.st_name,B.b_dcode,D.d_name,ST.st_grade
FROM tbl_student ST ,tbl_belong B,tbl_dept D
WHERE ST.st_num = B.b_stnum AND B.b_dcode =D.d_code;


--학생, 학과, 소속 테이블간의 FK 설정하기
--1. FK 설정하기에 앞서 참조 무결성 관계를 조회하기
--다음의 SQL 결과에서 결과가 한개도 없어야 참조 무결성 관계가 성립된다.
SELECT st.st_num, ST.st_name,B.b_seq,B.b_dcode,D.d_name,ST.st_grade
FROM tbl_student ST
    LEFT JOIN tbl_belong B
        ON ST.st_num = B.b_stnum
    LEFT JOIN tbl_dept D
        ON B.b_dcode = D.d_code
WHERE ST_NUM IS NULL OR D_NAME IS NULL;  

--위의 SQL 겨과 참조 무결성이 성립되지 않는 데이터들은 
-- 11,12,13의 seq값을 가지고 있다.
--2. 참조 무결성이 성립되지 않은 데이터를 삭제한다.
DELETE FROM tbl_belong 
WHERE b_seq IN (11,12,13);

SELECT b_seq, b_stnum, b_dcode, st_num, d_name
FROM tbl_belong
    LEFT JOIN tbl_student
        ON b_stnum = st_num
    LEFT JOIN tbl_dept
        ON b_dcode = d_code
WHERE st_num IS NULL OR d_name IS NULL;

--3.테이블간의 참조무결성 제약조건을 부여한다.
--참조 무결성 제약조건을 테이블에 추가하는데
--이때는 Relation 테이블에 추가한다.

--테이블에 FK를 추가하여 참조 무결성 제약 조건을 부여한다.
ALTER TABLE tbl_belong 
ADD CONSTRAINT FK_tbl_student
FOREIGN KEY(b_stnum)
REFERENCES tbl_student(st_num);

ALTER TABLE tbl_belong
ADD CONSTRAINT FK_tbl_dept
FOREIGN KEY(b_dcode)
REFERENCES tbl_dept(d_code);


SELECT * FROM tbl_student;
/*
20220001	홍길동	1
20220003	성춘향	3
20220002	이몽룡	2
*/

SELECT * FROM tbl_dept;

/*
D0001	컴퓨터공학	장영실
D0002	컴퓨터조립공학	임꺽정
D0003	컴퓨터분해공학	이소룡
*/

SELECT * FROM tbl_belong;
/*
1	20220003	D0003
2	20220001	D0001
3	20220001	D0002
4	20220002	D0001
5	20220002	D0003
6	20220003	D0002
*/

--tbl_student에 아직 추가되지 않은 학번을  tbl_belong 테이블에 추가하기
--tbl_student에 아직 없는  20220004 학번을 추가하려고 하였더니
--parent key not found 오류가 발생한다.
INSERT INTO tbl_belong(b_seq,b_stnum,b_dcode)
VALUES(seq_belong.NEXTVAL,'20220004','D0003');
--먼저 tbl_student에 해당 학번의 학생정보를 추가해 두어야 한다.
--tbl_student에 아래의 데이터를 추가한 후 다시 위의 SQL을 실행하면 정상 추가가 된다.
INSERT INTO tbl_student(st_num, st_name, st_grade)VALUES('20220004','장보고',2);

--tbl_belong 에 등록된 학번의 정보를 tbl_student에서 삭제하려고 한다
--이미 tbl_belong에 등록된 학번이므로 학번의 정보를 삭제할 수 없다.
--child key found
--FK를 설정할때
--parent table의 데이터를 삭제하려고 할때 child table에 데이터가 있으면 삭제 금지
--parent tlble의 데이터를 변경(update)하려고 할때 child table에 데이터가 있으면 변경 금지

--FK의 옵션을 지정하여 parent의 정보가 삭제되면, child 데이터를 모두 삭제하거나
--parent의 데이터가 변경되면 child 데이터를 변경하도록 설정 할 수 있따.
DELETE FROM tbl_student WHERE st_num= '20220004';

--만약 parent table의 데이터를 일괄 변경하거나, table의 구조는 변경하려고 하면 
--FK를 먼저 제거하고 실행을 해야한다.
ALTER TABLE tbl_belong
DROP CONSTRAINT FK_tbl_student CASCADE;

