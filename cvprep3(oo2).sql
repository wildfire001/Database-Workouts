drop type rectangle;

create or replace type rectangle as object(
length number(5),
width number(5),
member function comp_area return number,
member procedure display,
map member function measure return number
);
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

map member function measure return number is
begin
return length;
end measure;

end;
/

declare
r1 rectangle;
r2 rectangle;
r3 rectangle;
area number(5);
begin
r1 := rectangle(5,2);
r2 := rectangle(3,4);
area := r2.comp_area;
dbms_output.put_line(area);

r1.display;
r2.display;

if r1 > r2 then
dbms_output.put_line('greater');
end if;
end;
/



