USE  BD_MiguelSotoAguilar

create table partidosPoliticos
(
	id_partido int identity(1,1),
	nombre_Partido varchar(50),
	CONSTRAINT pk_id_partido primary key (id_partido)
)
GO
create table participantes 
(
	id_numeroEncuesta int identity(1,1),
	nombreParticipante varchar(50) not null,
	fecha_Nacimiento date not null,
	correoElectronico varchar (50),
	partidoPolitico int,
	CONSTRAINT pk_id_numeroEncuesta primary key (id_numeroEncuesta),
	CONSTRAINT fk_partidoPolitico foreign key (partidoPolitico) references
	partidosPoliticos (id_partido)



)


select * from partidosPoliticos
INSERT INTO partidosPoliticos VALUES ('PLN'), ('PUSC'), ('PAC')


CREATE PROCEDURE AGREGAR_ENCUESTA
@NOMBRE VARCHAR(50),
@FECHA_NACIMIENTO DATE,
@CORREOELECTRONICO VARCHAR(50),
@PARTIDOPOLITICO INT
AS 
BEGIN
		INSERT INTO participantes (nombreParticipante, fecha_Nacimiento, correoElectronico, partidoPolitico) 
		VALUES (@NOMBRE, @FECHA_NACIMIENTO, @CORREOELECTRONICO, @PARTIDOPOLITICO)
END

CREATE PROCEDURE MOSTRAR_PARTIDOS
AS
BEGIN
select * from partidosPoliticos
END

EXEC MOSTRAR_PARTIDOS

insert into participantes values ('Jorge', '10/5/1990', 'jorge@gmail', 1)

CREATE PROCEDURE REPORTE
AS
BEGIN

SELECT u.nombreParticipante as Nombre, u.correoElectronico as CorreoElectrónico, u.fecha_Nacimiento as FechadeNacimiento, p.nombre_Partido as NombrePartido
from participantes u
inner join partidosPoliticos p on p.id_partido = u.id_numeroEncuesta


END


