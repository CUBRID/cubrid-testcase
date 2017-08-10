--+ holdcas on;
set  system parameters 'dont_reuse_heap_file=yes';
create table mille as select 0 as i from table({1,2,3,4,5,6,7,8,9,0}) t1, table({1,2,3,4,5,6,7,8,9,0}) t2, table({1,2,3,4,5,6,7,8,9,0}) t3, table({0,1,2,3}) t4;

create table t (i int, j int, k int, l int);
insert into t(i,j,k,l) select i+2, 2*((rownum-1)%50+1)-1+100,rownum,rownum from mille;
insert into t(i,j,k,l) select i+1, 2*((rownum-1)%50+1)-1+100,rownum,rownum from mille;
insert into t(i,j,k,l) select i+0, 2*((rownum-1)%50+1)  ,rownum,rownum from mille;
insert into t(i,j,k,l) select i+3, 2*((rownum-1)%50+1)  ,rownum,rownum from mille;
insert into t(i,j,k,l) select i+4, 2*((rownum-1)%50+1)  ,rownum,rownum from mille;

drop table mille;

create index idx on t(i,j,k);
select count (*) from t;

update statistics on all classes;
--Test
select /*+ recompile INDEX_SS */ * from t where j = 100 order by 1;
--Test
select /*+ recompile INDEX_SS */ * from t where j = 199 order by 1;

--Test select EVERYTHING from ranges 1 ans 2
select /*+ recompile  */ count(*) from (select /*+ recompile index_ss */ * from t where j between 101 and 199) tt;


--Test select EVERYTHING from ranges 0,3 and 4
select /*+ recompile  */ count(*) from (select /*+ recompile index_ss */ * from t where j between 2 and 100) tt;


insert into t values (0,100, 9999, 23);
insert into t values (1,199, 9999, 23);
insert into t values (2,199, 9999, 23);
insert into t values (3,100, 9999, 23);
insert into t values (4,100, 9999, 23);


--Test select EVERYTHING from ranges 1 ans 2
select /*+ recompile  */ count(*) from (select /*+ recompile index_ss */ * from t where j between 101 and 199) tt;


--Test select EVERYTHING from ranges 0,3 and 4
select /*+ recompile  */ count(*) from (select /*+ recompile index_ss */ * from t where j between 2 and 100) tt;


drop table t;
set  system parameters 'dont_reuse_heap_file=no';
commit;
--+ holdcas off;
