prompt PL/SQL Developer Export Tables for user ETIWALIS@XE
prompt Created by User on יום שלישי 27 אפריל 2021
set feedback off
set define off

prompt Creating CUSTOMER...
create table CUSTOMER
(
  lastname    VARCHAR2(10) not null,
  firstname   VARCHAR2(10) not null,
  customerid  INTEGER not null,
  phonenumber INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CUSTOMER
  add primary key (CUSTOMERID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating DRIVER...
create table DRIVER
(
  driverid      INTEGER not null,
  licensenumber INTEGER not null,
  phonumber     INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DRIVER
  add primary key (DRIVERID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating TRANSPORT...
create table TRANSPORT
(
  transportid INTEGER not null,
  numofplaces INTEGER not null,
  driverid    INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TRANSPORT
  add primary key (TRANSPORTID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TRANSPORT
  add foreign key (DRIVERID)
  references DRIVER (DRIVERID);

prompt Creating GENERALTRANSPORT...
create table GENERALTRANSPORT
(
  transportid INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table GENERALTRANSPORT
  add primary key (TRANSPORTID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table GENERALTRANSPORT
  add foreign key (TRANSPORTID)
  references TRANSPORT (TRANSPORTID);

prompt Creating ORDERS...
create table ORDERS
(
  ordernumber     INTEGER not null,
  ridedate        DATE not null,
  payment         INTEGER not null,
  numofpassengers INTEGER not null,
  startpoint      VARCHAR2(25) not null,
  customerid      INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ORDERS
  add primary key (ORDERNUMBER)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ORDERS
  add foreign key (CUSTOMERID)
  references CUSTOMER (CUSTOMERID);

prompt Creating SPECIALTRANSPORT...
create table SPECIALTRANSPORT
(
  transportid INTEGER not null,
  numofrides  INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SPECIALTRANSPORT
  add primary key (TRANSPORTID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SPECIALTRANSPORT
  add foreign key (TRANSPORTID)
  references TRANSPORT (TRANSPORTID);

prompt Creating ORDERRIDE...
create table ORDERRIDE
(
  transportid INTEGER not null,
  ordernumber INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ORDERRIDE
  add primary key (TRANSPORTID, ORDERNUMBER)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ORDERRIDE
  add foreign key (TRANSPORTID)
  references SPECIALTRANSPORT (TRANSPORTID);
alter table ORDERRIDE
  add foreign key (ORDERNUMBER)
  references ORDERS (ORDERNUMBER);

prompt Creating ORDER_DESTINATION...
create table ORDER_DESTINATION
(
  destination VARCHAR2(25) not null,
  ordernumber INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ORDER_DESTINATION
  add primary key (DESTINATION, ORDERNUMBER)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ORDER_DESTINATION
  add foreign key (ORDERNUMBER)
  references ORDERS (ORDERNUMBER);

prompt Creating STOPS...
create table STOPS
(
  addresss VARCHAR2(25) not null,
  stopid   INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table STOPS
  add primary key (STOPID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating STOPSAT...
create table STOPSAT
(
  stopid      INTEGER not null,
  transportid INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table STOPSAT
  add primary key (STOPID, TRANSPORTID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table STOPSAT
  add foreign key (STOPID)
  references STOPS (STOPID);
alter table STOPSAT
  add foreign key (TRANSPORTID)
  references GENERALTRANSPORT (TRANSPORTID);

prompt Disabling triggers for CUSTOMER...
alter table CUSTOMER disable all triggers;
prompt Disabling triggers for DRIVER...
alter table DRIVER disable all triggers;
prompt Disabling triggers for TRANSPORT...
alter table TRANSPORT disable all triggers;
prompt Disabling triggers for GENERALTRANSPORT...
alter table GENERALTRANSPORT disable all triggers;
prompt Disabling triggers for ORDERS...
alter table ORDERS disable all triggers;
prompt Disabling triggers for SPECIALTRANSPORT...
alter table SPECIALTRANSPORT disable all triggers;
prompt Disabling triggers for ORDERRIDE...
alter table ORDERRIDE disable all triggers;
prompt Disabling triggers for ORDER_DESTINATION...
alter table ORDER_DESTINATION disable all triggers;
prompt Disabling triggers for STOPS...
alter table STOPS disable all triggers;
prompt Disabling triggers for STOPSAT...
alter table STOPSAT disable all triggers;
prompt Disabling foreign key constraints for TRANSPORT...
alter table TRANSPORT disable constraint SYS_C0012148;
prompt Disabling foreign key constraints for GENERALTRANSPORT...
alter table GENERALTRANSPORT disable constraint SYS_C0012168;
prompt Disabling foreign key constraints for ORDERS...
alter table ORDERS disable constraint SYS_C0012156;
prompt Disabling foreign key constraints for SPECIALTRANSPORT...
alter table SPECIALTRANSPORT disable constraint SYS_C0012160;
prompt Disabling foreign key constraints for ORDERRIDE...
alter table ORDERRIDE disable constraint SYS_C0012164;
alter table ORDERRIDE disable constraint SYS_C0012165;
prompt Disabling foreign key constraints for ORDER_DESTINATION...
alter table ORDER_DESTINATION disable constraint SYS_C0012172;
prompt Disabling foreign key constraints for STOPSAT...
alter table STOPSAT disable constraint SYS_C0012176;
alter table STOPSAT disable constraint SYS_C0012177;
prompt Deleting STOPSAT...
delete from STOPSAT;
commit;
prompt Deleting STOPS...
delete from STOPS;
commit;
prompt Deleting ORDER_DESTINATION...
delete from ORDER_DESTINATION;
commit;
prompt Deleting ORDERRIDE...
delete from ORDERRIDE;
commit;
prompt Deleting SPECIALTRANSPORT...
delete from SPECIALTRANSPORT;
commit;
prompt Deleting ORDERS...
delete from ORDERS;
commit;
prompt Deleting GENERALTRANSPORT...
delete from GENERALTRANSPORT;
commit;
prompt Deleting TRANSPORT...
delete from TRANSPORT;
commit;
prompt Deleting DRIVER...
delete from DRIVER;
commit;
prompt Deleting CUSTOMER...
delete from CUSTOMER;
commit;
prompt Loading CUSTOMER...
insert into CUSTOMER (lastname, firstname, customerid, phonenumber)
values ('DAN', 'DANNA', 1111111111, 525412365);
insert into CUSTOMER (lastname, firstname, customerid, phonenumber)
values ('RUBIN', 'TAL', 3052111111, 555413265);
insert into CUSTOMER (lastname, firstname, customerid, phonenumber)
values ('MAN', 'NANNA', 2211111111, 525418365);
insert into CUSTOMER (lastname, firstname, customerid, phonenumber)
values ('Cohen', 'DAN', 1111111133, 525411365);
insert into CUSTOMER (lastname, firstname, customerid, phonenumber)
values ('DANIEL', 'NOAM', 1852111111, 555412365);
insert into CUSTOMER (lastname, firstname, customerid, phonenumber)
values ('LEVY', 'NOAM', 2152111111, 585412365);
insert into CUSTOMER (lastname, firstname, customerid, phonenumber)
values ('MILSTEIN', 'ITAMAR', 1852888111, 555412365);
insert into CUSTOMER (lastname, firstname, customerid, phonenumber)
values ('TAMAR', 'YONI', 1852111611, 555412365);
insert into CUSTOMER (lastname, firstname, customerid, phonenumber)
values ('GROS', 'DANIEL', 2072111111, 522212365);
insert into CUSTOMER (lastname, firstname, customerid, phonenumber)
values ('OREN', 'YAEL', 319727433, 525412363);
commit;
prompt 10 records loaded
prompt Loading DRIVER...
insert into DRIVER (driverid, licensenumber, phonumber)
values (123456789, 102, 566666363);
insert into DRIVER (driverid, licensenumber, phonumber)
values (987654321, 103, 566116363);
insert into DRIVER (driverid, licensenumber, phonumber)
values (202123654, 302, 566660063);
insert into DRIVER (driverid, licensenumber, phonumber)
values (2574136, 2, 566666301);
insert into DRIVER (driverid, licensenumber, phonumber)
values (789522221, 152, 566666310);
insert into DRIVER (driverid, licensenumber, phonumber)
values (326514141, 632, 566666399);
insert into DRIVER (driverid, licensenumber, phonumber)
values (211111111, 202, 599999363);
insert into DRIVER (driverid, licensenumber, phonumber)
values (300002155, 182, 566444363);
insert into DRIVER (driverid, licensenumber, phonumber)
values (254122541, 802, 565566363);
insert into DRIVER (driverid, licensenumber, phonumber)
values (952231242, 133, 567766363);
commit;
prompt 10 records loaded
prompt Loading TRANSPORT...
insert into TRANSPORT (transportid, numofplaces, driverid)
values (12548745, 60, 123456789);
insert into TRANSPORT (transportid, numofplaces, driverid)
values (12548765, 60, 987654321);
insert into TRANSPORT (transportid, numofplaces, driverid)
values (12548645, 60, 202123654);
insert into TRANSPORT (transportid, numofplaces, driverid)
values (12546745, 60, 2574136);
insert into TRANSPORT (transportid, numofplaces, driverid)
values (12568745, 60, 789522221);
insert into TRANSPORT (transportid, numofplaces, driverid)
values (12648745, 60, 326514141);
insert into TRANSPORT (transportid, numofplaces, driverid)
values (16548745, 60, 211111111);
insert into TRANSPORT (transportid, numofplaces, driverid)
values (62548745, 60, 300002155);
insert into TRANSPORT (transportid, numofplaces, driverid)
values (12548746, 60, 254122541);
insert into TRANSPORT (transportid, numofplaces, driverid)
values (12548655, 60, 952231242);
commit;
prompt 10 records loaded
prompt Loading GENERALTRANSPORT...
insert into GENERALTRANSPORT (transportid)
values (12648745);
insert into GENERALTRANSPORT (transportid)
values (16548745);
insert into GENERALTRANSPORT (transportid)
values (62548745);
insert into GENERALTRANSPORT (transportid)
values (12548746);
insert into GENERALTRANSPORT (transportid)
values (12548655);
commit;
prompt 5 records loaded
prompt Loading ORDERS...
insert into ORDERS (ordernumber, ridedate, payment, numofpassengers, startpoint, customerid)
values (1, to_date('03-03-2020', 'dd-mm-yyyy'), 500, 12, 'RAMAT_GAN', 1111111111);
insert into ORDERS (ordernumber, ridedate, payment, numofpassengers, startpoint, customerid)
values (2, to_date('03-06-2020', 'dd-mm-yyyy'), 1500, 70, 'HAIFA', 3052111111);
insert into ORDERS (ordernumber, ridedate, payment, numofpassengers, startpoint, customerid)
values (3, to_date('07-03-2021', 'dd-mm-yyyy'), 2500, 58, 'JERUSALEM', 2211111111);
insert into ORDERS (ordernumber, ridedate, payment, numofpassengers, startpoint, customerid)
values (4, to_date('03-05-2021', 'dd-mm-yyyy'), 900, 60, 'HAIFA', 1111111133);
insert into ORDERS (ordernumber, ridedate, payment, numofpassengers, startpoint, customerid)
values (5, to_date('03-06-2021', 'dd-mm-yyyy'), 1500, 100, 'RAMAT_GAN', 1852111111);
insert into ORDERS (ordernumber, ridedate, payment, numofpassengers, startpoint, customerid)
values (6, to_date('11-09-2021', 'dd-mm-yyyy'), 600, 24, 'YAFO', 2152111111);
insert into ORDERS (ordernumber, ridedate, payment, numofpassengers, startpoint, customerid)
values (7, to_date('08-08-2021', 'dd-mm-yyyy'), 700, 35, 'RAMAT_GAN', 1852888111);
insert into ORDERS (ordernumber, ridedate, payment, numofpassengers, startpoint, customerid)
values (8, to_date('05-10-2021', 'dd-mm-yyyy'), 1200, 80, 'HAIFA', 1852111611);
insert into ORDERS (ordernumber, ridedate, payment, numofpassengers, startpoint, customerid)
values (9, to_date('10-07-2021', 'dd-mm-yyyy'), 900, 55, 'JERUSALEM', 2072111111);
insert into ORDERS (ordernumber, ridedate, payment, numofpassengers, startpoint, customerid)
values (10, to_date('12-11-2021', 'dd-mm-yyyy'), 800, 60, 'YAFO', 319727433);
commit;
prompt 10 records loaded
prompt Loading SPECIALTRANSPORT...
insert into SPECIALTRANSPORT (transportid, numofrides)
values (12548745, 30);
insert into SPECIALTRANSPORT (transportid, numofrides)
values (12548765, 14);
insert into SPECIALTRANSPORT (transportid, numofrides)
values (12548645, 22);
insert into SPECIALTRANSPORT (transportid, numofrides)
values (12546745, 20);
insert into SPECIALTRANSPORT (transportid, numofrides)
values (12568745, 1);
commit;
prompt 5 records loaded
prompt Loading ORDERRIDE...
insert into ORDERRIDE (transportid, ordernumber)
values (12548745, 5);
insert into ORDERRIDE (transportid, ordernumber)
values (12548745, 1);
insert into ORDERRIDE (transportid, ordernumber)
values (12548765, 5);
insert into ORDERRIDE (transportid, ordernumber)
values (12548765, 8);
insert into ORDERRIDE (transportid, ordernumber)
values (12548645, 8);
insert into ORDERRIDE (transportid, ordernumber)
values (12548645, 2);
insert into ORDERRIDE (transportid, ordernumber)
values (12546745, 2);
insert into ORDERRIDE (transportid, ordernumber)
values (12546745, 10);
insert into ORDERRIDE (transportid, ordernumber)
values (12568745, 9);
insert into ORDERRIDE (transportid, ordernumber)
values (12568745, 3);
commit;
prompt 10 records loaded
prompt Loading ORDER_DESTINATION...
insert into ORDER_DESTINATION (destination, ordernumber)
values ('Jerusalem_Ben_Gurion_15', 1);
insert into ORDER_DESTINATION (destination, ordernumber)
values ('TEL_AVIV_MENACHEM_BEGIN_6', 1);
insert into ORDER_DESTINATION (destination, ordernumber)
values ('TEL_AVIV_AFEK_2', 2);
insert into ORDER_DESTINATION (destination, ordernumber)
values ('Jerusalem_Ben_Gurion_8', 2);
insert into ORDER_DESTINATION (destination, ordernumber)
values ('HAIFA_PIKA_33', 3);
insert into ORDER_DESTINATION (destination, ordernumber)
values ('HAIFA_Ben_Gurion_15', 4);
insert into ORDER_DESTINATION (destination, ordernumber)
values ('Jerusalem_PIKA_15', 4);
insert into ORDER_DESTINATION (destination, ordernumber)
values ('TEL_AVIV_Ben_Gurion_78', 10);
insert into ORDER_DESTINATION (destination, ordernumber)
values ('Jerusalem_MENA_BEGIN_1', 9);
insert into ORDER_DESTINATION (destination, ordernumber)
values ('YAFO_Ben_Gurion_33', 9);
commit;
prompt 10 records loaded
prompt Loading STOPS...
insert into STOPS (addresss, stopid)
values ('JerusalemBenGurion15', 9988);
insert into STOPS (addresss, stopid)
values ('TELAVIVMENACHEMBEGIN6', 1221);
insert into STOPS (addresss, stopid)
values ('TEL_AVIV_AFEK_2', 5555);
insert into STOPS (addresss, stopid)
values ('Jerusalem_Ben_Gurion_8', 7895);
insert into STOPS (addresss, stopid)
values ('HAIFA_PIKA_33', 7759);
insert into STOPS (addresss, stopid)
values ('HAIFA_Ben_Gurion_15', 1001);
insert into STOPS (addresss, stopid)
values ('Jerusalem_PIKA_15', 2002);
insert into STOPS (addresss, stopid)
values ('TEL_AVIV_Ben_Gurion_78', 3333);
insert into STOPS (addresss, stopid)
values ('JerusalemMENACHEMBEGIN_1', 7878);
insert into STOPS (addresss, stopid)
values ('YAFO_Ben_Gurion_33', 9632);
commit;
prompt 10 records loaded
prompt Loading STOPSAT...
insert into STOPSAT (stopid, transportid)
values (9988, 12648745);
insert into STOPSAT (stopid, transportid)
values (1221, 12648745);
insert into STOPSAT (stopid, transportid)
values (1001, 16548745);
insert into STOPSAT (stopid, transportid)
values (1001, 12548746);
insert into STOPSAT (stopid, transportid)
values (7759, 12548746);
insert into STOPSAT (stopid, transportid)
values (9988, 12548746);
insert into STOPSAT (stopid, transportid)
values (9988, 62548745);
insert into STOPSAT (stopid, transportid)
values (7895, 62548745);
insert into STOPSAT (stopid, transportid)
values (7895, 16548745);
insert into STOPSAT (stopid, transportid)
values (5555, 12648745);
commit;
prompt 10 records loaded
prompt Enabling foreign key constraints for TRANSPORT...
alter table TRANSPORT enable constraint SYS_C0012148;
prompt Enabling foreign key constraints for GENERALTRANSPORT...
alter table GENERALTRANSPORT enable constraint SYS_C0012168;
prompt Enabling foreign key constraints for ORDERS...
alter table ORDERS enable constraint SYS_C0012156;
prompt Enabling foreign key constraints for SPECIALTRANSPORT...
alter table SPECIALTRANSPORT enable constraint SYS_C0012160;
prompt Enabling foreign key constraints for ORDERRIDE...
alter table ORDERRIDE enable constraint SYS_C0012164;
alter table ORDERRIDE enable constraint SYS_C0012165;
prompt Enabling foreign key constraints for ORDER_DESTINATION...
alter table ORDER_DESTINATION enable constraint SYS_C0012172;
prompt Enabling foreign key constraints for STOPSAT...
alter table STOPSAT enable constraint SYS_C0012176;
alter table STOPSAT enable constraint SYS_C0012177;
prompt Enabling triggers for CUSTOMER...
alter table CUSTOMER enable all triggers;
prompt Enabling triggers for DRIVER...
alter table DRIVER enable all triggers;
prompt Enabling triggers for TRANSPORT...
alter table TRANSPORT enable all triggers;
prompt Enabling triggers for GENERALTRANSPORT...
alter table GENERALTRANSPORT enable all triggers;
prompt Enabling triggers for ORDERS...
alter table ORDERS enable all triggers;
prompt Enabling triggers for SPECIALTRANSPORT...
alter table SPECIALTRANSPORT enable all triggers;
prompt Enabling triggers for ORDERRIDE...
alter table ORDERRIDE enable all triggers;
prompt Enabling triggers for ORDER_DESTINATION...
alter table ORDER_DESTINATION enable all triggers;
prompt Enabling triggers for STOPS...
alter table STOPS enable all triggers;
prompt Enabling triggers for STOPSAT...
alter table STOPSAT enable all triggers;

set feedback on
set define on
prompt Done
