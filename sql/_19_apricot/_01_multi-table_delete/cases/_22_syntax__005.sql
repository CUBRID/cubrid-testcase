--SERVER
create class t(i int, set_col set(int));

insert into t values (1, {0, 1});
insert into t values (2, {0, 2});

delete t1 from t, table(set_col) as t1(a);

delete t from t, table(set_col) as t1(a);
select * from t order by 1;

drop class t;