-- retrieve by function of char_length using parameter of null


create class dummy( a string );
insert into dummy values (null);


select char_length(null) from dummy;


drop class dummy;