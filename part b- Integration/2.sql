alter session set "_ORACLE_SCRIPT"=true;  

create user shira
IDENTIFIED BY 54321
default tablespace SYSTEM
temporary tablespace TEMP
profile DEFAULT
password expire;

grant create session to shira; 
grant create table to shira; 
grant unlimited tablespace to shira;
grant create view , create procedure , create sequence to shira;
