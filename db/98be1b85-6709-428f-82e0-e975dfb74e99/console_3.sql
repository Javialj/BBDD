DROP DATABASE IF EXISTS instituto;
CREATE DATABASE instituto CHARACTER SET utf8mb4;
use instituto;
CREATE TABLE PROFESORADO
( Codigo int unsigned auto_increment primary key,
  Nombre VARCHAR(30) not null,
  Apellidos VARCHAR(30),
  DNI VARCHAR(10),
  Especialidad VARCHAR(20),
  Fecha_Nac DATE,
  Antiguedad int unsigned
);

CREATE TABLE CURSOS
(  Codigo int unsigned auto_increment primary key,
  Nombre VARCHAR(20),
  Cod_Profe int unsigned,
  Max_Alumn int unsigned,
  Fecha_Inic DATE,
  Fecha_Fin DATE,
  Num_Horas int unsigned,
    constraint fk_profe
 FOREIGN KEY (Cod_Profe) REFERENCES PROFESORADO(Codigo)
);

CREATE TABLE ALUMNADO_NUEVO
( Nombre VARCHAR(30) not null ,
  Apellidos VARCHAR(30) not null,
  Sexo VARCHAR(1),
  Fecha_Nac DATE
);

CREATE TABLE ALUMNADO
(  Codigo int unsigned auto_increment primary key,
  Nombre VARCHAR(30) not null,
  Apellidos VARCHAR(30) not null,
  Sexo VARCHAR(1),
  Fecha_Nac DATE,
  Cod_Curso int unsigned,
  FOREIGN KEY (Cod_Curso)
    REFERENCES CURSOS(Codigo)
on update cascade on delete cascade
);

INSERT INTO CURSOS (Codigo, Nombre, Max_Alumn, Fecha_Inic, Fecha_Fin, Num_Horas) VALUES
(1, 'Carpintería', 30, '2021-01-01', '2021-12-31', 100);
INSERT INTO CURSOS (Codigo, Nombre, Max_Alumn, Fecha_Inic, Fecha_Fin, Num_Horas) VALUES
(2, 'Cerámica', 30, '2021-01-01', '2021-12-31', 100);
INSERT INTO CURSOS (Codigo, Nombre, Max_Alumn, Fecha_Inic, Fecha_Fin, Num_Horas) VALUES
(3, 'Yoga', 30, '2021-01-01', '2021-12-31', 100);
INSERT INTO CURSOS (Codigo, Nombre, Max_Alumn, Fecha_Inic, Fecha_Fin, Num_Horas) VALUES
(4, 'Informática', 30, '2021-01-01', '2021-12-31', 100);
INSERT INTO CURSOS (Codigo, Nombre, Max_Alumn, Fecha_Inic, Fecha_Fin, Num_Horas) VALUES
(5, 'Danza', 30, '2021-01-01', '2021-12-31', 100);
INSERT INTO CURSOS (Codigo, Nombre, Max_Alumn, Fecha_Inic, Fecha_Fin, Num_Horas) VALUES
(6, 'Ajedrez', 30, '2021-01-01', '2021-12-31', 100);



INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('MANUELA','SUAREZ IBAÑEZ','M','2000-6-30',1);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('MILAGROSA','DIAZ PEREZ','M','2004-10--28',3);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('JOSE','CRESPO DE HERMOSO','H','2003-3-2',1);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('ANTONIO JESUS','MARTIN BOLLO','H','2009-11-4',1);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('BARBARA','PELAEZ VALENCIA','M','2007-8-27',4);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('JUAN PEDRO','GALVE GONZALEZ','H','2001-11-10',4);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('MARIA ISABEL','PEREZ GUILLEN','M','2002-11-14',2);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('PATRICIA','ROMAN GOMEZ','M','2009-4-26',3);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('DAVID','TAPIA SOLANS','H','2000-6-5',4);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('MARIA','FERREIRO SANTOS','M','2009-1-29',1);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('JAVIER','LAMA DEL REY','H','2007-2-26',2);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('ALEJANDRA','CALDERON VALDIVIA','M','2000-11-16',2);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('ANA DOLORES','ESCUDERO ENCISO','M','2005-9-7',4);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('JUAN CARLOS','RODRIGUEZ PADILLA','H','2003-11-15',5);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('CECILIO','SASTRE GONZALEZ','H','2009-11-23',3);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('JUAN','MARTINEZ SANCHEZ','H','2004-10-23',2);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('MARIA','LAFUENTE FERNANDEZ','M','2003-11-21',2);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('MANUELA','MARTINEZ ALBA','M','2002-11-26',1);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('ROSA NIEVES','SANCHEZ CANO','M','2009-12-12',5);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('BELEN','RAMOS ANGUITA','M','2007-12-30',2);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('JULIAN','GARCIA ZABALA','H','2003-1-4',3);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('DIEGO JESUS','CANO SALVADOR','H','2000-5-18',1);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('JOSE IGNACIO','HARO FANECA','H','2001-5-8',5);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('JOSEFA','CASTELLANOS DIEZ','M','2008-5-1',2);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('BEATRIZ','RUBIO BERMEJO','M','2009-4-29',5);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('JAVIER','CASTRO GOMEZ','H','2007-8-20',5);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('DAVID','GAY GARCIA DEL VALLE','H','2009-7-22',3);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('DAVID','TOCADOS GARCIA','H','2001-1-18',1);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('ELISA ISABEL','BRUNO CALVO','M','2008-5-13',4);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('DIANA','GUILLAMON POSADA','M','2000-4-29',2);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('DAVID','RANILLA URRUTIA','H','2004-11-22',2);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('JAVIER','LUENGO HERRERO','H','2003-4-22',3);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('DAVID','VALENCIA MEDINA','H','2001-3-27',2);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('RAFAEL','DIAZ LAMA','H','2009-6-1',1);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('CAROLINA','RIVAS MENDIA','M','2004-7-30',1);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('JOSE MANUEL','GARCIA ZAPICO','H','2003-3-3',5);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('MIGUEL','IBARROLA DIEZ','H','2005-8-12',4);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('ENCARNACION','ASENJO HERNANDO','M','2002-4-3',4);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('FRANCISCO','CALVO BONO','H','2004-6-17',5);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('JOSE ANTONIO','CALVO RODRIGUEZ','H','2009-5-4',5);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('ANTONIA','MORENO RAYA','M','2006-8-4',1);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('JOSE MARIA','FUENTEMILLA ALBERT','H','2009-12-27',4);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('BELEN','PORTERO GRACIA','M','2001-10-28',4);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('LUIS ANTONIO','SUAREZ GARCIA','H','2007-10-24',5);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('FRANCISCO ANTONIO','BAUTISTA LAMENCA','H','2002-9-9',3);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('SILVIA','PEÑA CASTAN','M','2007-7-20',5);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('CARMEN','KAAMOUCHI VICENTE','M','2000-5-31',3);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('MARIA','LASTRA MOLINA','M','2001-9-29',1);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('ROCIO EMILIA','IZQUIERDO BELTRAN','M','2001-4-1',5);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('OSCAR','DIEZ NAVARRO','H','2002-6-17',3);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('JULIAN ANDRES','MORALES RIERA','H','2008-12-31',5);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('MUJERES','ALCALA PEREZ','M','2000-10-11',5);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('JOSE ANTONIO','GONZALEZ ROY','H','2005-6-19',1);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('JOSEFA','GOMEZ EGIDO','M','2008-9-27',5);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('MYRIAM','MORALES ISAC','M','2004-9-15',5);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('EDURNE','MARTINEZ LASTRA','M','2006-1-25',3);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('JUAN JOSE','RIVAS RAMON','H','2004-5-1',4);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('DANIEL JOSE','BLANCO IZQUIERDO','H','2002-5-2',2);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('MIRIAN','MONTERO LAMENCA','M','2002-6-5',5);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('MARIA PAZ','BERTIZ SARMIENTO','M','2007-4-1',5);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('EMILIO','MORILLO RAMON','H','2003-9-5',5);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('ENRIQUE','FERNANDEZ DIEZ','H','2002-10-6',3);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('ANA TERESA','CASADO CRESPO','M','2001-1-13',4);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('JOSE IGNACIO','MARTIN BERDUN','H','2007-8-18',5);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('DAVID','PADILLA ORTEGA','H','2000-8-29',4);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('MIGUEL','GARCIA LARRETA','H','2002-2-4',5);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('LUIS MIGUEL','NAVARRO URRUTIA','H','2009-4-20',5);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('NURIA','AMOSTEGUI LUZURIAGA','M','2003-10-25',2);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('ANA MARIA','SANDE LAMENCA','M','2009-10-31',1);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('LEON JOSE','SARMIENTO RIVAS','H','2009-4-11',5);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('VICTOR','GARCIA GARCÍA','H','2009-12-29',4);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('NATALIA','TIMON ECHEPARE','M','2003-1-19',2);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('MELANIE','CAMPOY GOMEZ','M','2007-2-24',2);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('RAMIRO','LLOBREGAT ALONSO','H','2004-5-14',3);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('JULIAN','JIMENO DIEZ','H','2006-2-27',3);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('ISABEL','SORIANO MATAMOROS','M','2005-7-7',2);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('MIGUEL','SANCHEZ SANCHEZ','H','2008-2-6',4);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('NOEMI','BERRUEZO REQUENA','M','2003-11-25',4);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('IVAN ANGEL DE LA','GARCIA RUBIO','H','2009-3-26',4);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('LUTGARDA','GOÑI TIMON','M','2004-10-17',2);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('MARIA JESUS','RECOVER AGUILERA','M','2004-3-20',1);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('MARIA SOLEDAD','MORILLAS GUILLEN','M','2005-4-30',4);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('JUAN MANUEL','MARTIN ALEJANO','H','2000-9-16',2);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('MARIA DEL MAR','CASTRO CRUZ','M','2007-11-8',2);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('MARIA ISABEL','ECHAGUE GONZALEZ','M','2008-3-30',1);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('JUAN','TALEGON CORTES','H','2006-7-12',2);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('MIGUEL','ARAGUAS DE LA TORRE','H','2008-8-12',4);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('DAVID','ALONSO GIMENEZ','H','2005-9-2',4);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('NICOLAS','BLANCO GONZALEZ','H','2002-3-8',2);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('ALBERTO','VEGA GARCIA','H','2006-8-29',4);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('EVA MARIA','FENOY ORDOÑEZ','M','2009-12-4',2);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('ANA M.','GUERRERO LANZA','M','2003-5-11',1);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('ANA MARIA','FERREIRO DIEZ','M','2009-1-7',5);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('ARTURO','REVIRIEGO CERVANTES','H','2004-8-2',5);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('ALEJANDRO','CANO MORALES','H','2000-5-13',1);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('AZUCENA','BERENGUEL ROY','M','2008-5-27',4);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('PAZ DE','GARRALDA ARIAS','M','2002-9-6',3);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('PABLO CESAR','URBISTONDO GONZALEZ','H','2001-2-12',2);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('OSCAR','MARTIN GALINDO','H','2002-8-3',5);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES
('LUIS','MOLINA TAGARRO','H','2006-1-16',4);


INSERT INTO ALUMNADO_NUEVO (Nombre,Apellidos,Sexo,Fecha_Nac) VALUES
('MARIA','GOMEZ ANDRES','M','2005-5-4');
INSERT INTO ALUMNADO_NUEVO (Nombre,Apellidos,Sexo,Fecha_Nac) VALUES
('JOSE MANUEL','PADILLA VEGAS','H','2009-5-19');
INSERT INTO ALUMNADO_NUEVO (Nombre,Apellidos,Sexo,Fecha_Nac) VALUES
('RICARDO','MARQUINA HERNANDO','H','2002-2-20');
INSERT INTO ALUMNADO_NUEVO (Nombre,Apellidos,Sexo,Fecha_Nac) VALUES
('MIGUEL','DIAZ FABRE','H','2005-4-17');
INSERT INTO ALUMNADO_NUEVO (Nombre,Apellidos,Sexo,Fecha_Nac) VALUES
('LUIS MIGUEL','AGURRUZA RODRIGUEZ','H','2003-4-25');
INSERT INTO ALUMNADO_NUEVO (Nombre,Apellidos,Sexo,Fecha_Nac) VALUES
('NICOLAS','LOBATO BARRANCO','H','2001-6-25');
INSERT INTO ALUMNADO_NUEVO (Nombre,Apellidos,Sexo,Fecha_Nac) VALUES
('MIGUEL','BURGOS ZAPICO','H','2003-4-13');
INSERT INTO ALUMNADO_NUEVO (Nombre,Apellidos,Sexo,Fecha_Nac) VALUES
('JOSE JESUS','VALDIVIESO JIMENEZ','H','2005-12-23');
INSERT INTO ALUMNADO_NUEVO (Nombre,Apellidos,Sexo,Fecha_Nac) VALUES
('ANA MARIA','BEAMONTE GOMEZ','M','2008-7-25');
INSERT INTO ALUMNADO_NUEVO (Nombre,Apellidos,Sexo,Fecha_Nac) VALUES
('MARIA','LOPEZ CARREÑO','M','2003-11-18');
INSERT INTO ALUMNADO_NUEVO (Nombre,Apellidos,Sexo,Fecha_Nac) VALUES
('MARIA DEL MAR','ASENSIO SEGURA','M','2004-05-21');
INSERT INTO ALUMNADO_NUEVO (Nombre,Apellidos,Sexo,Fecha_Nac) VALUES
('ROSA NIEVES','LARRAÑETA LAZARO','M','2006-06-10');
INSERT INTO ALUMNADO_NUEVO (Nombre,Apellidos,Sexo,Fecha_Nac) VALUES
('ELENA','DAZA FANECA','M','2000-09-18');
INSERT INTO ALUMNADO_NUEVO (Nombre,Apellidos,Sexo,Fecha_Nac) VALUES
('GEMA','PASTOR ADELL','M','2003-02-13');
INSERT INTO ALUMNADO_NUEVO (Nombre,Apellidos,Sexo,Fecha_Nac) VALUES
('MARIA CARMEN','CHECA CANO','M','2000-08-11');
INSERT INTO ALUMNADO_NUEVO (Nombre,Apellidos,Sexo,Fecha_Nac) VALUES
('JOSE ANTONIO','GRACIA GONZALEZ','H','2002-11-28');
INSERT INTO ALUMNADO_NUEVO (Nombre,Apellidos,Sexo,Fecha_Nac) VALUES
('AMALIA','GIL PER','M','2005-01-10');
INSERT INTO ALUMNADO_NUEVO (Nombre,Apellidos,Sexo,Fecha_Nac) VALUES
('VICTOR','RAMON GARCIA','H','2001-08-24');
INSERT INTO ALUMNADO_NUEVO (Nombre,Apellidos,Sexo,Fecha_Nac) VALUES
('ESPERANZA VICTORIA','PANIZO DEL AGUILA','M','2002-12-07');
INSERT INTO ALUMNADO_NUEVO (Nombre,Apellidos,Sexo,Fecha_Nac) VALUES
('ANTONIO','ALONSO SORIANO','H','2005-06-15');
INSERT INTO ALUMNADO_NUEVO (Nombre,Apellidos,Sexo,Fecha_Nac) VALUES
('JAVIER','BOTAZ HERNÁNDEZ','H','2009-03-31');
INSERT INTO ALUMNADO_NUEVO (Nombre,Apellidos,Sexo,Fecha_Nac) VALUES
('FRANCISCO','CUTILLAS HERNANDEZ','H','2002-03-30');
INSERT INTO ALUMNADO_NUEVO (Nombre,Apellidos,Sexo,Fecha_Nac) VALUES
('EDUARDO','LOPEZ RODRIGUEZ','H','2004-11-20');
INSERT INTO ALUMNADO_NUEVO (Nombre,Apellidos,Sexo,Fecha_Nac) VALUES
('ADOLFO','LOPEZ EL AAKROUTI','H','2007-10-16');
INSERT INTO ALUMNADO_NUEVO (Nombre,Apellidos,Sexo,Fecha_Nac) VALUES
('MARIA ROSA','MORA BAUTISTA','M','2009-04-20');
INSERT INTO ALUMNADO_NUEVO (Nombre,Apellidos,Sexo,Fecha_Nac) VALUES
('GONZALO','IBAÑEZ PALENCIA','H','2005-12-21');
INSERT INTO ALUMNADO_NUEVO (Nombre,Apellidos,Sexo,Fecha_Nac) VALUES
('ANA M.','DIEZ IZQUIERDO','M','2006-10-07');
INSERT INTO ALUMNADO_NUEVO (Nombre,Apellidos,Sexo,Fecha_Nac) VALUES
('ALICIA MARIA','DIAZ GUERRERO','M','2008-08-27');
INSERT INTO ALUMNADO_NUEVO (Nombre,Apellidos,Sexo,Fecha_Nac) VALUES
('MONTSERRAT','VELA SASTRE','M','2008-08-27');
INSERT INTO ALUMNADO_NUEVO (Nombre,Apellidos,Sexo,Fecha_Nac) VALUES
('LUIS','BERMEJO GARCIA','H','2004-11-07');