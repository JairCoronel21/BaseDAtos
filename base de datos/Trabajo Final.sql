use bdproyecto;

drop procedure if exists spActualizarCliente;
delimiter //
create procedure spActualizarCliente
(in _id char(5),
    _dni char(8),
    _nom varchar(70),
    _ape varchar(70),
    _dom varchar(100),
    _fnac date,
    _email varchar(100)
)
begin
  update Cliente set dni = _dni, Nombre = _nom, Apellido = _ape, domicilio = _dom, fecha_nac = _fnac, Email = _email
  Where cliente_id = _id;
end //
delimiter ;
call spActualizarCliente('22222222');

select * from Cliente;

select * from Pedido;









drop procedure if exists spEliminarCliente;
delimiter //
create procedure spEliminarCliente
(in _id char(5))
    
begin
  Delete from Cliente Where cliente_id = _id;
end //
delimiter ;
call spEliminarCliente('22222222');


select * from Cliente;




drop procedure if exists spBuscarCliente;
delimiter //
create procedure spBuscarCliente
(in _id char(8))
begin
select * from Cliente Where cliente_id = _id;
end //
delimiter ;
call spBuscarCliente('22345671');
