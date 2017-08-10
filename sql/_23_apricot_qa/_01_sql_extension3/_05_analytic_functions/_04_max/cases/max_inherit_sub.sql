--TEST: test with a table with a superclass 
--+holdcas on;
set system parameters 'dont_reuse_heap_file=yes';
create table max_super(
	col1 bit(20),
	col2 bit varying
);


create table max_bbc under max_super(
	col3 blob,
	col4 clob,
	col5 int
);


insert into max_bbc values(B'1011', X'abc', X'0', char_to_clob('cubrid'), 12345);
insert into max_bbc values(B'1011', x'bcd', X'1', char_to_clob('cubrid'), 23456);
insert into max_bbc values(B'1011', X'abc', X'2', char_to_clob('cubrid'), 34567);
insert into max_bbc values(B'1011', x'bcd', X'3', char_to_clob('cubrid'), 45678);
insert into max_bbc values(B'1011', X'abc', X'4', char_to_clob('cubrid'), 56789);
insert into max_bbc values(B'1001', x'bcd', X'5', char_to_clob('cubrid'), 45678);
insert into max_bbc values(B'1001', X'abc', X'6', char_to_clob('cubrid'), 56789);
insert into max_bbc values(B'1001', X'abc', X'7', char_to_clob('cubrid'), 12345);
insert into max_bbc values(B'1001', X'cde', X'8', char_to_clob('cubrid'), 23456);
insert into max_bbc values(B'0011', X'abc', X'9', char_to_clob('cubrid'), 34567);
insert into max_bbc values(B'0011', X'abc', X'10', char_to_clob('mysql'), 45678);
insert into max_bbc values(B'0011', X'cde', X'11', char_to_clob('mysql'), 67891);
insert into max_bbc values(B'1010', X'abc', X'12', char_to_clob('mysql'), 45678);
insert into max_bbc values(B'1111', X'abc', X'13', char_to_clob('mysql'), 67891);
insert into max_bbc values(B'1111', x'bcd', X'14', char_to_clob('mysql'), 78901);
insert into max_bbc values(B'1111', X'abc', X'15', char_to_clob('mysql'), 23456);
insert into max_bbc values(B'1111', X'abc', X'16', char_to_clob('mysql'), 23456);
insert into max_bbc values(B'1111', X'cde', X'17', char_to_clob('mysql'), 34567);
insert into max_bbc values(B'1111', X'abc', X'18', char_to_clob('mysql'), 78901);
insert into max_bbc values(B'1111', X'abc', X'19', char_to_clob('mysql'), 45634);


--TEST: OVER() clause
--TEST: bit(n) 
select col1, col2, max(col5) over() from max_bbc order by 1, 2;
--TEST: bit varying, with alias+all
select col2, blob_to_bit(col3), max(all col1) over() maximum from max_bbc order by 1, blob_to_bit(col3);
--TEST: blob, with where clause
select blob_to_bit(col3), clob_to_char(col4), max(blob_to_bit(col3)) over() maximum from max_bbc where col1 > B'1011' order by blob_to_bit(col3), clob_to_char(col4);
--TEST: clob, distinct
select clob_to_char(col4), col1, max(distinct col2) over() maximum from max_bbc order by clob_to_char(col4), 2;
--TEST: syntax error
select col5, max(col5) over() maximum from max_bbc order by 1, 2;
select col1, blob_to_bit(col3), clob_to_char(col4), max(col5) over maximum from max_bbc;
select col1, blob_to_bit(col3), col2, max(col5) over(1) maximum from max_bbc;



--TEST: OVER(PARTITION BY) clause
--TEST: partition by bit(n)
select col1, col2, blob_to_bit(col3), clob_to_char(col4), max(unique col5) over(partition by col1) maximum from max_bbc order by 1, 2, blob_to_bit(col3), clob_to_char(col4);
--TEST: partition by bit varying
select col1, col2, blob_to_bit(col3), clob_to_char(col4), max(unique clob_to_char(col4)) over(partition by col2) maximum from max_bbc order by 2, 1, blob_to_bit(col3), clob_to_char(col4);
--TEST: partition by blob
select col1, col2, blob_to_bit(col3), clob_to_char(col4), max(blob_to_bit(col3)) over(partition by 3) maximum from max_bbc order by blob_to_bit(col3), 1, 2, clob_to_char(col4);
--TEST: partition by clob
select col1, col2, blob_to_bit(col3), clob_to_char(col4), max(all col2) over(partition by 4) maximum from max_bbc order by clob_to_char(col4), 1, 2, blob_to_bit(col3), 5;



--TEST: OVER(ORDER BY) clause
--TEST: order by 1 column name
select col1, max(col1) over(order by col1) maximum from max_bbc order by 1, 2;
--TEST: order by 2 column names
select col2, blob_to_bit(col3), max(all col2) over(order by col2, blob_to_bit(col3) asc) maximum from max_bbc order by 1, 2, 3;
--TEST: order by more than 2 column names
select col1, col2, blob_to_bit(col3), clob_to_char(col4), max(unique col5) over(order by col1, col2 desc, blob_to_bit(col3), clob_to_char(col4) asc) maximum from max_bbc;
--TEST: order by columns not selected
select blob_to_bit(col3), max(distinct clob_to_char(col4)) over(order by clob_to_char(col4) desc, col2, col1 asc) maximum from max_bbc order by 1, 2;
--TEST: order by 1 position
select clob_to_char(col4), max(all col5) over(order by 1) maximum from max_bbc;
--TEST: order by 3 positions
select blob_to_bit(col3), col2, max(unique col5) over(order by blob_to_bit(col3), 2 desc, 3 asc) maximum from max_bbc;
--TEST: order by more than 3 positions
select col1, col2, blob_to_bit(col3), clob_to_char(col4), max(col5) over(order by blob_to_bit(col3), 2 asc, 1 desc, clob_to_char(col4)) maximum from max_bbc;
--TEST: order by positions not existed
select col2, max(distinct col5) over(order by 2) maximum from max_bbc;
select col1, max(all col5) over(order by 3, 4, 1 desc) maximum, col2, clob_to_char(col4) from max_bbc;
select blob_to_bit(col3), clob_to_char(col4), max(col5) over(order by 5) maximum from max_bbc;
select blob_to_bit(col3), col1, max(col5) over(order by 100) maximum from max_bbc;
--TEST: order by column names and positions
select col1, col2, blob_to_bit(col3), clob_to_char(col4), max(col5) over(order by 1, col2 desc, 3, clob_to_char(col4) asc) maximum from max_bbc;




--TEST: OVER(PARTITION BY ORDER BY) clause
--TEST: partition by bit(n)
select col1, col2, blob_to_bit(col3), max(distinct col1) over(partition by col1 order by 1, 2, blob_to_bit(col3)) from max_bbc;
--TEST: partition by bit varying
select col2, clob_to_char(col4), col1, max(col2) over(partition by col2 order by col2, clob_to_char(col4), col1 desc) from max_bbc;
--TEST: partition by blob
select blob_to_bit(col3), max(all col5) over(partition by 1 order by blob_to_bit(col3), clob_to_char(col4), 3) maximum, col2 from max_bbc order by 1, 2;
--TEST: partition by clob
select clob_to_char(col4), col1, max(unique blob_to_bit(col3)) over(partition by 1 order by clob_to_char(col4), 2 desc) maximum from max_bbc;
--TEST: syntax error
select col1, col2, max(unique colb_to_char(col4)) over(order by col1, col2 partition by col2) from max_bbc;


delete from max_super;
drop table max_super;
drop table max_bbc; 
set system parameters 'dont_reuse_heap_file=no';
--+holdcas off;














