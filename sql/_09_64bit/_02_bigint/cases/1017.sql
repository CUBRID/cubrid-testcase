create class test_class (bigint_col bigint, smallint_col smallint, int_col int, numeric_col numeric,float_col float, double_col double);
insert into test_class(bigint_col, smallint_col, int_col, numeric_col, float_col, double_col) values (9223372036854775807, 1, 2, 3.3, 4.4, 5.5);

update test_class set smallint_col = smallint_col + bigint_col;
update test_class set int_col = int_col + bigint_col;
update test_class set numeric_col = numeric_col + bigint_col;
update test_class set float_col = float_col + bigint_col;
update test_class set double_col = double_col + bigint_col;

select * from test_class;

drop class test_class; 