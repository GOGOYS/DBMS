CREATE DATABASE bookDB;

use bookDB;
DROP TABLE tbl_books;
CREATE TABLE tbl_books(
	ISBN BIGINT primary KEY,
    도서명 VARCHAR(40),
    출판사 VARCHAR(5),
    저자 VARCHAR(5),
    출판일 VARCHAR(13),
    페이지 INT,
    가격 INT
);

DROP TABLE tbl_company;
CREATE TABLE tbl_company(
	출판사코드 VARCHAR(5) primary key,
    출판사명 VARCHAR(20),
    대표 VARCHAR(5),
    전화번호 VARCHAR(13),
    주소 VARCHAR(50)
);

DROP TABLE tbl_author;
CREATE TABLE tbl_author(
	저자코드 VARCHAR(5) primary key,
    저자명 VARCHAR(20),
    전화번호 VARCHAR(13),
    주소 VARCHAR(50)
);

INSERT INTO tbl_books(ISBN,도서명,출판사,저자,출판일,페이지,가격)
VALUES(9791162842051,'데스바이 ㅇㅁㄴㄹ','C0001','A0001','2020-20-10',045,5525),
(979114354351,'데스바이 ㅎㅍㅋ','C0002','A0002','2100-20-50',025,99425),
(9645420557641,'데스바이 ㄹㄴㅁ','C0003','A0003','1020-11-1',047,63637),
(97911453451,'데스바이 ㄻㄴㄹ','C0004','A0004','800-20-10',714,73863),
(975325774271,'데스바이 ㅁㄹㄴㅇㄻ','C0005','A0005','9020-20-11',152,47417);

INSERT INTO tbl_books(ISBN,도서명,출판사,저자,출판일,페이지,가격)
VALUES(97911351,'데스바이 ㅇㅁㄴㄹ','C0008','A0001','2020-20-10',045,100),
(979532532051,'데스바이 ㅇㅁㄴㄹ','C0008','A0001','2020-20-10',045,200);

INSERT INTO tbl_books(ISBN,도서명,출판사,저자,출판일,페이지,가격)
VALUES(979324351,'데스바이 ㅇㅁㄴㄹ','C100','A0001','2018-12-31',045,100),
(9732341351,'데스바이 ㅇㅁㄴㄹ','C100','A0001','2018-12-30',045,100);

INSERT INTO tbl_company(출판사코드,출판사명,대표,전화번호,주소)
VALUES('C0001','북스북스','고영승','101-416-402','광주북구 양산'),
('C0002','ㅇㅇ스','홍길','147402','광주북구 봉선'),
('C0003','24334스','심사임당','101-14127-402','광주북구 일곡'),
('C0004','ㅊㅌㅋㅍ스','엄마','101-20402','광주북구 양림'),
('C0005','ㄹㅈㅁㄹ','아빠','101-42202','광주북구 계곡');

INSERT INTO tbl_author(저자코드,저자명,전화번호,주소)
VALUES('A0001','이지윤','010-4444-4444','경남 밀양1'),
('A0002','김보성','010-1801-1111','경남 밀양2'),
('A0003','으리으이','010-8788-1000','경남 밀양3'),
('A0004','유재석','010-781-1215','경남 밀양4'),
('A0005','아임마','010-40401-100','경남 밀양5');

INSERT INTO tbl_author(저자코드,저자명,전화번호,주소)
VALUES('A1000','노지양','010-9137-9014','경남 밀양1');

SELECT COUNT(*) FROM tbl;

SELECT * FROM tbl_books
ORDER BY 출판일;

SELECT 출판사, COUNT(출판사), AVG(가격) FROm tbl_books
GROUP BY 출판사;

SELECT * FROm tbl_books
WHERE 가격 >= 20000;

SELECT BK.ISBN, BK.도서명, CP.출판사명, CP.대표 AS 출판사대표, AH.저자명 AS 저자 , AH.전화번호 AS 저자연락처, BK.출판일
FROM tbl_books BK
	LEFT JOIN tbl_company CP
		ON	BK.출판사 = CP.출판사코드
			LEFT JOIN tbl_author AH
				ON  BK.저자 = AH.저자코드
WHERE 출판일 < '2018-12-31';


SELECT * FROM tbl_author
WHERE 저자명 = '노지양';

UPDATE tbl_author
set 전화번호 = '010-3782-9014'
WHERE 저자코드 = 'A1000';


