
-- 현재 등록된 사용자에게 DB 전체에 대한 권한 부여하기
GRANT ALL PRIVILEGES ON *.* TO  GOGO@'localhost';
-- 권한을 부여한 후 적용시키기
FLUSH PRIVILEGES;


CREATE database todoDB;

CREATE database myTodoDB;

use myTodoDB;
DROP TABLE tbl_users;

DROP TABLE tbl_authorities;
DROP TABLE tbl_todos;
SELECT *  FROM tbl_users;
SELECT * FROM tbl_authorities;
SELECT * FROM tbl_todos
ORDER BY d_date DESC, d_time DESC;
CREATE TABLE IF NOT EXISTS tbl_users (
				username VARCHAR(20) PRIMARY KEY,
				password  VARCHAR(255) NOT NULL,
				Enabled BOOLEAN DEFAULT FALSE,
				AccountNonExpired  BOOLEAN DEFAULT TRUE,
				AccountNonLocked  BOOLEAN  DEFAULT TRUE,
				CredentialsNonExpired  BOOLEAN  DEFAULT TRUE,
				
				email  VARCHAR(30),
				phone  VARCHAR(15),
				address VARCHAR(100),
			
				realname  VARCHAR(20),
				nickname  VARCHAR(20)
			);
            CREATE TABLE IF NOT EXISTS tbl_authorities (
				seq BIGINT AUTO_INCREMENT PRIMARY KEY,
			    username VARCHAR(20),
			    authority VARCHAR(20)
			);
            
            CREATE TABLE tbl_todos (
				seq BIGINT PRIMARY KEY auto_increment,
                username VARCHAR(20),
				todo  VARCHAR(400),
				d_time VARCHAR(20),
				d_date VARCHAR(20),
                f_time VARCHAR(20),
				f_date VARCHAR(20),
				finish boolean
			);
            
            CREATE TABLE IF NOT EXISTS tbl_users (
				username VARCHAR(20) PRIMARY KEY,
				password  VARCHAR(255) NOT NULL,
				enabled BOOLEAN DEFAULT FALSE,
				accountNonExpired  BOOLEAN DEFAULT TRUE,
				accountNonLocked  BOOLEAN  DEFAULT TRUE,
				credentialsNonExpired  BOOLEAN  DEFAULT TRUE,
				
			
				realname  VARCHAR(20),
				nickname  VARCHAR(20)
			);
            
            DESC tbl_users;
            
            SHOW TABLES;
            
            
            INSERT INTO tbl_users(username, password, enabled)
            VALUES('qaz75391','1234',true);
            
            INSERT INTO tbl_authorities(username, authority)
            VALUES('qaz75391','ROLE_USER');
            
            
            CREATE TABLE tbl_todolist(
				t_seq BIGINT auto_increment primary key,
                t_username VARCHAR(20) NOT NULL,
                t_sdate VARCHAR(20) NOT NULL,
                t_stime VARCHAR(20) NOT NULL,
                t_edate VARCHAR(20),
                t_etime VARCHAR(20)
		);
        
        USE myTodoDB;
        SELECT * FROM tbl_authorities;
        SELECT * FROM tbl_users;
        
        DROP TABLE tbl_todolist;
        
        CREATE database zandidb;
        GRANT ALL privileges On zandidb.*to GOGOYS@localhost;
        
        use zandidb;
        CREATE TABLE IF NOT EXISTS tbl_users(
			username VARCHAR(20) PRIMARY KEY,
			password VARCHAR(30) NOT NULL,
			nickname VARCHAR(10),
			email VARCHAR(30)
		);
        
        SELECT * FROM tbl_users;
        INSERT INTO tbl_users(username, password)VALUES("gogo","gogo");
        
        
        CREATE DATABASE bootDB;
            