-- root화면
-- 여기는 school DB 화면
-- DataBase 생성 : schoolDB 이름으로 생성 root에서만 생성가능
-- CREATE DATABASE schoolDB;
USE schoolDB;

-- 사용자 등록
-- 사용자 등록을 할때 @'%'를 등록하면 원격 접속이 가능하다
-- 하지만 원격 접속을 허용하면 DB보안에 취약할 수 있다.
-- 가급적 특별한 경우가 아니면 @'localhost'로 지정하는 것이 좋다
CREATE USER GOGO@'localhost' identified BY '!Korea8080';
-- 새로만든 사용자에게 schoolDB에 접근할 수 있는 권한을 부여
GRANT ALL PRIVILEGES ON *.* TO  GOGO@'localhost';
FlUSH privileges;

-- 현재 등록된 사용자에게 DB 전체에 대한 권한 부여하기
GRANT ALL PRIVILEGES ON *.* TO  GOGOYS@'localhost';
-- 권한을 부여한 후 적용시키기
FLUSH PRIVILEGES;

