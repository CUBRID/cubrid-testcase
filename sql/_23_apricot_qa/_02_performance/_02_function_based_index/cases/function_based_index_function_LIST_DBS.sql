--+ holdcas on;
CREATE TABLE t1 (col int, col2 DATE, col3 DATE);
create index idx_col0 on t1(col);
--Test create index failed;
create index idx_col1 on t1(LIST_DBS());
drop table t1;

commit;
--+ holdcas off;
