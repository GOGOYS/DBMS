use mydb;

Truncate table tbl_address;

SELECT * FROm tbl_address;
SELECT COUNT(*) FROM tbl_address;
-- 검색 조건이 '' 일때는 LIKE 연산자는 조건이 없는것으로 인식한다
SELECT * FROm tbl_address
WHERE a_name LIKE '';

SELECT * FROM  (
SELECT * FROM tbl_address
WHERE a_name LIKE CONCAT('%','유','%')
) AS SUB
LIMIT 200 OFFSET 0;
