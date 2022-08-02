-- Crear la base de datos
drop database if exists bdsistema;
create database bdsistema;
use bdsistema;
-- Crear las tablas
drop table if exists Datos;
create table Datos
(
    Dni char(8) Primary Key,
    Nombre varchar(50) not null,
    Apellidos varchar(50) not null,
    FechaNacimiento date,
    Edad int,
	Email varchar(100) 	                                                       -- No debe ser mayor a la fecha actual 
					                                   -- Se debe generar automaticamente(función)
	                                        -- Validar con el formato x@x.xxx / x@x.xxx / x@x.xxx.xx
);


-- Registro por defecto que tendra la tabla Datos
-- Insertar 5 registros 

use bdsistema;
insert Datos values ('05614122', 'Katya', 'Garcia', '2003-02-02','44', 'katya@gmail.com');
insert Datos values ('14121487', 'Jair', 'Coronel', '2003-02-21','54', 'jj@gmail.com');
insert Datos values ('27285521', 'Alex', 'Ramos', '2006-01-15','55', 'edu@gmail.com');
insert Datos values ('05615411', 'Juan', 'Perez', '2000-01-15','18','jperez@hotmail.com');
insert Datos values ('27289952', 'Jose', 'rodriguez', '2001-01-15','21', 'jose@gmail.com');
select * from Datos;


-- Creación procedimientos almacenados
-- CRUD y las Vistas (Listados totales y listados con filtros)
/*
 Create -> Insert
 Read -> Select .... Where
 Update -> Update .... Where
 Delete -> Delete .... Where
 VistaDatos -> Select ...
VistaMenores -> Select ... Where
VistaMayores -> Select ... Where
VistaNoEmail -> Select ... Where
VistaSiEmail -> Select ... Where
*/

-- spVistaDatos (Stored Procedure = Procedimiento Almacenado)
-- Debe mostrar todos los registros de la tabla Datos
drop procedure if exists spVistaDatos;
delimiter //
create procedure spVistaDatos()
begin
  select * from Datos;
  end //
  delimiter ;
  
-- Probar el spVistaDatos
call spVistaDatos;

-- Crear el spVistaEmail
-- Debe mostrar todos los registros de la tabla de datos que tengan email 
drop procedure if exists spVistaEmail;
delimiter //
create procedure spVistaEmail()
begin
   select * from Datos Where Email <> '';
 end//
   delimiter ;






-- Crear el spVistaNoEmail
-- Debe mostrar todos los registros de la tabla de datos que no tengan email
drop procedure if exists spVistaNoEmail;
delimiter //
create procedure spVistaNoEmail()
begin
   select * from Datos Where Email = '';
   end//
   delimiter ;
   

   
call spVistaEmail;
call spVistaNoEmail;

-- Crear el spInsertarDatos
-- Debe permitir insertar un registro a la tabla Datos

drop procedure if exists spInsertarDatos;
delimiter //
create procedure spInsertarDatos
(in _dni char(8),
    _nom varchar(50),
    _ape varchar(50),
    _fnac date,
    _edad int,
    _email varchar(100)
)
begin
insert Datos values (_dni, _nom, _ape, _fnac, _edad, _email);
end //
delimiter ;

call spInsertarDatos('04615048', 'Jse', 'Peez', '2000-10-21', 5,'');


-- SP para Buscar datos segun el DNI
drop procedure if exists spBuscarDatos;
delimiter //
create procedure spBuscarDatos
(in _dni char(8))
begin
select * from Datos Where Dni = _dni;
end //
delimiter ;
call spBuscarDatos('22345671');

-- SP para Actualizar datos segun el DNI
drop procedure if exists spActualizarDatos;
delimiter //
create procedure spActualizarDatos
(in _dni char(8),
    _nom varchar(50),
    _ape varchar(50),
    _fnac date,
    _edad int,
    _email varchar(100)
)
begin
  update Datos set Nombre = _nom, Apellidos = _ape, FechaNacimiento = _fnac, Edad = _edad, Email = _email
  Where Dni = _dni;
end //
delimiter ;
call spActualizarDatos('22222222');



-- Sp para Eliminar un registro según el DNI
drop procedure if exists spEliminarDatos;
delimiter //
create procedure spEliminarDatos
(in _dni char(8))
begin
  delete from  Datos Where Dni = _dni;
end //
delimiter ;
call spEliminarDatos('05645122');









