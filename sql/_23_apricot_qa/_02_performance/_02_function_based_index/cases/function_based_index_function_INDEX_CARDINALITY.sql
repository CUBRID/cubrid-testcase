--+ holdcas on;
CREATE TABLE t1 (col int, col2 DATE, col3 DATE);
create index idx_col0 on t1(col);
--Test create index failed;
create index idx_col1 on t1(INDEX_CARDINALITY('t1','idx_col0',0));
drop table t1;

commit;
--+ holdcas off;
