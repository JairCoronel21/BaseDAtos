drop database if exists bdtrabajo;
create database bdtrabajo;
use bdtrabajo;
-- Crear las tablas
drop table if exists Alumnos;
create table Alumnos
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

use bdtrabajo;
insert Alumnos values ('05614122', 'Katya', 'Garcia', '2003-02-02','44', 'katya@gmail.com');
insert Alumnos values ('14121487', 'Jair', 'Coronel', '2003-02-21','54', 'jj@gmail.com');
insert Alumnos values ('27285521', 'Alex', 'Ramos', '2006-01-15','55', 'edu@gmail.com');
insert Alumnos values ('05615411', 'Juan', 'Perez', '2000-01-15','18','jperez@hotmail.com');
insert Alumnos values ('27289952', 'Jose', 'rodriguez', '2001-01-15','21', 'jose@gmail.com');
select * from Alumnos;


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
drop procedure if exists spVistaAlumnos;
delimiter //
create procedure spVistaAlumnos()
begin
  select * from Alumnos;
  end //
  delimiter ;
  
-- Probar el spVistaDatos
call spVistaAlumnos;

-- Crear el spVistaEmail
-- Debe mostrar todos los registros de la tabla de datos que tengan email 
drop procedure if exists spVistaEmail;
delimiter //
create procedure spVistaEmail()
begin
   select * from Alumnos Where Email <> '';
 end//
   delimiter ;






-- Crear el spVistaNoEmail
-- Debe mostrar todos los registros de la tabla de datos que no tengan email
drop procedure if exists spVistaNoEmail;
delimiter //
create procedure spVistaNoEmail()
begin
   select * from Alumnos Where Email = '';
   end//
   delimiter ;
   

   
call spVistaEmail;
call spVistaNoEmail;

-- Crear el spInsertarDatos
-- Debe permitir insertar un registro a la tabla Datos

drop procedure if exists spInsertarAlumnos;
delimiter //
create procedure spInsertarAlumnos
(in _dni char(8),
    _nom varchar(50),
    _ape varchar(50),
    _fnac date,
    _edad int,
    _email varchar(100)
)
begin
insert Alumnos values (_dni, _nom, _ape, _fnac, _edad, _email);
end //
delimiter ;

call spInsertarAlumnos('04615048', 'Jse', 'Peez', '2000-10-21', 5,'');


-- SP para Buscar datos segun el DNI
drop procedure if exists spBuscarAlumnos;
delimiter //
create procedure spBuscarAlumnos
(in _dni char(8))
begin
select * from Alumnos Where Dni = _dni;
end //
delimiter ;
call spBuscarAlumnos('22345671');

-- SP para Actualizar datos segun el DNI
drop procedure if exists spActualizarAlumnos;
delimiter //
create procedure spActualizarAlumnos
(in _dni char(8),
    _nom varchar(50),
    _ape varchar(50),
    _fnac date,
    _edad int,
    _email varchar(100)
)
begin
  update Alumnos set Nombre = _nom, Apellidos = _ape, FechaNacimiento = _fnac, Edad = _edad, Email = _email
  Where Dni = _dni;
end //
delimiter ;
call spActualizarAlumnos('22222222');



-- Sp para Eliminar un registro según el DNI
drop procedure if exists spEliminarAlumnos;
delimiter //
create procedure spEliminarAlumnos
(in _dni char(8))
begin
  delete from  Datos Where Dni = _dni;
end //
delimiter ;
call spEliminarAlumnos('05645122');









