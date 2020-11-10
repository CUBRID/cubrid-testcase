DROP TABLE IF EXISTS DEP;
CREATE TABLE DEP (
     DEP_CD VARCHAR(10) NOT NULL, 
     PARENT_CD VARCHAR(10), 
     DEPT_NAME VARCHAR(100) NOT NULL, 
     PRIMARY KEY (DEP_CD), INDEX cix_dep_parent_cd (PARENT_CD)
);

INSERT INTO DEP VALUES ( 101, NULL, 'a');
INSERT INTO DEP VALUES ( 102, 101, 'b');
INSERT INTO DEP VALUES ( 103, 101, 'c');
INSERT INTO DEP VALUES ( 104, 101, 'd');
INSERT INTO DEP VALUES ( 105, 102, 'e');
INSERT INTO DEP VALUES ( 106, 103, 'f');
INSERT INTO DEP VALUES ( 107, 103, 'g');
INSERT INTO DEP VALUES ( 108, 105, 'h');
INSERT INTO DEP VALUES ( 109, 106, 'i');
INSERT INTO DEP VALUES ( 100, 106, 'j');
INSERT INTO DEP VALUES ( 111, 104, 'k');

INSERT INTO DEP SELECT LPAD(E.LVL,2,'0') || D.DEP_CD, LPAD(E.LVL,2,'0') || D.PARENT_CD, DEPT_NAME FROM DEP D, (SELECT LEVEL AS LVL FROM DB_ROOT CONNECT BY LEVEL < 100) E;

set optimization level 513;

SELECT /*+ recompile */
DEPT_NAME, DEP_CD, PARENT_CD, LEVEL
FROM DEP
WHERE 1=1
START WITH PARENT_CD IS NULL 
CONNECT BY PRIOR DEP_CD = PARENT_CD
LIMIT 1;

DROP TABLE DEP;
