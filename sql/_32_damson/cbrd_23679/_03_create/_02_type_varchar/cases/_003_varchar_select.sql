set system parameters 'allow_truncated_string=no';

---------- INSERT INTO ... SELECT ...
drop table if exists t1;
create table t1 (col1 int, col2 varchar(5));
insert into t1 values (1, 'abcde');
insert into t1 values (2, '12345');
show columns from t1;
select * from t1;

-- precision > value : OK
drop table if exists t2;
create table t2 (col1 int, col2 varchar(7));
show columns from t2;
insert into t2 select * from t1 order by 1;
select * from t2 order by 1;

-- precision = value : OK
drop table if exists t2;
create table t2 (col1 int, col2 varchar(5));
show columns from t2;
insert into t2 select * from t1 order by 1;
select * from t2 order by 1;

-- precision < value :truncated string
drop table if exists t2;
create table t2 (col1 int, col2 varchar(3));
show columns from t2;
insert into t2 select * from t1 order by 1;
select * from t2 order by 1;

drop table t1;
drop table t2;
set system parameters 'allow_truncated_string=no';
