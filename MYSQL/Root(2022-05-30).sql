-- 여기는 root화면
-- root는 orcle의 sys와 같은 역할
-- schemas의 sys폴더는 위험하니까 건드리면 안된다

/*
ㅡmySQL 사용자와 DB(Data 저장소)의 관계가 연결 아니다.
 오라클에서는 사용자에게 defalt Table Space 지정하여
 login(접속)을 하면 자동으로 기본 DB가 연결된다.
 
 사용자는 단순히 DB서버에 접속하는 권한을 부여받을 뿐이고
 어떤 DB를 사용할 것인지 처음 시작할때 연결을 해주어야 한다.
*/
-- DB 저장소 생성
CREATE DATABASE MYDB;

-- 일반 사용자 생성
-- mySQL은 전통적으로 root사용자로 접속하여 DB를 관리한다
-- 최큰추세는 root 사용자는 DB, User 생성만을 담당하고
-- DB 관리는 일반 사용자 등을 생성하여 실행하도록 권장한다.
-- MySQL은 사용자를 생성할때 어떤 방법으로 접속 할 것인지를 명시해야 한다.

-- GOGOYS 사용자는 localhost에서만 MYSQL 서버에 접속할 수 있다.
DROP USER 'GOGOYS'@'localhost';
CREATE USER 'GOGOYS'@'localhost' identified BY '!Korea8080';

/*
	MySQL은 사용자를 등록하면 
    그 사용자는 DBA 권한을 갖는다.
    
    MySQL은 실무에서 가장 많이 사용하는 버전이 5.7.x이다
	5.7 버전은 사용자 등록과 동시에 DB 관련된 명령을 대부분 사용할 수 있다.
    8.x 버전은 사용자 권한이 좀더 엄격해 졌다. 
    
    새로등록한 사용자에게 DB에 접근할 수 있는 권한 부여하기
    GOGOYS@localhost 사용자에게 mydb Schema에 접근하여
    모든 DML 명령을 수행할 수 있는 권한을 부여하겠다.
*/
GRANT ALL privileges ON mydb.* TO 'GOGOYS'@'localhost';

