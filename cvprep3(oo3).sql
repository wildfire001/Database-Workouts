drop type rectangle;
drop type sub_rectangle;

create or replace type rectangle as object(
length number(5),
width number(5),
member function comp_area return number,
not final member procedure display 
) not final;
/

create or replace type body rectangle as
member function comp_area
return number is
begin
return length * width;
end comp_area;

member procedure display is
begin
dbms_output.put_line(length|| ' '||width);
end display;

end;
/

create or replace type sub_rectangle under rectangle(
material varchar(5),
overriding member procedure display
);
/


create or replace type body sub_rectangle as
overriding member procedure display is
begin
	dbms_output.put_line(length || ' ' ||width || ' ' || material);
end display;
end;
/

declare
r1 sub_rectangle;
begin
r1 := sub_rectangle(10,20,'wood');
r1.display;
end;
/
