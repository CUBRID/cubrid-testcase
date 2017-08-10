--+ holdcas on;
set names utf8;
set system parameters 'intl_number_lang = ko_KR';
set system parameters 'intl_date_lang = ko_KR';
create table t( a DATE);
insert into t value(DATE '2012.1.31' );
insert into t value(DATE '2012.2.29' );
insert into t value(DATE '2012.2.30' );
insert into t value(DATE '2011.2.29' );
insert into t value('2012.1.31' );
select * from t order by 1;
drop table t;
set system parameters 'intl_date_lang = en_US';
set system parameters 'intl_number_lang = en_US';
set names iso88591;
commit;
--+ holdcas off;