/*
Test Case: delete & update 
Priority: 1
Reference case:
Author: Ray

Test Plan: 
Test DELETE/UPDATE locks (X_LOCK on instance) if the instances of the transactions are not overlapped (with composite index)

Test Scenario:
C1 delete, C2 update, the affected rows are not overlapped
C1 where clause is not on index (i.e. heap scan), C2 where clause is on index (index scan)
C2 commit, C1 rollback
Metrics: data size = small, index = composite index(unique), where clause = simple, schema = single table

Test Point:
1) C1 and C2 will not be waiting 
2) C1 instances won't be deleted since C1 rollback, C2 instances should be updated

NUM_CLIENTS = 3
C1: delete from table t1;   
C2: update table t1;    
C3: select on table t1; C3 is used to check the updated result
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
C1: CREATE TABLE t1(id INT, col VARCHAR(10), tag VARCHAR(2));
C1: CREATE UNIQUE INDEX idx_id_col on t1(id,col) with online parallel 7;
C1: INSERT INTO t1 VALUES(1,'abc','A');INSERT INTO t1 VALUES(2,'def','B');INSERT INTO t1 VALUES(3,'ghi','C');INSERT INTO t1 VALUES(4,'jkl','D');INSERT INTO t1 VALUES(5,'mno','E');INSERT INTO t1 VALUES(6,'pqr','F');INSERT INTO t1 VALUES(7,'stu','G');
C1: COMMIT WORK;
MC: wait until C1 ready;

/* test case */
C1: DELETE FROM t1 WHERE tag >= 'C' and tag <= 'E';
MC: wait until C1 ready;
C2: UPDATE t1 SET tag = 'D', id = 0 WHERE id = 1 or id IN (3,7) and col != 'ghi' ;
/* expect: no transactions need to wait */
MC: wait until C2 ready;
/* expect: C1 select - id = 3,4,5 are deleted */
C1: SELECT * FROM t1 order by 1,2;
MC: wait until C1 ready;
/* expect: C2 select - id = 1,7 are updated */
C2: SELECT * FROM t1 order by 1,2;
C2: commit;
/* expect: C1 select - id = 3,4,5 are deleted, id = 1,7 are updated */
C1: SELECT * FROM t1 order by 1,2;
C1: rollback;
/* expect: the instances of id = 1,7 are deleted, no instance is deleted */
C3: select * from t1 order by 1,2;

C3: commit;
C1: quit;
C2: quit;
C3: quit;