#   중복 제거 ... distinct

SQL 연산이나 보고서를 작성할 때 데이터 값의 행이 중복되었다면 중복을 제거하고 계산하거나 출력한다.

SELECT job_id
FROM employees;

job_id 출력했는데 중복값이 그대로 다 출력된다.
이 출력 결과만으로는 job_id에 전 종류를 한눈에 보기 어렵다. 이럴 때 중복을 제거하여 데이터의 값을 종류별로
하나만 출력해보자.

SELECT DISTINCT job_id
FROM employees;

데이터 값이 종류별로 하나씩만 출력되었다.
열 이름 뒤에 다른 열이름도 나열하면 모두 적용된다.

#별명 사용하기

SELECT문의 결과를 출력할 때 열이름이 제목으로 출력된다.
원래 이름 대신에 임의로 다른 이름을 표시할 수 있다. alias

- 별명은 열이름을 임시로 변경하는데 사용된다. 원래 이름을 바꾸는 것이 아니다.
- 별명은 열이름 바로 뒤에 as를 붙여서 만든다.
- as 는 생략 가능하다.
- 별명에 공백, 특수문자, 대소문자를 사용하려면 "" 묶어서 사용한다.

SELECT employee_id, first_name, last_name FROM employees;

SELECT employee_id AS 사원번호, first_name AS 이름, last_name AS 성 FROM employees;

# 연결해서 출력

SELECT employee_id AS 사원번호, first_name||' '||last_name AS 이름 FROM employees;


#산술 처리

SELECT employee_id, salary, salary * 0.4, salary * 0.6
FROM employees;

#WHERE 구문을 활용한 데이터 검색

행에서 특정 데이터 값을 조회하거나 비교 연산처리하는 방법
사용자가 원하는 데이터를 조회할 때 사용하는 WHERE문은 FROM 다음에 기술한다.

SELECT * FROM employees WHERE employee_id <= 200;

SELECT * FROM employees WHERE first_name = 'david';

SELECT * FROM employees WHERE salary BETWEEN 10000 AND 20000;

IN 연산자. 조회하고자 하는 데이터 여러개일 때 사용한다. = 유사하지만 = 은 조회 조건으로 데이터 값을 하나만 지정할 수 있는데 반해
IN 연산자는 데이터 값을 여러개 즉 목록으로 지정할 수 있다. 여러개의 값 목록 중에서 하나의 값이라도 만족하면 조건에 해당하는 결과를 출력한다.
IN(조건1, 조건2, 조건......)
employees 테이블에서 salary가 10000, 17000, 24000인 직원들의 정보를 출력하세요

LIKE 연산자 조회. 조건의 값이 명확하지 않을 때 사용한다.
% '모든 문자' _ '한글자'

employees 테이블에서 job_id에 AD포함하는 모든 데이터를 조회하세요.

SELECT * FROM employees WHERE job_id LIKE 'AD%';

last_name LIKE '김%' 김씨를 모두 출력
first_name LIKE '%나%' 이름에 나가 있으면 모두 출력
first_name LIKE '%자' 이름이 자로 끝나면 모두 출력

employees 테이블에서 job_id에서 AD를 포함하면서 뒤에 글자 3개인 데이터를 조회하세요

SELECT * FROM employees WHERE job_id LIKE '%AD___';
언더바를 통해 정해줄 수 있다.

IS NULL null은 값이 없는 것을 뜻한다. 0이나 공백과 다르다.

SELECT * FROM employees WHERE manager_id IS NULL;


여러개 조건
employees 테이블에서 salary가 4000을 초과하면서 job_id IT_PROG인 값을 조회하세요
SELECT * FROM employees WHERE salary >4000 AND job_id = 'IT_PROG';

SELECT * FROM employees WHERE salary >4000 AND job_id = 'IT_PROG' OR job_id = 'FI_ACCOUNT';

SELECT * 
FROM employees 
WHERE salary >4000
AND job_id IN ('IT_PROG', 'FI_ACCOUNT');

SELECT * 
FROM employees 
WHERE salary >4000
AND job_id != 'IT_PROG';

###############################################
함수
###############################################

