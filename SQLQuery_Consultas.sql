use PROYECTO


--- Consultas

/*Calcular la edad promedio*/
select AVG(DATEDIFF(YEAR,fecha_nacimiento, GETDATE())) AS Edad_Promedio from cliente

/*Diez productos mas vendidos*/

select top 5  sum(cantidad_producto) AS Mas_Vendidos, codigo_producto  from compra 
group by cantidad_producto , codigo_producto
order by cantidad_producto DESC



select * from compra


/*Cantidad de productos por categoría*/

select nombre_categoria, count (nombre_categoria) as Cantidad from categoria
group by nombre_categoria
order by Cantidad DESC

select * from categoria


/*Listar los productos más bajos en ventas*/


SELECT top 3 sum(cantidad_producto) Cantidad_venta ,codigo_producto  FROM compra
group by cantidad_producto,codigo_producto
order by Cantidad_venta asc
select * from compra


/*Listado de productos agrupados por categoría*/

select p.nombre,c.nombre_categoria from producto p
inner join categoria c on p.codigo_producto = c.codigo_producto


---Vistas 
/*Reporte mensual de ventas por sucursal*/

create view reporte
as
select p.codigo_producto , p.nombre , p.fotografia , iv.id_inventario , iv.cantidad_unidad, s.id_sucursal , s.nombre as nombre_sucursal , s.ubicacion , DATENAME(MONTH, DATEADD (MONTH, MONTH(fecha_compra) - 1, '1900-01-01')) as Mes from producto p
inner join inventario iv on p.codigo_producto = iv.codigo_producto
inner join sucursal s on iv.id_inventario = s.id_inventario
inner join compra c on c.codigo_producto = p.codigo_producto

select * from reporte
drop view reporte


/*Reporte de ventas mensual por producto*/
create view reporte2
as
select p.codigo_producto , p.nombre , iv.id_inventario , iv.cantidad_unidad, DATENAME(MONTH, DATEADD (MONTH, MONTH(fecha_compra) - 1, '1900-01-01')) as Mes from producto p
inner join inventario iv on p.codigo_producto = iv.codigo_producto
inner join compra c on c.codigo_producto = p.codigo_producto


select * from reporte2


/*Total ventas por categoría*/

create view Reporte3
as
select nombre_categoria, count (nombre_categoria) as Cantidad from categoria
group by nombre_categoria


select * from Reporte3


/*Productos en el inventario con cantidad menor 
que 10 unidades por sucursal*/



--Procedimientos Almacenados

/*Función para búsqueda de clientes por 
nombre*/


create procedure getRegistro @nombre varchar(60) 
as
select * from cliente where nombre  = @nombre


execute getRegistro @nombre= 'Erick Sanchez'


/*Eliminar clientes por id*/

create procedure getRegistro2 @usuario varchar(30)
as
begin
delete from cliente where @usuario= usuario
end

execute getRegistro2 @usuario='srlopez'
select * from cliente


/*Actualizar clientes por id*/

create procedure getRegistro3 @usuario varchar(30),@nombre varchar(60) ,@contrasena varchar(60), @fecha_nacimiento date, @telefono_celular int , @telefono_fijo int , @colonia varchar(40), @bloque varchar(30), @calle varchar(30), @numero_casa int
as
begin
update cliente set  nombre=@nombre , contrasena = @contrasena ,fecha_nacimiento = @fecha_nacimiento , telefono_celular = @telefono_celular , telefono_fijo = @telefono_fijo , colonia=@colonia,bloque = @bloque , calle = @calle,numero_casa=@numero_casa where usuario = @usuario
end

execute getRegistro3 @usuario='soSuany' , @nombre = 'Suany Martinez', @contrasena='1234siu', @fecha_nacimiento ='3-26-2000', @telefono_celular= '97243567',@telefono_fijo='21234567', @colonia='Satelite',@bloque='A12', @calle ='12va calle', @numero_casa ='129'
select * from cliente


/*Listado de todos los pedidos realizados por un cliente*/
create procedure getRegistro4 @usuario varchar(30)
as
begin
select * from compra where usuario = @usuario 
end

select * from compra
drop procedure getRegistro4
execute getRegistro4 @usuario='esanchez10'

/*Total de ventas de un producto en una fecha 
determinada*/

create procedure getregistro5 @fecha_compra date 
as
begin
select * from compra where fecha_compra =  ( DATENAME(MONTH, DATEADD (MONTH, MONTH(fecha_compra) - 1, '1900-01-01')))
end

