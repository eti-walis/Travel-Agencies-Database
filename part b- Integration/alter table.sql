rename DRIVER to DRIVER2;


ALTER TABLE DRIVER2 
add LastName varchar2(10)
add FirstName varchar2(10); 


ALTER TABLE GENERALTRANSPORT
ADD busLine INT 
ADD list_of_stations VARCHAR2(25);



ALTER TABLE passenger
ADD ControllerId INT 
ADD CONSTRAINT fk_controllerId FOREIGN KEY (ControllerId) REFERENCES Controller(ControllerId);

///////////////////////  ADD CONSTRAINT  /////////////////////////////

ALTER TABLE passenger
ADD card_number INT 
ADD CONSTRAINT fk_cardNumber FOREIGN KEY (card_number) REFERENCES buscard(card_number);

ALTER TABLE passenger
rename column customerid to passengerid;

ALTER TABLE customer
rename column passengerid to customerid;

ALTER TABLE driver
rename column Phonumber to dPhonumber;
ALTER TABLE driver
rename column firstname to dfirstname;
ALTER TABLE driver
rename column lastname to dlastname;

ALTER TABLE controll_at
rename column bus_number to transportId;



ALTER TABLE DRIVER
ADD LicenseNumber INT 
ADD Phonumber INT;

ALTER TABLE buscard
drop column passenger_Name;

drop table driver;
rename driver2 to driver;
--///////////////////////////////////////שינינו את המפתח זר לטבלה generalTransport ואז מחקנו את buses\\\\\\\\\\\\\\\\\\\\\\\\\\\
alter table controll_at drop constraint SYS_C0012242;
alter table controll_at add constraint SYS_C0012242 foreign key(bus_number) references generaltransport(TransportId);


drop table buses;
