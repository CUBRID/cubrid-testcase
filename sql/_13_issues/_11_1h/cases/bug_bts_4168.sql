--+ holdcas on;

drop table if exists t1;
create table t1(c1 int, c2 int, c3 int);
insert into t1 values (1, 1, 1);
--TEST:  exists syntax error for below query
select /*+ recompile */ c1,c2,c3 from t1 where c2;


drop table t1;

commit;

--+ holdcas off;

