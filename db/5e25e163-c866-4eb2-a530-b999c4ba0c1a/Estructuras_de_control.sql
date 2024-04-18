#Ejemplo: crear un procedimiento que realice la suma de todos los números enteros desde 1 hasta un número introducido por parámetro (inclusive).
#public static int sumarNumeros(int n) {
#        // ejemplo: n = 5 -> 1 + 2 + 3 + 4 + 5 = 15
#        int i = 1;
#        int suma = 0;
#        while (i <= n) {
#            suma = suma + i;
#            i = i + 1;
#        }
#        return suma;
#        }
USE procedimientos;
DELIMITER $$;
DROP PROCEDURE IF EXISTS ejemplo;
CREATE PROCEDURE ejemplo(IN n INT, OUT suma INT)
BEGIN
    DECLARE i INT;
    #DECLARE suma INT; -> Ya no falta declaralo ya que ersta arriba

    SET i = 1;
    SET suma = 0;

    WHILE i <= n DO
        SET suma = suma + i;
        SET i = i + 1;
    end while;

end $$;

DELIMITER :
CALL ejemplo(5,@RESULTADO);
SELECT @RESULTADO;