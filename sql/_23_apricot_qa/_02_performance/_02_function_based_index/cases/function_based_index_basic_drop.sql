--+ holdcas on;
create table t(d double);
--test
create index idx on t(ceil(d));
--test
drop index idx on t(ceil(d));
create index idx on t(ceil(d));
--test
drop index idx on t;
drop table t;
commit;
--+ holdcas off;
