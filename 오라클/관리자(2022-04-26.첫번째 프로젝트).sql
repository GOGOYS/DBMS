-- C:\oraclexe\data
-- 주석은 --
/*
    관리자로 접속하여 할일
    -TableSpace 생성
    -User Acc 생성 및 TableSpace 생성
    -User에게 권한 부여
    
    관리자로 접속하여 '생성'을 할때는 
    CREATE 라는 키워드를 사용한다.
    '삭제'를 할때는 DROP이라는 키워드를 사용한다.
*/

/*
1.TableSpace 생성
    오라클은 물리적 저장공산을 TableSpace라는 이름으로 관리한다.
    오라클 DBMS를 사용하여 데이터를 관리하기 위해서는
    제일먼저 TableSpace를 생성해야한다.
    
    오라클 DBMS를 설치하면 System이 관리하는  TableSpace가 기본으로 생성된다.
    System TableSpace에는 중요한 데이터들이 저장되르모
    가급적 일반적인, 대량의 Data를 저장하지 않는 것이 좋다.
    
    때문에 프로젝트별로 TableSpace를 만드는것이 좋다.
*/

-- TABLESPACE 생성하기
CREATE TABLESPACE firstDB
DATAFILE 'C:/oraclexe/data/first.dbf'
SIZE 1M AUTOEXTEND ON NEXT 1K;

--기존의 생성한 TABLESPACE를 완전히 삭제하기
DROP TABLESPACE firstDB 
INCLUDING CONTENTS AND DATAFILES CASCADE CONSTRAINTS;

/*
2.  사용자 생성과 TABLESPACE 연결
*/

-- 새로운 user1을 만들고  '12341234'라는 비밀번호를 부여하라
CREATE USER user2 IDENTIFIED BY 12341234
DEFAULT TABLESPACE firstDB;

/*
    사용자를 생성하면서 DEFAULT TABLESPACE를 연결하지 않았을경우
    생성된 사용자 정보에 TABLESPACE 추가하기
    단, 생성된 사용자 권한으로 추가된 데이터가 없어야 한다.
*/
--user1에 firstDB 테이블 추가 명령
ALTER USER user1 DEFAULT TABLESPACE firstDB;

-- 삭제명령
DROP USER user1 CASCADE;


/*
    오라클에서 새로운 사용자를 생성하면 생성된 사용자는 아무런 권한이 없다
    심지어 DBMS에 접속할 수 있는 권한마저 없다.
        
    따라서 생성된 사용자에게는 적절한 수준의 권한을 부여해야한다.
    GRANT 부여, REVOKE 뺏기
*/

-- 접속-login, logon 권한 부여
-- SESSION을 생성할 수 있는 권한을 user1에세 준다(로그인 할 수 있는 권한)

--SESSION 권한을 주면 insert와 selcet를 같이 사용할 수 있는 버그가 있다.
GRANT CREATE SESSION TO user1;

-- TABLE을 생성할수 있는 권한을 user1에게 부여
GRANT CREATE TABLE To user1;

-- TABLESPACE에 접근할 수 있는 권한 부여
GRANT UNLIMITED TABLESPACE TO user1;


--user1의 접속 권환 회수
REVOKE CREATE SESSION FROM user1;


/*
    DBMS에서 사용하는 SQL(Structed Query Lang.)명령들
    
    
    
    ## DDL (Data Definition Lang.: 데이터 정의어)
    
    CREATE로 시작하는 명령
        객체의 생성명령들
        -CREATE TABLESPACE
        -CREATE USER
        -CREATE TABLE
    
    DROP으로 시작하는 명령
        객체의 제거명령들 (삭제보다 강력)
        
    ALTER로 시작하는 명령
        객체의 상태, 구조 등을 변경하는 명령
        
    
    
    ##DCL (Data Control Lang. : 데이터 제어어)
    
    GRANT로 시작하는 명령
        사용자에게 권한을 부여하는 명령
        
    REVOKE로 시작하는 명령
        사용자에게서 권환을 회수하는 명령
    
    COMMIT, ROLLBACK
    
    
    
    ##DML (Data Menagement(Manipulation) Lang. 데이터 조작어, 관리어)    
    생성된 테이블에 대한 데이터 조작어
    
    C(CREATE) : Table 데이터 추가 : INSERT
    R(READ) : Table에 저장된 데이터 가져오기, 읽어오기 : SELECT 
    U(UPDATE) : Table에 저장된 데이터의 내용을 변경하기 : UPDATE
    D(DELETE) : Table에 저장된 데이터를 삭제하는 명령 : DELETE 
    
    UPDATE나 DELETE를 취소할때 ROLLBACK을 쓴다.
*/


/*
개발, 학습자 입장에서 사용자에게 권한 부여하기
사용자에게 부여하는 권한을 일일이 조목모족 부여하는것이 원칙이다.
실무에서는 회사의 정책(Policy)에 따라 적절한 권한을 관리해야한다.
권한이 잘못 부여되면 DB에 저장된 data에 손상을 가할 수 있고,
손상된 data는 신뢰성을 잃게된다.

손상된 Data가 저장된 데이터베이스 시스템은 '무결성이 파괴'되었다고 표현한다.
신뢰성을 잃게되는 데이터 = 무결성 파괴

DBA권한은 SYSDBA보다 약간의 제약이 있는 권한이다.
오라클 DBMS의 중요한 정보를 제외하고 모든 것을 다 할 수 있다.
심지어 다른 user의 tablespace에도 접근할 수 있다.
*/
GRANT DBA TO ser1;














