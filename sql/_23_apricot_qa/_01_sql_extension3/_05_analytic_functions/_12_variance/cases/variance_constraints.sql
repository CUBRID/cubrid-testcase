--TEST: test with columns with constraints 


create table variance_constraints(
	col1 int not null,
	col2 short auto_increment, 
	col3 bigint default 10000000,
	col4 numeric(10, 5) not null,
	col5 float unique,
	col6 double primary key,
	col7 monetary shared 500
);


insert into variance_constraints values(10000, 100, 10000000, 12345.06789, 111.11, 11111.130, 1000);
insert into variance_constraints values(10000, 200, 20000000, 12345.06789, 111.12, 11111.129, 1000);
insert into variance_constraints values(10000, 100, 30000000, 12345.16789, 111.13, 11111.128, 1000);
insert into variance_constraints values(10000, 200, 40000000, 12345.06789, 111.14, 11111.127, 1000);
insert into variance_constraints values(10000, 100, 50000000, 12345.16789, 111.15, 11111.126, null);
insert into variance_constraints values(20000, 200, 70000000, 12345.06789, 111.16, 11111.125, 1000);
insert into variance_constraints values(20000, 100, 80000000, 12345.06789, 111.17, 11111.124, 1000);
insert into variance_constraints values(20000, 100, 10000000, 12345.26789, 111.18, 11111.123, 1000);
insert into variance_constraints values(20000, 300, 20000000, 12345.06789, 111.19, 11111.122, 2000);
insert into variance_constraints values(30000, 100, 30000000, 12345.06789, 111.20, 11111.121, 1000);
insert into variance_constraints values(30000, 100, 40000000, 12345.16789, 111.21, 11111.120, 1000);
insert into variance_constraints values(30000, 300, 50000000, 12345.06789, 111.23, 11111.119, 1000);
insert into variance_constraints values(40000, 100, 10000000, 12345.06789, 111.24, 11111.118, 3000);
insert into variance_constraints values(50000, 100, 20000000, 12345.06789, 111.25, 11111.117, 1000);
insert into variance_constraints values(50000, 200, 30000000, 12345.06789, 111.26, 11111.116, 4000);
insert into variance_constraints values(50000, 100, 40000000, 12345.56789, 111.27, 11111.115, 1000);
insert into variance_constraints values(50000, 100, 50000000, 12345.06789, 111.28, 11111.114, 1000);
insert into variance_constraints values(50000, 300, 60000000, 12345.56789, 111.29, 11111.113, 5000);
insert into variance_constraints values(50000, 100, 70000000, 12345.06789, 111.30, 11111.112, 1000);
insert into variance_constraints values(50000, 100, 80000000, 12345.56789, 111.31, 11111.111, 8000);


--TEST: OVER() clause
--TEST: int 
select trunc(variance, 2) from (select col1, col2, variance(distinctrow col1) over() variance from variance_constraints) order by 1;
--TEST: short, with alias
select trunc(variance, 2) from (select col2, col3, variance(col2) over() variance from variance_constraints) order by 1;
--TEST: bigint, with where clause
select trunc(variance, 2) from (select col3, col4, variance(unique col3) over() variance from variance_constraints where col1 > 10000) order by 1;
--TEST: numeric, distinct
select trunc(variance, 2) from (select col4, col5, variance(distinct col4) over() variance from variance_constraints) order by 1;
--TEST: float, all
select trunc(variance, 2) from (select col5, col6, col7, variance(all col5) over() variance from variance_constraints) order by 1;
--TEST: double, all
select trunc(variance, 2) from (select col6, col1, col2, col5, variance(all col6) over() variance from variance_constraints where length(col3)=8 and round(col5)=111) order by 1;
--TEST: monetary, distinct
select trunc(variance, 2) from (select col7, col3, col5, variance(distinct col7) over() variance from variance_constraints) order by 1;
--TEST: no matched rows
select trunc(variance, 2) from (select col1, col2, col3, col4, col5, col6, col7, variance(unique col7) over() variance from variance_constraints where trunc(col6)=111) order by 1;
--TEST: syntax error
select trunc(variance, 2) from (select *, variance(col1) over() variance from variance_constraints);
select trunc(variance, 2) from (select col1, col3, col5, variance(col2) over variance from variance_constraints);
select trunc(variance, 2) from (select col1, col3, col5, variance(col3) over(1) variance from variance_constraints);



--TEST: OVER(PARTITION BY) clause
--TEST: partition by int
select trunc(variance, 2) from (select col1, col2, col3, col4, col5, col6, col7, variance(col2) over(partition by col1) variance from variance_constraints) order by 1;
--TEST: partition by smallint
select trunc(variance, 2) from (select col1, col2, col3, col4, col5, col6, col7, variance(distinctrow col4) over(partition by col2) variance from variance_constraints) order by 1;
--TEST: partition by bigint
select trunc(variance, 2) from (select col1, col2, col3, col4, col5, col6, col7, variance(unique col6) over(partition by col3) variance from variance_constraints) order by 1;
--TEST: partition by numeric
select trunc(variance, 2) from (select col1, col2, col3, col4, col5, col6, col7, variance(all col2) over(partition by col4) variance from variance_constraints) order by 1;
--TEST: partition by float
select trunc(variance, 2) from (select col1, col2, col3, col4, col5, col6, col7, variance(col3) over(partition by col5) variance from variance_constraints) order by 1;
--TEST: partition by double
select trunc(variance, 2) from (select col1, col2, col3, col4, col5, col6, col7, variance(all col4) over(partition by col6) variance from variance_constraints) order by 1;
--TEST: partition by monetary
select trunc(variance, 2) from (select col1, col2, col3, col4, col5, col6, col7, variance(distinct col7) over(partition by col7) variance from variance_constraints) order by 1;



--TEST: OVER(ORDER BY) clause
--TEST: order by 1 column name
select trunc(variance, 2) from (select col1, variance(col2) over(order by col1) variance from variance_constraints) order by 1;
--TEST: order by 2 column names
select trunc(variance, 2) from (select col2, col3, variance(all col4) over(order by col2, col3 asc) variance from variance_constraints) order by 1;
--TEST: order by more than 2 column names
select trunc(variance, 2) from (select col1, col2, col3, col4, col5, col6, col7, variance(unique col3) over(order by col1, col2 desc, col3, col4 asc, col5, col6 desc) variance from variance_constraints) order by 1;
--TEST: order by columns not select trunc(variance, 2) from (selected
select trunc(variance, 2) from (select col3, variance(distinct col2) over(order by col4, col6 desc, col2, col1 asc) variance from variance_constraints) order by 1;
--TEST: order by 1 position
select trunc(variance, 2) from (select col5, variance(all col2) over(order by 1) variance from variance_constraints) order by 1;
--TEST: order by 3 positions
select trunc(variance, 2) from (select col3, col5, variance(col1) over(order by 1, 2 desc, 3 asc) variance from variance_constraints) order by 1;
--TEST: order by more than 3 positions
select trunc(variance, 2) from (select col1, col2, col3, col4, col5, col6, col7, variance(col2) over(order by 5, 3, 7, 2 asc, 1 desc, 6 desc, 4) variance from variance_constraints) order by 1;
--TEST: order by positions not existed
select trunc(variance, 2) from (select col5, variance(distinct col1) over(order by 2) variance from variance_constraints) order by 1;
select trunc(variance, 2) from (select col1, variance(all col3) over(order by 3, 4, 1 desc) variance, col5, col7 from variance_constraints) order by 1;
select trunc(variance, 2) from (select col3, col5, variance(col5) over(order by 5) variance from variance_constraints) order by 1;
select trunc(variance, 2) from (select col3, col5, variance(col7) over(order by 100) variance from variance_constraints) order by 1;
--TEST: order by column names and positions
select trunc(variance, 2) from (select col1, col2, col3, col4, col5, col6, col7, variance(col3) over(order by 1, col2 desc, 3, col4 asc, 5, col6 desc, 7) variance from variance_constraints) order by 1;




--TEST: OVER(PARTITION BY ORDER BY) clause
--TEST: partition by int
select trunc(variance, 2) from (select col1, col2, col3, variance(distinct col4) over(partition by col1 order by 1, 2, 3) variance from variance_constraints) order by 1;
--TEST: partition by smallint
select trunc(variance, 2) from (select col2, col4, col5, variance(col5) over(partition by col2 order by col2, col4, col5 desc) variance from variance_constraints) order by 1;
--TEST: partition by bigint
select trunc(variance, 2) from (select col3, variance(all col7) over(partition by col3 order by 1, 2, 3) variance, col5 from variance_constraints) order by 1;
--TEST: partition by numeric
select trunc(variance, 2) from (select col4, col1, variance(unique col6) over(partition by col4 order by 1, 2 desc) variance from variance_constraints) order by 1;
--TEST: partition by float
select trunc(variance, 2) from (select col5, col6, variance(distinct col2) over(partition by col5 desc order by col5 desc, col6 asc) variance from variance_constraints) order by 1;
--TEST: partition by double
select trunc(variance, 2) from (select col6, col1, col2, col3, variance(all col7) over(partition by col6 order by 5,4,3 desc,2,1) variance from variance_constraints) order by 1;
--TEST: partition by monetary
select trunc(variance, 2) from (select col7, col1, col2, col3, col4, col5, col6, col7, variance(col4) over(partition by col7 order by 1 desc, col1, col2, col3 asc, 5, 6, col7 desc) variance from variance_constraints) order by 1;
--TEST: syntax error
select col1, col2, variance(distinct col3) over(order by col1, col2 partition by col2) from variance_constraints;



drop table variance_constraints; 















