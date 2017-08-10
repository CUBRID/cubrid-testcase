-- create a hash partition table  on char field with size 4 and a hash partition table on char field with size 6  and query data from the two join table and then drop tables

create table hash_test(id int not null ,
			  test_char char(50),
			  test_varchar varchar(2000),
			  test_bit bit(16),
			  test_varbit bit varying(20),
			  test_nchar nchar(50),
			  test_nvarchar nchar varying(2000),
			  test_string string,
			  test_datetime timestamp,primary key(id,test_char))
	PARTITION BY HASH(test_char)
        PARTITIONS 4;
	insert into hash_test values(1,'aaa','aaa',B'100',B'1011',N'aaa',N'aaa','aaaaaaaaaa','2006-03-01 09:00:00');
	insert into hash_test values(2,'bbb','bbb',B'100',B'1100',N'bbb',N'bbb','bbbbbbbbbb','2006-03-01 09:00:00');
	insert into hash_test values(3,'ccc','ccc',B'100',B'1110',N'ccc',N'ccc','cccccccccc','2006-03-01 09:00:00');
	insert into hash_test values(4,'ddd','ddd',B'100',B'1110',N'ddd',N'ddd','dddddddddd','2006-03-01 09:00:00');
	insert into hash_test values(5,'eee','eee',B'101',B'1111',N'eee',N'eee','eeeeeeeeee','2006-03-01 09:00:00');
	insert into hash_test values(6,'fff','fff',B'101',B'1111',N'fff',N'fff','ffffffffff','2006-03-01 09:00:00');
	insert into hash_test values(7,'ggg','ggg',B'101',B'1111',N'ggg',N'ggg','gggggggggg','2006-03-01 09:00:00');
	insert into hash_test values(8,'hhh','hhh',B'101',B'1111',N'hhh',N'hhh','hhhhhhhhhh','2006-03-01 09:00:00');
	insert into hash_test values(9,'iii','iii',B'101',B'1111',N'iii',N'iii','iiiiiiiiii','2006-03-01 09:00:00');
	insert into hash_test values(10,'jjj','jjj',B'101',B'1111',N'jjj',N'jjj','jjjjjjjjjj','2006-03-01 09:00:00');
	insert into hash_test values(11,'kkk','kkk',B'100',B'1011',N'kkk',N'kkk','kkkkkkkkkk','2006-03-01 09:00:00');
	insert into hash_test values(12,'lll','lll',B'100',B'1100',N'lll',N'lll','llllllllll','2006-03-01 09:00:00');
	insert into hash_test values(13,'mmm','mmm',B'100',B'1110',N'mmm',N'mmm','mmmmmmmmmm','2006-03-01 09:00:00');
	insert into hash_test values(14,'nnn','nnn',B'100',B'1110',N'nnn',N'nnn','nnnnnnnnnn','2006-03-01 09:00:00');
	insert into hash_test values(15,'ooo','ooo',B'101',B'1111',N'ooo',N'ooo','oooooooooo','2006-03-01 09:00:00');
	insert into hash_test values(16,'ppp','ppp',B'101',B'1111',N'ppp',N'ppp','pppppppppp','2006-03-01 09:00:00');
	insert into hash_test values(17,'qqq','qqq',B'101',B'1111',N'qqq',N'qqq','qqqqqqqqqq','2006-03-01 09:00:00');
	insert into hash_test values(18,'rrr','rrr',B'101',B'1111',N'rrr',N'rrr','rrrrrrrrrr','2006-03-01 09:00:00');
	insert into hash_test values(19,'sss','sss',B'101',B'1111',N'sss',N'sss','ssssssssss','2006-03-01 09:00:00');
	insert into hash_test values(20,'ttt','ttt',B'101',B'1111',N'ttt',N'ttt','tttttttttt','2006-03-01 09:00:00');
	insert into hash_test values(21,'zll',NULL,NULL,NULL,NULL,NULL,NULL,'2006-03-01 09:00:00');

create table hash_test2(id int not null ,
			  test_char char(50),
			  test_varchar varchar(2000),
			  test_bit bit(16),
			  test_varbit bit varying(20),
			  test_nchar nchar(50),
			  test_nvarchar nchar varying(2000),
			  test_string string,
			  test_datetime timestamp,primary key(id,test_char))
	PARTITION BY HASH(test_char)
        PARTITIONS 6;
	insert into hash_test2 values(1,'aaa','aaa',B'100',B'1011',N'aaa',N'aaa','aaaaaaaaaa','2006-03-01 09:00:00');
	insert into hash_test2 values(2,'bbb','bbb',B'100',B'1100',N'bbb',N'bbb','bbbbbbbbbb','2006-03-01 09:00:00');
	insert into hash_test2 values(3,'ccc','ccc',B'100',B'1110',N'ccc',N'ccc','cccccccccc','2006-03-01 09:00:00');
	insert into hash_test2 values(4,'ddd','ddd',B'100',B'1110',N'ddd',N'ddd','dddddddddd','2006-03-01 09:00:00');
	insert into hash_test2 values(5,'eee','eee',B'101',B'1111',N'eee',N'eee','eeeeeeeeee','2006-03-01 09:00:00');
	insert into hash_test2 values(6,'fff','fff',B'101',B'1111',N'fff',N'fff','ffffffffff','2006-03-01 09:00:00');
	insert into hash_test2 values(7,'ggg','ggg',B'101',B'1111',N'ggg',N'ggg','gggggggggg','2006-03-01 09:00:00');
	insert into hash_test2 values(8,'hhh','hhh',B'101',B'1111',N'hhh',N'hhh','hhhhhhhhhh','2006-03-01 09:00:00');
	insert into hash_test2 values(9,'iii','iii',B'101',B'1111',N'iii',N'iii','iiiiiiiiii','2006-03-01 09:00:00');
	insert into hash_test2 values(10,'jjj','jjj',B'101',B'1111',N'jjj',N'jjj','jjjjjjjjjj','2006-03-01 09:00:00');
	insert into hash_test2 values(11,'kkk','kkk',B'100',B'1011',N'kkk',N'kkk','kkkkkkkkkk','2006-03-01 09:00:00');
	insert into hash_test2 values(12,'lll','lll',B'100',B'1100',N'lll',N'lll','llllllllll','2006-03-01 09:00:00');
	insert into hash_test2 values(13,'mmm','mmm',B'100',B'1110',N'mmm',N'mmm','mmmmmmmmmm','2006-03-01 09:00:00');
	insert into hash_test2 values(14,'nnn','nnn',B'100',B'1110',N'nnn',N'nnn','nnnnnnnnnn','2006-03-01 09:00:00');
	insert into hash_test2 values(15,'ooo','ooo',B'101',B'1111',N'ooo',N'ooo','oooooooooo','2006-03-01 09:00:00');
	insert into hash_test2 values(16,'ppp','ppp',B'101',B'1111',N'ppp',N'ppp','pppppppppp','2006-03-01 09:00:00');
	insert into hash_test2 values(17,'qqq','qqq',B'101',B'1111',N'qqq',N'qqq','qqqqqqqqqq','2006-03-01 09:00:00');
	insert into hash_test2 values(18,'rrr','rrr',B'101',B'1111',N'rrr',N'rrr','rrrrrrrrrr','2006-03-01 09:00:00');
	insert into hash_test2 values(19,'sss','sss',B'101',B'1111',N'sss',N'sss','ssssssssss','2006-03-01 09:00:00');
	insert into hash_test2 values(20,'ttt','ttt',B'101',B'1111',N'ttt',N'ttt','tttttttttt','2006-03-01 09:00:00');
	insert into hash_test2 values(21,'zll',NULL,NULL,NULL,NULL,NULL,NULL,'2006-03-01 09:00:00');

select * from hash_test A, hash_test2 B order by a.id,b.id;
select a.test_char, b.test_char from hash_test A, hash_test2 B where a.test_char ='aaa' order by 1,2;


drop table hash_test;
drop table hash_test2;
