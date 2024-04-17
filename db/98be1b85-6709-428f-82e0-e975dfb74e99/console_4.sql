####
####    La puntuación de cada pregunta aparece en su enunciado.                                    ####
####    La puntuación en el examen es la suma de lo obtenido en cada pregunta.                     ####
####    Se puede obtener 10 puntos como máximo.                                                    ####
####    La consultas no contestadas o resueltas incorrecta o parcialmente suman 0 puntos.          ####
####    Se permite consultar cualquier tipo de material, sin conexión a internet.                  ####
####    Tiempo de realización del examen: 2 horas                                                  ####
####                                                                                               ####
####    Cuando finalices, añade este fichero a la tarea correspondiente en el Aula Virtual         ####
####                                                                                               ####
#######################################################################################################
use instituto;
# NOMBRE: Javier Alejandro Armillon Neciosup
#######################################################################################################

# 01.- (0,5 puntos) Respuesta pregunta 1:

insert into PROFESORADO values (1,'Nuria','Anerp Gonzales','58328033X','Mattematicas','1972-2-22',9);

# 02.- (1 punto) Respuesta pregunta 2:

insert into PROFESORADO values (2,'Maria Luisa','Fabre Berdún','51083099F','Tecnologia','1975-3-31',4);
insert into PROFESORADO (Codigo, Nombre, Apellidos, Especialidad, Fecha_Nac, Antiguedad)
values (3,'Javier','Jimenez Hernando','Lengua','1969-5-4',10);
insert into PROFESORADO values (4,'Estefania','Fernandez Martinez','19964324W','Tecnologia','1973-6-22',5);
insert into PROFESORADO (Codigo, Nombre, Apellidos)
values (5,'Jose M.','Anero Payan');

# 03.- (0,5 puntos) Respuesta pregunta 3:

update CURSOS set Cod_Profe = 4 where Codigo = 1;
update CURSOS set Cod_Profe = 2 where Codigo = 2;
update CURSOS set Cod_Profe = 2 where Codigo = 3;
update CURSOS set Cod_Profe = 1 where Codigo = 4;
update CURSOS set Cod_Profe = 1 where Codigo = 5;
update CURSOS set Cod_Profe = 3 where Codigo = 6;

#4.- (0,5 puntos) Respuesta pregunta 4:

create view profesores_cursos as
    select CURSOS.Nombre, concat_ws(' ',PROFESORADO.Nombre,PROFESORADO.Apellidos)
    from CURSOS join instituto.PROFESORADO on PROFESORADO.Codigo = CURSOS.Cod_Profe;
select *
from profesores_cursos;

# 05.- (0,5 puntos) Respuesta pregunta 5:

update PROFESORADO set Fecha_Nac = '1974-6-22' and Antiguedad = 4 where Codigo = 4;

# 06.- (0,5 puntos) Respuesta pregunta 6:

update PROFESORADO set Antiguedad = Antiguedad+1;

# 07.- (0,5 puntos) Respuesta pregunta 7:

delete from CURSOS where Codigo = 6;

# 08.- (0,5 punto). Respuesta pregunta 8:

delete from ALUMNADO where Cod_Curso = 3;

# 09.- (0,5 punto). Respuesta pregunta 9:

insert into ALUMNADO (Nombre, Apellidos, Sexo, Fecha_Nac)
select * from ALUMNADO_NUEVO;

#10.- (1'25 puntos). Respuesta pregunta 10:

#SELECT count(ALUMNADO.Codigo) from ALUMNADO where Cod_Curso = 2;
update CURSOS set Max_Alumn = (SELECT count(ALUMNADO.Codigo) from ALUMNADO where Cod_Curso = 2) where Codigo = 2;

#11.- (1,5 puntos) Respuesta pregunta 11:

delete from ALUMNADO where Cod_Curso = (select CURSOS.Codigo from CURSOS where Cod_Profe = (select PROFESORADO.Codigo from PROFESORADO where PROFESORADO.Nombre like 'Nuria'));

#12.-(1'25 puntos) Respuesta pregunta 12:

delete from PROFESORADO where Codigo = (select PROFESORADO.codigo from instituto.CURSOS where CURSOS.Codigo = 2);

#13.- (1 punto) Respuesta pregunta 13:

create user operador24 identified by 'Operador24_412';
update mysql.user set Host = 'localhost' where User = 'operador24';

