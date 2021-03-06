select distinct DriverId
from (select TransportId, count (OrderNumber) as SUM_OF_ORDERS
      from Orderride
      group by TransportId) NATURAL JOIN Transport NATURAL JOIN Driver
where SUM_OF_ORDERS=(select max(count(OrderNumber))
                     from Orderride
                     group by TransportId);
                     


select Destination as DESTINATION_OF_MAX_PASSENGERS
from Order_Destination
where OrderNumber in (select distinct OrderNumber
                     from orders
                     where numOfPassengers >= ALL(select numOfPassengers
                                                  from orders
                                                  ));
                                               

                    
select TransportId 
from (select*
      from Specialtransport
      where NumOfRides>10) NATURAL JOIN Transport
where NumOfPlaces=60;      
                           
  
                   
select distinct DriverId 
from DRIVER 
INTERSECT
select distinct DriverId
from Specialtransport NATURAL JOIN Transport;                   
 
                    
                    
select DISTINCT Destination
from order_destination
where Destination not in (select Addresss
                          from STOPS);                    
                     
                     
                     
select count (OrderNumber) as NUM_OF_RIDES_SUMMER
from Orders
where OrderNumber in(select OrderNumber
                      from orders
                      where RideDate > TO_DATE ('01/07/2021','DD-MM-YYYY')
                      AND  RideDate < TO_DATE ('22/09/2021','DD-MM-YYYY'));
                     
                     
                 
 
select count (OrderNumber) as NUM_OF_RIDES_WINTER
from Orders
where OrderNumber in(select OrderNumber
                      from orders
                      where RideDate > TO_DATE ('01/03/2021','DD-MM-YYYY')
                      AND  RideDate < TO_DATE ('20/06/2021','DD-MM-YYYY'));
                                               




select * 
from (select CustomerId, count (OrderNumber) as NUM_OF_ORDERS
       from Customer NATURAL JOIN Orders 
       group by CustomerId) NATURAL JOIN CUSTOMER
where NUM_OF_ORDERS=(select max (count(OrderNumber))
                     from Customer NATURAL JOIN Orders
                     group by CustomerId);



update Transport
set DriverId = (select DriverId
                from Driver
                where DriverId=322793048)
where TransportId= (select TransportId
                    from Transport
                    where DriverId=(select DriverId
                                    from Driver
                                    where DriverId=13480827));
                             



update Orderride
set TransportId=(select TransportId
                 from Transport
                 where TransportId=219250)
where TransportId = (select TransportId 
                      from Transport           
                      where TransportId  =1088443);  
                      
                            
                  
delete 
from stopsAt
where StopId=(select stopId
               from stops
               where addresss='86 Lofgren Road');                     
                      
                         
               
               
               
delete 
from OrderRide 
where OrderNumber in (select OrderNumber
                      from orders
                      where RideDate > TO_DATE('15/03/2021', 'DD-MM-YYYY')
                      AND RideDate < TO_DATE ('01/04/2021', 'DD-MM-YYYY'));               
