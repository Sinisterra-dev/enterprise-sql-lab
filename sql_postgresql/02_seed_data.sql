\connect enterprise_sql_lab

INSERT INTO ciudades (nombre, departamento_estado, pais, codigo_dane) VALUES
('Bogotá', 'Cundinamarca', 'Colombia', '11001'),
('Medellín', 'Antioquia', 'Colombia', '05001'),
('Cali', 'Valle del Cauca', 'Colombia', '76001'),
('Barranquilla', 'Atlántico', 'Colombia', '08001'),
('Cartagena', 'Bolívar', 'Colombia', '13001'),
('Bucaramanga', 'Santander', 'Colombia', '68001'),
('Pereira', 'Risaralda', 'Colombia', '66001'),
('Manizales', 'Caldas', 'Colombia', '17001'),
('Santa Marta', 'Magdalena', 'Colombia', '47001'),
('Cúcuta', 'Norte de Santander', 'Colombia', '54001'),
('Ibagué', 'Tolima', 'Colombia', '73001'),
('Villavicencio', 'Meta', 'Colombia', '50001'),
('Pasto', 'Nariño', 'Colombia', '52001'),
('Montería', 'Córdoba', 'Colombia', '23001'),
('Neiva', 'Huila', 'Colombia', '41001'),
('Quito', 'Pichincha', 'Ecuador', NULL),
('Lima', 'Lima', 'Perú', NULL),
('Ciudad de México', 'CDMX', 'México', NULL),
('Santiago', 'Región Metropolitana', 'Chile', NULL),
('Buenos Aires', 'Buenos Aires', 'Argentina', NULL);

INSERT INTO sucursales (nombre, ciudad_id, direccion, telefono, fecha_apertura, activa) VALUES
('Sucursal Bogotá Norte', 1, 'Cra 15 #98-34', '+57 601 3000101', '2019-03-01', TRUE),
('Sucursal Medellín Poblado', 2, 'Calle 10 #43A-12', '+57 604 3000102', '2019-05-10', TRUE),
('Sucursal Cali Centro', 3, 'Av 6N #24N-45', '+57 602 3000103', '2020-02-20', TRUE),
('Sucursal Barranquilla Río', 4, 'Calle 84 #52-31', '+57 605 3000104', '2020-07-15', TRUE),
('Sucursal Bucaramanga Cabecera', 6, 'Carrera 33 #48-76', '+57 607 3000105', '2021-01-22', TRUE),
('Sucursal Pereira Circunvalar', 7, 'Cra 13 #15-90', '+57 606 3000106', '2021-09-08', TRUE),
('Sucursal Cartagena Bocagrande', 5, 'Av San Martín #7-98', '+57 605 3000107', '2022-04-19', TRUE),
('Sucursal Bogotá Occidente', 1, 'Calle 80 #69Q-50', '+57 601 3000108', '2022-11-03', TRUE);

INSERT INTO categorias (categoria_padre_id, nombre, descripcion, activa) VALUES
(NULL, 'Tecnología', 'Dispositivos y accesorios electrónicos', TRUE),
(NULL, 'Hogar', 'Productos para el hogar y cocina', TRUE),
(NULL, 'Moda', 'Ropa, calzado y accesorios', TRUE),
(NULL, 'Deportes', 'Artículos deportivos y bienestar', TRUE),
(NULL, 'Belleza', 'Cuidado personal y belleza', TRUE),
(NULL, 'Alimentos', 'Mercado seco y bebidas', TRUE),
(NULL, 'Bebés', 'Productos para primera infancia', TRUE),
(NULL, 'Mascotas', 'Alimentos y accesorios para mascotas', TRUE),
(NULL, 'Oficina', 'Papelería y oficina', TRUE),
(NULL, 'Salud', 'Bienestar y farmacia básica', TRUE),
(NULL, 'Automotriz', 'Accesorios para vehículos', TRUE),
(NULL, 'Videojuegos', 'Consolas y juegos', TRUE);

INSERT INTO proveedores (nombre, contacto_nombre, email, telefono, ciudad_id, tiempo_entrega_dias, activo) VALUES
('Andes Tech Supply SAS', 'Laura Cardona', 'contacto@andestech.co', '+57 601 4011101', 1, 4, TRUE),
('Distribuciones Paisa Ltda', 'Julián Ospina', 'ventas@distropaisa.co', '+57 604 4011102', 2, 3, TRUE),
('Pacífico Hogar SAS', 'Martha Pineda', 'comercial@pacificohogar.co', '+57 602 4011103', 3, 5, TRUE),
('Caribe Retail Group', 'José De la Rosa', 'alianzas@cariberetail.co', '+57 605 4011104', 4, 6, TRUE),
('Insumos del Café', 'Valentina Giraldo', 'pedidos@insumoscafe.co', '+57 606 4011105', 7, 4, TRUE),
('Santander Industrial', 'Jorge Serrano', 'contacto@santanderind.co', '+57 607 4011106', 6, 7, TRUE),
('Nova Imports Colombia', 'Daniela Murcia', 'sales@novaimports.co', '+57 601 4011107', 1, 8, TRUE),
('Latam Home Goods', 'Andrés Londoño', 'ventas@latamhome.com', '+57 604 4011108', 2, 9, TRUE),
('Cuidado Total SAS', 'Carolina Rojas', 'info@cuidado-total.co', '+57 602 4011109', 3, 5, TRUE),
('NutriMarket Andino', 'Felipe Torres', 'pedidos@nutrimarket.co', '+57 601 4011110', 1, 4, TRUE),
('Pet Lovers Proveedor', 'Natalia Pardo', 'compras@petlovers.co', '+57 605 4011111', 5, 5, TRUE),
('Moda Urbana Colombia', 'Camilo Vélez', 'comercial@modaurbana.co', '+57 604 4011112', 2, 6, TRUE),
('Electroglobal Latam', 'Andrea Méndez', 'ventas@electroglobal.com', '+57 601 4011113', 1, 10, TRUE),
('Cali Sport Logistics', 'Ricardo Quintero', 'orders@calisport.co', '+57 602 4011114', 3, 3, TRUE),
('Bebé Feliz Supply', 'Paula Martínez', 'contacto@bebefeliz.co', '+57 607 4011115', 6, 7, TRUE),
('OfiExpress Colombia', 'Sergio Parra', 'ventas@ofiexpress.co', '+57 601 4011116', 1, 2, TRUE),
('Salud Plus Mayorista', 'Diana Correa', 'mayoreo@saludplus.co', '+57 604 4011117', 2, 4, TRUE),
('AutoLine Accesorios', 'Mauricio Ramos', 'contacto@autoline.co', '+57 605 4011118', 4, 6, TRUE),
('GameHub Distribution', 'Sebastián Nieto', 'partners@gamehub.co', '+57 601 4011119', 1, 5, TRUE),
('Conexión Sur SAS', 'María Fernanda Ruiz', 'info@conexion-sur.co', '+57 602 4011120', 3, 7, TRUE);

WITH RECURSIVE seq AS (
  SELECT 1 AS n
  UNION ALL
  SELECT n + 1 FROM seq WHERE n < 180
)
INSERT INTO productos (
  categoria_id, proveedor_id, sku, nombre, descripcion,
  precio_venta, costo_unitario, peso_kg, activo, fecha_alta
)
SELECT
  ((n - 1) % 12) + 1 AS categoria_id,
  ((n - 1) % 20) + 1 AS proveedor_id,
  CONCAT('SKU-', LPAD(n::text, 5, '0')) AS sku,
  CONCAT(
    CASE ((n - 1) % 12) + 1
      WHEN 1 THEN 'Producto Tech '
      WHEN 2 THEN 'Producto Hogar '
      WHEN 3 THEN 'Producto Moda '
      WHEN 4 THEN 'Producto Deporte '
      WHEN 5 THEN 'Producto Belleza '
      WHEN 6 THEN 'Producto Alimento '
      WHEN 7 THEN 'Producto Bebé '
      WHEN 8 THEN 'Producto Mascota '
      WHEN 9 THEN 'Producto Oficina '
      WHEN 10 THEN 'Producto Salud '
      WHEN 11 THEN 'Producto Auto '
      ELSE 'Producto Gaming '
    END,
    n
  ) AS nombre,
  CONCAT('Referencia comercial ', n, ' para portafolio retail regional') AS descripcion,
  ROUND((18000 + (n * 1337) % 350000)::numeric, 2) AS precio_venta,
  ROUND(((18000 + (n * 1337) % 350000) * (0.58 + ((n % 15) / 100.0)))::numeric, 2) AS costo_unitario,
  ROUND((0.2 + ((n * 7) % 350) / 100.0)::numeric, 3) AS peso_kg,
  TRUE,
  (DATE '2021-01-01' + (n * INTERVAL '1 day') + TIME '09:00:00')
FROM seq;

WITH RECURSIVE seq AS (
  SELECT 1 AS n
  UNION ALL
  SELECT n + 1 FROM seq WHERE n < 120
)
INSERT INTO empleados (
  sucursal_id, nombres, apellidos, email, telefono, cargo,
  salario_mensual, fecha_contratacion, activo
)
SELECT
  ((n - 1) % 8) + 1,
  CONCAT('Empleado', n),
  CONCAT('Apellido', n),
  CONCAT('empleado', LPAD(n::text, 4, '0'), '@enterprise-sql-lab.co'),
  CONCAT('+57 3', LPAD((100000000 + n)::text, 9, '0')),
  CASE
    WHEN n % 20 = 0 THEN 'gerente'
    WHEN n % 7 = 0 THEN 'soporte'
    WHEN n % 5 = 0 THEN 'bodega'
    WHEN n % 3 = 0 THEN 'cajero'
    ELSE 'asesor_ventas'
  END::empleado_cargo,
  ROUND((1800000 + (n * 85000))::numeric, 2),
  (DATE '2018-01-15' + ((n * 9) * INTERVAL '1 day'))::date,
  TRUE
FROM seq;

WITH RECURSIVE seq AS (
  SELECT 1 AS n
  UNION ALL
  SELECT n + 1 FROM seq WHERE n < 3000
)
INSERT INTO clientes (
  tipo_documento, numero_documento, nombres, apellidos,
  email, telefono, fecha_nacimiento, fecha_registro, nivel_fidelidad, acepta_marketing
)
SELECT
  'CC'::tipo_documento_cliente,
  CONCAT('10', LPAD((1000000 + n)::text, 8, '0')),
  CONCAT('Cliente', n),
  CONCAT('Apellido', n),
  CONCAT('cliente', LPAD(n::text, 5, '0'), '@correo.com'),
  CONCAT('+57 3', LPAD((200000000 + n)::text, 9, '0')),
  (DATE '1975-01-01' + ((n % 15000) * INTERVAL '1 day'))::date,
  (DATE '2021-01-01' + ((n % 1460) * INTERVAL '1 day') + make_interval(secs => ((n * 97) % 86400))),
  CASE
    WHEN n % 40 = 0 THEN 'platino'
    WHEN n % 15 = 0 THEN 'oro'
    WHEN n % 6 = 0 THEN 'plata'
    ELSE 'bronce'
  END::nivel_fidelidad_cliente,
  CASE WHEN n % 9 = 0 THEN FALSE ELSE TRUE END
FROM seq;

INSERT INTO direcciones (
  cliente_id, ciudad_id, linea_1, linea_2, codigo_postal, referencia, es_principal
)
SELECT
  c.cliente_id,
  ((c.cliente_id - 1) % 20) + 1,
  CONCAT('Calle ', 10 + (c.cliente_id % 90), ' #', 20 + (c.cliente_id % 60), '-', 10 + (c.cliente_id % 80)),
  CONCAT('Apto ', (c.cliente_id % 50) + 1),
  CONCAT('11', LPAD((c.cliente_id % 800)::text, 3, '0')),
  CONCAT('Referencia cliente ', c.cliente_id),
  TRUE
FROM clientes c;

INSERT INTO direcciones (
  cliente_id, ciudad_id, linea_1, linea_2, codigo_postal, referencia, es_principal
)
SELECT
  c.cliente_id,
  ((c.cliente_id + 4) % 20) + 1,
  CONCAT('Carrera ', 5 + (c.cliente_id % 70), ' #', 10 + (c.cliente_id % 40), '-', 30 + (c.cliente_id % 60)),
  NULL,
  CONCAT('11', LPAD((c.cliente_id % 900)::text, 3, '0')),
  'Dirección alterna',
  FALSE
FROM clientes c
WHERE c.cliente_id % 5 = 0;

INSERT INTO inventario (
  sucursal_id, producto_id, stock_actual, stock_minimo, stock_maximo, punto_reorden, fecha_actualizacion
)
SELECT
  s.sucursal_id,
  p.producto_id,
  30 + ((s.sucursal_id * p.producto_id) % 180) AS stock_actual,
  10 + (p.producto_id % 20) AS stock_minimo,
  240 + (p.producto_id % 60) AS stock_maximo,
  20 + (p.producto_id % 30) AS punto_reorden,
  TIMESTAMP '2026-01-01 08:00:00'
FROM sucursales s
CROSS JOIN productos p;

INSERT INTO cupones (
  codigo, descripcion, tipo_descuento, valor_descuento, monto_minimo,
  fecha_inicio, fecha_fin, uso_maximo, activo
) VALUES
('BIENVENIDA10', '10% de descuento en primera compra', 'porcentaje', 10, 80000, '2022-01-01', '2027-12-31', 100000, TRUE),
('AHORRA15', '15% para campañas especiales', 'porcentaje', 15, 120000, '2022-06-01', '2027-12-31', 50000, TRUE),
('ENVIOGRATIS', 'Bono fijo para compensar logística', 'valor_fijo', 12000, 70000, '2022-01-01', '2027-12-31', 200000, TRUE),
('CLIENTEORO', 'Beneficio para clientes fidelizados', 'porcentaje', 12, 150000, '2023-01-01', '2027-12-31', 80000, TRUE),
('RETAIL5', 'Descuento general del 5%', 'porcentaje', 5, 50000, '2022-01-01', '2027-12-31', 300000, TRUE),
('HOGAR25K', 'Bono fijo categoría hogar', 'valor_fijo', 25000, 180000, '2022-01-01', '2027-12-31', 70000, TRUE),
('TECNO20', 'Promoción tecnología', 'porcentaje', 20, 220000, '2023-03-01', '2027-12-31', 40000, TRUE),
('MODA8', 'Campaña moda', 'porcentaje', 8, 90000, '2022-01-01', '2027-12-31', 120000, TRUE),
('SALUD10K', 'Descuento fijo bienestar', 'valor_fijo', 10000, 60000, '2022-01-01', '2027-12-31', 160000, TRUE),
('FESTIVO18', 'Oferta temporadas festivas', 'porcentaje', 18, 180000, '2022-01-01', '2027-12-31', 60000, TRUE);

WITH RECURSIVE seq AS (
  SELECT 1 AS n
  UNION ALL
  SELECT n + 1 FROM seq WHERE n < 12000
)
INSERT INTO pedidos (
  cliente_id, direccion_envio_id, empleado_id, sucursal_id, fecha_pedido,
  estado, subtotal, descuento_total, costo_logistico, total, observaciones
)
SELECT
  ((n - 1) % 3000) + 1 AS cliente_id,
  ((n - 1) % 3000) + 1 AS direccion_envio_id,
  ((n - 1) % 120) + 1 AS empleado_id,
  ((n - 1) % 8) + 1 AS sucursal_id,
  (DATE '2022-01-01' + ((n % 1600) * INTERVAL '1 day') + make_interval(secs => ((n * 157) % 86400))) AS fecha_pedido,
  CASE
    WHEN n % 29 = 0 THEN 'cancelado'
    WHEN n % 17 = 0 THEN 'devuelto'
    WHEN n % 7 = 0 THEN 'enviado'
    WHEN n % 5 = 0 THEN 'pagado'
    WHEN n % 3 = 0 THEN 'creado'
    ELSE 'entregado'
  END::estado_pedido AS estado,
  0,
  0,
  0,
  0,
  NULL
FROM seq;

INSERT INTO detalle_pedidos (
  pedido_id, producto_id, cantidad, precio_unitario, descuento_unitario, impuesto_unitario
)
SELECT
  p.pedido_id,
  ((p.pedido_id * 13 + l.linea * 7) % 180) + 1 AS producto_id,
  1 + ((p.pedido_id + l.linea) % 4) AS cantidad,
  pr.precio_venta,
  CASE WHEN (p.pedido_id + l.linea) % 11 = 0 THEN ROUND((pr.precio_venta * 0.08)::numeric, 2) ELSE 0 END,
  ROUND((pr.precio_venta * 0.19)::numeric, 2)
FROM pedidos p
JOIN (
  SELECT 1 AS linea UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
) l
  ON l.linea <= 1 + (p.pedido_id % 4)
JOIN productos pr
  ON pr.producto_id = ((p.pedido_id * 13 + l.linea * 7) % 180) + 1
WHERE p.estado <> 'cancelado';

UPDATE pedidos p
SET
  subtotal = calc.subtotal_bruto,
  descuento_total = calc.descuento_linea,
  costo_logistico = calc.costo_logistico,
  total = calc.total
FROM (
  SELECT
    p2.pedido_id,
    COALESCE(d.subtotal_bruto, 0) AS subtotal_bruto,
    COALESCE(d.descuento_linea, 0) AS descuento_linea,
    CASE
      WHEN p2.estado = 'cancelado' THEN 0
      ELSE ROUND((7000 + (p2.pedido_id % 14000))::numeric, 2)
    END AS costo_logistico,
    GREATEST(COALESCE(d.subtotal_bruto, 0) - COALESCE(d.descuento_linea, 0), 0) +
    CASE
      WHEN p2.estado = 'cancelado' THEN 0
      ELSE ROUND((7000 + (p2.pedido_id % 14000))::numeric, 2)
    END AS total
  FROM pedidos p2
  LEFT JOIN (
    SELECT
      pedido_id,
      ROUND(SUM(cantidad * precio_unitario), 2) AS subtotal_bruto,
      ROUND(SUM(cantidad * descuento_unitario), 2) AS descuento_linea
    FROM detalle_pedidos
    GROUP BY pedido_id
  ) d ON d.pedido_id = p2.pedido_id
) calc
WHERE p.pedido_id = calc.pedido_id;

INSERT INTO pedido_cupones (pedido_id, cupon_id, valor_aplicado)
SELECT
  p.pedido_id,
  ((p.pedido_id - 1) % 10) + 1 AS cupon_id,
  CASE
    WHEN c.tipo_descuento = 'porcentaje' THEN ROUND((p.subtotal * (c.valor_descuento / 100.0))::numeric, 2)
    ELSE c.valor_descuento
  END AS valor_aplicado
FROM pedidos p
JOIN cupones c ON c.cupon_id = ((p.pedido_id - 1) % 10) + 1
WHERE p.estado <> 'cancelado'
  AND p.pedido_id % 4 = 0
  AND p.subtotal >= c.monto_minimo;

UPDATE pedidos p
SET
  descuento_total = calc.descuento_total,
  total = calc.total
FROM (
  SELECT
    p2.pedido_id,
    COALESCE(dl.descuento_linea, 0) + COALESCE(pc.descuento_cupon, 0) AS descuento_total,
    GREATEST(
      p2.subtotal - (COALESCE(dl.descuento_linea, 0) + COALESCE(pc.descuento_cupon, 0)),
      0
    ) + p2.costo_logistico AS total
  FROM pedidos p2
  LEFT JOIN (
    SELECT
      pedido_id,
      ROUND(SUM(cantidad * descuento_unitario), 2) AS descuento_linea
    FROM detalle_pedidos
    GROUP BY pedido_id
  ) dl ON dl.pedido_id = p2.pedido_id
  LEFT JOIN (
    SELECT pedido_id, ROUND(SUM(valor_aplicado), 2) AS descuento_cupon
    FROM pedido_cupones
    GROUP BY pedido_id
  ) pc ON pc.pedido_id = p2.pedido_id
) calc
WHERE p.pedido_id = calc.pedido_id;

INSERT INTO pagos (
  pedido_id, fecha_pago, metodo_pago, estado_pago, monto, referencia_externa
)
SELECT
  p.pedido_id,
  p.fecha_pedido + (((p.pedido_id * 3) % 48) * INTERVAL '1 hour'),
  CASE p.pedido_id % 6
    WHEN 0 THEN 'tarjeta_credito'
    WHEN 1 THEN 'tarjeta_debito'
    WHEN 2 THEN 'pse'
    WHEN 3 THEN 'transferencia'
    WHEN 4 THEN 'efectivo'
    ELSE 'wallet'
  END::metodo_pago_tipo,
  CASE
    WHEN p.estado = 'creado' THEN 'pendiente'
    ELSE 'aprobado'
  END::estado_pago_tipo,
  CASE
    WHEN p.estado = 'creado' THEN 0
    ELSE p.total
  END,
  CONCAT('PAY-', LPAD(p.pedido_id::text, 8, '0'))
FROM pedidos p
WHERE p.estado <> 'cancelado';

INSERT INTO envios (
  pedido_id, transportadora, numero_guia, fecha_envio, fecha_entrega_estimada,
  fecha_entrega_real, estado_envio, costo_envio
)
SELECT
  p.pedido_id,
  CASE p.pedido_id % 5
    WHEN 0 THEN 'Servientrega'
    WHEN 1 THEN 'Coordinadora'
    WHEN 2 THEN 'Inter Rapidísimo'
    WHEN 3 THEN '99Minutos'
    ELSE 'TCC'
  END,
  CONCAT('GUIA', LPAD(p.pedido_id::text, 10, '0')),
  p.fecha_pedido + ((1 + (p.pedido_id % 3)) * INTERVAL '1 day'),
  p.fecha_pedido + ((3 + (p.pedido_id % 5)) * INTERVAL '1 day'),
  CASE
    WHEN p.estado IN ('entregado', 'devuelto') THEN p.fecha_pedido + ((2 + (p.pedido_id % 6)) * INTERVAL '1 day')
    ELSE NULL
  END,
  CASE
    WHEN p.estado = 'enviado' THEN 'en_transito'
    WHEN p.estado = 'devuelto' THEN 'devuelto'
    ELSE 'entregado'
  END::estado_envio_tipo,
  p.costo_logistico
FROM pedidos p
WHERE p.estado IN ('enviado', 'entregado', 'devuelto');

INSERT INTO devoluciones (
  pedido_id, detalle_id, fecha_solicitud, motivo, estado, cantidad, monto_reembolso
)
SELECT
  p.pedido_id,
  d.detalle_id,
  p.fecha_pedido + ((10 + (p.pedido_id % 15)) * INTERVAL '1 day'),
  CASE p.pedido_id % 5
    WHEN 0 THEN 'producto_defectuoso'
    WHEN 1 THEN 'no_corresponde'
    WHEN 2 THEN 'arrepentimiento'
    WHEN 3 THEN 'demora_entrega'
    ELSE 'otro'
  END::motivo_devolucion_tipo,
  CASE
    WHEN p.pedido_id % 3 = 0 THEN 'reembolsada'
    WHEN p.pedido_id % 4 = 0 THEN 'aprobada'
    ELSE 'solicitada'
  END::estado_devolucion_tipo,
  LEAST(d.cantidad, 1 + (p.pedido_id % d.cantidad)),
  ROUND(((d.precio_unitario - d.descuento_unitario) * LEAST(d.cantidad, 1 + (p.pedido_id % d.cantidad)))::numeric, 2)
FROM pedidos p
JOIN (
  SELECT pedido_id, MIN(detalle_id) AS detalle_id
  FROM detalle_pedidos
  GROUP BY pedido_id
) x ON x.pedido_id = p.pedido_id
JOIN detalle_pedidos d ON d.detalle_id = x.detalle_id
WHERE p.estado = 'devuelto';

INSERT INTO resenas (
  producto_id, cliente_id, pedido_id, puntuacion, comentario, fecha_resena
)
SELECT
  d.producto_id,
  p.cliente_id,
  p.pedido_id,
  3 + (p.pedido_id % 3),
  CASE p.pedido_id % 4
    WHEN 0 THEN 'Buena relación precio-calidad'
    WHEN 1 THEN 'Entrega rápida y producto esperado'
    WHEN 2 THEN 'Producto recomendado para uso diario'
    ELSE 'Cumple con lo prometido'
  END,
  p.fecha_pedido + ((7 + (p.pedido_id % 20)) * INTERVAL '1 day')
FROM pedidos p
JOIN detalle_pedidos d ON d.pedido_id = p.pedido_id
WHERE p.estado = 'entregado'
  AND d.detalle_id % 9 = 0;

INSERT INTO auditoria_eventos (entidad, entidad_id, accion, usuario_sistema, detalle, fecha_evento)
SELECT
  'pedidos',
  p.pedido_id,
  'estado',
  'sistema_batch',
  jsonb_build_object('estado', p.estado, 'total', p.total, 'sucursal_id', p.sucursal_id),
  p.fecha_pedido + INTERVAL '1 hour'
FROM pedidos p;

INSERT INTO auditoria_eventos (entidad, entidad_id, accion, usuario_sistema, detalle, fecha_evento)
SELECT
  'pagos',
  pg.pago_id,
  'insert',
  'pasarela_pago',
  jsonb_build_object('estado_pago', pg.estado_pago, 'metodo', pg.metodo_pago, 'monto', pg.monto),
  pg.fecha_pago
FROM pagos pg;
