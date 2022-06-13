--bookuser

DROP TABLE tbl_bbs;
CREATE TABLE tbl_bbs (
			b_seq 		NUMBER 			PRIMARY KEY,
			b_date 		VARCHAR2(10) 	NOT NULL,
			b_time 		VARCHAR2(10) 	NOT NULL,
			b_writer 	VARCHAR2(125),
			b_subject 	nVARCHAR2(125),
			b_content 	nVARCHAR2(1000)
);

--시작값을 1로 하고, 1씩 자동증가되는 SEQ 생성하기
CREATE SEQUENCE seq_bbs
INCREMENT BY 1 START WITH 1; 

DROP SEQUENCE seq_bbs;

SELECT seq_bbs.NEXTVAL FROM DUAL;
INSERT INTO tbl_bbs(b_seq, b_date,b_time,b_writer,b_subject,b_content)
VALUES(seq_bbs.nextval, '2022-06-13', '14:20:00', 'callor', '게시판 글쓰기','게시판쓰장');

SELECT * FROM tbl_bbs;

commit