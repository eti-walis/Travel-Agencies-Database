--all the Specialtransport that have 60 places and have been ordered more than MinNumOfRides
select TransportId 
from (select*
      from Specialtransport
      where NumOfRides > &<name="MinNumOfRides"
                           hint="value between 0-100"
                           type="integer" default=10 required=true>) NATURAL JOIN Transport
where NumOfPlaces=60; 

--the count of rides between 2 dates.
select count (OrderNumber) as NUM_OF_RIDES_SUMMER
from Orders
where OrderNumber in(select OrderNumber
                      from orders
                      where RideDate 
                      between &<name="d_from" type="date" required=true> and &<name="d_to" type="date" required=true>);

--destination of orders that there are stations there.
select DISTINCT Destination
from order_destination
where Destination in &<name="address" list="select Addresss from STOPS" --MULTISELECT = YES
type="string" required=true>;        



--order orders by price
select* from orders 
order by Payment &<name="descending sort order" checkbox="desc, asc" required=true>
















