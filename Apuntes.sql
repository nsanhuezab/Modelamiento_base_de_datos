Create table Clientes(
rutCli varchar2(10) not null primary key, --Claves primarias
nombresCli varchar2(25),
apPatCli varchar2(15),
apMatCli varchar2(15),
fonocli number(9)
);
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

select  *  from arriendoautos --comprobar si estan los datos
select  modelo,marca --campos que mostrara
from  autos --nombre de tabla
where patente='FDFG56' --condicion

select rutC,valorArriendo
from arriendoautos
where valorArriendo>60000 --Se puede usar igual =,>,>=,<,<=, <> and, or

select fechaInicioArriendo
from arriendoautos 
where fechaInicioArriendo<'20/8/2023' --igual con fechas

select rutC,valorArriendo
from arriendoautos
where valorArriendo between 60000 and 70000 --Restringe valores que se encuentran entre un rango mínimo y un rango máximo.


select rutCli,nombresCli
from Clientes
where nombresCli  like 'Ma%' --Se utiliza este operador con patrones de búsqueda (o comodines). 
--El % sirve para cualquier secuencia de cero o más caracteres.
--El _ sirve para un único carácter.

select marcaequipo,descripequipo
from equipos
where marcaequipo in ('Stihl','Makita') --Selecciona aquellos valores que se encuentran en una lista, que puede ser escrita o generada con un select anidado.
--Mostrar marcas y descripciones de los equipos que estén entre las marcas Stihl o Makita

--En los tres operadores se puede usar el Not

select numArriendo,valorArriendo 
from arriendoautos
order by valorArriendo --Muestra ordenado el resultado del select. desc es para q sea descendiente

select distinct numArriendo --Distinct permite visualizar valores no duplicados (distintos) en el resultado.
from arriendoautos

select sum(costoventa) --Calcula la suma de los valores de un campo.
from ventas	

select round(avg(costoventa),2) Promedio    -- esto es una alias. Calcula el promedio de los valores de un campo.
from ventas
where fechaventa<'1/7/2023'

select min(costoventa) Mínimo --Muestra el menor valor del campo.
from ventas

select max(costoventa) Mayor --Muestra el mayor valor del campo.
from ventas

select count(fonoper)  --Calcula la cantidad de valores de un campo, “los cuenta”.
from personas
where nomper like 'D%'

select count(*) --Para contar todos los registros de una tabla, por ejemplo, para la tabla personas
from personas

--check

create table RegistroDeNotas(
codRegistro number(5) not null primary key,
codAsignatura varchar2(6),
rutEstudiante varchar2(10),
numEvaluacion number(1),
nota number(2,1)
)
alter table registrodenotas --nombre de la tabla
add constraint ckNumEval --nombre del check
check (numevaluacion>=1 and numevaluacion<=4) --expresion de check

select  *  from user_constraints where table_name = 'REGISTRODENOTAS' --Para revisar las restricciones, entre ellas los check, en mayusculas

insert into registrodenotas values(125,'FR4545','20210656-3',5,6.3) --marcara error ya que no cumple condicion
alter table registrodenotas drop constraint cknumeval --eliminar la restricción check 

--Transacciones
--Al ejecutar una transacción, si una de las operaciones falla se podrá deshacer la transacción entera.
begin
update productos set precio=5000 where codProd=110;
delete from productos where nombreProd='Martillo';

commit; --Confirma la ejecución de una transacción.
exception when others then rollback; --es una reversión que permite deshacer una transacción.
end;

--Gropup By 
/*Permite agrupar los datos de salida por uno o más campos, que están en la primera línea del select, 
además se debe estar usando, al menos, una función grupal (sum, avg, min, max, count) en la primera línea del Select.*/ 

select rutprofesor,sum(monto) SumaDePagos
from pagosaprofesores
where codigocurso='as3000'
group by rutprofesor --Se agrupa por un campo que está en la 1ra línea del select (excepto el campo de la función grupal)

--Having
/*having permite definir condiciones de salida, similar al where, 
pero usando las funciones grupales de registros (sum, avg, count, max, min).*/
select rutprofesor, sum(monto)
from pagosaprofesores
group by rutprofesor
having sum(monto)>=800000 
--Se puede usar Having y where juntos
select rutprofesor, avg(monto) promedio
from pagosaprofesores
where monto>80000
group by rutprofesor
having sum(monto)>=300000 


