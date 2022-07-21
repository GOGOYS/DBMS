create table tbl_bb_stadium (
    st_pk	VARCHAR2(20)		PRIMARY KEY,
    bb_st_name	nVARCHAR2(20),
    bb_st_x	VARCHAR2(50),
    bb_st_y	VARCHAR2(50)
);

drop table tbl_bb_stadium;

SELECT * FROM tbl_bb_stadium;

SELECT bb_st_x, bb_st_y
FROM tbl_bb_stadium;

SELECT bb_st_x, bb_st_y
FROM tbl_bb_stadium
WHERE st_pk LIKE '%bb_dusan%';

create table tbl_schedule_dusan (
    st_seq      NUMBER(5)    PRIMARY KEY,
    st_pk       VARCHAR2(20),
    st_date     nVARCHAR2(20),
    st_match    nVARCHAR2(20)    
);

drop table tbl_schedule_dusan;

SELECT D.st_date, D.st_match
FROM tbl_bb_stadium ST
    LEFT JOIN tbl_schedule_dusan D
        ON ST.st_pk = D.st_pk
        WHERE D.st_pk = 'bb_dusan'
ORDER BY st_seq;

create table tbl_schedule_lg (
    st_seq      NUMBER(5)    PRIMARY KEY,
    st_pk       VARCHAR2(20),
    st_date     nVARCHAR2(20),
    st_match    nVARCHAR2(20)
);

drop table tbl_schedule_lg;

SELECT L.st_date, L.st_match
FROM tbl_bb_stadium ST
    LEFT JOIN tbl_schedule_lg L
        ON ST.st_pk = L.st_pk
        WHERE L.st_date LIKE '%6월%'
ORDER BY st_seq;

create table tbl_schedule_kia (
    st_seq      NUMBER(5)    PRIMARY KEY,
    st_pk       VARCHAR2(20),
    st_date     nVARCHAR2(20),
    st_match    nVARCHAR2(20)    
);

drop table tbl_schedule_kia;

SELECT ST.st_pk, ST.bb_st_name, K.st_date, K.st_match
FROM tbl_bb_stadium ST
    LEFT JOIN tbl_schedule_kia K
        ON ST.st_pk = K.st_pk
        WHERE K.st_date LIKE '%6월%'
ORDER BY st_seq;

create table tbl_schedule_kt (
    st_seq      NUMBER(5)    PRIMARY KEY,
    st_pk       VARCHAR2(20),
    st_date     nVARCHAR2(20),
    st_match    nVARCHAR2(20)    
);

drop table tbl_schedule_kt;

create table tbl_schedule_lotte (
    st_seq      NUMBER(5)    PRIMARY KEY,
    st_pk       VARCHAR2(20),
    st_date     nVARCHAR2(20),
    st_match    nVARCHAR2(20)    
);

drop table tbl_schedule_lotte;

create table tbl_schedule_ssg (
    st_seq      NUMBER(5)    PRIMARY KEY,
    st_pk       VARCHAR2(20),
    st_date     nVARCHAR2(20),
    st_match    nVARCHAR2(20)    
);

drop table tbl_schedule_ssg;

create table tbl_schedule_samsung (
    st_seq      NUMBER(5)    PRIMARY KEY,
    st_pk       VARCHAR2(20),
    st_date     nVARCHAR2(20),
    st_match    nVARCHAR2(20)    
);

drop table tbl_schedule_samsung;

create table tbl_schedule_kiwoom (
    st_seq      NUMBER(5)    PRIMARY KEY,
    st_pk       VARCHAR2(20),
    st_date     nVARCHAR2(20),
    st_match    nVARCHAR2(20)    
);

drop table tbl_schedule_kiwoom;

create table tbl_schedule_hanwha (
    st_seq      NUMBER(5)    PRIMARY KEY,
    st_pk       VARCHAR2(20),
    st_date     nVARCHAR2(20),
    st_match    nVARCHAR2(20)    
);

drop table tbl_schedule_hanwha;

create table tbl_schedule_nc (
    st_seq      NUMBER(5)    PRIMARY KEY,
    st_pk       VARCHAR2(20),
    st_date     nVARCHAR2(20),
    st_match    nVARCHAR2(20)    
);

drop table tbl_schedule_nc;

create table tbl_fb_stadium (
    fb_st_pk	VARCHAR2(20)		PRIMARY KEY,
    fb_st_name	nVARCHAR2(20),
    fb_st_x	VARCHAR2(50),
    fb_st_y	VARCHAR2(50)
);

drop table tbl_fb_stadium;

create table tbl_fb_schedule_seoul (
    fb_st_seq      NUMBER(5)    PRIMARY KEY,
    fb_st_pk       VARCHAR2(20),
    fb_st_date     nVARCHAR2(20),
    fb_st_time     VARCHAR2(20),
    fb_st_match    nVARCHAR2(20)    
);

drop table tbl_fb_schedule_seoul;

SELECT ST.fb_st_pk, ST.fb_st_name, S.fb_st_date, S.fb_st_time, S.fb_st_match
FROM tbl_fb_stadium ST
    LEFT JOIN tbl_fb_schedule_seoul S
        ON ST.fb_st_pk = S.fb_st_pk
        WHERE ST.fb_st_pk ='fb_seoul'
ORDER BY fb_st_seq;

SELECT S.fb_st_date, S.fb_st_time, S.fb_st_match
FROM tbl_fb_stadium ST
    LEFT JOIN tbl_fb_schedule_seoul S
        ON ST.fb_st_pk = S.fb_st_pk
        WHERE ST.fb_st_pk ='fb_seoul'
ORDER BY fb_st_seq;

create table tbl_fb_schedule_jeonbuk (
    fb_st_seq      NUMBER(5)    PRIMARY KEY,
    fb_st_pk       VARCHAR2(20),
    fb_st_date     nVARCHAR2(20),
    fb_st_time     VARCHAR2(20),
    fb_st_match    nVARCHAR2(20)    
);

drop table tbl_fb_schedule_jeonbuk;

		SELECT J.fb_st_date, J.fb_st_time, J.fb_st_match
		FROM tbl_fb_stadium ST
		    LEFT JOIN tbl_fb_schedule_jeonbuk J
		        ON ST.fb_st_pk = J.fb_st_pk
		        WHERE ST.fb_st_pk ='fb_jeonbuk'
		ORDER BY fb_st_seq;
        
create table tbl_fb_schedule_gangwon1 (
    fb_st_seq      NUMBER(5)    PRIMARY KEY,
    fb_st_pk       VARCHAR2(20),
    fb_st_date     nVARCHAR2(20),
    fb_st_time     VARCHAR2(20),
    fb_st_match    nVARCHAR2(20)    
);

drop table tbl_fb_schedule_gangwon1;

SELECT G.fb_st_date, G.fb_st_time, G.fb_st_match
		FROM tbl_fb_stadium ST
		    LEFT JOIN tbl_fb_schedule_gangwon1 G
		        ON ST.fb_st_pk = G.fb_st_pk
		        WHERE ST.fb_st_pk ='fb_gangwon1'
ORDER BY fb_st_seq;

SELECT G.fb_st_date, G.fb_st_time, G.fb_st_match
		FROM tbl_fb_stadium ST
		    LEFT JOIN tbl_fb_schedule_gangwon1 G
		        ON ST.fb_st_pk = G.fb_st_pk
		        WHERE ST.fb_st_pk ='fb_gangwon2'
ORDER BY fb_st_seq;

create table tbl_fb_schedule_gangwon2 (
    fb_st_seq      NUMBER(5)    PRIMARY KEY,
    fb_st_pk       VARCHAR2(20),
    fb_st_date     nVARCHAR2(20),
    fb_st_time     VARCHAR2(20),
    fb_st_match    nVARCHAR2(20)    
);

drop table tbl_fb_schedule_gangwon2;

SELECT * FROM tbl_fb_stadium
    WHERE fb_st_pk ='fb_jeonbuk';

create table tbl_fb_schedule_incheon (
    fb_st_seq      NUMBER(5)    PRIMARY KEY,
    fb_st_pk       VARCHAR2(20),
    fb_st_date     nVARCHAR2(20),
    fb_st_time     VARCHAR2(20),
    fb_st_match    nVARCHAR2(20)    
);

create table tbl_fb_schedule_seongnam (
    fb_st_seq      NUMBER(5)    PRIMARY KEY,
    fb_st_pk       VARCHAR2(20),
    fb_st_date     nVARCHAR2(20),
    fb_st_time     VARCHAR2(20),
    fb_st_match    nVARCHAR2(20)    
);

create table tbl_fb_schedule_suwon_ss (
    fb_st_seq      NUMBER(5)    PRIMARY KEY,
    fb_st_pk       VARCHAR2(20),
    fb_st_date     nVARCHAR2(20),
    fb_st_time     VARCHAR2(20),
    fb_st_match    nVARCHAR2(20)    
);

create table tbl_fb_schedule_suwon (
    fb_st_seq      NUMBER(5)    PRIMARY KEY,
    fb_st_pk       VARCHAR2(20),
    fb_st_date     nVARCHAR2(20),
    fb_st_time     VARCHAR2(20),
    fb_st_match    nVARCHAR2(20)    
);

drop table tbl_fb_schedule_suwon;

create table tbl_fb_schedule_gimcheon (
    fb_st_seq      NUMBER(5)    PRIMARY KEY,
    fb_st_pk       VARCHAR2(20),
    fb_st_date     nVARCHAR2(20),
    fb_st_time     VARCHAR2(20),
    fb_st_match    nVARCHAR2(20)    
);

create table tbl_fb_schedule_daegu (
    fb_st_seq      NUMBER(5)    PRIMARY KEY,
    fb_st_pk       VARCHAR2(20),
    fb_st_date     nVARCHAR2(20),
    fb_st_time     VARCHAR2(20),
    fb_st_match    nVARCHAR2(20)    
);

create table tbl_fb_schedule_pohang (
    fb_st_seq      NUMBER(5)    PRIMARY KEY,
    fb_st_pk       VARCHAR2(20),
    fb_st_date     nVARCHAR2(20),
    fb_st_time     VARCHAR2(20),
    fb_st_match    nVARCHAR2(20)    
);

create table tbl_fb_schedule_ulsan (
    fb_st_seq      NUMBER(5)    PRIMARY KEY,
    fb_st_pk       VARCHAR2(20),
    fb_st_date     nVARCHAR2(20),
    fb_st_time     VARCHAR2(20),
    fb_st_match    nVARCHAR2(20)    
);

create table tbl_fb_schedule_jeju (
    fb_st_seq      NUMBER(5)    PRIMARY KEY,
    fb_st_pk       VARCHAR2(20),
    fb_st_date     nVARCHAR2(20),
    fb_st_time     VARCHAR2(20),
    fb_st_match    nVARCHAR2(20)    
);
