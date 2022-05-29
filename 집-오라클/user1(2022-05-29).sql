--user1

DROP TABLE tbl_user;
CREATE TABLE tbl_user(
    username nVARCHAR2(10) PRIMARY KEY,
    userid VARCHAR2(20) NOT NULL,
    password VARCHAR2(20) NOT NULL,
    email VARCHAR2(30) NOT NULL,
    role VARCHAR2(10)
);

SELECT * FROM tbl_user;

DROP TABLE tbl_user2;
CREATE TABLE tbl_user2(
    username nVARCHAR2(10) PRIMARY KEY,
    userid VARCHAR2(20) NOT NULL,
    password VARCHAR2(20) NOT NULL,
    email VARCHAR2(30) NOT NULL,
    role VARCHAR2(10)
);

SELECT * FROM tbl_user2;
