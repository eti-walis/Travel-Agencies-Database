create or replace trigger stations_history_trigger
  before update
  on stopsat 
  for each row
declare
  -- local variables here
begin
 insert into stations_history
 values
 (:old.stopid,
 :old.transportid) ;
end stations_history_trigger;
/
