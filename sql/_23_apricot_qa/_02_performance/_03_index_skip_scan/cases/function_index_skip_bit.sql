--+ holdcas on;
create table mille as select 0 as i from table({1,2,3,4,5,6,7,8,9,0}) t1, table({1,2,3,4,5,6,7,8,9,0}) t2, table({1,2,3,4,5,6,7,8,9,0}) t3,table({1,2,3,4,5,6,7,8,9,0}) t4;

create table t (i bit(1), j int, k int, l int);

insert into t(i,j,k,l) select B'1', rownum,rownum,rownum from mille;
insert into t(i,j,k,l) select null, rownum,rownum,rownum from mille;


drop table mille;

create reverse unique index idx on t(i,j,k);


update statistics on all classes;
--test should use ISS
select /*+ recompile INDEX_SS */ * from t where j = 1 order by 1;
select /*+ recompile INDEX_SS */ * from t where j = any{1} order by 1;
select /*+ recompile INDEX_SS */ * from t where j = any{1} and i is null order by i;
select /*+ recompile INDEX_SS */ * from t where j = any{1} and i is not null order by 1;;

select /*+ recompile INDEX_SS */ * from t where j = any{1} and i is null order by i desc;


drop table t;
commit;
--+ holdcas off;
