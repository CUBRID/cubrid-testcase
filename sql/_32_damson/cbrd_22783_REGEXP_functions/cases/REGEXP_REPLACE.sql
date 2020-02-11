--mandatory argument
SELECT REGEXP_REPLACE ('TechOnTheNet is a great resource', '^(\S*)', 'CheckYourMath');
SELECT REGEXP_REPLACE();
SELECT REGEXP_REPLACE ('abc');
SELECT REGEXP_REPLACE ('aabbb', 'ab{-1,3}$');
SELECT REGEXP_REPLACE ('', 'a|e|i|o|u', '#');
SELECT REGEXP_REPLACE ('abc', '', '#');
SELECT REGEXP_REPLACE ('abc', 'a|e|i|o|u', '');
SELECT REGEXP_REPLACE ('', '', '#');
SELECT REGEXP_REPLACE ('', 'a|e|i|o|u', '');
SELECT REGEXP_REPLACE ('abc', '', '');
SELECT REGEXP_REPLACE ('', '', '');
SELECT REGEXP_REPLACE (NULL, 'a|e|i|o|u', '#');
SELECT REGEXP_REPLACE ('abc', NULL, '#');
SELECT REGEXP_REPLACE ('abc', 'a|e|i|o|u', NULL);
SELECT REGEXP_REPLACE (NULL, NULL, '#');
SELECT REGEXP_REPLACE (NULL, 'a|e|i|o|u', NULL);
SELECT REGEXP_REPLACE ('abc', NULL, NULL);
SELECT REGEXP_REPLACE (NULL, NULL, NULL);

--optional arguments
SELECT REGEXP_REPLACE ('TechOnTheNet', 'a|e|i|o|u', '#', 6);
SELECT REGEXP_REPLACE ('TechOnTheNet', 'a|e|i|o|u', '#', 'a');
SELECT REGEXP_REPLACE ('TechOnTheNet', 'a|e|i|o|u', '#', 0);
SELECT REGEXP_REPLACE ('TechOnTheNet', 'a|e|i|o|u', '#', -5);
SELECT REGEXP_REPLACE ('TechOnTheNet', 'a|e|i|o|u', '#', 9999);
SELECT REGEXP_REPLACE ('TechOnTheNet', 'a|e|i|o|u', '#', NULL, 2);
SELECT REGEXP_REPLACE ('TechOnTheNet', 'a|e|i|o|u', '#', 6);
SELECT REGEXP_REPLACE ('TechOnTheNet', 'a|e|i|o|u', '#', 6, 'a');
SELECT REGEXP_REPLACE ('TechOnTheNet', 'a|e|i|o|u', '#', 2, 0);
SELECT REGEXP_REPLACE ('TechOnTheNet', 'a|e|i|o|u', '#', 2, -1);
SELECT REGEXP_REPLACE ('TechOnTheNet', 'a|e|i|o|u', '#', 1, 9999);
SELECT REGEXP_REPLACE ('TechOnTheNet', 'a|e|i|o|u', '#', 1, NULL); 
SELECT REGEXP_REPLACE ('TechOnTheNet', 'a|e|i|o|u', '#', 3, 2, 'i');
SELECT REGEXP_REPLACE ('TechOnTheNet', 'a|e|i|o|u', '#', 3, 2, 'c');
SELECT REGEXP_REPLACE ('TechOnTheNet', 'a|e|i|o|u', '#', 1, 0, '');
SELECT REGEXP_REPLACE ('TechOnTheNet', 'a|e|i|o|u', '#', 1, 2, 'ia');
SELECT REGEXP_REPLACE ('TechOnTheNet', 'a|e|i|o|u', '#', 1, 2, NULL);

--functional test
SELECT 
REGEXP_REPLACE (name, '[a-d]', '#'), REGEXP_REPLACE (name, '[e-z]', '@') 
from athlete LIMIT 5;

SELECT REGEXP_REPLACE (name, '[a-d]', '#', 6, 0, 'i') from athlete LIMIT 5;

SELECT name FROM athlete 
WHERE LENGTH (REGEXP_REPLACE (name, '\s', '')) < 5;

WITH V_TEST AS (
SELECT 'hello@cubrid.com' EMAIL
)
SELECT REGEXP_REPLACE(EMAIL, 'hello', 'cub') AS "id" FROM V_TEST;


CREATE TABLE new_athlete ( encrypted_name VARCHAR ) AS SELECT REGEXP_REPLACE (name, '[a|e|i|o|u]', '#') AS encrypted_name from athlete LIMIT 10;
SELECT * from new_athlete;
DROP TABLE new_athlete;

CREATE TABLE new_athlete (encrypted_name VARCHAR);
INSERT INTO new_athlete SELECT REGEXP_REPLACE (name, '[a|e|i|o|u]', '#') AS encrypted_name from athlete LIMIT 10;
SELECT * from new_athlete;
DROP TABLE new_athlete;

