USE enterprise_sql_lab;

CREATE INDEX idx_clientes_fecha_registro ON clientes (fecha_registro);
CREATE INDEX idx_direcciones_cliente_principal ON direcciones (cliente_id, es_principal);
CREATE INDEX idx_productos_categoria_activo ON productos (categoria_id, activo);
CREATE INDEX idx_productos_proveedor ON productos (proveedor_id);
CREATE INDEX idx_inventario_producto_stock ON inventario (producto_id, stock_actual);
CREATE INDEX idx_pedidos_fecha_estado ON pedidos (fecha_pedido, estado);
CREATE INDEX idx_pedidos_cliente_fecha ON pedidos (cliente_id, fecha_pedido);
CREATE INDEX idx_pedidos_sucursal_fecha ON pedidos (sucursal_id, fecha_pedido);
CREATE INDEX idx_detalle_pedido_producto ON detalle_pedidos (producto_id, pedido_id);
CREATE INDEX idx_pagos_metodo_estado_fecha ON pagos (metodo_pago, estado_pago, fecha_pago);
CREATE INDEX idx_envios_estado_fecha ON envios (estado_envio, fecha_envio);
CREATE INDEX idx_devoluciones_estado_fecha ON devoluciones (estado, fecha_solicitud);
CREATE INDEX idx_resenas_producto_fecha ON resenas (producto_id, fecha_resena);

CREATE OR REPLACE VIEW vw_ventas_diarias_ciudad AS
SELECT
  DATE(p.fecha_pedido) AS fecha,
  c.nombre AS ciudad,
  COUNT(DISTINCT p.pedido_id) AS pedidos,
  ROUND(SUM(p.total), 2) AS ventas_totales,
  ROUND(AVG(p.total), 2) AS ticket_promedio
FROM pedidos p
JOIN sucursales s ON s.sucursal_id = p.sucursal_id
JOIN ciudades c ON c.ciudad_id = s.ciudad_id
WHERE p.estado IN ('pagado', 'enviado', 'entregado', 'devuelto')
GROUP BY DATE(p.fecha_pedido), c.nombre;

CREATE OR REPLACE VIEW vw_productos_desempeno AS
SELECT
  pr.producto_id,
  pr.sku,
  pr.nombre AS producto,
  ca.nombre AS categoria,
  SUM(dp.cantidad) AS unidades_vendidas,
  ROUND(SUM(dp.cantidad * dp.precio_unitario), 2) AS ingreso_bruto,
  ROUND(SUM(dp.cantidad * pr.costo_unitario), 2) AS costo_total,
  ROUND(SUM(dp.cantidad * (dp.precio_unitario - pr.costo_unitario)), 2) AS margen_bruto
FROM detalle_pedidos dp
JOIN pedidos p ON p.pedido_id = dp.pedido_id
JOIN productos pr ON pr.producto_id = dp.producto_id
JOIN categorias ca ON ca.categoria_id = pr.categoria_id
WHERE p.estado IN ('pagado', 'enviado', 'entregado', 'devuelto')
GROUP BY pr.producto_id, pr.sku, pr.nombre, ca.nombre;

CREATE OR REPLACE VIEW vw_clientes_activos AS
SELECT
  cl.cliente_id,
  cl.nombres,
  cl.apellidos,
  cl.nivel_fidelidad,
  COUNT(DISTINCT p.pedido_id) AS total_pedidos,
  ROUND(SUM(p.total), 2) AS valor_comprado,
  ROUND(AVG(p.total), 2) AS ticket_promedio,
  MAX(p.fecha_pedido) AS ultima_compra
FROM clientes cl
JOIN pedidos p ON p.cliente_id = cl.cliente_id
WHERE p.estado IN ('pagado', 'enviado', 'entregado', 'devuelto')
GROUP BY cl.cliente_id, cl.nombres, cl.apellidos, cl.nivel_fidelidad;

CREATE OR REPLACE VIEW vw_inventario_riesgo AS
SELECT
  s.nombre AS sucursal,
  pr.sku,
  pr.nombre AS producto,
  i.stock_actual,
  i.stock_minimo,
  i.punto_reorden,
  CASE
    WHEN i.stock_actual <= i.stock_minimo THEN 'critico'
    WHEN i.stock_actual <= i.punto_reorden THEN 'reponer'
    ELSE 'estable'
  END AS estado_stock
FROM inventario i
JOIN sucursales s ON s.sucursal_id = i.sucursal_id
JOIN productos pr ON pr.producto_id = i.producto_id;

CREATE OR REPLACE VIEW vw_desempeno_sucursales_empleados AS
SELECT
  s.sucursal_id,
  s.nombre AS sucursal,
  e.empleado_id,
  CONCAT(e.nombres, ' ', e.apellidos) AS empleado,
  e.cargo,
  COUNT(DISTINCT p.pedido_id) AS pedidos_gestionados,
  ROUND(SUM(p.total), 2) AS ventas_gestionadas,
  ROUND(AVG(p.total), 2) AS ticket_promedio_gestionado
FROM empleados e
LEFT JOIN pedidos p
  ON p.empleado_id = e.empleado_id
 AND p.estado IN ('pagado', 'enviado', 'entregado', 'devuelto')
JOIN sucursales s ON s.sucursal_id = e.sucursal_id
GROUP BY s.sucursal_id, s.nombre, e.empleado_id, e.nombres, e.apellidos, e.cargo;
