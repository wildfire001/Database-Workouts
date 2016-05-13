set serveroutput on

declare
x number(5);
y number(5);
begin
if x > y then
dbms_output.put_line('somethin');
elsif x < y then
dbms_output.put_line('anythin');
else
dbms_output.put_line('wtf'); // output will be wtf. Thus null value comparison will be null. 
end if;
end;
/
