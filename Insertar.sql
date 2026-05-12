Create table Clientes(
rutCli varchar2(10) not null primary key,
nombresCli varchar2(25),
apPatCli varchar2(15),
apMatCli varchar2(15),
fonocli number(9)
);
create table Autos(
patente varchar2(6) not null primary key,
marca varchar2(15),
modelo varchar2(15),
año number(4)
);
create table Arriendoautos(
numArriendo number(6) not null primary key,
fechaInicioArriendo date,
fechaFinArriendo date,
valorArriendo number(7),
rutC varchar2(10) not null references Clientes,
pat varchar2(6) not null references Autos
);
insert into autos values('FDFG56','Honda','CR-V',2018);
insert into autos values('JHDF34','Toyota','RAV4',2019);
insert into autos values('KTHS12','Hyundai','Accent',2018);
insert into autos values('PBDB78','Peugeot','308',2020);

insert into clientes values('18234790-5','Maria Isabel','Fica','Herrera',987887234);
insert into clientes values('17890432-2','Bernardo Andrés','Vera','Lara',974657892);
insert into clientes values('19546890-k','Claudia Camila','Barra','Godoy',976789400);

insert into arriendoautos values(236,'23/04/2021','25/04/2021',80000,'18234790-5','FDFG56');
insert into arriendoautos values(237,'24/04/2021','25/04/2021',50000,'17890432-2','KTHS12');
insert into arriendoautos values(238,'12/04/2021','14/05/2021',80000,'19546890-k','JHDF34');
