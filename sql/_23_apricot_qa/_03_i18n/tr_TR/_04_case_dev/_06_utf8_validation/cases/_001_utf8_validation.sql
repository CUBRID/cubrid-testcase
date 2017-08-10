--+ holdcas on;
set names utf8;
-- validation of UTF-8 streams
create table test_utf8(s1 CHAR(200) collate utf8_tr_cs);

-- Inalid 1 byte sequence
insert into t1 values ('�');

-- Inalid 2 byte sequence
insert into t1 values ('�p');

-- Inalid 3 byte sequence
insert into t1 values ('��x');

insert into t1 values ('�2');

insert into t1 values ('�@x');

insert into t1 values ('�x');

insert into t1 values ('�xx');

-- Inalid 4 byte sequence
insert into t1 values ('�P ');

insert into t1 values ('�x');

insert into t1 values ('�xx');

insert into t1 values ('�xxx');

insert into t1 values ('�x');

insert into t1 values ('�xx');

insert into t1 values ('�xxx');

insert into t1 values ('�x');

insert into t1 values ('�xx');

insert into t1 values ('�xxx');
-- Inalid 5 byte sequence
insert into t1 values ('�1xxx');

-- Inalid 6 byte sequence
insert into t1 values ('�xxxxx');

drop table test_utf8;
set names iso88591;
commit;
--+ holdcas off;


