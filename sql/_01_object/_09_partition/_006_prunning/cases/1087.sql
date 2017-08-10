--create range partition table with time data type and three partitions,create table,insert data to tables,update the range partition table with where complex clause

create table range_test(id int not null ,	
				   test_time time,
				   test_date date,
				   test_timestamp timestamp,primary key(id,test_time))
		PARTITION BY RANGE (test_time) (
		PARTITION p0 VALUES LESS THAN ('09:00:00'),
		PARTITION p1 VALUES LESS THAN ('10:00:00'),
		PARTITION p2 VALUES LESS THAN ('11:00:00')
	);
	insert into range_test values(1,'08:10:00','2006-01-01','2006-01-01 08:10:00');
	insert into range_test values(2,'08:20:00','2006-01-11','2006-01-11 08:20:00');
	insert into range_test values(3,'09:10:00','2006-02-01','2006-02-01 09:10:00');
	insert into range_test values(4,'09:20:00','2006-02-11','2006-02-11 09:20:00');
	insert into range_test values(5,'09:30:00','2006-02-21','2006-02-21 09:30:00');
	insert into range_test values(6,'10:10:00','2006-03-01','2006-03-01 09:40:00');
	insert into range_test values(7,'10:20:00','2006-03-11','2006-03-11 09:50:00');
	insert into range_test values(10,null,null,null);

	create table range_test2(id int not null primary key,	
				   test_time time,
				   test_date date,
				   test_timestamp timestamp);

	insert into range_test2 values(1,'08:10:00','2006-01-01','2006-01-01 08:10:00');
	insert into range_test2 values(2,'08:20:00','2006-01-11','2006-01-11 08:20:00');
	insert into range_test2 values(3,'09:10:00','2006-02-01','2006-02-01 09:10:00');
	insert into range_test2 values(4,'09:20:00','2006-02-11','2006-02-11 09:20:00');
	insert into range_test2 values(5,'09:30:00','2006-02-21','2006-02-21 09:30:00');
	insert into range_test2 values(6,'10:10:00','2006-03-01','2006-03-01 09:40:00');
	insert into range_test2 values(7,'10:20:00','2006-03-11','2006-03-11 09:50:00');
	insert into range_test2 values(8,'11:20:00','2007-03-11','2007-03-11 09:50:00');
	insert into range_test2 values(10,null,null,null);
update range_test set test_time = (select test_time from range_test2 where  id = 7) where test_time = '08:10:00';
update range_test set test_time = (select test_time from range_test2 where  id = 8) where test_time = '08:20:00';
select * from range_test order by id;
select * from range_test__p__p0 order by id;
select * from range_test__p__p1 order by id;
select * from range_test__p__p2 order by id;

drop table range_test;
drop table range_test2;
