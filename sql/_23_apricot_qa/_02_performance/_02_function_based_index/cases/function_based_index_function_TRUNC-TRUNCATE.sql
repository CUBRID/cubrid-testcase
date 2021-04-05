--+ holdcas on;
create table t1(  a char(1200),   b varchar(1200),  c nchar(1200),  d NCHAR VARYING(1200),  e BIT(1200),  f BIT VARYING(1200),  g int,  h SMALLINT,  i BIGINT,  j NUMERIC,  k FLOAT,  l DOUBLE,  m MONETARY,  n DATE,  o TIME,  p TIMESTAMP,  q DATETIME);

insert into t1 values (
  '1234567890',
  '1234567890',
  N'abc',
  N'ABC',
  B'1111111111',
  B'1111111111',
  10,
  255,
  9223372036854775807,
  0,
  1234.5678,
  -1234.5678,
  -100,
  DATE '2008-10-31',
  TIME '00:00:00',
  TIMESTAMP '2010-10-31 01:15:45',
  DATETIME  '2008-10-31 13:15:45');
insert into t1 values (null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);

--TEST Create failed 
create index i_t1_a2q on t1(TRUNC(a,0));
--TEST Create failed 
create index i_t1_a2p on t1(TRUNC(b,0));
--TEST Create failed 
create index i_t1_a2o on t1(TRUNC(c,0));
--TEST Create failed 
create index i_t1_a2n on t1(TRUNC(d,0));
--TEST Create failed 
create index i_t1_a2m on t1(TRUNC(e,0));
--TEST Create failed 
create index i_t1_a2l on t1(TRUNC(f,0));
--TEST Create successfully 
create index i_t1_a2k on t1(TRUNC(g,0));
--TEST: should use index i_t1_a2k
select /*+ RECOMPILE */* from t1 where TRUNC(g,0)=10;
--TEST Create successfully 
create index i_t1_a2j on t1(TRUNC(h,-1));
--TEST: should use index i_t1_a2j
select /*+ RECOMPILE */* from t1 where TRUNC(h,-1)=250 ;
--TEST Create successfully 
create index i_t1_a2i on t1(TRUNC(i,0));
--TEST: should use index i_t1_a2i
select /*+ RECOMPILE */* from t1 where TRUNC(i,0) =9223372036854775807 ;
--TEST Create successfully 
create index i_t1_a2h on t1(TRUNC(j,0));
--TEST: should use index i_t1_a2h
select /*+ RECOMPILE */* from t1 where TRUNC(j,0)=0 ;
--TEST Create successfully 
create index i_t1_a2g on t1(TRUNC(k,3));
--TEST: should use index i_t1_a2g
select /*+ RECOMPILE */* from t1 where TRUNC(k,3)< 1234.5678;
--TEST Create successfully 
create index i_t1_a2f on t1(TRUNC(l,g));
--TEST: should use index i_t1_a2f
select /*+ RECOMPILE */* from t1 where TRUNC(l,g)<0 ;
--TEST Create successfully 
create index i_t1_a2e on t1(TRUNC(m,0));
--TEST: should use index i_t1_a2e
select /*+ RECOMPILE */* from t1 where TRUNC(m,0)<0 ;
--TEST Create failed 
create index i_t1_a2d on t1(TRUNC(n,0));
--TEST Create failed 
create index i_t1_a2c on t1(TRUNC(o,0));
--TEST Create failed 
create index i_t1_a2b on t1(TRUNC(p,0));
--TEST Create failed 
create index i_t1_a2a on t1(TRUNC(q,0));
--TEST Create failed 
create index i_t1_a2a1 on t1(TRUNC(pi()/3,0));
--TEST Create failed 
create index i_t1_a2a2 on t1(TRUNC(h/3),0);
drop table t1;
commit;
--+ holdcas off;
