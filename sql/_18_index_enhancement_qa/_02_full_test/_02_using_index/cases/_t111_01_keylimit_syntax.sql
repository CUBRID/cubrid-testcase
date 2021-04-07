--+ holdcas on;
CREATE TABLE t1 (
   a  INT NOT NULL,
   b  VARCHAR(40) NOT NULL,
   c  CHAR(3)
  );
CREATE UNIQUE INDEX idx_t1_ac ON t1(a,c);
CREATE INDEX idx_t1_abc ON t1(a,b,c);

insert into t1 values (1, 'Adalius', '086');
insert into t1 values (2, 'Agassi', '086');
insert into t1 values (3, 'Ahman', '086');
insert into t1 values (4, 'Alcott', '086');
insert into t1 values (5, 'Ali', '086');
insert into t1 values (6, 'Bdalius', '011');
insert into t1 values (7, 'Bgassi', '011');
insert into t1 values (8, 'Bhman', '011');
insert into t1 values (9, 'Blcott', '011');
insert into t1 values (10, 'Bli', '011');

--TEST:  expect ok
select /*+ RECOMPILE */ a,b,c from t1 where a<100 and c='086' using index idx_t1_ac(+) keylimit 3;

--TEST:  expect ok
select /*+ RECOMPILE */ a,b,c from t1 where a<100 and c='086' using index idx_t1_ac(+) keylimit 1,3;

--TEST:  expect ok
select /*+ RECOMPILE */ a,b,c from t1 where a<100 and c='086' using index idx_t1_ac(+) keylimit 1,1;

--TEST:  expect ?
select /*+ RECOMPILE */ a,b,c from t1 where a<100 and c='086' using index idx_t1_ac(+) keylimit keylimit  -1,1 ;

--TEST:  expect ?
select /*+ RECOMPILE */ a,b,c from t1 where a<100 and c='086' using index idx_t1_ac(+) keylimit(+) -1,1 ;

--TEST:  expect ?
select /*+ RECOMPILE */ a,b,c from t1 where a<100 and c='086' using index idx_t1_ac(+) keylimit -1,1, keylimit -1,1 ;


--TEST:  expect ?
select /*+ RECOMPILE */ a,b,c from t1 where a<100 and c='086' using index idx_t1_ac(+) keylimit -1,1;

--TEST:  expect ?
select /*+ RECOMPILE */ a,b,c from t1 where a<100 and c='086' using index idx_t1_ac(+) keylimit 1,-1;

--TEST:  expect ?
select /*+ RECOMPILE */ a,b,c from t1 where a<100 and c='086' using index idx_t1_ac(+) keylimit -10,-1;

--TEST:  expect ?
select /*+ RECOMPILE */ a,b,c from t1 where a<100 and c='086' using index idx_t1_ac(+) keylimit 1*1,3*1;

--TEST:  expect ?
select /*+ RECOMPILE */ a,b,c from t1 where a<100 and c='086' using index idx_t1_ac(+) keylimit ROWNUM;

--TEST:  expect ?
select /*+ RECOMPILE */ a,b,c from t1 where a<100 and c='086' using index idx_t1_ac(+) keylimit (select 1 from db_root);

--TEST:  expect ?
select /*+ RECOMPILE */ a,b,c from t1 where a<100 and c='086' using index idx_t1_ac(+) keylimit '1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111';

--TEST: expect error
select /*+ RECOMPILE */ a,b,c from t1 where a<100 and c='086' using index idx_t1_ac(+) keylimit;

--TEST: expect ? (max integer)
select /*+ RECOMPILE */ a,b,c from t1 where a<100 and c='086' using index idx_t1_ac(+) keylimit 2147483647;

--TEST: expect ? (min and max integer)
select /*+ RECOMPILE */ a,b,c from t1 where a<100 and c='086' using index idx_t1_ac(+) keylimit -2147483648, 2147483647;

--TEST: expect ? (min and max bigint)
select /*+ RECOMPILE */ a,b,c from t1 where a<100 and c='086' using index idx_t1_ac(+) keylimit -9223372036854775808,9223372036854775807;

--TEST: expect ? (min and max short)
select /*+ RECOMPILE */ a,b,c from t1 where a<100 and c='086' using index idx_t1_ac(+) keylimit -32768,32767;

--TEST: expect ? (float)
select /*+ RECOMPILE */ a,b,c from t1 where a<100 and c='086' using index idx_t1_ac(+) keylimit 3.55;

--TEST: expect ? (char)
select /*+ RECOMPILE */ a,b,c from t1 where a<100 and c='086' using index idx_t1_ac(+) keylimit 'c';

--TEST: expect ? (char)
select /*+ RECOMPILE */ a,b,c from t1 where a<100 and c='086' using index idx_t1_ac(+) keylimit '3';

--TEST: expect ? (char)
select /*+ RECOMPILE */ a,b,c from t1 where a<100 and c='086' using index idx_t1_ac(+) keylimit 1,'3';

--TEST: expect ? (from is greate than to value)
select /*+ RECOMPILE */ a,b,c from t1 where a<100 and c='086' using index idx_t1_ac(+) keylimit 3,1;

--TEST: expect ? (from is equal to value)
select /*+ RECOMPILE */ a,b,c from t1 where a<100 and c='086' using index idx_t1_ac(+) keylimit 2,2;

--TEST: expect ? (date)
select /*+ RECOMPILE */ a,b,c from t1 where a<100 and c='086' using index idx_t1_ac(+) keylimit DATE('2010-10-28');

--TEST: expect ? (time)
select /*+ RECOMPILE */ a,b,c from t1 where a<100 and c='086' using index idx_t1_ac(+) keylimit TIME('14:33:33');

--TEST: expect ? (time)
select /*+ RECOMPILE */ a,b,c from t1 where a<100 and c='086' using index idx_t1_ac(+) keylimit TIME('14:33:33');

--TEST:
update t1 set a=16,c='022' where a<10 and c='011' using index idx_t1_ac keylimit 1; 

--TEST:
update t1 set a=17,c='022' where a<10 and c='011' using index idx_t1_ac keylimit 1,1;

--TEST:
update t1 set a=19,c='022' where a<10 and c='011' using index idx_t1_ac keylimit 2,2;

--TEST:
update t1 set a=8+10+rownum-1,c='022' where a<10 and c='011' using index idx_t1_ac keylimit 1,2;

--TEST: should use cover index idx_t1_abc
select /*+ RECOMPILE */ a,b,c from t1 order by 1,2,3;

--TEST
delete from t1 where a<=20 and c='022' using index idx_t1_ac keylimit 1;

--TEST
delete from t1 where a<=20 and c='022' using index idx_t1_ac keylimit 4,4;

--TEST: should use cover index idx_t1_abc
select /*+ RECOMPILE */ a,b,c from t1 order by 1,2,3;

drop table t1;
commit;
--+ holdcas off;
