create or replace trigger station_number
  before insert
  on stops 
  for each row
declare
  -- local variables here
begin
    :new.StopId:=sequence_station.nextval;
end station_number;
/
