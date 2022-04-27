create database PROYECTO
USE PROYECTO

create table producto (
codigo_producto int primary key not null,
nombre varchar(60) not null,
cantidad_producto int not null,
precio_compra decimal (5,2) not null,
precio_venta decimal (5,2) not null,
descripcion varchar (120) not null,
fotografia image 
)
drop table producto

insert into producto values (1000,'Serum',20,20.22,25.20 ,'Antioxidante con acido, ayuda a savizar las lineas de expresion',null)
insert into producto values (1001,'Celular Cream',25,50.22,55.20 ,'Esta formula a base de acido glicolico, promete mejorar la textura de la piel',null)
insert into producto values (1002,'Aceite antiestrias',30,90.23,100.50 ,'Puede usarse en todo el cuerpo y regenera y mejora el aspecto de cicatrices',null)
insert into producto values (1003,'Agua de Belleza',36,45.22,55.20 ,'Definido como elixir de la belleza con textura de agua ligera',null)
insert into producto values (1004,'Perfume Roger & Ballet',400,500.22,600.20 ,'Agua de colonia con ingredientes naturales',null)
insert into producto values (1005,'Cepillo dental',1000,10.22,15.20 ,'Uso casero para limpieza profunda ',null)
insert into producto values (1006,'Capsulas para el dolor muscular',30,30.22,35.20 ,'Tranquilizantes para calmar el dolor muscular',null)
insert into producto values (1007,'Acetominofen',60,30.22,45.20 ,'Analgesico para el dolor de cabeza',null)
insert into producto values (1008,'Simvastatina',1020,110.22,120.20 ,'Para control del colesterol',null)
insert into producto values (1009,'Omeprazol',200,20.22,25.20 ,'Para el acidez estomacal',null)

select * from producto

create table cliente(
usuario varchar (30) primary key  not null,
 nombre varchar(60) not null,
 contrasena varchar (25) not null,
 fecha_nacimiento date not null,
 telefono_celular int not null,
 telefono_fijo int not null,
 colonia varchar(40) not null,
 bloque varchar(30) not null,
 calle varchar(30) not null,
 numero_casa int not null,
)


insert into cliente values ('esanchez10', 'Erick Sanchez','toquent19' ,'12-5-1998',99202045,22454567,'3 de mayo','3A','3ra calle',1502)
insert into cliente values ('rtRodri', 'Rodrigo Ramires','RTluna23' ,'10-9-2000',99203456,22452131,'Independencia','10','1ra calle',3402)
insert into cliente values ('soSuany', 'Suany Martinez','swrDomingo10' ,'12-5-1999',99223456,22219087,'Quezada','5','1ra calle',5502)
insert into cliente values ('srlopez', 'Daniela Lopez','drLopez21' ,'11-10-1970',99202345,22454511,'Tamara','Barrio el sapote','4ra calle',234)
insert into cliente values ('eryufi', 'Yuri Sanchez','Junio@10' ,'12-25-1999',99205671,22451272,'El bosque','4A','9na calle',9502)
insert into cliente values ('Sharon23', 'Sharon Gonzales','SGCS1999' ,'12-7-2000',99203467,22454560,'La Granada','3A','3ra calle',1503)
insert into cliente values ('JRSalazar', 'Ronny Salazar','JR1998' ,'10-30-1998',99202025,22454523,'Ulloa','6A','6ta calle',1512)
insert into cliente values ('DcMolina', 'Josue Cerritos','CRITOS199' ,'3-3-1999',99202098,22452323,'3 de mayo','8A','1ra calle',1402)
insert into cliente values ('MMOliva23', 'Mario Montoya','toqueteo23' ,'6-7-1998',97202045,25454567,'21 de Octubre','3C','10ma calle',1514)
insert into cliente values ('RZmARTIENZ', 'Samuel Mendoza','tutito1990' ,'5-6-1998',98202045,23454567,'Ciudad España','10A','1ra calle',10000)

select * from cliente



create table compra (
usuario varchar (30) foreign key references cliente(usuario),
codigo_producto int foreign key references producto(codigo_producto),
fecha_compra date not null,
cantidad_producto int not null
)


insert into compra values('esanchez10',1006, '10/02/20',2)
insert into compra values('esanchez10',1007, '10/02/20',1)
insert into compra values('JRSalazar',1009, '10/03/21',10)
insert into compra values('RZmARTIENZ',1006, '10/02/20',12)
insert into compra values('Sharon23',1000, '11/10/20',3)
insert into compra values('Sharon23',1004, '11/10/20',1)
insert into compra values('eryufi',1007, '11/04/22',10)
insert into compra values('DcMolina',1008, '9/11/21',10)
insert into compra values('rtRodri',1009, '6/08/10',9)
insert into compra values('srlopez',1005, '6/08/11',9)

select * from compra


create table laboratorio (
RTN int primary key not null,
ubicacion varchar (50) not null,
nombre varchar(50) not null
)

insert into laboratorio values (100,'4ta Avenida los Proceres, Tegucigalpa','Laboratorio y drogeria Lian')
insert into laboratorio values (101,'3ra Avenida los Catrachos, Tegucigalpa','Laboratorio y drogeria BIRMON')
insert into laboratorio values (102,'1ra Calle el Horno, Comayagua','Laboratorio y drogeria Steven')
insert into laboratorio values (103,'4ta Avenida el Carmen, Intibuca','Laboratorio y drogeria Counter')
insert into laboratorio values (104,'1ra Avenida el Picacho, Nacaome','Laboratorio Misael')
insert into laboratorio values (105,'4ta Avenida el Sumidero, Mexico DC','Laboratorio y drogeria Tualh')
insert into laboratorio values (106,'8va Avenida los Patriotas, Tegucigalpa','Laboratorio y drogeria ARMVM')
insert into laboratorio values (107,'5ta Calle el cubano, Choluteca','Laboratorio y drogeria Sula')
insert into laboratorio values (108,'6ta Avenida los Milagritos','Laboratorio y drogeria Brillos')
insert into laboratorio values (109,'4ta Avenida los Hermanos, Durango','Laboratorio y drogeria Tuxa')

select * from laboratorio

create table producto_laboratorio (
RTN int foreign key references laboratorio(RTN),
codigo_producto int foreign key references producto(codigo_producto)
)

insert into producto_laboratorio values (100,1000)
insert into producto_laboratorio values (101,1001)
insert into producto_laboratorio values (102,1002)
insert into producto_laboratorio values (103,1003)
insert into producto_laboratorio values (104,1004)
insert into producto_laboratorio values (105,1005)
insert into producto_laboratorio values (106,1006)
insert into producto_laboratorio values (107,1007)
insert into producto_laboratorio values (108,1008)
insert into producto_laboratorio values (109,1009)

select *from producto_laboratorio 


create table categoria (
codigo_categoria int primary key not null,
nombre_categoria varchar(30) not null,
codigo_producto int foreign key references producto(codigo_producto)
)

insert into categoria values (001,'Cuidado Personal',1000)
insert into categoria values (002,'Cosmeticos',1001)
insert into categoria values (003,'Cosmeticos',1002)
insert into categoria values (004,'Cuidado Personal',1003)
insert into categoria values (005,'Perfumeria',1004)
insert into categoria values (006,'Cuidado Personal',1005)
insert into categoria values (007,'Medicamento',1006)
insert into categoria values (008,'Medicamento',1007)
insert into categoria values (009,'Medicamento',1008)
insert into categoria values (010,'Medicamento',1009)

select * from categoria


create table inventario (
id_inventario int primary key not null,
estado_producto varchar(30) not null,
cantidad_unidad int not null,
codigo_producto int foreign key references producto(codigo_producto)
)

insert into inventario values (10000, 'Recibido',100,1000)
insert into inventario values (10001, 'Recibido',100,1001)
insert into inventario values (10002, 'Recibido',100,1002)
insert into inventario values (10003, 'Agotado',0,1003)
insert into inventario values (10004, 'Recibido',100,1004)
insert into inventario values (10005, 'Recibido',100,1005)
insert into inventario values (10006, 'Agotado',0,1006)
insert into inventario values (10007, 'Recibido',100,1007)
insert into inventario values (10008, 'Recibido',100,1008)
insert into inventario values (10009, 'Agotado',0,1009)

select * from inventario


create table sucursal (
id_sucursal int primary key not null,
nombre varchar(30) not null,
ubicacion varchar(60) not null,
id_inventario int foreign key references inventario(id_inventario)
)


insert into sucursal values (001,'Los Proceres','1ra Calle los Proceres, Teguigalpa',10000)
insert into sucursal values (002,'Los Hermanos','1ra Calle los Hermanos, Comayagua',10001)
insert into sucursal values (003,'Los Proceres 2','5ta Calle los Proceres, Teguigalpa',10002)
insert into sucursal values (004,'Los Olivos','4ta Calle los Olivos, San Pedro Sula',10003)
insert into sucursal values (005,'Los Churrascos','6ta Calle la Granja, Choluteca',10004)
insert into sucursal values (006,'El Mangal','1ra Calle el Mangal, Danli',10005)
insert into sucursal values (007,'Mall Premier','Bulevar del Norte, Teguigalpa',10006)
insert into sucursal values (008,'Los Anillos','2da Calle los Anillos, Talanga',10007)
insert into sucursal values (009,'La Malarea','1ra Calle el progreso, Yoro',10008)
insert into sucursal values (010,'Los Primos','3ra Calle el Maizal, Colon',10009)

select * from sucursal


create table producto_sucursal(
codigo_producto int foreign key references producto (codigo_producto),
id_sucursal int foreign key references sucursal(id_sucursal)
)

insert into producto_sucursal values (1000,001)
insert into producto_sucursal values (1001,002)
insert into producto_sucursal values (1002,003)
insert into producto_sucursal values (1003,004)
insert into producto_sucursal values (1004,005)
insert into producto_sucursal values (1005,006)
insert into producto_sucursal values (1006,007)
insert into producto_sucursal values (1007,008)
insert into producto_sucursal values (1008,009)
insert into producto_sucursal values (1009,010)

select * from producto_sucursal