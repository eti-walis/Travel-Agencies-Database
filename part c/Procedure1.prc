create or replace noneditionable procedure Procedure1(Num in number) is
 
rideflag number:=1;
ridecount number;
transportNumber number;
transportNumberToDelete number;
strfn varchar2(15) not null:='fn';
strln varchar2(15) not null:='ln';

--constant
numconst CONSTANT number(4):=40;

--record type of existing table-orderride
randorderride OrderRide %rowtype;

CURSOR allrides is
    select transportid, ordernumber
    from orderride natural join transport
    where driverid=num;
--record type of existing table
ridesRec allrides%rowtype;
begin
  select dlastname, dfirstname into strln, strfn
  from driver
  where driverid=num;
  
  if( SQL%found)
  then
    dbms_output.put_line('driver name: '|| strfn||' '||strln||' driverid: '||num);

    --ridecount= number of rides of this driver.    
    select count(*) into ridecount
    from orderride
    where transportid in (select transportid
                       from transport
                       where driverid=num);
    if (ridecount<numconst)
    then
     dbms_output.put_line('Driver has fewer rides.');                       
     dbms_output.put_line('System random a ride, to add the driver.') ;
     loop
       --adding a ride to the driver
       select * into randorderride
       from orderride
       order by dbms_random.value()--.
       fetch first row only;
       
       --check if the ride in the riderReq 
       for ridesRec in allrides
         loop
           if (ridesRec.Transportid = randorderride.transportid and ridesRec.Ordernumber=randorderride.ordernumber)
             then 
                rideflag:=0;
           end if;
           end loop;
       exit when rideflag=1;
     end loop;
    --adding the new ride to the driver
    --find a transport of this driver
    select transportid into transportNumber
    from transport
    where driverid=num
    fetch first row only;--the first one.
    
    --find a transport of randorderride order and deletet it because we wanr another transport to take this order.
    select transportid into transportNumberToDelete
    from orderride
    where orderNumber=randorderride.ordernumber
    fetch first row only;--the first one.
    
    --delete this line from orderride table.
    delete 
    from orderride
    where orderNumber=randorderride.ordernumber and transportid=transportNumberToDelete;
  
    --finally-adding the new ride to the driver
    insert into orderride(TransportId, OrderNumber)values(transportNumber,randorderride.ordernumber);
    
    if(SQL%rowcount>0)--we added a new ride. 
    then
        dbms_output.put_line('A new ride added to our driver!!');
    end if ;   
   end if;
  else
    dbms_output.put_line('driver name not found');
  end if;
end Procedure1;
/
