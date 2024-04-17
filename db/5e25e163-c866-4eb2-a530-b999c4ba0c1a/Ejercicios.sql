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
#7.Escribe un procedimiento que reciba como parámetro de entrada un valor numérico que represente un día de la semana y que devuelva una cadena de caracteres con el nombre del día de la semana correspondiente. Por ejemplo, para el valor de entrada 1 debería devolver la cadena lunes.
#8.Resuelva el procedimiento haciendo uso de la estructura de control IF.