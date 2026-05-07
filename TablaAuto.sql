create table Clientes(
rutCli varchar2(10) not null,
nombresCli varchar2(25),
apPatCli varchar2(15),
apMatCli varchar2(15),
fonocli number(9),
primary key(rutCli)
)
create table Autos(
patente varchar2(6) not null,
marca varchar2(15),
modelo varchar2(15),
año number(4),
primary key(patente)
)
create table ArriendoAutos(
numArriendo number(6) not null,
fechaInicioArriendo date,
fechaFinArriendo date,
valorArriendo number(7),
rutC varchar2(10) not null,
pat varchar2(6) not null,
primary key(numArriendo),
foreign key(rutC) references Clientes(rutCli),
foreign key (pat) references Autos(patente)
)

rename Clientes to cliente
describe cliente
rename cliente to clientes --cambiar nombre
drop table arriendoautos --borrar
alter table clientes modify appatcli varchar2(20) --editar tabla
alter table autos add color varchar2(15) --añadir atributos
alter table autos rename column color to colorauto --renombrar atributos
alter table autos drop column colorauto --eliminar atributos
describe autos