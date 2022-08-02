use bdsistema;
-- *********PROBAR TABLA***********************
-- Ingresar información a la tabla Datos
-- 1. Ingresar datos a todos los campos de la tabla
insert Datos values ('05614122', 'Katya', 'Garcia', '2003-02-02', '19', 'katya@gmail.com');
insert Datos values ('14121487', 'Jair', 'Coronel', '2003-02-21', '18', 'jj@gmail.com');
insert Datos values ('27285521', 'Alex', 'Ramos', '2006-01-15', '16', 'edu@gmail.com');
insert Datos values ('05615411', 'Juan', 'Perez', '2000-01-15', '22', 'jperez@hotmail.com');
insert Datos values ('27289952', 'Jose', 'rodriguez', '2001-01-15', '21', 'jose@gmail.com');
select * from Datos;


 select
  FLOOR( (curdate() - 20230514 ) / 10000 )
AS 
  Edad;
drop procedure if exists spVistaEmail;
delimiter //
create procedure spVistaEmail()
begin
   select * from Datos Where Email <> '';
 end//
   delimiter ;
   
   call spVistaEmail;
   
   
   
drop procedure if exists spVistaNoEmail;
delimiter //
create procedure spVistaNoEmail()
begin
   select * from Datos Where Email = '';
   end//
   delimiter ;
   
   call spVistaNoEmail;
   
   select nombre, 
edad,
apellido_paterno,
apellido_materno,
if(edad >= 18, apellido_paterno, apellido_materno) as apellido
from personas;

select * from Datos;