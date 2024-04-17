DROP DATABASE IF EXISTS practica01;
CREATE DATABASE practica01;

USE practica01;

CREATE TABLE empresas (
	cif VARCHAR(10) PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	dirección VARCHAR(100),
	telefono INT UNSIGNED NOT NULL
);

CREATE  TABLE alumnos(
	dni_alumno VARCHAR(10) PRIMARY KEY,
	nombre VARCHAR(30) NOT NULL,
	apellido1 VARCHAR(15) NOT NULL,
	apellido2 VARCHAR(15) NOT NULL,
	telefono INT UNSIGNED NOT NULL,
	edad INT UNSIGNED NOT NULL,
	cif INT UNSIGNED NOT NULL,
	FOREIGN KEY (cif) REFERENCES empresas(cif)
);

CREATE TABLE profesores (
	dni_profe VARCHAR(10) PRIMARY KEY,
	nombre VARCHAR(30) NOT NULL,
	apellido1 VARCHAR(15) NOT NULL,
	apellido2 VARCHAR(15) NOT NULL,
	dirección VARCHAR(100),
	telefono INT UNSIGNED NOT NULL
);

CREATE TABLE tipo_curso (
	cod_tipcurso VARCHAR(10) PRIMARY KEY,
	titulo VARCHAR(20) NOT NULL,
	duración DATE NOT NULL
);

CREATE TABLE curso (
	n_curso VARCHAR(20) PRIMARY KEY,
	fecha_inicio DATE NOT NULL,
	fecha_fin DATE NOT NULL,
	dni_profe VARCHAR(10) PRIMARY KEY,
	cod_tipcurso VARCHAR(10) PRIMARY KEY,
	FOREIGN KEY (dni_profe) REFERENCES profesores(dni_profe),
	FOREIGN KEY (cod_tipcurso) REFERENCES tipo_curso(cod_tipcurso)
);

CREATE TABLE asistir (
	nota INT UNSIGNED NULL,
	dni_alumno VARCHAR(10) NOT NULL,
	n_curso VARCHAR(20) NOT NULL,
	PRIMARY KEY (n_curso, dni_alumno),
	FOREIGN KEY (dni_alumno) REFERENCES alumnos(dni_alumno),
	FOREIGN KEY (n_curso) REFERENCES curso(n_curso)
);