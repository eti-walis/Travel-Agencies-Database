alter table controll_at add constraint SYS_C0012242 foreign key(bus_number) references generaltransport(TransportId);

insert into controll_at values(211462123,1);
commit;


alter table passengers
add constraint check_id
check(passengerid > 99999999);

insert into passengers values(99999991, 'pl', 'p;l', 123,211462123 );
commit;


alter table transport
add constraint check_num_places
check(numofplaces > 10);

insert into transport values(12345815,4, 123456789 );
commit;
