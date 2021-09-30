create or replace function totalPaymentOfDriver(driveridin in number) return number is
  FunctionResult number;
  totalpayment int:=0;
--all the orders of this driver  
  CURSOR allorders is
    select ordernumber, transportid, payment
    from orderride natural join orders 
    where transportid in (select transportid
                          from transport
                          where driverid= driveridin);
  
begin
  
for o in allorders
  loop
    totalpayment:=totalpayment+o.payment;               
end loop;

  


  FunctionResult:=totalpayment;
  return(FunctionResult);
end totalPaymentOfDriver;
/
