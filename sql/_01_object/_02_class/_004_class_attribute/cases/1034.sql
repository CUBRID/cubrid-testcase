-- create class attribute same name as instance attribute

create class picture
(caption set string,
 image string);
 
 insert INTO picture VALUES ({'s'},'s');
 
 create class meal
class attribute (menu string)
(menu picture);
 
 select * FROM db_attribute WHere class_name='meal' order by 1,2,3;
 
 SELECT picture INTO a FROM picture where image='s' ;
 
 INSERT INTO meal VALUES (a);
 
 SELECT * FROM meal;
 
 
 DROP picture;
 
 DROP meal;