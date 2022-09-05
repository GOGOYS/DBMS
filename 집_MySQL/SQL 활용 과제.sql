use mydb;

CREATE TABLE tbl_books(
	bk_isbn BIGINT PRIMARY KEY,
    bk_title VARCHAR(50),
    bk_pbcode VARCHAR(5),
    bk_ahcode VARCHAR(5),
    bk_intdate BIGINT,
    bk_strdate VARCHAR(10),
    bk_page BIGINT,
    bk_price BIGINT
);

CREATE TABLE tbl_publishs(
	pb_code VARCHAR(5) PRIMARY KEY,
    pb_name VARCHAR(20),
    pb_ceo VARCHAR(8),
    pb_tel VARCHAR(13),
    pb_addr VARCHAR(100)
);

CREATE TABLE tbl_authors(
	ah_code VARCHAR(5) PRIMARY KEY,
    ah_name VARCHAR(20),
    ah_tel VARCHAR(13),
    ah_addr VARCHAR(100)
);

SELECT * FROM tbl_books;
SELECT * FROM tbl_publishs;
SELECT * FROM tbl_authors;

INSERT INTO tbl_books(bk_isbn, bk_title, bk_pbcode, bk_ahcode, bk_intdate, bk_strdate, bk_page, bk_price)
    VALUES("97407854854178","댄싱 위드 더 스타2", "C0002", "A0001",2022-06-10,"2022-06-10",82 ,7500 ),
    ("97407412441344","아차차라차차", "C0003", "A0002",2000-01-12,"2000-01-12",172,15200 ),
    ("97407345435436","코딩 어떨게하면 잘할까", "C0004", "A0003",2019-12-20,"2019-12-20",500,32000 ),
    ("97432453425454","INSERT에 대한 모든것", "C0005", "A003",2022-07-23,"2022-07-23",350,18500 ),
    ("97454546464545","괴인협회", "C0006", "A0006",2021-08-09,"2021-08-09",120,10200 ),
    ("97454356436464","애호박 전", "C0007", "A0007",2022-06-23,"2022-06-23",20,3000 ),
    ("97407854542444","인스타그램 잘하기", "C0008", "A0001",2000-11-11,"2000-11-11",160,10500 ),
    ("97407676356554","남성시대", "C0009", "A0009",2022-06-12,"2022-06-12",160,13200 ),
    ("97476865785733","타격 잘 하기", "C0010", "A0010",2022-01-18,"2022-01-18",184,11000 );