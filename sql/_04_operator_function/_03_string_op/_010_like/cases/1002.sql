-- [er]retrieve by "like" keyword using escape with null

create class func_06 ( a string, b char(50) , c varchar(10));
insert into func_06 values (null,null,null);
insert into func_06 values ('abcdef ??? ABCDEF ���n���',null,null);
insert into func_06 values ('abcdef ??? ABCDEF ���n���','abc','123');
insert into func_06 values ('abcdef ??? ABCDEF ���n���','abc','');
insert into func_06 values ('abcdef ??? ABCDEF ���n���','abc','1');
insert into func_06 values ('abcdef ??? ABCDEF ���n���','???','123');
insert into func_06 values ('abcdef ??? ABCDEF ���n���','???','12345678');
insert into func_06 values ('abcdef ??? ABCDEF ���n���',' ???','12345678');
insert into func_06 values ('abcdef ??? ABCDEF ���n���','���n���','12345678');
insert into func_06 values ('abcdef ??? ABCDEF ���n���','','1');
insert into func_06 values ('abcdef ??? ABCDEF ���n���',' ',' ');
insert into func_06 values ('___________','%%%','%_%');


select a from func_06 where a like '\_%' escape null   order by 1;

drop class func_06;