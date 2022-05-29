-- 여기는 유저 1 접속화면

SELECT * FROM tbl_student;

--성적 테이블 재 설계
--기존 성적 테이블 제거
--DROP TABLE tbl_score;

--재 설계된 성적테이블 생성하기
CREATE TABLE tbl_score(
    sc_stnum	VARCHAR2(5)	NOT NULL,
    sc_subject	nVARCHAR2(15)	NOT NULL,	
    sc_score	NUMBER,		
    sc_seq	NUMBER		PRIMARY KEY
);

-- 생성된 테이블 구조확인
DESC tbl_score;

--데이터 임포트

--임포트 후에 데이터 수량을 카운트하여 모두 잘 임포트 되었는지 확인
SELECT COUNT(*) FROM tbl_score;

/*
    tbl_score 테이블은 제1 정규화가 완료되어 재 설계되고
    데이터를 임포트한 상태가 되었다.
*/

-- 학번별로 전체 총점과 평균을 구해보자
-- DB 합계와 평균을 계산하는 함수 
-- SUM(숫자칼럼), AVG(숫자칼럼)
--ROUND(값 , 자릿수) : 소수점 이하 관리하는 함수
/*
    ROUND(AVG(sc_score),1)
    AVG() 함수로 구한 결과를
    소수점 2째에서 반올림하여 1째 자리까지만 표현
*/
SELECT sc_stNum, SUM(sc_score) AS 총점, ROUND(AVG(sc_score),1) AS 평균
FROM tbl_score
GROUP BY sc_stNum;

/*
    ROUND(AVG(sc_score)) : ROUND(AVG(sc_score),0)과 같다
    소수 부분에서 반올림하여 정수만 표현
*/
SELECT sc_stNum AS 학번, SUM(sc_score) AS 총점, ROUND(AVG(sc_score)) AS 평균
FROM tbl_score
GROUP BY sc_stNum;

--전체 학생의 과목별 총점과 평균을 구하기
--과목명으로 그룹을 묶고 그룹내에서 총점을 구하여라
SELECT sc_subject, SUM(sc_score) AS 총점, ROUND(AVG(sc_score)) AS 평균
FROM tbl_score
GROUP BY sc_subject;

/*
    학생별 총점과 평균을 구하고 평균순으로 높은 점수부터 낮은 점수 순으로 보이기
*/
SELECT sc_stNum AS 학번, SUM(sc_score) AS 총점, ROUND(AVG(sc_score),1) AS 평균
FROM tbl_score
GROUP BY sc_stNum 
ORDER BY ROUND(AVG(sc_score),1) DESC;

/*
    전체 학생의 과목별 총점과 평균을 구하고 평균순으로 낮은 점수부터 높은점수 순으로 보이기
*/

SELECT sc_subject  AS 과목명, SUM(sc_score) AS 총점, ROUND(AVG(sc_score),1) AS 평균
FROM tbl_score
GROUP BY sc_subject
ORDER BY  ROUND(AVG(sc_score),1) ASC;

/*
    DBMS의 표준 통계함수 
    GROUP BY로 공통 항목을 묶고 공통항목 내에서 
    갯수 COUNT, 합계 SUM, 평균 AVG, 최대값 MAX, 최소값 MIN 등을 계산하는 함수
    
    통계함수로 묶지 않은 칼럼은 반드시 GROUP BY에 명시해야한다.
*/


--과목별 총점과 평균을 계산하고 
--평균이 76점 이상인 과목만 보고싶다.
--통계함수로 계산된 결과에 대한 조건부여

SELECT sc_subject, SUM(sc_score) 총점, ROUND(AVG(sc_score),2) 평균
FROM tbl_score
GROUP BY sc_subject
HAVING ROUND(AVG(sc_score),2)  > 75;


--음악, 국어 과목의 총점과 평균 계산
SELECT sc_subject, SUM(sc_score), ROUND(AVG(sc_score),2)
FROM tbl_score
GROUP BY sc_subject
HAVING sc_subject = '음악' OR sc_subject = '국어';

--이와 같은 코드는 어리석은 코드다 왜 전체를 계산하고 나중에 골라내냐?
SELECT sc_subject, SUM(sc_score), ROUND(AVG(sc_score),2)
FROM tbl_score
GROUP BY sc_subject
HAVING sc_subject IN('음악','국어');

--먼저 where절에서 내가 필요한데이터의 집함이 무었인지 찾으면
--조건에 맞는 데이터만 추출하고 그 추출된 데이터 안에서만 통계를 낸다.
SELECT sc_subject, SUM(sc_score), ROUND(AVG(sc_score),2)
FROM tbl_score
WHERE sc_subject IN('음악','국어')
GROUP BY sc_subject;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
/*
    통계함수와 GROUP BY를 사용하여 통계연산을 할때 주의사항
    통계연산 결과에 어떤 조건을 부여하여 데이터를 보고자 할때는 
    WHERE 절이나 HAVING절에 조건을 부여할 수 있다.
    
    통계 연산이 *수행된 결과*에 대하여 조건을 부여할때는 
    어쩔 수 없이 HAVING절에 조건을 부여해야할 것이다.
    
    하짐나 연산결과가 아닌 어떤 조건에 일치하는 데이터들에게만
    통계연산을 수행하고자 할때는 
    WHERE절에 조건을 부여할 수 없는지 반드시 고민해야한다.
    
    통계함수와 GROUP BY를 통한 통계 연산은 
    SQL 조회명령에서 많이 느린 연산이다.
    
    
    
*/


