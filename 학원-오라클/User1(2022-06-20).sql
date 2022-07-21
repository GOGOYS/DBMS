CREATE TABLE tbl_images (
			i_seq 			NUMBER 			PRIMARY KEY,
			i_bseq 			NUMBER 			NOT NULL,
			i_originalName 	VARCHAR2(255) 	NOT NULL UNIQUE,
			i_imageName 	VARCHAR2(125)	NOT NULL
		);
        
        CREATE TABLE tbl_bbs (
			b_seq 		NUMBER 			PRIMARY KEY,
			b_date 		VARCHAR2(10) 	NOT NULL,
			b_time 		VARCHAR2(10) 	NOT NULL,
			b_writer 	VARCHAR2(125),
			b_subject 	nVARCHAR2(125),
			b_content 	nVARCHAR2(1000)
		);
        
        CREATE TABLE tbl_users (
		        username	VARCHAR2(20)		PRIMARY KEY,
		        password	VARCHAR2(125)		NOT NULL,	
		        email		VARCHAR2(125)		NOT NULL UNIQUE,
		        name		nVARCHAR2(125),
		        nickname	nVARCHAR2(125),		
		        role		VARCHAR2(5)
		);
        
        
SELECT 3,4,5,6,7 FROM DUAL
UNION ALL
SELECT 5,6,7,8,9 FROM DUAL
UNION ALL
SELECT 10,11,12,13,14 FROM DUAL;


INSERT INTO tbl_images(i_seq, i_bseq, i_originalName, i_imageName )
SELECT seq_image.NEXTVAL, SUB.* FROM
(
SELECT 1, 'image1.jpg', 'uuid-image1.jpg' FROM DUAL
UNION ALL
SELECT 1, 'image2.jpg', 'uuid-image2.jpg' FROM DUAL
UNION ALL
SELECT 1, 'image2.jpg', 'uuid-image2.jpg' FROM DUAL
) SUB;

SELECT * FROM tbl_images;



create SEQUENCE seq_bbs INCREMENT by 1;
create SEQUENCE seq_image INCREMENT by 1;
commit;