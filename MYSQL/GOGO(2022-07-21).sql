-- 새로운 GOGO 화면
use schoolDB;

SELECT  * FROM tbl_student;

-- 학사정보 테이블 명세를 참조하여 tbl_student 테이블 생성
DROP TABLE tbl_student;
CREATE TABLE tbl_student(
	st_num		VARCHAR(5)		PRIMARY KEY,
	st_name	VARCHAR(20)		NOT NULL,
	st_dept		VARCHAR(20),
	st_grade	INT(1),
	st_tel		VARCHAR(15)		NOT NULL,
	st_addr		VARCHAR(125)
);

CREATE TABLE tbl_subject(
	sb_code	VARCHAR(5)	PRIMARY KEY,
	sb_name	VARCHAR(25)	NOT NULL
);

SELECT * FROM tbl_subject;

-- MySQL의 다중 INSERT
INSERT INTO tbl_subject(sb_code,sb_name) 
VALUES
('SB008','논어'),
('SB009','서학');

-- 성적이 저장될 테이블
-- 학생 정보와 과목정보가 함께 연동되어 점수를 관리하는 코드
-- sc_seq임의의 칼럼을 만들어 PK로 삼고
-- 학번과 과목코드가 동시에 같은 코드가 중복되지 읺도록
--  UNIQUE(sc_stnum, sc_sbcode)는 두개의 칼럼을 묶어서 중복되는 값을 막았다
CREATE TABLE tbl_score (
    sc_seq BIGINT PRIMARY KEY AUTO_INCREMENT,
    sc_stnum VARCHAR(5) NOT NULL,
    sc_sbcode VARCHAR(5) NOT NULL,
    sc_score INT,
    UNIQUE (sc_stnum , sc_sbcode)
);
SELECT COUNT(*) FROM tbl_score;

-- tbl_score 데이터에서 점수가 70점 이하인 데이터만 추출 학번 순 나열
-- selection : 조건절(WHERE)을 추가하여 조건에 맞는 데이터만 추출하기
SELECT * FROM tbl_score
WHERE sc_score <= 70
ORDER BY sc_stnum;

-- tbl_score 데이터에서 과목 코드, 점수 칼럼만 표시되도록 데이터 출력
-- Projection: table에 많은 칼럼이 있을 경우 필료한 칼럼만 보고자할때
SELECT sc_sbcode, sc_score FROM tbl_score
ORDER BY sc_sbcode;

-- tbl_score 데이터에서 점수가 50점 이상 70점 이하인 데이터의 과목코드와 점수만 보이게
SELECT sc_sbcode AS 과목코드 , sc_score AS  점수 FROM tbl_score
WHERE sc_score >= 50 AND sc_score <= 70
ORDER BY sc_sbcode;
-- 범위를 지정할때 이상 AND 이하일 경우 BETWEEN을 사용할 수 있다.
SELECT sc_sbcode AS 과목코드 , sc_score AS  점수 FROM tbl_score
WHERE sc_score BETWEEN 50 AND 70
ORDER BY sc_sbcode;

-- 점수가 50이상 70이하인 데이터를 보이되
-- tbl_subject와 연결하여 과목코드 , 과목명, 점수 칼럼이 보이도록
-- EQ 조인
SELECT sc_sbcode AS 과목코드 ,sb_name AS 과목명, sc_score AS  점수
FROM tbl_score, tbl_subject
WHERE sc_sbcode = sb_code AND sc_score BETWEEN 50 AND 70
ORDER BY sc_sbcode;

-- LEFT JOIN
SELECT SC.sc_sbcode AS 과목코드, SB.sb_name AS 과목명 , SC.sc_score AS 점수
FROM tbl_score SC
	LEFT JOIN tbl_subject SB
		ON SC.sc_sbcode = SB.sb_code
WHERE sc_score between 50 AND 70
ORDER BY sc_sbcode;

-- 점수가 50 부터 70인 데이터를 Selection하고
-- 과목코드, 과목명, 점수를 표현
-- tbl_student table을 JOIN하고
-- 학번, 학생이름, 과목코드, 과목명, 점수를  Projection
SELECT SC.sc_stnum AS 학번,
			  ST.st_name AS 이름,
              SC.sc_sbcode  AS 학번코드,
              SB.sb_name AS 과목명 ,
              SC.sc_score AS 점수
FROM tbl_score SC
	LEFT JOIN tbl_subject SB
		ON SC.sc_sbcode = SB.sb_code
			LEFT JOIN tbl_student ST
				ON SC.sc_stnum = ST.st_num
WHERE SC.sc_score between 50 AND 70
ORDER BY SC.sc_stnum, SC.sc_sbcode;


-- tbl_score의 데이터를 참조하여 과목별 총점을 구하시오
-- GROUP BY SUM, AVG등 통계함수를 사용하여 Selection
SELECT sc_sbcode AS 과목코드,
			  SUM(sc_score) AS 총점,
              AVG(sc_score) AS 평균
FROM tbl_score
GROUP BY sc_sbcode;

-- 과목명을 함께 Projection하기
-- 통계함수로 묶지 않는 코드는 만드시 GRUOP  BY절에서 묶어줘야 한다, 안하면 다 나열됨
SELECT SC.sc_sbcode AS 과목코드,
			  SB.sb_name AS 과목명,
              SUM(sc_score) AS 총점, 
              AVG(sc_score) AS 평균
FROM tbl_score SC
	LEFT JOIN tbl_subject SB
		ON SC.sc_sbcode = SB.sb_code
GROUP BY SC.sc_sbcode,SB.sb_name
ORDER BY SC.sc_sbcode;

-- 학생별로 총점 구하기
-- 학번, 이름, 총점, 평균 Projection
-- 학번순으로 정렬
SELECT  SC.sc_stnum AS 학번, 
			   ST.st_name AS 이름, 
			   SUM(sc_score ) AS 총점, 
               AVG(sc_score)  AS 평균
FROM tbl_score SC
		LEFT JOIN  tbl_student ST
			ON SC.sc_stnum = ST.st_num
GROUP BY SC.sc_stnum;

-- tbl_score 테이블에서 학생들의 SB002(데이터베이스) 과목정보만
-- 학번, 데이터베이스 점수(SB002)
SELECT sc_stnum, sc_score
FROM tbl_score
WHERE sc_sbcode = 'SB002';

-- 데이터 베이스에서 피벗코드 구현하기 pivot
-- 데이터베이스의 로우로 펼쳐지는 데이터를 칼럼으로 표출할때
SELECT sc_stnum, sc_sbcode,
	IF(sc_sbcode = 'SB001', sc_score,0) AS 국어
FROM tbl_score;

-- 표준 MySQL 피벗 방법 IF 함수 사용
-- 삼항 연산자랑 비슷하게 작동한다
SELECT sc_stnum AS 학번, st_name AS 이름,
	SUM(IF(sc_sbcode = 'SB001', sc_score,0)) AS 국어,
    SUM(IF(sc_sbcode = 'SB002', sc_score,0)) AS DB,
    SUM(IF(sc_sbcode = 'SB003', sc_score,0)) AS 미술,
    SUM(IF(sc_sbcode = 'SB004', sc_score,0)) AS 소프트웨어,
    SUM(IF(sc_sbcode = 'SB005', sc_score,0)) AS 수학,
    SUM(IF(sc_sbcode = 'SB006', sc_score,0)) AS 영어영문,
    SUM(IF(sc_sbcode = 'SB007', sc_score,0)) AS 음악
FROM tbl_score
	LEFT JOIN tbl_student
		ON sc_stnum = st_num
 GROUP BY sc_stnum, st_name;

-- 오라클은 IF 함수를 사용못해서 표준 SQL의 CASE 명령문을 사용해야한다
-- MySQL에서도 작동함
SELECT sc_stnum AS 학번, st_name AS 이름,
	SUM(CASE WHEN sc_sbcode = 'SB001' THEN  sc_score ELSE 0 END) AS 국어,
    SUM(CASE WHEN sc_sbcode = 'SB002' THEN  sc_score ELSE 0 END) AS DB,
    SUM(CASE WHEN sc_sbcode = 'SB003' THEN  sc_score ELSE 0 END) AS 미술,
    SUM(CASE WHEN sc_sbcode = 'SB004' THEN  sc_score ELSE 0 END) AS 소프트웨어,
    SUM(CASE WHEN sc_sbcode = 'SB005' THEN  sc_score ELSE 0 END) AS 수학,
    SUM(CASE WHEN sc_sbcode = 'SB006' THEN  sc_score ELSE 0 END) AS 영어영문,
    SUM(CASE WHEN sc_sbcode = 'SB007' THEN  sc_score ELSE 0 END) AS 음악
FROM tbl_score
	LEFT JOIN tbl_student
		ON sc_stnum = st_num
GROUP BY sc_stnum, st_name;

-- 제2 정규화가 되어있는 데이터를 view 할때는 PIVOT으로 데이터를 펼쳐서
-- 보는것이 편리할때가 많다
-- 제2 정규화가 된 데이터는 기준이되는 키 값을 중심으로 Row 방향으로 
-- 데이터가 저장되어 있다.
-- 이 데이터를 쉽게 보고서 등으로 만들때는 PIVOT으로 하여
-- 칼럼 방향으로 펼쳐서 보는것이 편리하다
