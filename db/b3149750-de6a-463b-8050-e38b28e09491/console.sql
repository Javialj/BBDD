DROP DATABASE IF EXISTS Montruos;
CREATE DATABASE Montruos CHARACTER SET utf8mb4;
USE Montruos;

CREATE TABLE Elementos (
	elemento VARCHAR(30),
	PRIMARY KEY (elemento)
)

CREATE TABLE Habilidades (
	habilidades VARCHAR(30) NOT NULL,
	descripcion VARCHAR(100),
	elemento VARCHAR(30),
	PRIMARY KEY (habilidades),
	FOREIGN KEY (elemento) REFERENCES Elementos (elemento)
);

CREATE TABLE Montruo (
	codigo INTEGER NOT NULL,
	monstruo VARCHAR(20) NOT NULL,
	descripcion VARCHAR(100),
	habilidades VARCHAR(30), 
	debilidades  VARCHAR(30),
	PRIMARY KEY (codigo),
	FOREIGN KEY (habilidades) REFERENCES Habilidades (habilidades)
);

#--DATOS

INSERT INTO Elementos VALUES ('Fuego');
INSERT INTO Elementos VALUES ('Viento');
INSERT INTO Elementos VALUES ('Agua');
INSERT INTO Elementos VALUES ('Tierra');
INSERT INTO Elementos VALUES ('Fisico');

INSERT INTO Habilidades VALUES ('Tajo','Hace un tajo con un arma afilada','Fisico');
INSERT INTO Habilidades VALUES ('Bola de Fuego','Castea una bola de fuego con un alcanze de 20 metros','Fuego');
INSERT INTO Habilidades VALUES ('Escudo de Agua','Produce un escudo de agua capas de resitir 5 puntos de daño','Agua');
INSERT INTO Habilidades VALUES ('Alas de viento','Crea un par de alas con una duracion de 2 de mana cada 1 minuto','Fisico');
INSERT INTO Habilidades VALUES ('Petrificacion','Petrifica la tierra durante 10 segundos','Fisico');

INSERT INTO Montruo VALUES (001,'Goblin','Criatura humanoide del tamaño de un niño, es de color verde','Tajo','Todo tipo de ataques');
INSERT INTO Montruo VALUES (002,'Mago Goblin','Evolucion del goblin comun enfcado en la magia','Bola de Fuego','Todo tipo de atque');
INSERT INTO Montruo VALUES (003,'Goblin asesino','Evolucion del goblin comun enfcado en la velocidad','Alas de viento','Todo tipo de ataque');

