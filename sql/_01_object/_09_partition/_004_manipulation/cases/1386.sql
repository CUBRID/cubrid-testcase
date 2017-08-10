--[er]test insert(date) for many list partition(have no NULL value) with incorrect values out of range
create table list_test(id int,	
				   test_time time,
				   test_date date,
				   test_timestamp timestamp, primary key(id,test_date))
		PARTITION BY LIST (test_date) (
		PARTITION p0 VALUES IN ('2006-02-01','2006-02-11','2006-02-21'),
		PARTITION p1 VALUES IN ('2006-03-01','2006-03-11','2006-03-21'),
		PARTITION p2 VALUES IN ('2006-04-01','2006-04-11','2006-04-21')
	);
insert into list_test values(8,'12:00:00','2006-05-01','2007-04-01 10:00:00');
select * from list_test order by 1;


drop table list_test;
