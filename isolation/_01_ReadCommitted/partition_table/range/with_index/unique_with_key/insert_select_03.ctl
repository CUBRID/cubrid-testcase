/*
Test Case: insert & select
Priority: 1
Reference case:
Author: Rong Xu

Test Point:
there are lots of unvacuummed version, one user insert, another select min

NUM_CLIENTS = 2
C2: commit -- 1 row insert
*/

MC: setup NUM_CLIENTS = 2;

C1: set transaction lock timeout INFINITE;
C1: set transaction isolation level read committed;

C2: set transaction lock timeout INFINITE;
C2: set transaction isolation level read committed;

/* preparation */
C1: drop table if exists t;
C1: create table t(id int,col varchar(10),col1 varchar(10)) partition by range(id)(partition p1 values less than (50000),partition p2 values less than (100000));
C1: set @newincr=0;
C1: insert into t select (@newincr:=@newincr+1),'a','b' from db_class a,db_class b,db_class c,db_class d limit 40000;
C1: set @newincr=0;
C1: insert into t select (@newincr:=@newincr+1)+50000,'a','b' from db_class a,db_class b,db_class c,db_class d limit 40000;
C1: create unique index idx on t(id,col);
C1: commit work;
MC: wait until C1 ready;

/* prepare unvacuummed data */
C1: update t set id=id+1 where id<50000;
C2: update t set id=id+1 where id>=50000;
MC: wait until C1 ready;
MC: wait until C2 ready;
C1: commit;
C2: commit;
C1: update t set id=id+1 where id<50000;
C2: update t set id=id+1 where id>=50000;
MC: wait until C1 ready;
MC: wait until C2 ready;
C1: commit;
C2: commit;
C1: update t set id=id+1 where id<50000;
C2: update t set id=id+1 where id>=50000;
MC: wait until C1 ready;
MC: wait until C2 ready;
C1: commit;
C2: commit;

/* test case */
C1: insert into t values(1,'abc','a');
MC: wait until C1 ready;
/* expected 4 */
C2: select min(id) from t where id>0;
/* expected 4 */
C2: select min(id) from t where id<50000;
/* expected 50004 */
C2: select min(id) from t where id>50000;
MC: wait until C2 ready;
C1: commit;
MC: wait until C1 ready;
/* expected 1 */
C2: select min(id) from t where id>0;
C2: commit work;

C2: quit;
C1: quit;
