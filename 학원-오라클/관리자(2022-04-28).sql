 --여기는 관리자 화면
 --C:\oraclexe\data
 
 /*
    오라클 DBMS 데이터를 저장하고 관리하기 위한 절차
    
    관리자에 접속하여
    1.TableSpace 생성 
    2. 사용자생성 및 TableSpace 연결
    3. 사용자에게 원한부여
 */
 
 CREATE TABLESPACE school
 DATAFILE 'C:/oraclexe/data/school.dbf'
 SIZE 1M AUTOEXTEND ON NEXT 1K;
 
 CREATE USER user3 IDENTIFIED BY 12341334
 DEFAULT TABLESPACE school;
 
 GRANT DBA To user3;
 GRANT DBA To user1;
 