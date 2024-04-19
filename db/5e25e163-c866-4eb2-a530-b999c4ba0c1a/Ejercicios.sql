use jardineria;
#1.Escribe un procedimiento que no tenga ningún parámetro de entrada ni de salida y que muestre el texto ¡Hola mundo!.
DELIMITER $$;
DROP PROCEDURE IF EXISTS hola_mundo;
CREATE PROCEDURE hola_mundo()
BEGIN
    SELECT '!Hola mundo¡';
END $$;

#2.Escribe un procedimiento que reciba un número real de entrada y muestre un mensaje indicando si el número es positivo, negativo o cero.
DELIMITER $$;
DROP PROCEDURE IF EXISTS ejercicio_2;
CREATE PROCEDURE ejercicio_2(IN numero double)
BEGIN
    IF numero > 0 THEN SELECT 'Positivo';
    ELSEIF numero < 0 THEN SELECT 'Negativo';
    ELSE SELECT 'Cero';
    END IF;
end $$;

DELIMITER ;
CALL ejercicio_2(1000.2);
CALL ejercicio_2(-1000.2);
CALL ejercicio_2(0);
#3.Modifique el procedimiento diseñado en el ejercicio anterior para que tenga un parámetro de entrada, con el valor un número real, y un parámetro de salida, con una cadena de caracteres indicando si el número es positivo, negativo o cero.
DELIMITER $$;
DROP PROCEDURE IF EXISTS ejercicio_3;
CREATE PROCEDURE ejercicio_3(IN numero double, out resultado VARCHAR(20))
BEGIN
    IF numero > 0 THEN SET resultado = 'Positivo';
    ELSEIF numero < 0 THEN SET resultado = 'Negativo';
    ELSE SET resultado = 'Cero';
    END IF;
end $$;

DELIMITER ;
CALL ejercicio_3(1000.2,@resultado);
SELECT @resultado;
CALL ejercicio_3(-1000.2,@resultado);
SELECT @resultado;
CALL ejercicio_3(0,@resultado);
SELECT @resultado;

#4.Escribe un procedimiento que reciba un número real de entrada, que representa el valor de la nota de un alumno, y muestre un mensaje indicando qué nota ha obtenido teniendo en cuenta las siguientes condiciones:
#   [0,5) = Insuficiente
#   [5,6) = Aprobado
#   [6, 7) = Bien
#   [7, 9) = Notable
#   [9, 10] = Sobresaliente
#   En cualquier otro caso la nota no será válida.
DELIMITER $$;
DROP PROCEDURE IF EXISTS ejercicio_4;
CREATE PROCEDURE ejercicio_4(IN numero double)
BEGIN
    IF numero >= 0 AND numero < 5 THEN SELECT 'F mi pana';
    ELSEIF numero >= 5 AND numero < 6 THEN SELECT 'Al limite';
    ELSEIF numero >= 6 AND numero < 7 THEN SELECT 'Bien';
    ELSEIF numero >= 7 AND numero < 9 THEN SELECT 'Ta loco no?';
    ELSEIF numero >= 9 AND numero <= 10 THEN SELECT 'Kovaski';
    ELSE SELECT 'XD Te pasas Guachin';
    END IF;
end $$;

DELIMITER ;
CALL ejercicio_4(10);

CALL ejercicio_4(2.3);

CALL ejercicio_4(8.2);

#5.Modifique el procedimiento diseñado en el ejercicio anterior para que tenga un parámetro de entrada, con el valor de la nota en formato numérico y un parámetro de salida, con una cadena de texto indicando la nota correspondiente.
DELIMITER $$;
DROP PROCEDURE IF EXISTS ejercicio_5;
CREATE PROCEDURE ejercicio_5(IN numero double, out resultado VARCHAR(20))
BEGIN
    IF numero >= 0 AND numero < 5 THEN SET resultado = 'F mi pana';
    ELSEIF numero >= 5 AND numero < 6 THEN SET resultado = 'Al limite';
    ELSEIF numero >= 6 AND numero < 7 THEN SET resultado = 'Bien';
    ELSEIF numero >= 7 AND numero < 9 THEN SET resultado = 'Ta loco no?';
    ELSEIF numero >= 9 AND numero <= 10 THEN SET resultado = 'Kovaski';
    ELSE SET resultado = 'XD Te pasas Guachin';
    END IF;
end $$;

DELIMITER ;
CALL ejercicio_5(10,@resultado);
SELECT @resultado;
CALL ejercicio_5(4,@resultado);
SELECT @resultado;
CALL ejercicio_5(0,@resultado);
SELECT @resultado;
#6.Resuelva el procedimiento diseñado en el ejercicio anterior haciendo uso de la estructura de control CASE.
 DELIMITER $$;
 DROP PROCEDURE IF EXISTS ejercicio_6;
CREATE PROCEDURE ejercicio_6(IN nota double, OUT resultado VARCHAR(30))
BEGIN
    CASE
       WHEN nota >= 0 AND nota < 5 THEN SET resultado = 'Ere´Tonto?';
       WHEN nota >= 5 AND nota < 6 THEN SET resultado = 'Al limite perro';
       WHEN nota >= 6 AND nota < 7 THEN SET resultado = 'Buena po weon';
       WHEN nota >= 7 AND nota < 9 THEN SET resultado = 'Todo un master mi causa';
       WHEN nota >= 9 AND nota < 10 THEN SET resultado = 'Alto crack';
       ELSE SET resultado = 'Impossible';
    END CASE;
end $$;

DELIMITER :
CALL ejercicio_6(4.99,@nota);
select @nota;
#7.Escribe un procedimiento que reciba como parámetro de entrada un valor numérico que represente un día de la semana y que devuelva una cadena de caracteres con el nombre del día de la semana correspondiente. Por ejemplo, para el valor de entrada 1 debería devolver la cadena lunes.
    DELIMITER $$;
    DROP PROCEDURE IF EXISTS ejercicio_7;
CREATE PROCEDURE ejercicio_7(IN dia INTEGER, OUT diaL VARCHAR(10))
BEGIN
    CASE
        WHEN dia = 1 THEN SET diaL = 'LUNES';
        WHEN dia = 2 THEN SET diaL = 'MARTES';
        WHEN dia = 3 THEN SET diaL = 'MIERCOLES';
        WHEN dia = 4 THEN SET diaL = 'JUEVES';
        WHEN dia = 5 THEN SET diaL = 'VIERNES';
        WHEN dia = 6 THEN SET diaL = 'SABADO';
        WHEN dia = 7 THEN SET diaL = 'DOMINGO';
        ELSE SET diaL = 'Ere´Tonto';
    END CASE;
END $$;
DELIMITER :
CALL ejercicio_7(1,@resultado);
SELECT @resultado;
#7.1.Resuelva el procedimiento haciendo uso de la estructura de control IF.
    DELIMITER $$;
    DROP PROCEDURE IF EXISTS ejercicio_7_1;
CREATE PROCEDURE ejercicio_7_1(IN dia INTEGER, OUT diaL VARCHAR(10))
BEGIN
    IF dia = 1 THEN SET diaL = 'LUNES';
    ELSEIF dia = 2 THEN SET diaL = 'MARTES';
    ELSEIF dia = 3 THEN SET diaL = 'MIERCOLES';
    ELSEIF dia = 4 THEN SET diaL = 'JUEVES';
    ELSEIF dia = 5 THEN SET diaL = 'VIERNES';
    ELSEIF dia = 6 THEN SET diaL = 'SABADO';
    ELSEIF dia = 7 THEN SET diaL = 'DOMINGO';
    ELSE SET diaL = 'Ere´Tonto';
    END IF;
END $$;
DELIMITER :
CALL ejercicio_7_1(1,@resultado);
SELECT @resultado;
#8.Resuelva el procedimiento diseñado en el ejercicio anterior haciendo uso de la estructura de control CASE.
#CASE nombre_variable
#    WHEN when_value1 THEN statement_list
#    [WHEN when_value.. THEN statement_list..] ...
#    [ELSE statement_list]
#END CASE
    DELIMITER $$;
    DROP PROCEDURE IF EXISTS ejercicio_8;
CREATE PROCEDURE ejercicio_8(IN dia INTEGER, OUT diaL VARCHAR(10))
BEGIN
    CASE dia
    WHEN 1 THEN SET diaL = 'LUNES';
    WHEN 2 THEN SET diaL = 'MARTES';
    WHEN 3 THEN SET diaL = 'MIERCOLES';
    WHEN 4 THEN SET diaL = 'JUEVES';
    WHEN 5 THEN SET diaL = 'VIERNES';
    WHEN 6 THEN SET diaL = 'SABADO';
    WHEN 7 THEN SET diaL = 'DOMINGO';
    ELSE SET diaL = 'Ere´Tonto';
    END CASE;
END $$;
DELIMITER :
CALL ejercicio_8(10,@resultado);
SELECT @resultado;

#1.8.2 Procedimientos con sentencias SQL
#9.Escribe un procedimiento que reciba el nombre de un país como parámetro de entrada y realice una consulta sobre la tabla cliente para obtener todos los clientes que existen en la tabla de ese país.
DELIMITER $$;
DROP PROCEDURE IF EXISTS ejercicio_9;
CREATE PROCEDURE ejercicio_9(IN nombre_pais VARCHAR(30))
BEGIN
    SELECT cliente.*
    FROM cliente
    WHERE pais = nombre_pais;
end $$;

DELIMITER :
CALL ejercicio_9('USA');
#10.Escribe un procedimiento que reciba como parámetro de entrada una forma de pago, que será una cadena de caracteres (Ejemplo: #PayPal, Transferencia, etc). Y devuelva como salida el pago de máximo valor realizado para esa forma de pago. Deberá hacer uso de la tabla pago de la base de datos jardineria.
DELIMITER $$;
DROP PROCEDURE IF EXISTS ejercicio_10;
CREATE PROCEDURE ejercicio_10(IN forma_de_pago VARCHAR(20),OUT pago_maximo double)
BEGIN
    SET pago_maximo = (SELECT MAX(total)
                       FROM pago
                       where forma_de_pago = forma_pago);
end $$;

DELIMITER :
CALL ejercicio_10('Cheque',@Pago);
SELECT @Pago;
CALL ejercicio_10('Paypal',@Pago);
SELECT @Pago;
#11.Escribe un procedimiento que reciba como parámetro de entrada una forma de pago, que será una cadena de caracteres (Ejemplo: #PayPal, Transferencia, etc). Y devuelva como salida los siguientes valores teniendo en cuenta la forma de pago seleccionada como parámetro de entrada:
#el pago de máximo valor,
#el pago de mínimo valor,
#el valor medio de los pagos realizados,
#la suma de todos los pagos,
#el número de pagos realizados para esa forma de pago.
DELIMITER $$;
Drop PROCEDURE IF EXISTS ejercicio_11;
CREATE PROCEDURE ejercicio_11(IN forma_de_pago VARCHAR(20),
                              OUT pago_maximo double,
                              OUT pago_minimo double,
                              OUT pago_medio double,
                              OUT pago_suma double,
                              OUT numero_pagos int)
BEGIN
    SET pago_maximo = (SELECT MAX(total)
                       FROM pago
                       where forma_de_pago = forma_pago);
    SET pago_minimo = (SELECT MIN(total)
                       FROM pago
                       where forma_de_pago = forma_pago);
    SET pago_medio = (SELECT AVG(total)
                       FROM pago
                       where forma_de_pago = forma_pago);
    SET pago_suma = (SELECT SUM(total)
                       FROM pago
                       where forma_de_pago = forma_pago);
    SET numero_pagos = (SELECT COUNT(total)
                       FROM pago
                       where forma_de_pago = forma_pago);
end $$;

DELIMITER :
CALL ejercicio_11('PayPal', @R1,@R2,@R3,@R4,@R5);
SELECT @R1, @R2, @R3, @R4, @R5;

#WHILE

#12.Crea una base de datos llamada procedimientos que contenga una tabla llamada cuadrados. La tabla cuadrados debe tener dos columnas de tipo INT UNSIGNED, una columna llamada número y otra columna llamada cuadrado.
DROP DATABASE IF EXISTS procedimientos;
CREATE DATABASE procedimientos;
USE procedimientos;

#Una vez creada la base de datos y la tabla deberá crear un procedimiento llamado calcular_cuadrados con las siguientes características. El procedimiento recibe un parámetro de entrada llamado tope de tipo INT UNSIGNED y calculará el valor de los cuadrados de los primeros números naturales hasta el valor introducido como parámetro. El valor del números y de sus cuadrados deberán ser almacenados en la tabla cuadrados que hemos creado previamente.
#Tenga en cuenta que el procedimiento deberá eliminar el contenido actual de la tabla antes de insertar los nuevos valores de los cuadrados que va a calcular.
#Utilice un bucle WHILE para resolver el procedimiento.

CREATE TABLE cuadrados(
    numero INT UNSIGNED,
    cuadrado INT UNSIGNED
);
DELIMITER $$;
DROP PROCEDURE IF EXISTS calcular_cuadrados;
CREATE PROCEDURE calcular_cuadrados(IN N INT UNSIGNED)
BEGIN
    DECLARE cuadrado INT;
    DECLARE i INT;

    SET i = 1;
    DELETE FROM cuadrados;
    WHILE i <= n DO
            SET cuadrado = i * i;
            INSERT INTO cuadrados VALUES (i,cuadrado);
        SELECT cuadrado;
        SET i = i + 1;
    end while;
end $$;

DELIMITER :
CALL calcular_cuadrados(6);

#13. Utilice un bucle REPEAT para resolver el procedimiento del ejercicio anterior.

#14. Utilice un bucle LOOP para resolver el procedimiento del ejercicio anterior.
#15. Crea una base de datos llamada procedimientos que contenga una tabla llamada ejercicio. La tabla debe tener una única columna llamada número y el tipo de dato de esta columna debe ser INT UNSIGNED.
# Una vez creada la base de datos y la tabla deberá crear un procedimiento llamado calcular_números con las siguientes características. El procedimiento recibe un parámetro de entrada llamado valor_inicial de tipo INT UNSIGNED y deberá almacenar en la tabla ejercicio toda la secuencia de números desde el valor inicial pasado como entrada hasta el 1.
# Tenga en cuenta que el procedimiento deberá eliminar el contenido actual de las tablas antes de insertar los nuevos valores.
CREATE TABLE ejercicio (
    numero INT UNSIGNED
);
DELIMITER $$;
DROP PROCEDURE IF EXISTS caLcular_numeros;
CREATE PROCEDURE calcular_numeros (IN valor_icicial INT UNSIGNED)
BEGIN
    DECLARE i INT;
    SET i = valor_icicial;
        DELETE FROM ejercicio;
    WHILE i >= 1 DO
            INSERT INTO ejercicio VALUES (i);
            SET i = i - 1;
    end while;
end $$;

DELIMITER :

CALL calcular_numeros(5);
#18. Crea una base de datos llamada procedimientos que contenga una tabla llamada pares y otra tabla llamada impares. Las dos tablas deben tener única columna llamada número y el tipo de dato de esta columna debe ser INT UNSIGNED.
#Una vez creada la base de datos y las tablas deberá crear un procedimiento llamado calcular_pares_impares con las siguientes características. El procedimiento recibe un parámetro de entrada llamado tope de tipo INT UNSIGNED y deberá almacenar en la tabla pares aquellos números pares que existan entre el número 1 el valor introducido como parámetro. Habrá que realizar la misma operación para almacenar los números impares en la tabla impares.
#Tenga en cuenta que el procedimiento deberá eliminar el contenido actual de las tablas antes de insertar los nuevos valores.
#Utilice un bucle WHILE para resolver el procedimiento.