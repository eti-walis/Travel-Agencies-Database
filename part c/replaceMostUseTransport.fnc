create or replace function replaceMostUseTransport return number is
  FunctionResult number;
  mostUseTransportId number:=0;
  leastUseTransportId number:=0;
  --find the transportid of the most use transport.
                     
begin
  
select transportid into mostUseTransportId
  from (select TransportId, count (OrderNumber) as SUM_OF_ORDERS
        from Orderride
        group by TransportId)
  where  SUM_OF_ORDERS=(select max(count(OrderNumber))
                         from Orderride
                         group by TransportId);
                         
   --find the transportid of the least use transport.                                      
  select transportid into leastUseTransportId
  from (select TransportId, count (OrderNumber) as SUM_OF_ORDERS
        from Orderride
        group by TransportId)
  where  SUM_OF_ORDERS=(select min(count(OrderNumber))
                         from Orderride
                         group by TransportId); 

  --replace the most use transport rides by transportid of the least use.
  update orderride
  set TransportId=leastUseTransportId
  where TransportId=mostUseTransportId 
  and ordernumber not in (select OrderNumber
                          from orderride
                          where transportid=leastUseTransportId);
  
   FunctionResult:=leastUseTransportId;
  return(FunctionResult);
end replaceMostUseTransport;
/
