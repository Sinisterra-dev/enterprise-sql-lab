/*
=====================================================================
ENTERPRISE SQL LAB
100 EJERCICIOS PROGRESIVOS — FUNDAMENTOS + AGREGACIONES
=====================================================================

BASE DE DATOS:
enterprise_sql_lab

REGLA GENERAL:
NO utilizar JOIN en ninguno de estos ejercicios.

Este laboratorio cubre progresivamente:

NIVEL 1 — CONSULTA Y OPERACIONES SOBRE FILAS
  SELECT
  FROM
  WHERE
  AND / OR / NOT
  BETWEEN
  IN / NOT IN
  IS NULL / IS NOT NULL
  DISTINCT
  ORDER BY
  LIMIT
  OFFSET
  Alias
  Expresiones calculadas
  COUNT
  MIN
  MAX
  SUM
  AVG

NIVEL 2 — AGREGACIONES Y AGRUPACIÓN
  GROUP BY
  HAVING
  COUNT
  SUM
  AVG
  MIN
  MAX
  combinaciones de agregaciones
  filtros previos con WHERE
  filtros posteriores con HAVING

NO utilizar todavía:
  JOIN
  CTE
  subconsultas
  EXISTS
  Window Functions

Objetivo:
Aprender a resolver preguntas de negocio usando solamente una tabla
por consulta y dominar completamente los fundamentos antes de entrar
al Nivel 3 — JOIN.
=====================================================================
*/


/* =====================================================================
   NIVEL 1 — FUNDAMENTOS
   EJERCICIOS 01-60
   ===================================================================== */

/* ---------------------------------------------------------------------
   01. PRODUCTOS
   La gerencia quiere obtener el catálogo completo de productos.
   Mostrar todas las columnas.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:
SELECT*FROM productos;

/* ---------------------------------------------------------------------
   02. PRODUCTOS
   Mostrar únicamente el SKU, nombre y precio de venta de cada producto.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:
SELECT sku, nombre, precio_venta FROM productos;

/* ---------------------------------------------------------------------
   03. PRODUCTOS
   Mostrar los productos cuyo precio de venta sea superior a $200.000.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:
SELECT *
FROM productos
WHERE precio_venta > '200000';

/* ---------------------------------------------------------------------
   04. PRODUCTOS
   Mostrar los productos cuyo costo unitario sea menor a $100.000.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:
SELECT *
FROM productos
WHERE costo_unitario < '100000';

/* ---------------------------------------------------------------------
   05. PRODUCTOS
   Mostrar productos cuyo precio de venta esté entre $100.000 y $250.000.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:
SELECT *
FROM productos
WHERE precio_venta BETWEEN '100000' and '250000';

/* ---------------------------------------------------------------------
   06. PRODUCTOS
   Mostrar productos cuyo peso sea menor o igual a 1 kg.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:
SELECT *
FROM productos
WHERE peso_kg <= 1;

/* ---------------------------------------------------------------------
   07. PRODUCTOS
   Mostrar productos que estén activos Y tengan un precio de venta
   superior a $300.000.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:
SELECT *
FROM productos
WHERE activo = TRUE AND precio_venta > 300000;

/* ---------------------------------------------------------------------
   08. PRODUCTOS
   Mostrar productos que estén activos O tengan un precio de venta
   superior a $350.000.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:
SELECT *
FROM productos
WHERE activo = TRUE OR precio_venta > 350000;

/* ---------------------------------------------------------------------
   09. PRODUCTOS
   La empresa quiere productos de bajo costo o de alto precio.
   Mostrar productos cuyo costo unitario sea menor a $80.000
   O cuyo precio de venta sea mayor a $300.000.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:
SELECT *
FROM productos
WHERE costo_unitario < 80000 OR precio_venta > 300000;

/* ---------------------------------------------------------------------
   10. PRODUCTOS
   Mostrar productos que NO estén activos.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:
SELECT *
FROM productos
WHERE activo = false;


/* ---------------------------------------------------------------------
   11. PRODUCTOS
   Mostrar únicamente los productos de las categorías con ID 1, 2 o 3.
   No utilizar JOIN.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:
SELECT *
FROM productos
WHERE categoria_id IN (1, 2, 3);


/* ---------------------------------------------------------------------
   12. PRODUCTOS
   Mostrar los productos cuyo proveedor_id NO sea 1, 2 ni 3.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:
SELECT *
FROM productos
WHERE proveedor_id NOT IN (1, 2, 3);


/* ---------------------------------------------------------------------
   13. PRODUCTOS
   Mostrar los productos cuyo precio de venta NO esté entre
   $100.000 y $300.000.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:
SELECT *
FROM productos
WHERE precio_venta NOT BETWEEN 100000 AND 300000;


/* ---------------------------------------------------------------------
   14. PRODUCTOS
   Mostrar productos cuyo precio de venta sea superior a $250.000
   Y cuyo peso esté entre 1 y 3 kg.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:
SELECT *
FROM productos
WHERE precio_venta > 250000
   AND peso_kg BETWEEN 1 AND 3;


/* ---------------------------------------------------------------------
   15. PRODUCTOS
   Mostrar productos cuyo precio sea menor a $80.000 O mayor a $300.000,
   pero únicamente si están activos.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:
SELECT *
FROM productos
WHERE activo = TRUE
   AND (precio_venta < 80000 OR precio_venta > 300000);


/* ---------------------------------------------------------------------
   16. PRODUCTOS
   Mostrar los SKU de los productos y asignar alias a las columnas:
   sku_producto y precio.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   17. PRODUCTOS
   Mostrar nombre, precio de venta y costo unitario, pero además crear
   una columna calculada llamada margen_absoluto:

   precio_venta - costo_unitario
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   18. PRODUCTOS
   Mostrar nombre, precio de venta, costo unitario y una expresión
   calculada llamada margen_porcentual.

   Fórmula:
   ((precio_venta - costo_unitario) / costo_unitario) * 100
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   19. PRODUCTOS
   Mostrar los 10 productos con mayor margen absoluto.
   Debes mostrar también la columna calculada.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   20. PRODUCTOS
   Mostrar los 10 productos con menor margen absoluto.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   21. PRODUCTOS
   Mostrar todos los productos ordenados por precio de venta de mayor
   a menor y, en caso de empate, por nombre de forma ascendente.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   22. PRODUCTOS
   Mostrar los productos del puesto 11 al 20 cuando se ordenan por
   precio de venta de mayor a menor.

   Utiliza LIMIT + OFFSET.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   23. PRODUCTOS
   La empresa quiere una página de catálogo.
   Obtener 15 productos comenzando desde la posición 31,
   ordenados por nombre ascendente.

   Utiliza LIMIT + OFFSET.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   24. PRODUCTOS
   Mostrar únicamente los productos cuya categoria_id esté en
   (1, 4, 7, 10).
   Utiliza IN.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   25. PRODUCTOS
   Mostrar productos cuyo proveedor_id esté en (1, 5, 10, 15, 20)
   Y cuyo precio de venta sea superior a $150.000.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   26. PRODUCTOS
   Mostrar productos cuyo categoria_id NO esté en (2, 6, 8, 11).
   Utiliza NOT IN.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   27. PRODUCTOS
   ¿Cuántos productos existen en total?
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   28. PRODUCTOS
   ¿Cuál es el precio de venta más alto del catálogo?
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   29. PRODUCTOS
   ¿Cuál es el precio de venta más bajo del catálogo?
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   30. PRODUCTOS
   ¿Cuál es el costo unitario promedio de todos los productos?
   Utiliza un alias descriptivo para el resultado.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   31. PRODUCTOS
   ¿Cuál es la suma de todos los precios de venta registrados?
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   32. PRODUCTOS
   ¿Cuál es el precio de venta promedio de los productos activos?
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   33. PRODUCTOS
   ¿Cuál es el margen absoluto máximo entre todos los productos?
   No necesitas mostrar el producto, únicamente el valor máximo.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   34. PRODUCTOS
   ¿Cuál es el margen absoluto promedio de todos los productos?
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   35. PRODUCTOS
   ¿Cuántos productos tienen un margen absoluto superior a $100.000?
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   36. PRODUCTOS
   Mostrar los diferentes categoria_id existentes en productos.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   37. PRODUCTOS
   Mostrar los diferentes proveedor_id existentes en productos.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   38. CLIENTES
   Mostrar nombre, apellido, email y nivel de fidelidad de los clientes
   que sean oro O platino.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   39. CLIENTES
   Mostrar los clientes que NO aceptan marketing.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   40. CLIENTES
   Mostrar los clientes cuya fecha de nacimiento sea NULL.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   41. CLIENTES
   Mostrar los clientes cuya fecha de nacimiento NO sea NULL.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   42. CLIENTES
   Mostrar clientes registrados entre el 1 de enero de 2023 y
   el 31 de diciembre de 2024, inclusive.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   43. CLIENTES
   Mostrar los clientes cuyo nivel de fidelidad esté en
   ('plata', 'oro', 'platino').
   Utiliza IN.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   44. CLIENTES
   Mostrar los 25 clientes más recientemente registrados.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   45. CLIENTES
   Mostrar los clientes del puesto 26 al 50 según fecha de registro
   de más reciente a más antigua.

   Utiliza LIMIT + OFFSET.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   46. CLIENTES
   Mostrar nombre completo mediante una expresión que concatene
   nombres y apellidos.
   Asignar alias nombre_completo.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   47. CLIENTES
   Mostrar nombre, fecha de nacimiento y calcular aproximadamente
   la edad en años usando AGE(fecha_nacimiento).
   No utilizar JOIN.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   48. CLIENTES
   ¿Cuántos clientes existen en total?
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   49. CLIENTES
   ¿Cuántos clientes aceptan marketing y cuántos no?
   Realiza el ejercicio utilizando una expresión CASE dentro de
   la consulta junto con COUNT.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   50. CLIENTES
   ¿Cuál es la fecha de registro más antigua y cuál es la más reciente?
   Devuelve ambas en la misma consulta usando alias claros.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   51. EMPLEADOS
   Mostrar empleados con salario mayor a $5.000.000 O cargo gerente.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   52. EMPLEADOS
   Mostrar empleados contratados antes de 2020 que estén activos.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   53. EMPLEADOS
   Mostrar empleados cuyo cargo esté en:
   gerente, soporte o bodega.
   Utiliza IN.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   54. EMPLEADOS
   Mostrar empleados cuyo salario esté entre $2.500.000 y $6.000.000,
   ordenados de mayor a menor salario.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   55. EMPLEADOS
   Mostrar nombres y apellidos junto con una columna calculada
   llamada salario_anual = salario_mensual * 12.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   56. EMPLEADOS
   Mostrar los 10 empleados con mayor salario anual.
   Debes calcular salario anual dentro de la consulta.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   57. EMPLEADOS
   ¿Cuál es el salario promedio mensual?
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   58. EMPLEADOS
   ¿Cuál es la suma total de salarios mensuales que paga la empresa?
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   59. EMPLEADOS
   ¿Cuántos empleados están activos?
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   60. EMPLEADOS
   ¿Cuántos empleados tienen cada uno de los diferentes cargos?

   IMPORTANTE:
   Todavía NO puedes usar GROUP BY.
   Para este ejercicio, utiliza DISTINCT para explorar los valores
   existentes; el conteo por grupo llegará en el Nivel 2.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:



/* =====================================================================
   NIVEL 2 — AGREGACIONES Y AGRUPACIÓN
   EJERCICIOS 61-100
   ===================================================================== */

/* ---------------------------------------------------------------------
   61. PRODUCTOS
   ¿Cuántos productos existen por categoria_id?
   Utiliza GROUP BY.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   62. PRODUCTOS
   ¿Cuántos productos existen por proveedor_id?
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   63. PRODUCTOS
   ¿Cuál es el precio de venta promedio por categoria_id?
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   64. PRODUCTOS
   ¿Cuál es el costo unitario promedio por proveedor_id?
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   65. PRODUCTOS
   ¿Cuál es el precio de venta máximo por categoria_id?
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   66. PRODUCTOS
   ¿Cuál es el precio de venta mínimo por categoria_id?
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   67. PRODUCTOS
   ¿Cuál es la suma de los precios de venta por categoria_id?
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   68. PRODUCTOS
   ¿Cuál es la suma de los costos unitarios por proveedor_id?
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   69. PRODUCTOS
   ¿Cuál es el margen absoluto promedio por categoria_id?

   margen absoluto = precio_venta - costo_unitario
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   70. PRODUCTOS
   ¿Qué categorias tienen más de 10 productos?
   Utiliza GROUP BY + HAVING.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   71. PRODUCTOS
   ¿Qué proveedores tienen más de 8 productos?
   Utiliza GROUP BY + HAVING.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   72. PRODUCTOS
   Mostrar únicamente las categorias cuyo precio promedio de venta
   sea superior a $200.000.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   73. PRODUCTOS
   Mostrar únicamente los proveedores cuyo costo unitario promedio
   sea superior a $150.000.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   74. PRODUCTOS
   Para cada categoria_id mostrar:
   - cantidad de productos
   - precio promedio
   - precio máximo
   - precio mínimo
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   75. PRODUCTOS
   Para cada proveedor_id mostrar:
   - cantidad de productos
   - suma de precios de venta
   - costo promedio
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   76. PRODUCTOS
   Mostrar las categorias que tengan al menos 5 productos activos.
   Debes filtrar los productos antes de agruparlos.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   77. PRODUCTOS
   Mostrar los proveedores cuyo margen absoluto promedio sea superior
   a $100.000.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   78. PRODUCTOS
   Calcular para cada categoria_id:

   - SUM(precio_venta)
   - SUM(costo_unitario)
   - SUM(precio_venta - costo_unitario)

   Asignar alias claros a las tres métricas.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   79. PRODUCTOS
   Mostrar los categoria_id cuya suma de precios de venta sea
   superior a $4.000.000.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   80. PRODUCTOS
   Mostrar las categorias cuyo precio máximo de venta sea superior
   a $300.000 Y tengan al menos 10 productos.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   81. CLIENTES
   ¿Cuántos clientes existen por nivel de fidelidad?
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   82. CLIENTES
   ¿Cuántos clientes existen por valor de acepta_marketing?
   Agrupa por esa columna.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   83. CLIENTES
   ¿Cuál es la fecha de registro mínima y máxima por nivel de fidelidad?
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   84. CLIENTES
   ¿Cuántos clientes de cada nivel de fidelidad no aceptan marketing?
   Utiliza WHERE + GROUP BY.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   85. CLIENTES
   ¿Qué niveles de fidelidad tienen más de 500 clientes?
   Utiliza HAVING.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   86. CLIENTES
   Para cada nivel de fidelidad mostrar:
   - cantidad de clientes
   - fecha de registro mínima
   - fecha de registro máxima
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   87. EMPLEADOS
   ¿Cuántos empleados existen por cargo?
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   88. EMPLEADOS
   ¿Cuál es el salario promedio por cargo?
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   89. EMPLEADOS
   ¿Cuál es el salario máximo y mínimo por cargo?
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   90. EMPLEADOS
   ¿Cuál es la suma de salarios mensuales por cargo?
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   91. EMPLEADOS
   ¿Qué cargos tienen un salario promedio superior a $3.500.000?
   Utiliza GROUP BY + HAVING.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   92. EMPLEADOS
   ¿Qué cargos tienen más de 10 empleados?
   Utiliza GROUP BY + HAVING.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   93. EMPLEADOS
   Para cada sucursal_id mostrar:
   - cantidad de empleados
   - salario promedio
   - salario máximo
   - salario mínimo
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   94. EMPLEADOS
   Mostrar las sucursales cuya suma total de salarios mensuales
   sea superior a $50.000.000.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   95. PEDIDOS
   ¿Cuántos pedidos existen por estado?
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   96. PEDIDOS
   ¿Cuál es el valor promedio de los pedidos por estado?
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   97. PEDIDOS
   ¿Cuál es la suma total de ventas por estado del pedido?
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   98. PEDIDOS
   ¿Cuál es el pedido promedio y el total de ventas por sucursal_id?
   Devuelve ambas métricas en la misma consulta.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   99. PEDIDOS
   Mostrar únicamente las sucursales_id que tengan más de 1.000 pedidos.
   Utiliza GROUP BY + HAVING.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* ---------------------------------------------------------------------
   100. PEDIDOS — DESAFÍO FINAL DEL BLOQUE

   La gerencia quiere un resumen por sucursal_id que muestre:

   - cantidad de pedidos
   - suma total de ventas
   - promedio de venta por pedido
   - venta mínima
   - venta máxima

   Ordenar el resultado desde la sucursal con mayor facturación.

   Restricciones:
   - Una sola tabla.
   - No JOIN.
   - Utilizar GROUP BY.
   - Utilizar múltiples funciones de agregación.
   - Utilizar alias claros.
   - Ordenar usando la métrica de facturación.
   --------------------------------------------------------------------- */
-- Escribe tu consulta aquí:


/* =====================================================================
   FIN DEL LABORATORIO — 100 EJERCICIOS

   Cuando termines estos 100 ejercicios deberías dominar:

   ✓ SELECT / FROM
   ✓ WHERE
   ✓ AND / OR / NOT
   ✓ BETWEEN
   ✓ IN / NOT IN
   ✓ IS NULL / IS NOT NULL
   ✓ DISTINCT
   ✓ ORDER BY
   ✓ LIMIT / OFFSET
   ✓ Alias
   ✓ Expresiones calculadas
   ✓ COUNT / MIN / MAX / SUM / AVG
   ✓ GROUP BY
   ✓ HAVING
   ✓ WHERE + GROUP BY
   ✓ GROUP BY + HAVING
   ✓ Varias agregaciones en una misma consulta

   SIGUIENTE NIVEL:
   JOIN
   ===================================================================== */