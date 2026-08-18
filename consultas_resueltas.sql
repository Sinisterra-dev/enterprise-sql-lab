-- =========================================================
-- LABORATORIO SQL 0 A EXPERTO
-- =========================================================
-- Este archivo responde a 100 ejercicios prácticos del laboratorio.
-- Cada ejercicio contiene:
-- 1) la pregunta de negocio,
-- 2) una consulta SQL resolutiva,
-- 3) una explicación breve pero clara del porqué funciona.
--
-- Está pensado para aprendizaje progresivo, desde fundamentos hasta
-- análisis analítico y ejecutivo del negocio.
--
-- No se modifica el esquema ni la estructura de la base.
-- =========================================================

-- =========================================================
-- NIVEL 0 - FUNDAMENTOS (1 al 20)
-- =========================================================

-- Ejercicio 1
-- Pregunta: ¿Cuáles son todos los clientes registrados?
-- Explicación: SELECT básico muestra todas las columnas de la tabla.
SELECT *
FROM clientes;

-- Ejercicio 2
-- Pregunta: ¿Cuáles son los primeros 10 clientes que aparecen en la tabla?
-- Explicación: LIMIT corta la salida a 10 filas.
SELECT *
FROM clientes
LIMIT 10;

-- Ejercicio 3
-- Pregunta: ¿Qué información básica de contacto tiene la base de clientes?
-- Explicación: seleccionamos solo columnas útiles para contacto.
SELECT nombres, apellidos, email
FROM clientes
LIMIT 20;

-- Ejercicio 4
-- Pregunta: ¿Qué productos están disponibles y cuánto cuestan?
-- Explicación: mostramos el nombre y el valor de venta del producto.
SELECT nombre, precio_venta
FROM productos
LIMIT 20;

-- Ejercicio 5
-- Pregunta: ¿Qué productos son los más costosos?
-- Explicación: ORDER BY DESC ordena de mayor a menor precio.
SELECT nombre, precio_venta
FROM productos
ORDER BY precio_venta DESC
LIMIT 10;

-- Ejercicio 6
-- Pregunta: ¿Quiénes se registraron más recientemente?
-- Explicación: ORDER BY fecha_registro DESC ordena cronológicamente inverso.
SELECT nombres, apellidos, fecha_registro
FROM clientes
ORDER BY fecha_registro DESC
LIMIT 10;

-- Ejercicio 7
-- Pregunta: ¿Qué productos superan un valor de referencia?
-- Explicación: WHERE filtra los productos con precio mayor a 100000.
SELECT nombre, precio_venta
FROM productos
WHERE precio_venta > 100000
ORDER BY precio_venta DESC;

-- Ejercicio 8
-- Pregunta: ¿Qué productos están cerca de agotarse?
-- Explicación: se compara stock actual contra un valor de referencia.
SELECT p.nombre, i.stock_actual
FROM inventario i
JOIN productos p ON p.producto_id = i.producto_id
WHERE i.stock_actual < 20
ORDER BY i.stock_actual ASC;

-- Ejercicio 9
-- Pregunta: ¿Qué clientes viven en una ciudad específica?
-- Explicación: se unen clientes, direcciones y ciudades para cruzar ubicación.
SELECT c.nombres, c.apellidos, ci.nombre AS ciudad
FROM clientes c
JOIN direcciones d ON d.cliente_id = c.cliente_id
JOIN ciudades ci ON ci.ciudad_id = d.ciudad_id
WHERE ci.nombre = 'Bogotá';

-- Ejercicio 10
-- Pregunta: ¿Cuál es la cantidad total de clientes?
-- Explicación: COUNT(*) cuenta todas las filas de la tabla clientes.
SELECT COUNT(*) AS total_clientes
FROM clientes;

-- Ejercicio 11
-- Pregunta: ¿Cuántos productos conforman el catálogo?
-- Explicación: COUNT(*) sobre productos calcula total del catálogo.
SELECT COUNT(*) AS total_productos
FROM productos;

-- Ejercicio 12
-- Pregunta: ¿Cuál es la distribución de precios del catálogo?
-- Explicación: MIN, MAX y AVG permiten observar precio mínimo, máximo y promedio.
SELECT MIN(precio_venta) AS precio_minimo,
       MAX(precio_venta) AS precio_maximo,
       ROUND(AVG(precio_venta), 2) AS precio_promedio
FROM productos;

-- Ejercicio 13
-- Pregunta: ¿Cuáles son los 5 productos más caros?
-- Explicación: ORDER BY precio_venta DESC LIMIT 5.
SELECT nombre, precio_venta
FROM productos
ORDER BY precio_venta DESC
LIMIT 5;

-- Ejercicio 14
-- Pregunta: ¿Cuáles son los 5 productos más baratos?
-- Explicación: ORDER BY precio_venta ASC LIMIT 5.
SELECT nombre, precio_venta
FROM productos
ORDER BY precio_venta ASC
LIMIT 5;

-- Ejercicio 15
-- Pregunta: ¿Qué pedidos se realizaron en una fecha específica?
-- Explicación: WHERE fecha_pedido = '...'; se compara con un valor fijo.
SELECT *
FROM pedidos
WHERE DATE(fecha_pedido) = '2024-01-15';

-- Ejercicio 16
-- Pregunta: ¿Qué pedidos están en un estado concreto?
-- Explicación: se filtra por la columna estado de la tabla pedidos.
SELECT *
FROM pedidos
WHERE estado = 'entregado';

-- Ejercicio 17
-- Pregunta: ¿Qué pagos se hicieron con un método específico?
-- Explicación: WHERE aplica un filtro sobre metodo_pago.
SELECT *
FROM pagos
WHERE metodo_pago = 'tarjeta_credito';

-- Ejercicio 18
-- Pregunta: ¿En qué ciudades opera la empresa?
-- Explicación: se lee la dimensión geográfica de ciudades.
SELECT ciudad_id, nombre, departamento_estado, pais
FROM ciudades
ORDER BY nombre;

-- Ejercicio 19
-- Pregunta: ¿Qué categorías conforman el catálogo?
-- Explicación: consulta directa de la tabla categorias.
SELECT categoria_id, nombre, descripcion
FROM categorias
ORDER BY nombre;

-- Ejercicio 20
-- Pregunta: ¿Quiénes fueron contratados más recientemente?
-- Explicación: ORDER BY fecha_contratacion DESC ordena cronológicamente.
SELECT nombres, apellidos, cargo, fecha_contratacion
FROM empleados
ORDER BY fecha_contratacion DESC;

-- Ejercicio 21
-- Pregunta: ¿Qué clientes viven en qué ciudad?
-- Explicación: el JOIN conecta clientes con sus direcciones y ciudades.
SELECT c.nombres, c.apellidos, ci.nombre AS ciudad
FROM clientes c
JOIN direcciones d ON d.cliente_id = c.cliente_id
JOIN ciudades ci ON ci.ciudad_id = d.ciudad_id
WHERE d.es_principal = 1;

-- Ejercicio 22
-- Pregunta: ¿A qué categoría pertenece cada producto?
-- Explicación: se une la tabla de productos con categorías.
SELECT p.nombre AS producto, c.nombre AS categoria
FROM productos p
JOIN categorias c ON c.categoria_id = p.categoria_id;

-- Ejercicio 23
-- Pregunta: ¿Dónde están ubicados los proveedores?
-- Explicación: se une la tabla proveedores con ciudades.
SELECT pr.nombre AS proveedor, ci.nombre AS ciudad
FROM proveedores pr
JOIN ciudades ci ON ci.ciudad_id = pr.ciudad_id;

-- Ejercicio 24
-- Pregunta: ¿Qué cliente hizo cada pedido?
-- Explicación: JOIN entre pedidos y clientes.
SELECT p.pedido_id, c.nombres, c.apellidos, p.total
FROM pedidos p
JOIN clientes c ON c.cliente_id = p.cliente_id;

-- Ejercicio 25
-- Pregunta: ¿En qué sucursal se realizó cada venta?
-- Explicación: se conecta pedidos con sucursales.
SELECT p.pedido_id, s.nombre AS sucursal, p.total
FROM pedidos p
JOIN sucursales s ON s.sucursal_id = p.sucursal_id;

-- Ejercicio 26
-- Pregunta: ¿Cuántos clientes hay por nivel de fidelidad?
-- Explicación: GROUP BY agrupa por categoría y COUNT cuenta miembros del grupo.
SELECT nivel_fidelidad, COUNT(*) AS total_clientes
FROM clientes
GROUP BY nivel_fidelidad
ORDER BY total_clientes DESC;

-- Ejercicio 27
-- Pregunta: ¿Qué categorías tienen más productos?
-- Explicación: agrupamos por categoría y contamos productos.
SELECT c.nombre AS categoria, COUNT(p.producto_id) AS total_productos
FROM categorias c
LEFT JOIN productos p ON p.categoria_id = c.categoria_id
GROUP BY c.categoria_id, c.nombre
ORDER BY total_productos DESC;

-- Ejercicio 28
-- Pregunta: ¿Qué estados predominan en la operación?
-- Explicación: GROUP BY sobre estado entrega la distribución del ciclo de compra.
SELECT estado, COUNT(*) AS total_pedidos
FROM pedidos
GROUP BY estado
ORDER BY total_pedidos DESC;

-- Ejercicio 29
-- Pregunta: ¿Cuál es la mezcla de pago del negocio?
-- Explicación: COUNT por metodo_pago muestra la frecuencia de cada canal de pago.
SELECT metodo_pago, COUNT(*) AS total_pagos
FROM pagos
GROUP BY metodo_pago
ORDER BY total_pagos DESC;

-- Ejercicio 30
-- Pregunta: ¿Qué sucursal genera más ingresos?
-- Explicación: SUM total por sucursal agrega el valor de las ventas.
SELECT s.nombre AS sucursal, ROUND(SUM(p.total), 2) AS ventas_totales
FROM pedidos p
JOIN sucursales s ON s.sucursal_id = p.sucursal_id
GROUP BY s.sucursal_id, s.nombre
ORDER BY ventas_totales DESC;

-- Ejercicio 31
-- Pregunta: ¿Cuánto ha gastado en promedio cada cliente?
-- Explicación: AVG calcula el gasto promedio por cliente.
SELECT c.cliente_id, c.nombres, c.apellidos,
       ROUND(AVG(p.total), 2) AS gasto_promedio
FROM clientes c
LEFT JOIN pedidos p ON p.cliente_id = c.cliente_id
GROUP BY c.cliente_id, c.nombres, c.apellidos;

-- Ejercicio 32
-- Pregunta: ¿Qué productos hay en cada sucursal?
-- Explicación: join entre inventario, productos y sucursales para ver stock por ubicación.
SELECT s.nombre AS sucursal,
       p.nombre AS producto,
       i.stock_actual,
       i.stock_minimo
FROM inventario i
JOIN sucursales s ON s.sucursal_id = i.sucursal_id
JOIN productos p ON p.producto_id = i.producto_id
ORDER BY s.nombre, p.nombre;

-- Ejercicio 33
-- Pregunta: ¿Qué productos requieren reabastecimiento?
-- Explicación: se compara stock actual contra el mínimo necesario.
SELECT s.nombre AS sucursal,
       p.nombre AS producto,
       i.stock_actual,
       i.stock_minimo
FROM inventario i
JOIN sucursales s ON s.sucursal_id = i.sucursal_id
JOIN productos p ON p.producto_id = i.producto_id
WHERE i.stock_actual < i.stock_minimo
ORDER BY s.nombre, p.nombre;

-- Ejercicio 34
-- Pregunta: ¿Cuántos empleados activos tiene cada sucursal?
-- Explicación: COUNT + GROUP BY resume personal por ubicación.
SELECT s.nombre AS sucursal, COUNT(e.empleado_id) AS empleados_activos
FROM sucursales s
LEFT JOIN empleados e ON e.sucursal_id = s.sucursal_id AND e.activo = 1
GROUP BY s.sucursal_id, s.nombre
ORDER BY empleados_activos DESC;

-- Ejercicio 35
-- Pregunta: ¿Cuánto paga realmente un cliente en cada pedido?
-- Explicación: total final se calcula con subtotal, descuento total y monto final.
SELECT pedido_id, subtotal, descuento_total, total
FROM pedidos
ORDER BY total DESC;

-- Ejercicio 36
-- Pregunta: ¿Qué cupones están vigentes actualmente?
-- Explicación: WHERE fecha_inicio <= CURDATE() AND fecha_fin >= CURDATE().
SELECT codigo, descripcion, tipo_descuento, valor_descuento,
       fecha_inicio, fecha_fin
FROM cupones
WHERE activo = 1
  AND fecha_inicio <= CURDATE()
  AND fecha_fin >= CURDATE();

-- Ejercicio 37
-- Pregunta: ¿Qué tipo de devoluciones ocurren con más frecuencia?
-- Explicación: COUNT por motivo identifica la causa principal.
SELECT motivo, COUNT(*) AS total_devoluciones
FROM devoluciones
GROUP BY motivo
ORDER BY total_devoluciones DESC;

-- Ejercicio 38
-- Pregunta: ¿Qué productos tienen comentarios y calificaciones?
-- Explicación: JOIN resumido entre reseñas y productos.
SELECT r.resena_id, p.nombre AS producto, r.puntuacion, r.comentario
FROM resenas r
JOIN productos p ON p.producto_id = r.producto_id;

-- Ejercicio 39
-- Pregunta: ¿Qué productos tienen mejor reputación?
-- Explicación: se calcula la media de puntuación por producto.
SELECT p.nombre AS producto, ROUND(AVG(r.puntuacion), 2) AS promedio_puntuacion,
       COUNT(r.resena_id) AS total_resenas
FROM resenas r
JOIN productos p ON p.producto_id = r.producto_id
GROUP BY p.producto_id, p.nombre
ORDER BY promedio_puntuacion DESC, total_resenas DESC;

-- Ejercicio 40
-- Pregunta: ¿Qué pedidos fueron más grandes?
-- Explicación: ORDER BY total DESC muestra los mayores valores del negocio.
SELECT pedido_id, cliente_id, total, estado
FROM pedidos
ORDER BY total DESC
LIMIT 10;

-- =========================================================
-- NIVEL 2 - CONSULTAS OPERATIVAS (41 al 70)
-- =========================================================

-- Ejercicio 41
-- Pregunta: ¿Qué productos se han vendido más unidades?
-- Explicación: sumamos la cantidad vendida por producto con detalle_pedidos.
SELECT p.producto_id, p.nombre AS producto, SUM(dp.cantidad) AS unidades_vendidas
FROM detalle_pedidos dp
JOIN productos p ON p.producto_id = dp.producto_id
GROUP BY p.producto_id, p.nombre
ORDER BY unidades_vendidas DESC
LIMIT 10;

-- Ejercicio 42
-- Pregunta: ¿Qué sucursal lidera las ventas?
-- Explicación: agregamos ventas por sucursal para comparar resultados.
SELECT s.nombre AS sucursal, ROUND(SUM(p.total), 2) AS ventas_totales
FROM pedidos p
JOIN sucursales s ON s.sucursal_id = p.sucursal_id
GROUP BY s.sucursal_id, s.nombre
ORDER BY ventas_totales DESC;

-- Ejercicio 43
-- Pregunta: ¿En qué meses hubo más ventas?
-- Explicación: extraemos el mes y año de la fecha del pedido para agrupar.
SELECT DATE_FORMAT(fecha_pedido, '%Y-%m') AS mes,
       COUNT(*) AS total_pedidos,
       ROUND(SUM(total), 2) AS ventas_mes
FROM pedidos
GROUP BY DATE_FORMAT(fecha_pedido, '%Y-%m')
ORDER BY mes;

-- Ejercicio 44
-- Pregunta: ¿Quiénes son los clientes con más pedidos?
-- Explicación: COUNT por cliente identifica clientes más frecuentes.
SELECT c.cliente_id, c.nombres, c.apellidos, COUNT(p.pedido_id) AS cantidad_pedidos
FROM clientes c
LEFT JOIN pedidos p ON p.cliente_id = c.cliente_id
GROUP BY c.cliente_id, c.nombres, c.apellidos
ORDER BY cantidad_pedidos DESC
LIMIT 20;

-- Ejercicio 45
-- Pregunta: ¿Qué transportadora entrega más rápido?
-- Explicación: promedio de días de entrega por transportadora.
SELECT e.transportadora,
       ROUND(AVG(TIMESTAMPDIFF(DAY, e.fecha_envio, e.fecha_entrega_real)), 2) AS promedio_dias
FROM envios e
WHERE e.fecha_entrega_real IS NOT NULL
GROUP BY e.transportadora
ORDER BY promedio_dias ASC;

-- Ejercicio 46
-- Pregunta: ¿Cuántos envíos llegaron después de la fecha estimada?
-- Explicación: se compara fecha_entrega_real > fecha_entrega_estimada.
SELECT COUNT(*) AS pedidos_tarde
FROM envios
WHERE fecha_entrega_real IS NOT NULL
  AND fecha_entrega_real > fecha_entrega_estimada;

-- Ejercicio 47
-- Pregunta: ¿Qué pedidos no tienen un pago aprobado?
-- Explicación: LEFT JOIN y filtro en pagos pendientes o faltantes.
SELECT p.pedido_id, p.estado, p.total
FROM pedidos p
LEFT JOIN pagos pa ON pa.pedido_id = p.pedido_id AND pa.estado_pago = 'aprobado'
WHERE pa.pago_id IS NULL;

-- Ejercicio 48
-- Pregunta: ¿Qué pedidos están creados pero aún no tienen envío?
-- Explicación: LEFT JOIN con envios para detectar faltantes.
SELECT p.pedido_id, p.estado, p.total
FROM pedidos p
LEFT JOIN envios e ON e.pedido_id = p.pedido_id
WHERE e.envio_id IS NULL;

-- Ejercicio 49
-- Pregunta: ¿Qué cupones tienen mayor impacto real?
-- Explicación: COUNT y HAVING permiten filtrar los cupones más usados.
SELECT c.codigo, COUNT(pc.pedido_cupon_id) AS veces_usado,
       ROUND(SUM(pc.valor_aplicado), 2) AS descuento_total
FROM cupones c
JOIN pedido_cupones pc ON pc.cupon_id = c.cupon_id
GROUP BY c.codigo
HAVING COUNT(pc.pedido_cupon_id) >= 5
ORDER BY veces_usado DESC;

-- Ejercicio 50
-- Pregunta: ¿Qué productos superan el margen bruto esperado?
-- Explicación: calcula margen bruto por producto y compara con promedio global.
WITH margen AS (
    SELECT p.producto_id, p.nombre,
           ROUND(SUM(dp.cantidad * (dp.precio_unitario - p.costo_unitario)), 2) AS margen_bruto
    FROM detalle_pedidos dp
    JOIN productos p ON p.producto_id = dp.producto_id
    GROUP BY p.producto_id, p.nombre
),
promedio AS (
    SELECT AVG(margen_bruto) AS margen_promedio
    FROM margen
)
SELECT m.producto_id, m.nombre, m.margen_bruto
FROM margen m
CROSS JOIN promedio pr
WHERE m.margen_bruto > pr.margen_promedio
ORDER BY m.margen_bruto DESC;

-- Ejercicio 51
-- Pregunta: ¿Qué clientes son recurrentes en el último trimestre?
-- Explicación: filtra por fecha y conta pedidos por cliente.
SELECT c.cliente_id, c.nombres, c.apellidos, COUNT(p.pedido_id) AS pedidos_ultimo_trimestre
FROM clientes c
JOIN pedidos p ON p.cliente_id = c.cliente_id
WHERE p.fecha_pedido >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
GROUP BY c.cliente_id, c.nombres, c.apellidos
HAVING COUNT(p.pedido_id) > 1;

-- Ejercicio 52
-- Pregunta: ¿Qué ciudades generan más ingresos?
-- Explicación: relaciona pedidos, direcciones y ciudades para sumar por región.
SELECT ci.nombre AS ciudad, ROUND(SUM(p.total), 2) AS ingresos
FROM pedidos p
JOIN direcciones d ON d.direccion_id = p.direccion_envio_id
JOIN ciudades ci ON ci.ciudad_id = d.ciudad_id
GROUP BY ci.ciudad_id, ci.nombre
ORDER BY ingresos DESC;

-- Ejercicio 53
-- Pregunta: ¿Qué empleados están generando más ventas?
-- Explicación: suma de total de pedidos por empleado.
SELECT e.empleado_id, e.nombres, e.apellidos, ROUND(SUM(p.total), 2) AS ventas_totales
FROM empleados e
LEFT JOIN pedidos p ON p.empleado_id = e.empleado_id
GROUP BY e.empleado_id, e.nombres, e.apellidos
ORDER BY ventas_totales DESC;

-- Ejercicio 54
-- Pregunta: ¿Qué productos necesitan pedido urgente?
-- Explicación: se compara stock actual con punto_reorden.
SELECT p.nombre AS producto, s.nombre AS sucursal,
       i.stock_actual, i.punto_reorden
FROM inventario i
JOIN productos p ON p.producto_id = i.producto_id
JOIN sucursales s ON s.sucursal_id = i.sucursal_id
WHERE i.stock_actual <= i.punto_reorden
ORDER BY i.stock_actual ASC;

-- Ejercicio 55
-- Pregunta: ¿Qué pedidos tuvieron descuentos significativos?
-- Explicación: ratio de descuento_total sobre subtotal.
SELECT pedido_id, subtotal, descuento_total,
       ROUND((descuento_total / subtotal) * 100, 2) AS porcentaje_descuento
FROM pedidos
WHERE subtotal > 0
HAVING porcentaje_descuento > 20;

-- Ejercicio 56
-- Pregunta: ¿Qué ciudades tienen más clientes premium?
-- Explicación: filtamos niveles oro y platino y agrupamos por ciudad.
SELECT ci.nombre AS ciudad, c.nivel_fidelidad, COUNT(*) AS total_clientes
FROM clientes c
JOIN direcciones d ON d.cliente_id = c.cliente_id
JOIN ciudades ci ON ci.ciudad_id = d.ciudad_id
WHERE c.nivel_fidelidad IN ('oro', 'platino')
GROUP BY ci.nombre, c.nivel_fidelidad
ORDER BY ci.nombre, total_clientes DESC;

-- Ejercicio 57
-- Pregunta: ¿Qué productos aportan más margen en cada categoría?
-- Explicación: calcula margen bruto y ordena por categoría con ranking implícito.
SELECT cat.nombre AS categoria,
       p.nombre AS producto,
       ROUND(SUM(dp.cantidad * (dp.precio_unitario - p.costo_unitario)), 2) AS margen_bruto
FROM detalle_pedidos dp
JOIN productos p ON p.producto_id = dp.producto_id
JOIN categorias cat ON cat.categoria_id = p.categoria_id
GROUP BY cat.nombre, p.nombre
ORDER BY cat.nombre, margen_bruto DESC;

-- Ejercicio 58
-- Pregunta: ¿Qué productos tienen mejor promedio de calificación?
-- Explicación: se calcula la media de puntuación y se cuenta las reseñas.
SELECT p.nombre AS producto,
       ROUND(AVG(r.puntuacion), 2) AS promedio_puntuacion,
       COUNT(r.resena_id) AS total_resenas
FROM resenas r
JOIN productos p ON p.producto_id = r.producto_id
GROUP BY p.producto_id, p.nombre
ORDER BY promedio_puntuacion DESC, total_resenas DESC;

-- Ejercicio 59
-- Pregunta: ¿Qué clientes han generado devoluciones?
-- Explicación: se usan devoluciones para cruzar con clientes y pedidos.
SELECT DISTINCT c.cliente_id, c.nombres, c.apellidos
FROM clientes c
JOIN pedidos p ON p.cliente_id = c.cliente_id
JOIN devoluciones d ON d.pedido_id = p.pedido_id;

-- Ejercicio 60
-- Pregunta: ¿Qué pedidos hicieron uso de promoción?
-- Explicación: INNER JOIN con pedido_cupones identifica pedidos con cupón.
SELECT DISTINCT p.pedido_id, p.total
FROM pedidos p
JOIN pedido_cupones pc ON pc.pedido_id = p.pedido_id;

-- Ejercicio 61
-- Pregunta: ¿Cuál es el ticket promedio por sucursal?
-- Explicación: AVG del total de cada pedido agrupado por sucursal.
SELECT s.nombre AS sucursal,
       ROUND(AVG(p.total), 2) AS ticket_promedio
FROM pedidos p
JOIN sucursales s ON s.sucursal_id = p.sucursal_id
GROUP BY s.sucursal_id, s.nombre
ORDER BY ticket_promedio DESC;

-- Ejercicio 62
-- Pregunta: ¿Qué proveedor abastece más productos?
-- Explicación: COUNT de productos por proveedor.
SELECT pr.nombre AS proveedor, COUNT(p.producto_id) AS total_productos
FROM proveedores pr
LEFT JOIN productos p ON p.proveedor_id = pr.proveedor_id
GROUP BY pr.proveedor_id, pr.nombre
ORDER BY total_productos DESC;

-- Ejercicio 63
-- Pregunta: ¿Qué categoría genera más devoluciones?
-- Explicación: join devoluciones, detalle_pedidos y productos hacia categorías.
SELECT cat.nombre AS categoria, COUNT(d.devolucion_id) AS total_devoluciones
FROM devoluciones d
JOIN detalle_pedidos dp ON dp.detalle_id = d.detalle_id
JOIN productos p ON p.producto_id = dp.producto_id
JOIN categorias cat ON cat.categoria_id = p.categoria_id
GROUP BY cat.categoria_id, cat.nombre
ORDER BY total_devoluciones DESC;

-- Ejercicio 64
-- Pregunta: ¿Qué proveedores tardan más en entregar?
-- Explicación: se analiza tiempo_entrega_dias del proveedor.
SELECT nombre, tiempo_entrega_dias
FROM proveedores
ORDER BY tiempo_entrega_dias DESC;

-- Ejercicio 65
-- Pregunta: ¿Cuántas transacciones tuvo cada pedido?
-- Explicación: COUNT pagos agrupado por pedido.
SELECT pedido_id, COUNT(*) AS cantidad_pagos
FROM pagos
GROUP BY pedido_id
ORDER BY cantidad_pagos DESC;

-- Ejercicio 66
-- Pregunta: ¿Qué nivel de fidelidad genera más ventas?
-- Explicación: suma de pedidos por nivel de fidelidad del cliente.
SELECT c.nivel_fidelidad, ROUND(SUM(p.total), 2) AS ventas_totales
FROM clientes c
JOIN pedidos p ON p.cliente_id = c.cliente_id
GROUP BY c.nivel_fidelidad
ORDER BY ventas_totales DESC;

-- Ejercicio 67
-- Pregunta: ¿Qué productos no se han vendido durante mucho tiempo?
-- Explicación: LEFT JOIN con detalle_pedidos y filtro por fecha.
SELECT p.producto_id, p.nombre
FROM productos p
LEFT JOIN detalle_pedidos dp ON dp.producto_id = p.producto_id
LEFT JOIN pedidos pe ON pe.pedido_id = dp.pedido_id
GROUP BY p.producto_id, p.nombre
HAVING MAX(pe.fecha_pedido) IS NULL OR MAX(pe.fecha_pedido) < DATE_SUB(CURDATE(), INTERVAL 180 DAY);

-- Ejercicio 68
-- Pregunta: ¿Qué sucursales tienen mayor capacidad operativa?
-- Explicación: count de empleados activos por sucursal.
SELECT s.nombre AS sucursal, COUNT(e.empleado_id) AS total_empleados
FROM sucursales s
LEFT JOIN empleados e ON e.sucursal_id = s.sucursal_id AND e.activo = 1
GROUP BY s.sucursal_id, s.nombre
ORDER BY total_empleados DESC;

-- Ejercicio 69
-- Pregunta: ¿Qué pedidos están por encima del promedio de la base?
-- Explicación: usa un subquery para calcular el promedio general y comparar.
SELECT pedido_id, total
FROM pedidos
WHERE total > (SELECT AVG(total) FROM pedidos)
ORDER BY total DESC;

-- Ejercicio 70
-- Pregunta: ¿Quiénes gastan más por compra?
-- Explicación: dividiendo total gastado entre cantidad de pedidos por cliente.
SELECT c.cliente_id, c.nombres, c.apellidos,
       ROUND(SUM(p.total) / COUNT(p.pedido_id), 2) AS gasto_promedio_por_pedido
FROM clientes c
JOIN pedidos p ON p.cliente_id = c.cliente_id
GROUP BY c.cliente_id, c.nombres, c.apellidos
ORDER BY gasto_promedio_por_pedido DESC;

-- =========================================================
-- NIVEL 3 - ANALÍTICA Y EXPERTO (71 al 100)
-- =========================================================

-- Ejercicio 71
-- Pregunta: ¿Cuál es el panorama consolidado del negocio?
-- Explicación: KPI general con clientes únicos, pedidos, ingresos, ticket promedio y unidades.
SELECT COUNT(DISTINCT p.cliente_id) AS clientes_unicos,
       COUNT(*) AS total_pedidos,
       ROUND(SUM(p.total), 2) AS ingresos_totales,
       ROUND(AVG(p.total), 2) AS ticket_promedio,
       SUM(dp.cantidad) AS unidades_totales_vendidas
FROM pedidos p
LEFT JOIN detalle_pedidos dp ON dp.pedido_id = p.pedido_id;

-- Ejercicio 72
-- Pregunta: ¿Qué categoría aporta más margen bruto total?
-- Explicación: suma del margen bruto por categoría.
SELECT cat.nombre AS categoria,
       ROUND(SUM(dp.cantidad * (dp.precio_unitario - p.costo_unitario)), 2) AS margen_bruto_total
FROM detalle_pedidos dp
JOIN productos p ON p.producto_id = dp.producto_id
JOIN categorias cat ON cat.categoria_id = p.categoria_id
GROUP BY cat.categoria_id, cat.nombre
ORDER BY margen_bruto_total DESC;

-- Ejercicio 73
-- Pregunta: ¿Qué productos tienen mucho inventario pero pocas ventas?
-- Explicación: se cruzan stock actual con volumen de ventas por producto.
SELECT p.nombre AS producto,
       i.stock_actual,
       SUM(dp.cantidad) AS unidades_vendidas
FROM productos p
JOIN inventario i ON i.producto_id = p.producto_id
LEFT JOIN detalle_pedidos dp ON dp.producto_id = p.producto_id
GROUP BY p.producto_id, p.nombre, i.stock_actual
ORDER BY i.stock_actual DESC, unidades_vendidas ASC;

-- Ejercicio 74
-- Pregunta: ¿Qué productos venden mucho pero no son rentables?
-- Explicación: mezcla volumen de ventas con margen por producto.
SELECT p.nombre AS producto,
       SUM(dp.cantidad) AS unidades_vendidas,
       ROUND(SUM(dp.cantidad * (dp.precio_unitario - p.costo_unitario)), 2) AS margen_bruto_total
FROM detalle_pedidos dp
JOIN productos p ON p.producto_id = dp.producto_id
GROUP BY p.producto_id, p.nombre
HAVING SUM(dp.cantidad) > 100
ORDER BY margen_bruto_total ASC
LIMIT 20;

-- Ejercicio 75
-- Pregunta: ¿Los retrasos logísticos ocasionan devoluciones?
-- Explicación: se combina información de envíos, pedidos y devoluciones.
SELECT e.transportadora,
       COUNT(CASE WHEN e.fecha_entrega_real > e.fecha_entrega_estimada THEN 1 END) AS entregas_tardias,
       COUNT(d.devolucion_id) AS devoluciones_total
FROM envios e
LEFT JOIN devoluciones d ON d.pedido_id = e.pedido_id
GROUP BY e.transportadora;

-- Ejercicio 76
-- Pregunta: ¿Qué ciudades convierten mejor ventas sobre clientes potenciales?
-- Explicación: análisis de ratio que requiere un enfoque más estratégico y dimensional.
SELECT ci.nombre AS ciudad,
       COUNT(DISTINCT c.cliente_id) AS clientes,
       COUNT(DISTINCT p.pedido_id) AS pedidos,
       ROUND(COUNT(DISTINCT p.pedido_id) / NULLIF(COUNT(DISTINCT c.cliente_id), 0) * 100, 2) AS tasa_conversion
FROM ciudades ci
LEFT JOIN direcciones d ON d.ciudad_id = ci.ciudad_id
LEFT JOIN clientes c ON c.cliente_id = d.cliente_id
LEFT JOIN pedidos p ON p.cliente_id = c.cliente_id
GROUP BY ci.ciudad_id, ci.nombre
ORDER BY tasa_conversion DESC;

-- Ejercicio 77
-- Pregunta: ¿Qué segmento aporta más valor en ventas?
-- Explicación: agrupa el total por nivel de fidelidad del cliente.
SELECT c.nivel_fidelidad,
       COUNT(DISTINCT p.pedido_id) AS pedidos,
       ROUND(SUM(p.total), 2) AS ventas_totales
FROM clientes c
JOIN pedidos p ON p.cliente_id = c.cliente_id
GROUP BY c.nivel_fidelidad
ORDER BY ventas_totales DESC;

-- Ejercicio 78
-- Pregunta: ¿Quiénes son los mejores clientes de cada ciudad?
-- Explicación: análisis de ranking por ciudad con valor total gastado.
WITH clientes_por_ciudad AS (
    SELECT ci.nombre AS ciudad,
           c.cliente_id,
           c.nombres,
           c.apellidos,
           SUM(p.total) AS gasto_total,
           ROW_NUMBER() OVER (PARTITION BY ci.nombre ORDER BY SUM(p.total) DESC) AS rn
    FROM clientes c
    JOIN direcciones d ON d.cliente_id = c.cliente_id
    JOIN ciudades ci ON ci.ciudad_id = d.ciudad_id
    JOIN pedidos p ON p.cliente_id = c.cliente_id
    GROUP BY ci.nombre, c.cliente_id, c.nombres, c.apellidos
)
SELECT ciudad, cliente_id, nombres, apellidos, gasto_total
FROM clientes_por_ciudad
WHERE rn <= 5
ORDER BY ciudad, gasto_total DESC;

-- Ejercicio 79
-- Pregunta: ¿Qué sucursal obtiene más beneficio de cupones?
-- Explicación: sumamos valor aplicado por cupón y lo cruzamos con la sucursal del pedido.
SELECT s.nombre AS sucursal,
       ROUND(SUM(pc.valor_aplicado), 2) AS total_descuento_aplicado
FROM pedido_cupones pc
JOIN pedidos p ON p.pedido_id = pc.pedido_id
JOIN sucursales s ON s.sucursal_id = p.sucursal_id
GROUP BY s.sucursal_id, s.nombre
ORDER BY total_descuento_aplicado DESC;

-- Ejercicio 80
-- Pregunta: ¿Cuántos clientes repiten compra por trimestre?
-- Explicación: calcula la frecuencia de repetición temporal.
SELECT DATE_FORMAT(fecha_pedido, '%Y-%m') AS trimestre,
       COUNT(DISTINCT cliente_id) AS clientes_con_compra
FROM pedidos
GROUP BY DATE_FORMAT(fecha_pedido, '%Y-%m')
ORDER BY trimestre;

-- Ejercicio 81
-- Pregunta: ¿Qué productos se venden más en cada ciudad?
-- Explicación: se cruzan ciudades, clientes, pedidos y detalle de pedidos.
SELECT ci.nombre AS ciudad,
       p.nombre AS producto,
       SUM(dp.cantidad) AS unidades_vendidas
FROM ciudades ci
JOIN direcciones d ON d.ciudad_id = ci.ciudad_id
JOIN clientes c ON c.cliente_id = d.cliente_id
JOIN pedidos pe ON pe.cliente_id = c.cliente_id
JOIN detalle_pedidos dp ON dp.pedido_id = pe.pedido_id
JOIN productos p ON p.producto_id = dp.producto_id
GROUP BY ci.ciudad_id, ci.nombre, p.producto_id, p.nombre
ORDER BY ciudad, unidades_vendidas DESC;

-- Ejercicio 82
-- Pregunta: ¿Qué productos están por debajo del punto de reorden?
-- Explicación: compara stock con punto_reorden para detectar reposición.
SELECT p.nombre AS producto, s.nombre AS sucursal,
       i.stock_actual, i.punto_reorden
FROM inventario i
JOIN productos p ON p.producto_id = i.producto_id
JOIN sucursales s ON s.sucursal_id = i.sucursal_id
WHERE i.stock_actual <= i.punto_reorden
ORDER BY s.nombre, p.nombre;

-- Ejercicio 83
-- Pregunta: ¿Qué proporción de pedidos usa cupones?
-- Explicación: ratio de pedidos con cupones sobre el total de pedidos.
SELECT ROUND((COUNT(DISTINCT pc.pedido_id) / COUNT(DISTINCT p.pedido_id)) * 100, 2) AS porcentaje_pedidos_con_cupon
FROM pedidos p
LEFT JOIN pedido_cupones pc ON pc.pedido_id = p.pedido_id;

-- Ejercicio 84
-- Pregunta: ¿Qué combinación de categoría y ciudad presenta más devoluciones?
-- Explicación: analítica multidimensional de devoluciones por categoría y ciudad.
SELECT ci.nombre AS ciudad,
       cat.nombre AS categoria,
       COUNT(d.devolucion_id) AS total_devoluciones
FROM devoluciones d
JOIN detalle_pedidos dp ON dp.detalle_id = d.detalle_id
JOIN productos p ON p.producto_id = dp.producto_id
JOIN categorias cat ON cat.categoria_id = p.categoria_id
JOIN pedidos pe ON pe.pedido_id = dp.pedido_id
JOIN direcciones dr ON dr.direccion_id = pe.direccion_envio_id
JOIN ciudades ci ON ci.ciudad_id = dr.ciudad_id
GROUP BY ci.ciudad_id, ci.nombre, cat.categoria_id, cat.nombre
ORDER BY total_devoluciones DESC;

-- Ejercicio 85
-- Pregunta: ¿Qué empleado y sucursal aportan mayor venta?
-- Explicación: se agrupa por empleado y sucursal para medir rendimiento.
SELECT e.nombres, e.apellidos, s.nombre AS sucursal,
       ROUND(SUM(p.total), 2) AS ventas_totales
FROM pedidos p
JOIN empleados e ON e.empleado_id = p.empleado_id
JOIN sucursales s ON s.sucursal_id = p.sucursal_id
GROUP BY e.empleado_id, e.nombres, e.apellidos, s.sucursal_id, s.nombre
ORDER BY ventas_totales DESC;

-- Ejercicio 86
-- Pregunta: ¿Qué productos tienen mejor percepción por parte del cliente?
-- Explicación: calcula porcentaje de reseñas con puntuación alta.
SELECT p.nombre AS producto,
       COUNT(*) AS total_resenas,
       ROUND(SUM(CASE WHEN r.puntuacion >= 4 THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS porcentaje_positivas
FROM resenas r
JOIN productos p ON p.producto_id = r.producto_id
GROUP BY p.producto_id, p.nombre
ORDER BY porcentaje_positivas DESC;

-- Ejercicio 87
-- Pregunta: ¿Qué sucursales tienen más pedidos cancelados?
-- Explicación: cuenta pedidos por estado cancelado y sucursal.
SELECT s.nombre AS sucursal, COUNT(*) AS pedidos_cancelados
FROM pedidos p
JOIN sucursales s ON s.sucursal_id = p.sucursal_id
WHERE p.estado = 'cancelado'
GROUP BY s.sucursal_id, s.nombre
ORDER BY pedidos_cancelados DESC;

-- Ejercicio 88
-- Pregunta: ¿Existen pagos duplicados o ajustes de cobro?
-- Explicación: cuenta pagos por pedido para detectar anomalías.
SELECT pedido_id, COUNT(*) AS total_pagos
FROM pagos
GROUP BY pedido_id
HAVING COUNT(*) > 1
ORDER BY total_pagos DESC;

-- Ejercicio 89
-- Pregunta: ¿Qué sucursales tienen peor logística?
-- Explicación: calcula porcentaje de entregas tardías por sucursal.
SELECT s.nombre AS sucursal,
       COUNT(CASE WHEN e.fecha_entrega_real > e.fecha_entrega_estimada THEN 1 END) AS entregas_tardias,
       COUNT(*) AS total_envios,
       ROUND((COUNT(CASE WHEN e.fecha_entrega_real > e.fecha_entrega_estimada THEN 1 END) / COUNT(*)) * 100, 2) AS porcentaje_tardio
FROM envios e
JOIN pedidos p ON p.pedido_id = e.pedido_id
JOIN sucursales s ON s.sucursal_id = p.sucursal_id
GROUP BY s.sucursal_id, s.nombre
ORDER BY porcentaje_tardio DESC;

-- Ejercicio 90
-- Pregunta: ¿Qué productos se venden más con cada medio de pago?
-- Explicación: se cruzan detalle de pedido, pedidos y pagos por método.
SELECT p.nombre AS producto,
       pa.metodo_pago,
       SUM(dp.cantidad) AS unidades_vendidas
FROM detalle_pedidos dp
JOIN productos p ON p.producto_id = dp.producto_id
JOIN pedidos pe ON pe.pedido_id = dp.pedido_id
JOIN pagos pa ON pa.pedido_id = pe.pedido_id
GROUP BY p.producto_id, p.nombre, pa.metodo_pago
ORDER BY p.nombre, unidades_vendidas DESC;

-- Ejercicio 91
-- Pregunta: ¿Qué productos aportan más margen acumulado?
-- Explicación: ranking global de rentabilidad por producto.
SELECT p.producto_id, p.nombre AS producto,
       ROUND(SUM(dp.cantidad * (dp.precio_unitario - p.costo_unitario)), 2) AS margen_acumulado
FROM detalle_pedidos dp
JOIN productos p ON p.producto_id = dp.producto_id
GROUP BY p.producto_id, p.nombre
ORDER BY margen_acumulado DESC
LIMIT 20;

-- Ejercicio 92
-- Pregunta: ¿Qué cupones realmente ayudan a vender más?
-- Explicación: compara descuento aplicado contra ingresos generados por el pedido.
SELECT c.codigo,
       ROUND(SUM(pc.valor_aplicado), 2) AS descuento_total,
       ROUND(SUM(p.total), 2) AS ingreso_total,
       ROUND(SUM(p.total) / NULLIF(SUM(pc.valor_aplicado), 0), 2) AS relacion_ventas_descuento
FROM pedido_cupones pc
JOIN cupones c ON c.cupon_id = pc.cupon_id
JOIN pedidos p ON p.pedido_id = pc.pedido_id
GROUP BY c.cupon_id, c.codigo
ORDER BY ingreso_total DESC;

-- Ejercicio 93
-- Pregunta: ¿Qué productos tienen más reseñas negativas?
-- Explicación: identifica productos con mala percepción según la puntuación.
SELECT p.nombre AS producto, COUNT(*) AS reseñas_negativas
FROM resenas r
JOIN productos p ON p.producto_id = r.producto_id
WHERE r.puntuacion <= 2
GROUP BY p.producto_id, p.nombre
ORDER BY reseñas_negativas DESC;

-- Ejercicio 94
-- Pregunta: ¿Cuáles clientes son frecuentes y de alto valor?
-- Explicación: se analiza frecuencia y monto por cliente.
SELECT c.cliente_id, c.nombres, c.apellidos,
       COUNT(p.pedido_id) AS frecuencia,
       ROUND(SUM(p.total), 2) AS valor_total
FROM clientes c
JOIN pedidos p ON p.cliente_id = c.cliente_id
GROUP BY c.cliente_id, c.nombres, c.apellidos
HAVING COUNT(p.pedido_id) >= 3
ORDER BY valor_total DESC;

-- Ejercicio 95
-- Pregunta: ¿Los clientes premium responden mejor a cupones?
-- Explicación: se relaciona nivel de fidelidad con uso de cupones.
SELECT c.nivel_fidelidad,
       COUNT(DISTINCT pc.pedido_id) AS pedidos_con_cupon,
       ROUND(SUM(pc.valor_aplicado), 2) AS descuento_total
FROM clientes c
LEFT JOIN pedidos p ON p.cliente_id = c.cliente_id
LEFT JOIN pedido_cupones pc ON pc.pedido_id = p.pedido_id
GROUP BY c.nivel_fidelidad
ORDER BY descuento_total DESC;

-- Ejercicio 96
-- Pregunta: ¿Cómo evoluciona el funnel de ventas por fecha?
-- Explicación: agrupa por fecha para ver creados, pagados y entregados.
SELECT DATE(p.fecha_pedido) AS fecha,
       COUNT(*) AS pedidos_creados,
       SUM(CASE WHEN p.estado IN ('pagado', 'enviado', 'entregado') THEN 1 ELSE 0 END) AS pedidos_pagados_o_mas,
       SUM(CASE WHEN p.estado = 'entregado' THEN 1 ELSE 0 END) AS entregados
FROM pedidos p
GROUP BY DATE(p.fecha_pedido)
ORDER BY fecha;

-- Ejercicio 97
-- Pregunta: ¿Qué tipo de clientes tienden a devolver más?
-- Explicación: se cruzan clientes con devoluciones para analizar comportamiento de segmento.
SELECT c.nivel_fidelidad,
       COUNT(DISTINCT d.devolucion_id) AS devoluciones_total,
       COUNT(DISTINCT c.cliente_id) AS clientes_afectados
FROM clientes c
LEFT JOIN pedidos p ON p.cliente_id = c.cliente_id
LEFT JOIN devoluciones d ON d.pedido_id = p.pedido_id
GROUP BY c.nivel_fidelidad
ORDER BY devoluciones_total DESC;

-- Ejercicio 98
-- Pregunta: ¿Qué sucursal es más rentable neta después de logística?
-- Explicación: ingresos menos costo logístico para obtener utilidad operativa aproximada.
SELECT s.nombre AS sucursal,
       ROUND(SUM(p.total), 2) AS ingresos,
       ROUND(SUM(p.costo_logistico), 2) AS costo_logistico,
       ROUND(SUM(p.total) - SUM(p.costo_logistico), 2) AS margen_neto
FROM pedidos p
JOIN sucursales s ON s.sucursal_id = p.sucursal_id
GROUP BY s.sucursal_id, s.nombre
ORDER BY margen_neto DESC;

-- Ejercicio 99
-- Pregunta: ¿Cuál es el valor estimado de vida del cliente?
-- Explicación: LTV aproximado como suma histórica de compras por cliente.
SELECT c.cliente_id, c.nombres, c.apellidos,
       ROUND(SUM(p.total), 2) AS ltv_estimado
FROM clientes c
JOIN pedidos p ON p.cliente_id = c.cliente_id
GROUP BY c.cliente_id, c.nombres, c.apellidos
ORDER BY ltv_estimado DESC
LIMIT 20;

-- Ejercicio 100
-- Pregunta: ¿Qué métricas estratégicas deben verse en un panel ejecutivo?
-- Explicación: este ejercicio sirve para consolidar un dashboard con diagnóstico general.
SELECT
    COUNT(DISTINCT c.cliente_id) AS clientes_activos,
    COUNT(DISTINCT p.pedido_id) AS pedidos_totales,
    ROUND(SUM(p.total), 2) AS ingresos_totales,
    ROUND(AVG(p.total), 2) AS ticket_promedio,
    ROUND(SUM(CASE WHEN p.estado = 'entregado' THEN 1 ELSE 0 END), 0) AS pedidos_entregados,
    ROUND(SUM(CASE WHEN e.fecha_entrega_real > e.fecha_entrega_estimada THEN 1 ELSE 0 END), 0) AS entregas_tardias,
    ROUND(SUM(CASE WHEN d.devolucion_id IS NOT NULL THEN 1 ELSE 0 END), 0) AS devoluciones_total
FROM clientes c
LEFT JOIN pedidos p ON p.cliente_id = c.cliente_id
LEFT JOIN envios e ON e.pedido_id = p.pedido_id
LEFT JOIN devoluciones d ON d.pedido_id = p.pedido_id;

-- =========================================================
-- CIERRE DIDÁCTICO
-- =========================================================
-- Este laboratorio fue diseñado para entrar desde SQL básico hasta un nivel
-- analítico. Si logras resolver estos 100 ejercicios sin mirar la solución, ya
-- tendrás una base sólida para trabajar con datos reales de negocio.
--
-- La clave no es solo escribir SQL bien, sino entender la pregunta de negocio
-- detrás de cada consulta. Eso es lo que transforma una consulta en insight.
-- =========================================================
