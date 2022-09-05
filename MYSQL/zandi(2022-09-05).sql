use zandidb;

DROP table tbl_comment;
CREATE TABLE IF NOT EXISTS tbl_comment(
			c_seq BIGINT AUTO_INCREMENT PRIMARY KEY,
			c_groupseq BIGINT NOT NULL,
			c_username VARCHAR(20) NOT NULL,
			c_date VARCHAR(20),
			c_time VARCHAR(20),
			c_comment VARCHAR(500)
		);
SELECT * FROM tbl_comment;

SELECT * FROM tbl_users;

SELECT * FROM tbl_group;
SELECT * FROM tbl_join_group;
DROP TABLE tbl_group;
DROP table tbl_join_group;
DROP table tbl_comment;
CREATE TABLE IF NOT EXISTS tbl_join_group(
			j_seq BIGINT AUTO_INCREMENT PRIMARY KEY,
			j_gname VARCHAR(20),
			j_username VARCHAR(20),
			j_percent VARCHAR(5),
			j_count INT
		);
        CREATE TABLE IF NOT EXISTS tbl_group(
			g_seq BIGINT AUTO_INCREMENT PRIMARY KEY,
			g_name VARCHAR(20) NOT NULL UNIQUE,
			g_people INT NOT NULL,
			g_inpeople INT,
			g_create_date VARCHAR(20),
			g_end_date VARCHAR(20)
		);

DROP TABLE tbl_trophy;
select * from tbl_trophy;
CREATE TABLE IF NOT EXISTS tbl_trophy(
			t_seq BIGINT AUTO_INCREMENT PRIMARY KEY,
			t_groupseq BIGINT NOT NULL,
            t_groupname VARCHAR(20) NOT NULL,
			t_username VARCHAR(20) NOT NULL,
			t_complete VARCHAR(5),
			t_trophy boolean
		);
        
        
        
