--+ holdcas on;
create table t1(a int)
PARTITION BY RANGE (a)
(PARTITION before_10 VALUES LESS THAN (10),
PARTITION before_20 VALUES LESS THAN (20));

insert into t1 values (null);
insert into t1 values (7);
insert into t1 values (9);
insert into t1 values (8);
insert into t1 values (17);
insert into t1 values (19);
insert into t1 values (18);

select /*+ recompile */ a from t1 where a is not null order by a;


drop table t1;

commit;
--+ holdcas off;
