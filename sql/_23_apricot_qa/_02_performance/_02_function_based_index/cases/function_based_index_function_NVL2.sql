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
  0,
  0,
  -100,
  DATE '2008-10-31',
  TIME '00:00:00',
  TIMESTAMP '2010-10-31 01:15:45',
  DATETIME  '2008-10-31 13:15:45');
insert into t1 values (null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
insert into t1 values (null,null,null,null,null,null,0,null,null,null,null,null,null,null,null,null,null);
insert into t1 values (null,null,null,null,null,null,null,1,null,null,null,null,null,null,null,null,null);

--TEST Create successfully 
create index i_t1_a2q on t1(NVL2(a,a,'a'));
--TEST: should use index i_t1_a2q
select /*+ RECOMPILE */* from t1 where NVL2(a,a'a')='a' ;
--TEST Create successfully 
create index i_t1_a2p on t1(NVL2(b,b,'b'));
--TEST: should use both index i_t1_a2p and i_t1_a2q
select /*+ RECOMPILE */* from t1 where NVL2(b,b'b')='b' ;
--TEST Create successfully 
create index i_t1_a2o on t1(NVL2(c,c,'c'));
--TEST: should use index i_t1_a2o
select /*+ RECOMPILE */* from t1 where NVL2(c,c,'c')<>'c' ;
--TEST Create successfully 
create index i_t1_a2n on t1(NVL2(d,d,'d'));
--TEST: should use index i_t1_a2n
select /*+ RECOMPILE */* from t1 where LENGTH(NVL2(d,d,'d'))>1 ;
--TEST Create successfully 
create index i_t1_a2m on t1(NVL2(e,e,'1'));
--TEST: should use index i_t1_a2m
select /*+ RECOMPILE */* from t1 where NVL2(e,e,'1')='1' ;
--TEST Create successfully 
create index i_t1_a2l on t1(NVL2(f,f,'0'));
--TEST: should use index i_t1_a2l
select /*+ RECOMPILE */* from t1 where NVL2(f,f,'0')='0' ;
--TEST Create successfully 
create index i_t1_a2k on t1(NVL2(g,g,0));
--TEST: should use index i_t1_a2k
select /*+ RECOMPILE */* from t1 where NVL2(g,g,0)=0 ;
--TEST Create successfully 
create index i_t1_a2j on t1(NVL2(h,h,0));
--TEST: should use index i_t1_a2j
select /*+ RECOMPILE */* from t1 where NVL2(h,h,0)<=0 ;
--TEST Create successfully 
create index i_t1_a2i on t1(NVL2(i,i,0));
--TEST: should use index i_t1_a2i
select /*+ RECOMPILE */* from t1 where NVL2(i,i,0)>=0 ;
--TEST Create successfully 
create index i_t1_a2h on t1(NVL2(j,j,0));
--TEST: should use index i_t1_a2h
select /*+ RECOMPILE */* from t1 where NVL2(j,j,0)=0 ;
--TEST Create successfully 
create index i_t1_a2g on t1(NVL2(k,k,0));
--TEST: should use index i_t1_a2g
select /*+ RECOMPILE */* from t1 where NVL2(k,k,0)>=0 ;
--TEST Create successfully 
create index i_t1_a2f on t1(NVL2(l,l,0));
--TEST: should use index i_t1_a2f
select /*+ RECOMPILE */* from t1 where NVL2(l,l,0)=0 ;
--TEST Create successfully 
create index i_t1_a2e on t1(NVL2(m,m,0));
--TEST: should use index i_t1_a2e
select /*+ RECOMPILE */* from t1 where NVL2(m,m,0)=0 ;
--TEST Create successfully 
create index i_t1_a2d on t1(NVL2(n,n,'2008-10-31'));
--TEST: should use index i_t1_a2d
select /*+ RECOMPILE */* from t1 where NVL2(n,n,'2008-10-31')='2008-10-31' ;
--TEST Create successfully 
create index i_t1_a2c on t1(NVL2(o,o,'13:10:30'));
--TEST: should use index i_t1_a2c
select /*+ RECOMPILE */* from t1 where NVL2(o,o,'13:10:30')='13:10:30' ;
--TEST Create successfully 
create index i_t1_a2b on t1(NVL2(p,p,'2010-10-31 01:15:45'));
--TEST: should use index i_t1_a2b
select /*+ RECOMPILE */* from t1 where NVL2(p,p,'2010-10-31 01:15:45')='2010-10-31 01:15:45' ;
--TEST Create successfully 
create index i_t1_a2a on t1(NVL2(q,q,'2010-10-31 01:15:45'));
--TEST: should use index i_t1_a2a
select /*+ RECOMPILE */* from t1 where NVL2(q,q,'2010-10-31 01:15:45')=q ;

drop table t1;
commit;
--+ holdcas off;
