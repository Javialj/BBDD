#######################################################################################################
####                    EXAMEN CONSULTAS 2ª EVALUACIÓN                                             ####
####                                                                                               ####
####     La base de datos a utilizar se carga con el script jardineria.sql                         ####
####                                                                                               ####
####    Cada consulta correcta y completamente resulta suma 0,3 puntos.                            ####
####    La consultas no contestadas o resueltas incorrecta o parcialmente suman 0 puntos.          ####
####    Tiempo de realización del examen: 3 horas                                                  ####
####                                                                                               ####
####    Cuando finalices, añade este fichero a la tarea correspondiente en el Aula Virtual         ####
####                                                                                               ####
#######################################################################################################

# NOMBRE:Javier Alejandro Armillon Neciosup
#######################################################################################################
use jardineria;

# 01.- Obtén un listado de los nombres de los distintos ciruelos (de cualquier tipo). Ordena el resultado en orden alfabético.
    select distinct producto.nombre
    from jardineria.producto
    where nombre like 'Ciruelo%'
    order by nombre;
# 02.- Obtén un listado del nombre, y la cantidad en stock de los distintos productos de gama Ornamentales cuyo stock sea inferior a 50. Ordena el resultado primero por stock de forma descendente y luego por orden alfabético de nombre.
    select producto.nombre, producto.cantidad_en_stock, producto.gama
    from producto
    where cantidad_en_stock<50 and gama like 'Ornamentales'
    order by cantidad_en_stock desc, nombre;
# 03.- Obtén el nombre, apellido y teléfono del contacto del cliente cuyo nombre es Jardin de Flores. Se debe mostrar en una única columna llamada 'contacto' y todas las letras deben mostrarse en mayúsculas.
    select concat_ws(' ',upper(cliente.nombre_contacto), upper(cliente.apellido_contacto), upper(cliente.telefono), upper(cliente.nombre_cliente)) as Contacto
    from cliente
    where nombre_cliente like 'Jardin de Flores';
# 04.- Muestra los códigos y la fecha de los pedidos realizados entre enero y junio (ambos meses incluidos) de 2008, ordenados por fecha de más a menos reciente.
    select pedido.codigo_pedido, pedido.fecha_pedido
    from pedido
    where fecha_pedido like '2008%';

# 05.- Muestra el nombre y el total pagado de los cinco clientes que hayan pagado más en total.
    select cliente.nombre_cliente, sum(pago.total) as Total
    from cliente join pago
    on cliente.codigo_cliente = pago.codigo_cliente
    group by cliente.nombre_cliente
    order by Total desc
    limit 5;
# 06.- Muestra los distintos nombres de productos que tengan siete caracteres.
    select distinct producto.nombre
    from producto
    where nombre like '_______';
# 07.- Muestra los distintos países de los clientes cuya región no se indique.
    select distinct cliente.pais
    from cliente
    where region is null;
# 08.- Haz un listado del nombre de los clientes y la forma de pago de los clientes que no hayan pagado con PayPal.
    select distinct cliente.nombre_cliente, pago.forma_pago
    from cliente join pago
    where forma_pago not like 'PayPal';
# 09.- Muestra los distintos nombres de los productos de la gama 'Aromáticas' que hayan aparecido en los pedidos realizados y entregados en 2008.
    select producto.nombre, producto.gama
    from producto
    where gama like 'Aromáticas';

# 10.- Muestra el nombre de los clientes cuyo nombre comience por G y que han rechazado pedidos, junto con los distintos comentarios que aparecen en el pedido. También deben aparecer los clientes que no han hecho comentarios, en cuyo caso se deberá mostrar "Sin comentarios". Ordena los resultados alfabéticamente por nombre de cliente.
    select cliente.nombre_cliente, pedido.estado, pedido.comentarios
    from cliente join pedido
    on cliente.codigo_cliente = pedido.codigo_cliente
    where nombre_cliente like 'G%' and estado like 'Rechazado'
    order by nombre_cliente;

# 11.- Muestra los nombres de los clientes de la región de Madrid que no han realizado ningún pedido. Ordena el resultado por nombre de cliente.
    select distinct cliente.nombre_cliente, cliente.codigo_cliente, cliente.region
    from cliente join pedido
    where region like 'Madrid'
    except
    select distinct cliente.nombre_cliente, cliente.codigo_cliente, cliente.region
    from cliente join pedido
    on cliente.codigo_cliente = pedido.codigo_cliente
    where region like 'Madrid'
    order by nombre_cliente;
# 12.- Calcula el total del importe del el pedido de código 90. Muéstralo en una columna llamada total_pedido
    select sum(detalle_pedido.cantidad*detalle_pedido.precio_unidad)
    from detalle_pedido
    where detalle_pedido.codigo_pedido = 90;
# 13.- Muestra el nombre y el número de pedidos del cliente que más pedidos ha realizado.

# 14.- Muestra los diferentes nombres de los clientes que han realizado algún pedido pero no han realizado ningún pago.
    select distinct cliente.nombre_cliente
    from cliente join pedido join pago
    on cliente.codigo_cliente = pago.codigo_cliente

# 15.- Calcula el precio medio de todos los pedidos. Muestra el resultado con dos decimales y en una columna llamada precio_medio
    select round(avg(detalle_pedido.cantidad*detalle_pedido.precio_unidad),2) as Precio_medio
    from detalle_pedido;
# 16.- Muestra cuántos productos hay de cada gama.
    select count(producto.nombre), producto.gama
    from producto
    group by producto.gama;
# 17.- Muestra el precio medio por unidad (con todos sus decimales) de los productos de la gama 'Frutales'.
    select avg(producto.precio_venta)
    from producto
    where producto.gama like 'Frutales';
# 18.- Muestra el nombre del cliente que han realizado la mayor suma de pagos en total, junto con el número de pedidos que ha realizado. Se deben mostrar nombre, cuánto ha pagado en total y número de pedidos de este cliente.

# 19.- Muestra las gamas de productos de los que se han vendido en promedio al menos 50 unidades.
    select producto.gama,producto.codigo_producto, round(avg(detalle_pedido.cantidad),2) as Promedio
    from producto join detalle_pedido
    on producto.codigo_producto = detalle_pedido.codigo_producto
    group by producto.codigo_producto;
# 20.- Muestra el nombre de los clientes que han realizado pagos  en total superiores a la media de todos los pagos. No se mostrarán nombres de clientes repetidos.
    select cliente.nombre_cliente, sum(pago.total) as Total
    from cliente join pago
    on cliente.codigo_cliente = pago.codigo_cliente
    where Total > 7613.07
    group by cliente.nombre_cliente;

# 21.- Muestra el nombre de los clientes que no tienen una región asignada.
    select cliente.nombre_cliente
    from cliente
    where cliente.region is null;
# 22.- Calcula cuántos clientes tiene cada representante de ventas. Muestra el nombre de los representantes y a continuación el número de clientes que representa. Ordena el resultado por orden alfabético de representante.
    select empleado.nombre, cliente.codigo_empleado_rep_ventas, count(cliente.codigo_empleado_rep_ventas)
    from empleado join cliente
    on empleado.codigo_empleado = cliente.codigo_empleado_rep_ventas
    group by cliente.codigo_empleado_rep_ventas, empleado.nombre
    order by empleado.nombre;
# 23- Devuelve el nombre del cliente de aquellos clientes españoles que no hayan realizado ningún pago cuyo representante de ventas se llame Felipe


# 24.- Muestra un listado indicando todas las ciudades donde hay oficinas.
    select oficina.ciudad
    from oficina;
# 25.- Muestra cuantos pedidos tienen 1 línea, cuántos tienen 2 líneas, cuántos tienene 3 líneas y así sucesivamente.


# 26.- Muestra el promedio del límite de crédito que tienen los países en que residen los clientes que han realizado pagos en total por un importe inferior a la media del total de los pagos. Agrupa el resultado por países. Las columnas que debes mostrar son: país, promedio del límite de crédito por cada país y total de los pagos por cada país. Los datos numéricos deben mostrarse sin decimales.
    select round(avg(cliente.limite_credito),0), cliente.pais, round(sum(pago.total),0) as Total
    from cliente join pago
    on cliente.codigo_cliente = pago.codigo_cliente
    where Total < 7613.07
    group by cliente.nombre_cliente, cliente.pais, cliente.limite_credito;
# 27.- Muestra  el nombre completo del director de la oficina de Sidney.
    select concat_ws(' ',empleado.nombre, empleado.apellido1, empleado.apellido2) as Nombre_completo
    from empleado
    where empleado.puesto like 'Director Oficina' and empleado.codigo_oficina like 'SYD-AU';
# 28.- Muestra  nombre y apellidos (en una columna llamada empleados) con el email de los empleados que tienen un email de jardineria.es
    select concat_ws(' ',empleado.nombre, empleado.apellido1, empleado.apellido2) as Empleados, empleado.email
    from empleado
    where email like '%jardineria.es';
# 29.- Muestra cuántos pedidos rechazados hay cada año. Ordena el resultado por año.
    select count(pedido.estado)
    from pedido
    where estado like 'Rechazado';
# 30.- Muestra los proveedores que ofrecen productos que puedan describirse como limoneros o naranjos. Y, para cada uno de estos productos, muestra su nombre, el precio del proveedor, el precio de venta y el beneficio que obtiene el vendedor para cada producto.
    select producto.nombre, producto.precio_proveedor, producto.precio_venta, (producto.precio_venta-producto.precio_proveedor) as beneficio
    from producto
    where producto.proveedor like 'Naranjas%';