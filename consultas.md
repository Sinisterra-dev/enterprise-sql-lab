# Banco de ejercicios SQL - Laboratorio 0 a experto

Este archivo reúne 100 ejercicios de SQL para reforzar el aprendizaje del laboratorio de negocio. Está pensado para avanzar desde lo más básico hasta temas avanzados de análisis de datos.

La estructura del proyecto sigue el contexto de retail/e-commerce con clientes, productos, inventario, pedidos, pagos, envíos, cupones, devoluciones y reseñas.

No se toca el esquema ni la estructura de la base; solo se generan ejercicios de práctica.

---

## Nivel 0 - Fundamentos (1 al 20)

### 1. Listar todos los clientes
Pregunta de negocio: ¿Cuáles son todos los clientes registrados?
Objetivo: usar SELECT básico.

### 2. Ver los primeros 10 clientes
Pregunta de negocio: ¿Cuáles son los primeros 10 clientes que aparecen en la tabla?
Objetivo: limitar filas con LIMIT.

### 3. Mostrar nombre, apellido y email de clientes
Pregunta de negocio: ¿Qué información personal básica se necesita para contactar a los clientes?
Objetivo: seleccionar columnas específicas.

### 4. Mostrar nombre y precio de productos
Pregunta de negocio: ¿Qué productos están disponibles y cuánto cuestan?
Objetivo: seleccionar columnas de otra tabla.

### 5. Ordenar productos por precio de mayor a menor
Pregunta de negocio: ¿Qué productos son los más costosos?
Objetivo: usar ORDER BY DESC.

### 6. Ordenar clientes por fecha de registro más reciente
Pregunta de negocio: ¿Quiénes se registraron más recientemente?
Objetivo: usar ORDER BY con fechas.

### 7. Filtrar productos con precio mayor a 100000
Pregunta de negocio: ¿Qué productos superan un valor de referencia?
Objetivo: usar WHERE con comparación numérica.

### 8. Filtrar productos con stock menor a 20
Pregunta de negocio: ¿Qué productos están cerca de agotarse?
Objetivo: aprender filtros sobre inventario.

### 9. Filtrar clientes por ciudad
Pregunta de negocio: ¿Qué clientes viven en una ciudad específica?
Objetivo: combinar JOIN con WHERE.

### 10. Contar cuántos clientes hay en total
Pregunta de negocio: ¿Cuál es la cantidad total de clientes?
Objetivo: usar COUNT.

### 11. Contar cuántos productos hay en total
Pregunta de negocio: ¿Cuántos productos conforman el catálogo?
Objetivo: usar COUNT sobre productos.

### 12. Mostrar precio mínimo, máximo y promedio de productos
Pregunta de negocio: ¿Cuál es la distribución de precios del catálogo?
Objetivo: usar MIN, MAX y AVG.

### 13. Mostrar los 5 productos más caros
Pregunta de negocio: ¿Cuáles son los artículos premium más costosos?
Objetivo: combinar ORDER BY y LIMIT.

### 14. Mostrar los 5 productos más baratos
Pregunta de negocio: ¿Cuáles son los productos de bajo precio?
Objetivo: ordenar ascendente.

### 15. Mostrar pedidos de una fecha concreta
Pregunta de negocio: ¿Qué pedidos se realizaron en una fecha específica?
Objetivo: filtrar por fecha.

### 16. Mostrar pedidos con estado específico
Pregunta de negocio: ¿Qué pedidos están en una etapa determinada del ciclo de venta?
Objetivo: filtrar por estados de pedidos.

### 17. Mostrar pagos por método específico
Pregunta de negocio: ¿Qué pagos se hicieron con un medio de pago concreto?
Objetivo: filtrar por metodo_pago.

### 18. Listar ciudades registradas
Pregunta de negocio: ¿En qué ciudades opera la empresa?
Objetivo: consultar dimensión geográfica.

### 19. Mostrar categorías de productos
Pregunta de negocio: ¿Qué categorías conforman el catálogo?
Objetivo: consultar la dimensión de categorías.

### 20. Mostrar empleados ordenados por fecha de ingreso
Pregunta de negocio: ¿Quiénes fueron contratados más recientemente?
Objetivo: ordenar fechas en empleados.

---

## Nivel 1 - Filtros, joins y agregaciones (21 al 40)

### 21. Ver clientes con su ciudad principal
Pregunta de negocio: ¿Qué clientes viven en qué ciudades?
Objetivo: JOIN entre clientes y direcciones y ciudades.

### 22. Ver productos con su categoría
Pregunta de negocio: ¿A qué categoría pertenece cada producto?
Objetivo: JOIN entre productos y categorias.

### 23. Mostrar proveedores y su ciudad
Pregunta de negocio: ¿Dónde están ubicados los proveedores?
Objetivo: JOIN entre proveedores y ciudades.

### 24. Ver pedidos con nombre del cliente
Pregunta de negocio: ¿Qué cliente hizo cada pedido?
Objetivo: JOIN entre pedidos y clientes.

### 25. Mostrar pedidos con el nombre de la sucursal
Pregunta de negocio: ¿En qué sucursal se realizó cada venta?
Objetivo: JOIN entre pedidos y sucursales.

### 26. Contar clientes por nivel de fidelidad
Pregunta de negocio: ¿Cuántos clientes hay por nivel?
Objetivo: GROUP BY con COUNT.

### 27. Contar productos por categoría
Pregunta de negocio: ¿Qué categorías tienen más productos?
Objetivo: agrupar por categorías.

### 28. Mostrar pedidos por estado y cantidad
Pregunta de negocio: ¿Qué estados predominan en la operación?
Objetivo: GROUP BY sobre una columna categórica.

### 29. Mostrar total de pagos por método
Pregunta de negocio: ¿Cuál es la mezcla de pago del negocio?
Objetivo: GROUP BY con COUNT.

### 30. Mostrar el valor total de pedidos por sucursal
Pregunta de negocio: ¿Qué sucursal genera más ingresos?
Objetivo: SUM y GROUP BY.

### 31. Mostrar el valor promedio de pedidos por cliente
Pregunta de negocio: ¿Cuánto ha gastado en promedio cada cliente?
Objetivo: AVG sobre pedidos.

### 32. Mostrar inventario con nombre del producto y sucursal
Pregunta de negocio: ¿Qué productos hay en cada sucursal?
Objetivo: JOIN entre inventario, productos y sucursales.

### 33. Ver productos con stock bajo el mínimo
Pregunta de negocio: ¿Qué productos requieren reabastecimiento?
Objetivo: comparar stock_actual y stock_minimo.

### 34. Listar empleados activos por sucursal
Pregunta de negocio: ¿Cuántos empleados activos tiene cada sucursal?
Objetivo: agrupar empleados por sucursal.

### 35. Mostrar el valor total de cada pedido con descuento aplicado
Pregunta de negocio: ¿Cuánto paga realmente un cliente por pedido?
Objetivo: usar subtotal, descuento_total y total.

### 36. Mostrar cupones activos y su rango de vigencia
Pregunta de negocio: ¿Qué cupones están vigentes actualmente?
Objetivo: filtrar por fechas con WHERE.

### 37. Ver devoluciones por motivo
Pregunta de negocio: ¿Qué tipo de devoluciones ocurren con más frecuencia?
Objetivo: contar por motivo.

### 38. Mostrar reseñas con nombre del producto
Pregunta de negocio: ¿Qué productos tienen comentarios y calificaciones?
Objetivo: JOIN entre reseñas y productos.

### 39. Mostrar promedio de calificación por producto
Pregunta de negocio: ¿Qué productos tienen mejor reputación?
Objetivo: AVG de puntuacion por producto.

### 40. Ver pedidos con mayor total
Pregunta de negocio: ¿Qué pedidos fueron más grandes?
Objetivo: ordenar por total descendente.

---

## Nivel 2 - Consultas operativas (41 al 70)

### 41. Productos más vendidos por cantidad
Pregunta de negocio: ¿Qué productos se han vendido más unidades?
Objetivo: sumar cantidad desde detalle_pedidos.

### 42. Sucursales con mayor volumen de ventas
Pregunta de negocio: ¿Qué sucursal lidera las ventas?
Objetivo: SUM total por sucursal.

### 43. Compras por mes y año
Pregunta de negocio: ¿En qué meses hubo más ventas?
Objetivo: usar funciones de fecha y GROUP BY.

### 44. Clientes que más compran
Pregunta de negocio: ¿Quiénes son los clientes con más pedidos?
Objetivo: contar pedidos por cliente.

### 45. Promedio de días de entrega por transportadora
Pregunta de negocio: ¿Qué transportadora entrega más rápido?
Objetivo: usar TIMESTAMPDIFF y GROUP BY.

### 46. Pedidos entregados tarde
Pregunta de negocio: ¿Cuántos envíos llegaron después de la fecha estimada?
Objetivo: comparar fechas reales vs estimadas.

### 47. Pedidos sin pago confirmado
Pregunta de negocio: ¿Qué pedidos no tienen un pago aprobado?
Objetivo: usar LEFT JOIN y filtros sobre pagos.

### 48. Pedidos sin envío registrado
Pregunta de negocio: ¿Qué pedidos están creados pero aún no tienen envío?
Objetivo: usar LEFT JOIN con envios.

### 49. Cupones usados más de cinco veces
Pregunta de negocio: ¿Qué cupones tienen mayor impacto real?
Objetivo: contar usos con HAVING.

### 50. Productos con margen bruto superior al promedio
Pregunta de negocio: ¿Qué productos superan el margen esperado?
Objetivo: calcular margen y comparar con promedio.

### 51. Usuarios con más de 2 pedidos en el último trimestre
Pregunta de negocio: ¿Cuáles clientes son recurrentes?
Objetivo: filtrar fechas y contar pedidos.

### 52. Ventas totales por ciudad
Pregunta de negocio: ¿Qué ciudades generan más ingresos?
Objetivo: unir pedidos, direcciones y ciudades.

### 53. Empleados con mayor facturación por ventas
Pregunta de negocio: ¿Qué empleados están generando más ventas?
Objetivo: sumar total por empleado.

### 54. Productos con inventario crítico
Pregunta de negocio: ¿Qué productos necesitan pedido urgente?
Objetivo: combinar stock_actual, stock_minimo y punto_reorden.

### 55. Pedidos con descuento mayor al 20%
Pregunta de negocio: ¿Qué pedidos tuvieron promociones significativas?
Objetivo: comparar descuento_total con subtotal.

### 56. Clientes premium por ciudad
Pregunta de negocio: ¿Qué ciudades tienen más clientes oro y platino?
Objetivo: agrupar por ciudad y nivel de fidelidad.

### 57. Productos más rentables por categoría
Pregunta de negocio: ¿Qué productos aportan más margen en cada categoría?
Objetivo: cálculo de margen y agrupación.

### 58. Rendimiento de reseñas por producto
Pregunta de negocio: ¿Qué productos tienen mejor promedio de calificación?
Objetivo: AVG y COUNT sobre reseñas.

### 59. Clientes con devolución
Pregunta de negocio: ¿Qué clientes han generado devoluciones?
Objetivo: unir clientes, pedidos y devoluciones.

### 60. Pedidos con al menos un cupón aplicad0
Pregunta de negocio: ¿Qué pedidos hicieron uso de promoción?
Objetivo: JOIN con pedido_cupones.

### 61. Cálculo del ticket promedio por sucursal
Pregunta de negocio: ¿Cuánto cuesta en promedio una compra por sucursal?
Objetivo: AVG de total por sucursal.

### 62. Revisar cantidad de productos por proveedor
Pregunta de negocio: ¿Qué proveedor abastece más productos?
Objetivo: contar productos por proveedor.

### 63. Qué categoría tiene mayor volumen de devoluciones
Pregunta de negocio: ¿Cuáles categorías generan más problemas?
Objetivo: contar devoluciones agrupadas por categoría.

### 64. Proveedores con tiempos de entrega más lentos
Pregunta de negocio: ¿Cuáles proveedores tardan más en entregar?
Objetivo: analizar proveedor y tiempo_entrega_dias.

### 65. Historial de pagos por pedido
Pregunta de negocio: ¿Cuántas transacciones tuvo cada pedido?
Objetivo: contar pagos por pedido.

### 66. Ventas por tipo de cliente
Pregunta de negocio: ¿Qué nivel de fidelidad genera más ventas?
Objetivo: unir clientes y pedidos por nivel.

### 67. Productos sin ventas recientes
Pregunta de negocio: ¿Qué productos no se han vendido durante mucho tiempo?
Objetivo: usar fechas y LEFT JOIN.

### 68. Sucursales con más empleados activos
Pregunta de negocio: ¿Qué sucursales tienen mayor capacidad operativa?
Objetivo: contar empleados por sucursal.

### 69. Pedidos con valor por encima del promedio general
Pregunta de negocio: ¿Qué pedidos están por encima de la media del negocio?
Objetivo: comparar con AVG general.

### 70. Clientes con el mayor valor promedio por pedido
Pregunta de negocio: ¿Quiénes gastan más por compra?
Objetivo: SUM/COUNT sobre pedidos por cliente.

---

## Nivel 3 - Consultas analíticas y expert (71 al 100)

### 71. KPI general de negocio
Pregunta de negocio: ¿Cuál es el panorama consolidado del negocio?
Objetivo: combinar ingresos, ticket promedio, clientes y pedidos.

### 72. Mayor margen bruto por categoría
Pregunta de negocio: ¿Qué categoría aporta más margen bruto total?
Objetivo: SUM de margen por categoría.

### 73. Productos con stock alto y poco movimiento
Pregunta de negocio: ¿Qué productos tienen mucho inventario pero pocas ventas?
Objetivo: comparar stock y volumen de ventas.

### 74. Productos con ventas altas pero margen bajo
Pregunta de negocio: ¿Qué productos venden mucho pero no son rentables?
Objetivo: combinar margen y volumen de ventas.

### 75. Pedidos con entregas tardías y devoluciones asociadas
Pregunta de negocio: ¿Los retrasos logísticos ocasionan devoluciones?
Objetivo: cruzar envíos, devoluciones y pedidos.

### 76. Cálculo de tasa de conversión por ciudad
Pregunta de negocio: ¿Qué ciudades convierten mejor visitas a compras?
Objetivo: análisis avanzado con ratios.

### 77. Ratio de ventas por nivel de fidelidad
Pregunta de negocio: ¿Qué segmento aporta más valor en ventas?
Objetivo: agrupar por fidelidad y comparar ingresos.

### 78. Top 10 clientes por valor de compra por ciudad
Pregunta de negocio: ¿Quiénes son los mejores clientes de cada ciudad?
Objetivo: ranking por ciudad.

### 79. Rendimiento de promociones por sucursal
Pregunta de negocio: ¿Qué sucursal obtiene más beneficio de cupones?
Objetivo: combinar pedidos y cupones.

### 80. Retención de clientes por trimestre
Pregunta de negocio: ¿Cuántos clientes repiten compra por trimestre?
Objetivo: análisis temporal de retención.

### 81. Demanda por producto y ciudad
Pregunta de negocio: ¿Qué productos se venden más en cada ciudad?
Objetivo: tabla cruzada de ciudad y productos.

### 82. Ajuste de inventario por punto de reorden
Pregunta de negocio: ¿Qué productos están por debajo del punto de reorden?
Objetivo: comparar stock_actual y punto_reorden.

### 83. Porcentaje de pedidos con cupón sobre total de pedidos
Pregunta de negocio: ¿Qué proporción de pedidos usa cupones?
Objetivo: calcular ratio sobre la base total.

### 84. Ratio de devoluciones por categoría y por ciudad
Pregunta de negocio: ¿Qué combinación de categoría y ciudad presenta más devoluciones?
Objetivo: análisis multidimensional.

### 85. Análisis de ventas por empleado y sucursal
Pregunta de negocio: ¿Qué empleado y qué sucursal aportan mayor venta?
Objetivo: agrupación multidimensional.

### 86. Ranking de productos por tasa de reseñas positivas
Pregunta de negocio: ¿Qué productos tienen mejor percepción?
Objetivo: calcular porcentaje de reseñas con puntuación alta.

### 87. Cálculo de cancelaciones por motivo y sucursal
Pregunta de negocio: ¿Qué sucursales tienen más pedidos cancelados?
Objetivo: cruzar pedidos, sucursales y estado.

### 88. Pedidos con más de un pago registrado
Pregunta de negocio: ¿Existen pagos duplicados o ajustes de cobro?
Objetivo: detectar anomalías con COUNT y GROUP BY.

### 89. Sucursales con mayor tasa de entrega tardía
Pregunta de negocio: ¿Qué sucursales tienen peor logística?
Objetivo: calcular porcentaje de envíos tardíos por sucursal.

### 90. Ventas por producto y método de pago
Pregunta de negocio: ¿Qué productos se venden más con cada medio de pago?
Objetivo: analizar la mezcla comercial por producto.

### 91. Top 20 productos por rentabilidad acumulada
Pregunta de negocio: ¿Qué productos aportan más margen acumulado?
Objetivo: ranking global de rentabilidad.

### 92. Cupones que generan más ingresos netos
Pregunta de negocio: ¿Qué cupones realmente ayudan a vender más?
Objetivo: comparar descuento contra venta total generada.

### 93. Productos con mayor cantidad de reseñas negativas
Pregunta de negocio: ¿Qué productos tienen mayor riesgo reputacional?
Objetivo: filtrar reseñas bajas y contar por producto.

### 94. Análisis de segmentación por frecuencia y valor
Pregunta de negocio: ¿Cuáles clientes son frecuentes y de alto valor?
Objetivo: analizar recencia y monto por cliente.

### 95. Efectividad de promociones por nivel de fidelidad
Pregunta de negocio: ¿Los clientes premium responden mejor a cupones?
Objetivo: analizar segmentación con cupones y clientes.

### 96. Pedidos creados vs pagados vs entregados por día
Pregunta de negocio: ¿Cómo evoluciona el funnel de ventas por fecha?
Objetivo: análisis de funnel con fechas.

### 97. Análisis de comportamiento de clientes con devoluciones
Pregunta de negocio: ¿Qué tipo de clientes tienden a devolver más?
Objetivo: cruzar clientes, pedidos y devoluciones.

### 98. Costo logístico versus margen por sucursal
Pregunta de negocio: ¿Qué sucursal es más rentable neta después de logística?
Objetivo: restar costos logísticos a ingresos por sucursal.

### 99. Customer lifetime value aproximado
Pregunta de negocio: ¿Cuál es el valor estimado de vida del cliente?
Objetivo: usar ventas acumuladas por cliente como proxy de LTV.

### 100. Dashboard ejecutivo final
Pregunta de negocio: ¿Qué métricas estratégicas deben verse en un panel de control del negocio?
Objetivo: construir un reporte de negocio con ventas, margen, inventario, logística y valor del cliente.

---

## Recomendación de estudio

Para dominar SQL, sigue este camino:

1. Resolver 20 ejercicios básicos.
2. Resolver 20 intermedios.
3. Resolver 20 analíticos.
4. Resolver 20 avanzados.
5. Repetir los ejercicios escribiéndolos sin mirar la solución.

A medida que avances, deberías dominar:
- SELECT, WHERE, ORDER BY
- GROUP BY, COUNT, SUM, AVG
- JOIN de varias tablas
- funciones de fecha
- subconsultas
- CTEs
- funciones de ventana
- análisis de negocio con KPI

---

## Siguiente paso sugerido

Si quieres continuar de forma más profunda, el siguiente nivel sería:
- funciones de ventana (ROW_NUMBER, RANK, DENSE_RANK)
- CTEs avanzadas
- cohortes por cliente
- análisis de retención
- dashboard ejecutivo solicitado por la dirección

Este laboratorio puede escalar de 0 a experto sin cambiar el esquema inicial.
