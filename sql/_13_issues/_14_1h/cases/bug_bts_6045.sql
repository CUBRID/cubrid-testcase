drop table if exists t1;
drop table if exists t2;
create table t1(i int);
insert into t1 values(1),(2),(3);
create table t2(j int);
insert into t2 values(11),(22),(33);
select * from t1 cross join t2;
select * from (t1 cross join t2);
drop table if exists t1;
drop table if exists t2;
