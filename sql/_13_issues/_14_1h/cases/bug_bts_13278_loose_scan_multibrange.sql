-- create tables
autocommit off;

drop table if exists t;

create table t(id int primary key auto_increment, a int, b int, c int, d int);
insert into t (a,b,c,d) select mod(rownum,10), mod(rownum,10), mod(rownum,10), rownum from db_class x1, db_class x2, db_class x3 limit 15000;
insert into t (a,b,c,d) values (null, null, 888, null);

-- all null key
insert into t (a,b,c,d) values (null, null, null, null);
insert into t (a,b,c,d) values (0, null, null, null);
insert into t (a,b,c,d) values (1, null, null, null);
insert into t (a,b,c,d) values (2, null, null, null);
insert into t (a,b,c,d) values (3, null, null, null);
insert into t (a,b,c,d) values (4, null, null, null);
insert into t (a,b,c,d) values (5, null, null, null);
insert into t (a,b,c,d) values (6, null, null, null);
insert into t (a,b,c,d) values (7, null, null, null);
insert into t (a,b,c,d) values (8, null, null, null);
insert into t (a,b,c,d) values (9, null, null, null);
insert into t (a,b,c,d) values (0, 0, null, null);
insert into t (a,b,c,d) values (1, 1, null, null);
insert into t (a,b,c,d) values (2, 2, null, null);
insert into t (a,b,c,d) values (3, 3, null, null);
insert into t (a,b,c,d) values (4, 4, null, null);
insert into t (a,b,c,d) values (5, 5, null, null);
insert into t (a,b,c,d) values (6, 6, null, null);
insert into t (a,b,c,d) values (7, 7, null, null);
insert into t (a,b,c,d) values (8, 8, null, null);
insert into t (a,b,c,d) values (9, 9, null, null);
insert into t (a,b,c,d) values (0, 0, 0, null);
insert into t (a,b,c,d) values (1, 1, 1, null);
insert into t (a,b,c,d) values (2, 2, 2, null);
insert into t (a,b,c,d) values (3, 3, 3, null);
insert into t (a,b,c,d) values (4, 4, 4, null);
insert into t (a,b,c,d) values (5, 5, 5, null);
insert into t (a,b,c,d) values (6, 6, 6, null);
insert into t (a,b,c,d) values (7, 7, 7, null);
insert into t (a,b,c,d) values (8, 8, 8, null);
insert into t (a,b,c,d) values (9, 9, 9, null);

-- min keys
insert into t (a,b,c,d) values (-2147483648, -2147483648, -2147483648, -2147483648);
insert into t (a,b,c,d) values (0, -2147483648, -2147483648, -2147483648);
insert into t (a,b,c,d) values (1, -2147483648, -2147483648, -2147483648);
insert into t (a,b,c,d) values (2, -2147483648, -2147483648, -2147483648);
insert into t (a,b,c,d) values (3, -2147483648, -2147483648, -2147483648);
insert into t (a,b,c,d) values (4, -2147483648, -2147483648, -2147483648);
insert into t (a,b,c,d) values (5, -2147483648, -2147483648, -2147483648);
insert into t (a,b,c,d) values (6, -2147483648, -2147483648, -2147483648);
insert into t (a,b,c,d) values (7, -2147483648, -2147483648, -2147483648);
insert into t (a,b,c,d) values (8, -2147483648, -2147483648, -2147483648);
insert into t (a,b,c,d) values (9, -2147483648, -2147483648, -2147483648);
insert into t (a,b,c,d) values (0, 0, -2147483648, -2147483648);
insert into t (a,b,c,d) values (1, 1, -2147483648, -2147483648);
insert into t (a,b,c,d) values (2, 2, -2147483648, -2147483648);
insert into t (a,b,c,d) values (3, 3, -2147483648, -2147483648);
insert into t (a,b,c,d) values (4, 4, -2147483648, -2147483648);
insert into t (a,b,c,d) values (5, 5, -2147483648, -2147483648);
insert into t (a,b,c,d) values (6, 6, -2147483648, -2147483648);
insert into t (a,b,c,d) values (7, 7, -2147483648, -2147483648);
insert into t (a,b,c,d) values (8, 8, -2147483648, -2147483648);
insert into t (a,b,c,d) values (9, 9, -2147483648, -2147483648);
insert into t (a,b,c,d) values (0, 0, 0, -2147483648);
insert into t (a,b,c,d) values (1, 1, 1, -2147483648);
insert into t (a,b,c,d) values (2, 2, 2, -2147483648);
insert into t (a,b,c,d) values (3, 3, 3, -2147483648);
insert into t (a,b,c,d) values (4, 4, 4, -2147483648);
insert into t (a,b,c,d) values (5, 5, 5, -2147483648);
insert into t (a,b,c,d) values (6, 6, 6, -2147483648);
insert into t (a,b,c,d) values (7, 7, 7, -2147483648);
insert into t (a,b,c,d) values (8, 8, 8, -2147483648);
insert into t (a,b,c,d) values (9, 9, 9, -2147483648);

-- max keys
insert into t (a,b,c,d) values (2147483647, 2147483647, 2147483647, 2147483647);
insert into t (a,b,c,d) values (0, 2147483647, 2147483647, 2147483647);
insert into t (a,b,c,d) values (1, 2147483647, 2147483647, 2147483647);
insert into t (a,b,c,d) values (2, 2147483647, 2147483647, 2147483647);
insert into t (a,b,c,d) values (3, 2147483647, 2147483647, 2147483647);
insert into t (a,b,c,d) values (4, 2147483647, 2147483647, 2147483647);
insert into t (a,b,c,d) values (5, 2147483647, 2147483647, 2147483647);
insert into t (a,b,c,d) values (6, 2147483647, 2147483647, 2147483647);
insert into t (a,b,c,d) values (7, 2147483647, 2147483647, 2147483647);
insert into t (a,b,c,d) values (8, 2147483647, 2147483647, 2147483647);
insert into t (a,b,c,d) values (9, 2147483647, 2147483647, 2147483647);
insert into t (a,b,c,d) values (0, 0, 2147483647, 2147483647);
insert into t (a,b,c,d) values (1, 1, 2147483647, 2147483647);
insert into t (a,b,c,d) values (2, 2, 2147483647, 2147483647);
insert into t (a,b,c,d) values (3, 3, 2147483647, 2147483647);
insert into t (a,b,c,d) values (4, 4, 2147483647, 2147483647);
insert into t (a,b,c,d) values (5, 5, 2147483647, 2147483647);
insert into t (a,b,c,d) values (6, 6, 2147483647, 2147483647);
insert into t (a,b,c,d) values (7, 7, 2147483647, 2147483647);
insert into t (a,b,c,d) values (8, 8, 2147483647, 2147483647);
insert into t (a,b,c,d) values (9, 9, 2147483647, 2147483647);
insert into t (a,b,c,d) values (0, 0, 0, 2147483647);
insert into t (a,b,c,d) values (1, 1, 1, 2147483647);
insert into t (a,b,c,d) values (2, 2, 2, 2147483647);
insert into t (a,b,c,d) values (3, 3, 3, 2147483647);
insert into t (a,b,c,d) values (4, 4, 4, 2147483647);
insert into t (a,b,c,d) values (5, 5, 5, 2147483647);
insert into t (a,b,c,d) values (6, 6, 6, 2147483647);
insert into t (a,b,c,d) values (7, 7, 7, 2147483647);
insert into t (a,b,c,d) values (8, 8, 8, 2147483647);
insert into t (a,b,c,d) values (9, 9, 9, 2147483647);

-- all possibilities
create index i_t_all on t(a asc, b asc, c asc, d asc);
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a, b;
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a desc, b desc;
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a desc, b;
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a, b desc;
alter table t drop index i_t_all;

create index i_t_all on t(a asc, b asc, c asc, d desc);
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a, b;
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a desc, b desc;
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a desc, b;
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a, b desc;
alter table t drop index i_t_all;

create index i_t_all on t(a asc, b asc, c desc, d asc);
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a, b;
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a desc, b desc;
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a desc, b;
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a, b desc;
alter table t drop index i_t_all;

create index i_t_all on t(a asc, b asc, c desc, d desc);
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a, b;
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a desc, b desc;
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a desc, b;
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a, b desc;
alter table t drop index i_t_all;

create index i_t_all on t(a asc, b desc, c asc, d asc);
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a, b;
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a desc, b desc;
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a desc, b;
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a, b desc;
alter table t drop index i_t_all;

create index i_t_all on t(a asc, b desc, c asc, d desc);
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a, b;
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a desc, b desc;
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a desc, b;
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a, b desc;
alter table t drop index i_t_all;

create index i_t_all on t(a asc, b desc, c desc, d asc);
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a, b;
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a desc, b desc;
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a desc, b;
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a, b desc;
alter table t drop index i_t_all;

create index i_t_all on t(a asc, b desc, c desc, d desc);
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a, b;
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a desc, b desc;
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a desc, b;
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a, b desc;
alter table t drop index i_t_all;



create index i_t_all on t(a desc, b asc, c asc, d asc);
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a, b;
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a desc, b desc;
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a desc, b;
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a, b desc;
alter table t drop index i_t_all;

create index i_t_all on t(a desc, b asc, c asc, d desc);
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a, b;
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a desc, b desc;
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a desc, b;
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a, b desc;
alter table t drop index i_t_all;

create index i_t_all on t(a desc, b asc, c desc, d asc);
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a, b;
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a desc, b desc;
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a desc, b;
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a, b desc;
alter table t drop index i_t_all;

create index i_t_all on t(a desc, b asc, c desc, d desc);
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a, b;
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a desc, b desc;
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a desc, b;
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a, b desc;
alter table t drop index i_t_all;

create index i_t_all on t(a desc, b desc, c asc, d asc);
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a, b;
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a desc, b desc;
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a desc, b;
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a, b desc;
alter table t drop index i_t_all;

create index i_t_all on t(a desc, b desc, c asc, d desc);
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a, b;
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a desc, b desc;
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a desc, b;
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a, b desc;
alter table t drop index i_t_all;

create index i_t_all on t(a desc, b desc, c desc, d asc);
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a, b;
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a desc, b desc;
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a desc, b;
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a, b desc;
alter table t drop index i_t_all;

create index i_t_all on t(a desc, b desc, c desc, d desc);
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a, b;
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a desc, b desc;
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a desc, b;
select /*+ recompile index_ls */ a,b from t where (a>4 and a<6) or (a>7 and a<9) group by a, b desc;
alter table t drop index i_t_all;


-- cleanup
drop table t;
autocommit on;