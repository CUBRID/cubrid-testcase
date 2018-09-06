WITH RECURSIVE my_cte(n) AS
(
SELECT 1
UNION ALL
SELECT 1+n FROM my_cte WHERE n<6
)
UPDATE my_cte
SET n=0
WHERE n=n*n;

WITH RECURSIVE my_cte(n) AS
(
SELECT 1
UNION ALL
SELECT 1+n FROM my_cte WHERE n<6
)
DELETE FROM my_cte WHERE n > (SELECT AVG(n) FROM my_cte);

WITH RECURSIVE my_cte(n) AS
(
SELECT 1
UNION ALL
SELECT 1+n FROM my_cte WHERE n<6
)
DELETE FROM my_cte ;

DELETE FROM my_cte WHERE i >  (
WITH RECURSIVE my_cte(i) AS   ( SELECT 1 UNION ALL  SELECT 1+i FROM my_cte WHERE i<6
)  SELECT AVG(i)/2 FROM my_cte   );

