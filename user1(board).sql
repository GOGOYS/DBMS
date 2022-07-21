-- save skin

-- 게시판 테이블
drop table tbl_board;

commit;

create table tbl_board (
    b_num         NUMBER            not null,    -- 게시물 고유번호
    b_title       nvarchar2(50)     not null,       -- 제목
    b_content     nvarchar2(1000)   not null,       -- 내용
    b_hit         NUMBER            ,               -- 조회수
    b_writer      nvarchar2(25)     ,       -- 작성자
    b_date        varchar2(10)       NOT NULL ,     -- 작성일
	b_time		VARCHAR2(10) 	 NOT NULL,      -- 작성시간
    CONSTRAINT b_pk  PRIMARY KEY (b_num)
);

create table tbl_board (
    b_num         NUMBER      PRIMARY KEY     ,    -- 게시물 고유번호
    b_title       nvarchar2(50)     ,       -- 제목
    b_content     nvarchar2(1000)  ,       -- 내용
    b_hit         NUMBER            ,               -- 조회수
    b_writer      nvarchar2(25)   ,       -- 작성자
    b_date        varchar2(8)                      -- 작성일
    --CONSTRAINT b_pk  PRIMARY KEY (b_num)
);

CREATE SEQUENCE b_num START WITH 1 
INCREMENT BY 1 MAXVALUE 9999 NOCYCLE NOCACHE;

INSERT INTO tbl_board(b_num, b_title, b_content, b_writer)
VALUES(b_num.NEXTVAL, '1234', '1234', '1234');

INSERT INTO tbl_board(b_num, b_title, b_content, b_writer)
    values(b_seq.NEXTVAL,'제모옥 1', '내요옹', '작성자');
    
INSERT INTO tbl_board(b_num, b_title, b_content, b_writer)
    values(b_seq.NEXTVAL,'제모옥 2', '내요옹', '작성자');

INSERT INTO tbl_board(b_num, b_title, b_content, b_writer)
    values(b_seq.NEXTVAL,'제모옥 3', '내요옹', '작성자');

INSERT INTO tbl_board(b_num, b_title, b_content, b_writer)
    values(b_seq.NEXTVAL,'제모옥 4', '내요옹', '작성자');
    
select * from  tbl_board;


-- 게시글 작성 테이블
CREATE TABLE   tbl_write (
    w_num        NUMBER         primary key,
    w_date       varchar2(8)     not null
);

-- 추천 수 테이블
CREATE TABLE tbl_recommend (
    r_num       NUMBER         primary key,
    r_hit       nvarchar2(500)     not null
); 

-- 댓글 작성 테이블
CREATE TABLE tbl_comment (
    c_num       NUMBER          primary key,
    c_date      varchar2(8)     not null,
    c_content   nvarchar2(500)  not null
);