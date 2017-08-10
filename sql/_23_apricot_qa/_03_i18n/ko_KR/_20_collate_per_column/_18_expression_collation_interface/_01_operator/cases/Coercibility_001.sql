--+ holdcas on;
set names utf8;
CREATE TABLE t (s1 STRING COLLATE utf8_en_cs, s2 STRING COLLATE utf8_tr_cs);
insert into t values('i','h');
insert into t values('a','A');
SELECT s1, s2 FROM t WHERE s1 > s2;
SELECT s1, s2 FROM t WHERE s1 > CAST (s2 AS STRING COLLATE utf8_en_cs);
SELECT s1, s2 FROM t WHERE s1 > CAST (s2 AS STRING COLLATE utf8_bin);
SELECT s1, s2 FROM t WHERE s1 > CAST (s2 AS STRING COLLATE utf8_tr_cs);
SELECT s1, s2 FROM t WHERE s1 > CONCAT (s2,'');
SELECT s1, s2 FROM t WHERE s1 > 'abc';
drop table t;
set names iso88591;
commit;
--+ holdcas off;