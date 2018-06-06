--+ holdcas on;
--test optimizing with common user
call add_user('test_user') on class db_user;
create class t1(c1 int);
create class t2(c1 int);
create class t3(c1 int);
call login('test_user') on class db_user;
update statistics on t1, t2, t3;

call login('dba') on class db_user;
update statistics on t1, t2, t3;
drop class t1, t2, t3;
call drop_user('test_user') on class db_user;
--+ holdcas off;
