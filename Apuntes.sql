Create table Clientes(
rutCli varchar2(10) not null primary key, --Claves primarias
nombresCli varchar2(25),
apPatCli varchar2(15),
apMatCli varchar2(15),
fonocli number(9)
);
DESCRIBE Clientes --muestra la estructura de la tabla
Create table Autos(
patente varchar2(6) not null primary key,
marca varchar2(15),
modelo varchar2(15),
año number(4)
);
Create table ArriendoAutos(
numArriendo number(6) not null primary key,
fechaInicioArriendo date,
fechaFinArriendo date,
valorArriendo number(7),
rutC varchar2(10) not null references Clientes(rutCli), --Claves Foraneas
pat varchar2(6) not null references Autos(patente)  
);
RENAME clientes to cliente --Cambiar el nombre de una tabla
drop  table arriendoautos --Eliminar una tabla de datos
--Alter: Modificar estructura de una tabla
ALTER TABLE clientes MODIFY appatcli varchar2(20) --Cambiar el tamaño de un campo
ALTER TABLE autos ADD color varchar2(15) --Agregar un campo

alter table <tabla> add constraint <nombre pk> primary key (<campo pk>) --Agregar clave primaria

alter table <tabla> add constraint <nombre fk> foreign key (<campo fk>) references <tabla madre>(<campo pk de tabla madre>)--Agregar clave Secundaria

ALTER TABLE autos RENAME COLUMN color to colorauto -- Cambiar nombre de un campo
ALTER TABLE autos DROP COLUMN colorauto --Eliminar campo

insert into autos values('FDFG56','Honda','CR-V',2018); --Insertar registros de datos
insert into autos values('JHDF34','Toyota','RAV4',2019);
insert into autos values('KTHS12','Hyundai','Accent',2018);
insert into autos values('PBDB78', 'Peugeot', '308',2020)

insert into clientes values('18234790-5','María Isabel','Fica','Herrera',987887234);
insert into clientes values('17890432-2','Bernardo Andrés','Vera','Lara',974657892);
insert into clientes values('19546890-k','Claudia Camila','Barra','Godoy',976789400)

insert into arriendoautos values(236,'23/04/2021','25/04/2021',80000,'18234790-5','FDFG56');
insert into arriendoautos values(237,'24/04/2021','25/04/2021',50000,'17890432-2','KTHS12');
insert into arriendoautos values(238,'12/05/2021','14/05/2021',80000,'19546890-k','JHDF34')

select  *  from arriendoautos --comprobar si estan los datos

delete from arriendoautos where numArriendo=236 --Elimina uno o más registros de una tabla
delete from arriendoautos --Se dejará vacía la tabla
truncate  table arriendoautos --deja vacía una tabla

update clientes  --Modificar registros de una tabla
set fonocli=994657893 --<nombre de campo>=<nuevo valor>
where rutcli='17890432-2' --condicion

update arriendoautos
set valorarriendo=valorarriendo*1.05 --Aumentar todos los valorarriendo en un 5%, en toda la tabla arriendoautos.

delete from arriendoautos where valorarriendo>80000 --delete from <nombredetabla> where <condición>    Eliminación de  múltiple de registros
delete from arriendoautos where fechainicioarriendo>='1/6/2023' and fechainicioarriendo<='15/6/2023'
delete from arriendoautos where rutc<>'18234790-5'








