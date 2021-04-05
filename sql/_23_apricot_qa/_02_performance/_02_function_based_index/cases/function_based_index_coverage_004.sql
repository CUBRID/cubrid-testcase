--+ holdcas on;
create table t1 (i int, d double);
--Test
create index idx on t1 (sqrt(d));
--Test
create index idx2 on t1 (i) where i > 15;

insert into t1 values (4,25), (16,256), (20,400);
--Test
SHOW INDEXES FROM t1;

alter table t1 drop column d;
--Test
SHOW INDEXES FROM t1;

alter table t1 drop column i;
--Test
SHOW INDEXES FROM t1;

drop table t1;

commit;
--+ holdcas off;
