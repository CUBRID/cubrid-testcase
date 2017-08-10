--+ holdcas on;
set names utf8;
set system parameters 'intl_number_lang = de_DE';
set system parameters 'intl_date_lang = de_DE';
create table t( a time);
insert into t value(time '1:15:45 pm' );
insert into t value(time '16:08:33 am' );
insert into t value(time '1:15' );
insert into t value('16:08:33' );
insert into t VALUES (time '26:08:33' );
select * from t order by 1;
drop table t;
set system parameters 'intl_date_lang = en_US';
set system parameters 'intl_number_lang = en_US';
set names iso88591;
commit;
--+ holdcas off;