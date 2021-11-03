DML : 데이터 삽입/갱신/삭제
data manipulation language 데이터 조작 명령어
select 도 DML에 속하지만 단지 조회하여 출력만 한다.
INSERT, UPDATE, DELETE는 직접 데이터를 삽입, 갱신, 삭제
트랜잭션 transaction 데이터를 조작하여 저장하는 과정
DML은 트랜잭션을 다루는 명령어...
테이블을 행을 기준으로 삽입 갱신 삭제한다.


INSERT 행 삽입하기... 새로운 데이터를 행 단위로 입력한다.

INSERT INTO departments (department_id, department_name, manager_id, location_id)
VALUES (271, 'Sample_Dept',200,1700);

INSERT INTO departments 
VALUES (271, 'Sample_Dept',200,1700);

UPDATE 기존의 값을 변경할 때 사용

UPDATE departments
SET manager_id = 201, 
location_id = 1800
WHERE department_name = 'IT';

#DELETE 행 삭제, where 생략하면 조건식이 없으므로 모두 삭제
DELETE FROM departments
WHERE department_id = 271;



#DDL - data definition language 데이터 정의어
따로 커밋하지 않아도 데이터베이스에 즉각 반영된다. 

CREATE 테이블 생성

CREATE TABLE product (
    product_id number,
    product_name varchar2(30),
    manudate date
)

INSERT INTO product values(1, 'tv', to_date('211007', 'YYMMDD'));

테이블과 열의 이름을 정할 때는...
1. 동일한 테이블의 이름을 중복하여 생성할 수 없다. 테이블 안의 열 이름도 동일한 이름으로 생성할 수 없다. 

2. SELECT, INSERT, FROM 와 같은 예약어는 사용할 수 없다. 

3. 문자로 시작한다. 한글과 특수문자도 사용할 수는 잇지만 권장하지 않는다.
4. 너무 긴 이름으로 사용은 권장하지 않는다. 

ALTER 테이블 수정

이미 생성한 테이블에 열을 추가, 변경, 삭제 할 수 있다. ALTER TABLE을 사용하여 구조를 변경할 수 있다. 

ALTER TABLE product
ADD (factory varchar(10))

새로 생성되는 열은 위치를 지정할 수 없다. 
테이블의 마지막에 위치한다. 
이미 행이 있다면 열을 추가했을 때 새로운 열의 데이터 값은 null로 초기화 된다. 

ALTER TABLE product
MODIFY (factory char(10));

ALTER TABLE product
MODIFY (productname varchar(5));

ALTER TABLE product 
RENAME COLUMN factory to factoryname;

ALTER TABLE product 
DROP COLUMN factoryname;

#열이름 변경

ALTER TABLE PRODUCT
RENAME COLUMN  PRODUCT_NAME TO PRODUCT_NAMEE;

# 테이블 내용만 삭제

TRUNCATE TABLE PRODUCT;


# 테이블 내용과 구조까지 삭제
DROP TABLE PRODUCT;

트랜잭션 내의 DML명령문은 실행되어 결과 반영되더라고 COMMIT전까지는 임시적인 상태다. 
이 상태에서 ROLLBACK을 할 경우 트랜잭션이 취소되고 커밋직후로 돌아간다.