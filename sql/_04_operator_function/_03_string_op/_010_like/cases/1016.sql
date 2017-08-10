--[er]test like function with set and other types
create class tb(
	col1 set
);

insert into tb values({1,2,3});
insert into tb values({4,5,6});

select * from tb where col1 like 1;
select * from tb where col1 like b'0001';
select * from tb where col1 like {1,2};
select * from tb where col1 like 1.23;
select * from tb where col1 like '%8%';
select * from tb where col1 like n'%8%';

drop class tb;
