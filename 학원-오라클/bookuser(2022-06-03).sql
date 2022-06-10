DROP TABLE tbl_books;
CREATE TABLE tbl_books(
    isbn VARCHAR2(13) PRIMARY KEY,
    title NVARCHAR2(50) NOT NULL,
    author NVARCHAR2(50) NOT NULL,
    publisher NVARCHAR2(50) NOT NULL,    
    price NUMBER,
    discount NUMBER,
    description NVARCHAR2(2000),
    pubdate VARCHAR2(10),
    link VARCHAR2(125),
    image VARCHAR2(125)
);

SELECT * FROM tbl_books;

	CREATE TABLE tbl_books (
		        isbn	VARCHAR2(13)		PRIMARY KEY,
		        title	nVARCHAR2(50)	NOT NULL,	
		        author	nVARCHAR2(50)	NOT NULL,	
		        publisher	nVARCHAR2(50)	NOT NULL,	
		        price	NUMBER,		
		        discount	NUMBER	,	
		        description	nVARCHAR2(2000)	,	
		        pubdate	VARCHAR2(10),		
		        link	VARCHAR2(125),		
		        image	VARCHAR2(125)		
		);

commit;
DROP TABLE tbl_users;
SELECT * FROM tbl_users;