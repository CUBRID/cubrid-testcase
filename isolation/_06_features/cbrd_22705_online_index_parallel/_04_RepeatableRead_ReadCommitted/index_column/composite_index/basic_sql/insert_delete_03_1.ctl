/*
Test Case: delete & insert
Priority: 1
Reference case: 
Author: Rong Xu

Test Point:
-    Insert: X_LOCK on first key OID for unique indexes.
-    Delete: X_LOCK acquired on current instance
there is index on t1(id,col), delete and insert value has overlap on second key column
unique index

NUM_CLIENTS = 3
C1: insert into t1 values(6,'mno');
C2: DELETE FROM t1 WHERE id >0 and col='mno' and sleep(1)=0;
*/

MC: setup NUM_CLIENTS = 3;

C1: set transaction lock timeout INFINITE;
C1: set transaction isolation level repeatable read;

C2: set transaction lock timeout INFINITE;
C2: set transaction isolation level read committed;

C3: set transaction lock timeout INFINITE;
C3: set transaction isolation level read committed;

/* preparation */
C1: DROP TABLE IF EXISTS t1;
C1: CREATE TABLE t1(id INT, col VARCHAR(10));
C1: create unique index idx on t1(id,col) with online parallel 7;
C1: INSERT INTO t1 VALUES(1,'abc');INSERT INTO t1 VALUES(2,'def');INSERT INTO t1 VALUES(3,'ghi');INSERT INTO t1 VALUES(4,'jkl');INSERT INTO t1 VALUES(5,'mno');INSERT INTO t1 VALUES(5,'pqr');INSERT INTO t1 VALUES(7,'stu');
C1: COMMIT WORK;
MC: wait until C1 ready;

/* test case */
C1: insert into t1 values(6,'mno');
MC: wait until C1 ready;
C2: DELETE FROM t1 WHERE id >0 and col='mno' and sleep(1)=0;
/* expect: no transactions need to wait */
MC: wait until C2 ready;
/* expected delete 2 row */
C1: commit;
MC: wait until C1 ready;
/* expected insert 1 row */
C2: commit;
MC: wait until C2 ready;
C3: select * from t1 order by 1,2;
C3: commit;

C1: quit;
C2: quit;
C3: quit;
