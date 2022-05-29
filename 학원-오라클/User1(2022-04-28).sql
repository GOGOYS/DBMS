-- 여기는 user1 화면
/*
처음으로 데이터를 저장하기 위해서 할일
1. 등록된 사용자로 접속하기
2. 테이블 생성
*/

CREATE TABLE tbl_student (
	st_num	    VARCHAR2(5)	    PRIMARY KEY, --한개의 프라이머리 키를 만들때는 이렇게 만들면 된다.
	st_name	    nVARCHAR2(20)	NOT NULL,   -- NOT : 비어있는 값이 있어서는 안된다
	st_tel	    VARCHAR2(15)	UNIQUE NOT NULL, -- UNIQUE : 중복된 데이터값을 추가하지 못하게 한다.
	st_addr	    nVARCHAR2(125)	NULL,
	st_dept	    nVARCHAR2(5)	NULL,
	st_grade	NUMBER(1)	    NULL
);

--DROP TABLE tbl_student;

/*
이중화 : 데이터서버를 두개의 서버를 돌려서 한개에 트래픽이 몰리거나
        서버가 터지면 다른 한곳으로 순식간에 전화시킴
        데이터를 저장할때 서버 두곳에 동시에 저장됨
        
로드밸런싱 : 데이터의 부하를 나누어서 분산시킴;
*/

--tbl_student table에 데이터 추가하기
-- 생성된 테이블에 데이터를 추가하는 행위를 Data Create라고 한다.
INSERT INTO tbl_student (st_num, st_name, st_tel, st_dept)
VALUES('00001', '홍길동', '010-111-1111', '컴공과');

INSERT INTO tbl_student (st_num, st_name, st_tel, st_dept)
VALUES('00002', '이몽룡', '010-111-1234', '전자과');

INSERT INTO tbl_student (st_num, st_name, st_tel, st_dept)
VALUES('00003', '성춘향', '010-111-1314', '정보통신과');


--저장된 데이터의 조회(Query), 읽기

/*
    SELECT * : 모든 칼럼을 다 표시해달라
    
    SELECT st_num, st_name : 여러 칼럼중에서 st_num, st_name만 표시해달라
        projection: 보고싶은 칼럼만 보기
*/
SELECT * 
FROM tbl_student;

SELECT st_num, st_name, st_dept
FROM tbl_student;

--칼럼의 표시 순서를 변경하여 보여달라
SELECT st_num, st_dept, st_name, st_tel, st_addr, st_grade
FROM tbl_student;

--  tbl_ student에 저장된 데이터 중에서 '홍길동'인 데이터만 SELECTION 해달라
SELECT *
FROM tbl_student
WHERE st_name = '홍길동';

/*
SELECT 명령 수행
Projection : 데이터를 조회할때 보고자 하는 칼럼만 표시하는것
Selection : 데이터를조회할때 WHERE 조건절을 붙여 필요한 데이터 리스트만 보는 것

Projection을 하면 실제 칼럼보다 적은 양의 칼럼을 보여준다
Selection을 하면 실제 데이터 리스트보다 적은 양의 리스트를보여준다.
*/

--전체 데이터를 조건없이 보여주되 이름(st_name 칼럼)순으로 정렬(Sort)하여 보여라
-- 가나다순 정렬(오름차순)
SELECT *
FROM tbl_student
ORDER BY st_name ASC; -- ASC는 생략

-- 역순 정렬(내림차순)
SELECT *
FROM tbl_student
ORDER BY st_name DESC;


INSERT INTO tbl_student ( st_num, st_name, st_tel, st_dept)
VALUES('0004', '장영실', '010-3344-5436', '컴공과');


INSERT INTO tbl_student ( st_num, st_name, st_tel, st_dept)
VALUES('0005', '최순실', '010-3343-5647', '컴공과');


--학과(st_dept)가 컴공과 인 데이터만 SELECTION 하여 
--이름(st_name)순으로 정렬하라
SELECT *
FROM tbl_student
WHERE st_dept = '컴공과'
ORDER BY st_name;

-- 컴공과 학생들만 이름을 역순 정렬하여라
SELECT *
FROM tbl_student
WHERE st_dept = '컴공과'
ORDER BY st_name DESC;

--전체 데이터를 st_dept 순으로 정렬하고 같은 st_dept면 st_name 순으로 정렬하라
SELECT *
FROM tbl_student
ORDER BY st_dept, st_name;

-- st_dept을 가지고 있는 데이터의 갯수가 몇개냐
Select count(st_dept)
FROM tbl_student;

--학과별로 학생이 몇명인지 알고싶다

SELECT st_dept, COUNT(st_dept) 학생수 --묶인 데이터에 그룹에 포함된 데이터의 갯수 -- 카운트 결과의 제목을 '학생수'로 바꿔달라
FROM tbl_student -- 데이터를 가져오고
GROUP BY st_dept; -- 학과가 같은 데이터끼리 묶고


SELECT COUNT(*) 데이터수
FROM tbl_student;

--정체 데이터 중 컴공과 학생이 몇명인가
SELECT COUNT(st_dept)
FROM tbl_student
WHERE st_dept = '컴공과';

/*
    도구에서 데이터를 추가 수정, 삭제 명령을 수행한 경우
    Oracle DBMS에게 요청을 한 생태가 된다.
    하지만 Oracle DBMs는 아직 스토리지의 DBF 파일에 저장하지 않은 상태이다.
    이상태에서 도구를 종료해 버리면 Oracle DBMS는 문제가 발행하여
    종료 된것으로 생각하고 데이터를 지워버린다.
    도구를 사용하여 접속 하였을 경우는 도구를 종료하기 전에 반드시
    COMMIT을 해주어야한다.
*/
-- commit 데이터베이스에 실행한 연산 저장
COMMIT;


SELECT * FROM tbl_student;


INSERT INTO tbl_student (st_num, st_name, st_tel)
VALUES('00006', '신창원' , '010-3434-6572');

/*
    ROLLBACK
    데이터를 추가, 수정, 삭제하고 아직 COMMIT 되지 않은 상태에서
    추가, 수정, 삭제를 취소하는 명령이다.
*/
ROLLBACK;

--tbl_student 데이터를 모두 지워라
DELETE 
FROM tbl_student;

/*
    DCL (Data Controll Lang)
    사용자에게 권한을 부여하거나 회수하는 GRANT, REVOKE하는 명령이 있고,
    데이터를 COMMIT 또는 ROLLBACK 하는 명령이 있다.
*/

DROP TABLE tbl_student;
CREATE TABLE tbl_student(
    st_num	    VARCHAR2(5)		            PRIMARY KEY,
    st_name	    nVARCHAR2(20)	NOT NULL,
    st_dept	    nVARCHAR2(10),		
    st_grade	NUMBER(1),		
    st_tel	    VARCHAR2(15)	NOT NULL	UNIQUE,
    st_addr	    nVARCHAR2(125)		
);

SELECT * FROM tbl_student;

DROP TABLE tbl_score;
CREATE TABLE tbl_score(
    sc_stnum	VARCHAR2(5) PRIMARY KEY,
    sc_kor	    NUMBER,
    sc_eng	    NUMBER,
    sc_math	    NUMBER,
    sc_his	    NUMBER,
    sc_moral	NUMBER,
    sc_sci	    NUMBER

);

SELECT * FROM tbl_student;

SELECT st_dept, COUNT(st_dept) AS 학생수
FROM tbl_student
GROUP BY st_dept 
ORDER BY 학생수 DESC, st_dept;

















