create or replace procedure delete_stop_procedure(delAddress in varchar2) is
stopid number;
numOfStations number:=0;--count num of stations in this address.
cursor stps is
select *
from stopsat
where stopsat.stopid in(select stopid
                        from stops
                        where addresss=delAddress); 
begin
 --if the address exists, else throw exception.  
 select count(*) into numOfStations
 from stops
 where stops.addresss=delAddress;

 
 --exception
 if (numOfStations=0)
   then raise_application_error(-2001, 'There are no stops at '|| delAddress);
 end if;


dbms_output.put_line('The station ' || delAddress ||' was removed for the next transports:');              

for s in stps
  loop
    dbms_output.put_line(s.transportid);
   end loop; 
   
--delete all lines
delete
from stopsat
where stopid in (select stopid
                 from stops
                 where addresss=delAddress);  

end delete_stop_procedure;
/
