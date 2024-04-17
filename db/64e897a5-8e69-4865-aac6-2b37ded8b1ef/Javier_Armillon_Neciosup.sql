DROP DATABASE IF EXISTS examenDDL;
CREATE DATABASE examenDDL;

USE examenDDL;

CREATE TABLE ciclistas(
    id VARCHAR(10) PRIMARY KEY ,
    nombre VARCHAR(50) NOT NULL ,
    fecha_nac DATE NOT NULL
);
CREATE TABLE equipo (
    nombre VARCHAR(20) PRIMARY KEY ,
    nacionalidad VARCHAR(15) NOT NULL
);
CREATE TABLE prueba (
    nombre ENUM('Vuelta a España','Tour de Francia','Giro de Italia') NOT NULL ,
    año DATE NOT NULL ,
    PRIMARY KEY (nombre, año)
);
CREATE TABLE ciclista_equipo (
    id_ciclista VARCHAR(10) NOT NULL ,
    nombre_eqipo VARCHAR(20) NOT NULL ,
    PRIMARY KEY (id_ciclista, nombre_eqipo),
    FOREIGN KEY (nombre_eqipo) REFERENCES equipo(nombre),
    FOREIGN KEY (id_ciclista) REFERENCES ciclistas(id),
    fecha_inicio DATE NOT NULL ,
    fecha_fin DATE NOT NULL
);
CREATE TABLE equipo_prueba (
    nombre_eqipo VARCHAR(20) NOT NULL ,
    nombre_prueba ENUM('Vuelta a España','Tour de Francia','Giro de Italia') NOT NULL ,
    año DATE NOT NULL ,
    PRIMARY KEY (nombre_eqipo,nombre_prueba,año),
    FOREIGN KEY (nombre_prueba) REFERENCES prueba(nombre),
    FOREIGN KEY (nombre_eqipo) REFERENCES equipo(nombre),
    nacionalidad VARCHAR(15) NOT NULL
);

DESCRIBE equipo;

ALTER TABLE equipo ADD director VARCHAR(20) NOT NULL;

DESCRIBE ciclistas;

ALTER TABLE ciclistas DROP fecha_nac;