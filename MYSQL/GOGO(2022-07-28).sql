use schooldb;
DROP TABLE tbl_users;

/*
	MySQL의 boolean type
    실제 테이블 상에는 BOOLEAN타입이 없고
    tinyint type으로 칼럼이 생성된다
    이값은 0과 1의 값을 가지며 자바에서 SELECT를 하면
    1은 true 0은 false로 반환된다
*/
CREATE TABLE tbl_users(
	username VARCHAR(20) PRIMARY KEY,
	password VARCHAR(255) NOT NULL,
	isEnabled BOOLEAN DEFAULT FALSE,
	isAccountNonExpired BOOLEAN DEFAULT TRUE,
	isAccountNonLocked BOOLEAN DEFAULT TRUE,
	isCredentialsNonExpired BOOLEAN DEFAULT TRUE,
	
	email VARCHAR(30),
	tel VARCHAR(15),
	realname VARCHAR(20),
	nickname VARCHAR(20)
);

SELECT * FROM tbl_users;

-- Spring Security에서 사용하는 권한 테이블
-- 한 유저에게 복합적인 권한을 부여하기 위하여 사용하는 보조테이블
CREATE TABLE tbl_authorities(
	seq BIGINT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(20),
    authority VARCHAR(20)
);

desc tbl_users;
drop table tbl_users;
drop table tbl_authorities;

use schoolDb;

