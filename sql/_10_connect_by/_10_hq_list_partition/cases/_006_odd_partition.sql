create table list_test(id int,
                        parentid int, text varchar(32)
                        )
        PARTITION BY list(id)
        (
        PARTITION p0 VALUES IN (1,2),
        PARTITION p1 VALUES IN (3,4),
        PARTITION p2 VALUES IN (5,6),
        PARTITION p3 VALUES IN (7,8) );

insert into list_test values(1,null,'A');
insert into list_test values(2,null,'B');
insert into list_test values(3,1,'AA');
insert into list_test values(4,1,'AB');
insert into list_test values(5,2,'BA');
insert into list_test values(6,2,'BB');
insert into list_test values(7,6,'BBA');
insert into list_test values(8,7,'CBA');

select id,parentid,text
        from list_test
        where prior id=6 and prior id=6
        start with parentid is null
        connect by parentid=prior id
        order by id;

select id,parentid,text
        from list_test
        where prior id is null
        start with parentid is null
        connect by parentid=prior id
        order by id;

select id,parentid,text
        from list_test
        where prior id is null and prior id is not null
        start with parentid is null
        connect by parentid=prior id
        order by id;

select id,parentid,text
        from list_test
        where prior id>=2 and prior id<=6
        start with parentid is null
        connect by parentid=prior id
        order by id;

select id,parentid,text
        from list_test
        where prior text like 'A%'
        start with parentid is null
        connect by parentid=prior id
        order by id;

select id,parentid,text
        from list_test
        where (prior id>=2 and prior id<=6) and (prior id>=50 and prior id<=100)
        start with parentid is null
        connect by parentid=prior id
        order by id;

select id,parentid,text
        from list_test
        where prior id=1 and prior id<=20
        start with parentid is null
        connect by parentid=prior id
        order by id;

select id,parentid,text
        from list_test
        where prior id<=20 and prior id>=10 and prior id<=200 and prior id>=0
        start with parentid is null
        connect by parentid=prior id
        order by id;

select list_test.*,prior 1 as "col1"
        from list_test
        start with parentid is null
        connect by parentid=prior id
        order by id;

select list_test.*,prior id as "col1"
        from list_test;

drop table list_test;

