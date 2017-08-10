--+ holdcas on;
set names utf8;
Create table t (col1 char(10) collate utf8_ko_cs_uca,col2 varchar(10) collate utf8_ko_cs_uca,col3 nchar(10) collate utf8_ko_cs_uca,col4 NCHAR VARYING(10) collate utf8_ko_cs_uca,col5 string collate utf8_ko_cs_uca);
create index idx1  on t(col1(2));
create index idx2  on t(col2(2));
create index idx3  on t(col3(2));
create index idx4  on t(col4(2));
create index idx5  on t(col5(2));
insert into t values('가伽佳假價加可呵哥嘉','가伽佳假價加可呵哥嘉',N'가伽佳假價加可呵哥嘉',N'가伽佳假價加可呵哥嘉','가伽佳假價加可呵哥嘉');
insert into t values('각刻却各恪慤殼珏脚覺','각刻却各恪慤殼珏脚覺',N'각刻却各恪慤殼珏脚覺',N'각刻却各恪慤殼珏脚覺','각刻却各恪慤殼珏脚覺');
insert into t values('가刻却各恪慤殼珏脚覺','가刻却各恪慤殼珏脚覺',N'가刻却各恪慤殼珏脚覺',N'가刻却各恪慤殼珏脚覺','가刻却各恪慤殼珏脚覺');
insert into t values('각伽佳假價加可呵哥嘉','각伽佳假價加可呵哥嘉',N'각伽佳假價加可呵哥嘉',N'각伽佳假價加可呵哥嘉','각伽佳假價加可呵哥嘉');
insert into t values('각刊墾奸姦干幹懇揀杆','각刊墾奸姦干幹懇揀杆',N'각刊墾奸姦干幹懇揀杆',N'각刊墾奸姦干幹懇揀杆','각刊墾奸姦干幹懇揀杆');
insert into t values('가假價加可呵哥嘉嫁家','가假價加可呵哥嘉嫁家',N'가假價加可呵哥嘉嫁家',N'가假價加可呵哥嘉嫁家','가假價加可呵哥嘉嫁家');
insert into t values('가佳假價加可呵哥嘉嫁','가佳假價加可呵哥嘉嫁',N'가佳假價加可呵哥嘉嫁',N'가佳假價加可呵哥嘉嫁','가佳假價加可呵哥嘉嫁');
select/*recompile*/* from t where col1>'' order by 1;
select/*recompile*/* from t where col2>'' order by 2;
select/*recompile*/* from t where col3>N'' order by 3;
select/*recompile*/* from t where col4>N'' order by 4;
select/*recompile*/* from t where col5>'' order by 5;
drop table t;
set names iso88591;
commit;
--+ holdcas off;