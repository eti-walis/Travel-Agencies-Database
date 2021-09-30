create or replace procedure main is

--return the total benefit from driver with 123456789 id number.
totalPaymentDriver number :=totalPaymentOfDriver(123456789);
-- replace the rides of the most use transport by the least use transport ans return the least use transport.
replaceTransport number:=replaceMostUseTransport();

begin
  --call functions
 dbms_output.put_line('The total payment from driver with 123456789 id is: '|| totalPaymentDriver);
 dbms_output.put_line('The least use transport number is: ' ||replaceTransport);
 --call procedures
 Procedure1(123456789);
 delete_stop_procedure('16 Cetera Blvd');

 dbms_output.put_line('All functions and procedures runed.'); 
end main;
/
