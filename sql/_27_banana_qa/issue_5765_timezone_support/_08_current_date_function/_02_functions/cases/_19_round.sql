--+ holdcas on;
set timezone '+13:00';
set @x1=(select round(current_date,'yy'));
set timezone '+14:00';
set @x2=(select round(current_date,'yy'));
select if(timediff(@x1,@x2)='12:00:00 AM ','ok','nok');
drop variable @x1,@x2;
set timezone 'Asia/Seoul';
--+ holdcas off;
