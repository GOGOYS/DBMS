# DBMS 쿼리 폴터

## 오라클 DB 시작

## ERD(Entity-Relation Diagram)
* 물리적인 데이터 저장소인 Table을 생성하기 앞서 어떤 데이터를 저장할 것인가 설계하는 것

### Entity
* Table을 논리적으로 부르는 이름

### Relation
* Table과 Table이 서로 연동되어 만들어지는 관계
* Entity를 그냥 Relation이라고 하기도 한다.

### E-RD 작성하기
* https://erdclude.com 을 이용하자

## 오라클의 데이터 타입
### 문자열 데이터 타입
* CHAR(길이) : 고정길이 - 숫자형으로 데이터를 저장하면 나중에 읽어올때 문제가 생긴다
* VARCHAR2(길이) : 가변길이          - 학번이나 전화번호등 숫자 사용
* nVARCHAR2(길이) : 한글가변길이     - 이름이나 주소같은 거 사용

### 숫자형 데이터 타입
* NUMBER(길이) : 숫자형 데이터 타입 
* 길이를 지정하지 않으면 최대 64자리까지 저장된다.