USE enterprise_sql_lab;

DELIMITER $$

DROP PROCEDURE IF EXISTS sp_recalcular_totales_pedido $$
CREATE PROCEDURE sp_recalcular_totales_pedido(IN p_pedido_id BIGINT UNSIGNED)
BEGIN
  DECLARE v_subtotal DECIMAL(12,2) DEFAULT 0;
  DECLARE v_descuento_linea DECIMAL(12,2) DEFAULT 0;
  DECLARE v_descuento_cupon DECIMAL(12,2) DEFAULT 0;
  DECLARE v_logistica DECIMAL(12,2) DEFAULT 0;

  SELECT
    COALESCE(SUM(cantidad * precio_unitario), 0),
    COALESCE(SUM(cantidad * descuento_unitario), 0)
  INTO v_subtotal, v_descuento_linea
  FROM detalle_pedidos
  WHERE pedido_id = p_pedido_id;

  SELECT COALESCE(SUM(valor_aplicado), 0)
  INTO v_descuento_cupon
  FROM pedido_cupones
  WHERE pedido_id = p_pedido_id;

  SELECT COALESCE(costo_logistico, 0)
  INTO v_logistica
  FROM pedidos
  WHERE pedido_id = p_pedido_id;

  UPDATE pedidos
  SET
    subtotal = v_subtotal,
    descuento_total = v_descuento_linea + v_descuento_cupon,
    total = GREATEST(v_subtotal - (v_descuento_linea + v_descuento_cupon), 0) + v_logistica
  WHERE pedido_id = p_pedido_id;
END $$

DROP PROCEDURE IF EXISTS sp_generar_clientes_extra $$
CREATE PROCEDURE sp_generar_clientes_extra(IN p_cantidad INT)
BEGIN
  DECLARE v_base_cliente INT DEFAULT 0;

  IF p_cantidad IS NULL OR p_cantidad <= 0 THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'p_cantidad debe ser mayor que cero';
  END IF;

  SET SESSION cte_max_recursion_depth = GREATEST(1000, p_cantidad + 50);
  SELECT COALESCE(MAX(cliente_id), 0) INTO v_base_cliente FROM clientes;

  WITH RECURSIVE seq AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM seq WHERE n < p_cantidad
  )
  INSERT INTO clientes (
    tipo_documento, numero_documento, nombres, apellidos,
    email, telefono, fecha_nacimiento, fecha_registro, nivel_fidelidad, acepta_marketing
  )
  SELECT
    'CC',
    CONCAT('10', LPAD(1000000 + v_base_cliente + n, 8, '0')),
    CONCAT('Cliente', v_base_cliente + n),
    CONCAT('Apellido', v_base_cliente + n),
    CONCAT('cliente', LPAD(v_base_cliente + n, 5, '0'), '@correo.com'),
    CONCAT('+57 3', LPAD((200000000 + v_base_cliente + n), 9, '0')),
    DATE_ADD('1975-01-01', INTERVAL ((v_base_cliente + n) % 15000) DAY),
    TIMESTAMP(DATE_ADD('2021-01-01', INTERVAL ((v_base_cliente + n) % 1460) DAY), SEC_TO_TIME(((v_base_cliente + n) * 97) % 86400)),
    CASE
      WHEN (v_base_cliente + n) % 40 = 0 THEN 'platino'
      WHEN (v_base_cliente + n) % 15 = 0 THEN 'oro'
      WHEN (v_base_cliente + n) % 6 = 0 THEN 'plata'
      ELSE 'bronce'
    END,
    IF((v_base_cliente + n) % 9 = 0, 0, 1)
  FROM seq;

  INSERT INTO direcciones (
    cliente_id, ciudad_id, linea_1, linea_2, codigo_postal, referencia, es_principal
  )
  SELECT
    c.cliente_id,
    ((c.cliente_id - 1) % 20) + 1,
    CONCAT('Calle ', 10 + (c.cliente_id % 90), ' #', 20 + (c.cliente_id % 60), '-', 10 + (c.cliente_id % 80)),
    CONCAT('Apto ', (c.cliente_id % 50) + 1),
    CONCAT('11', LPAD((c.cliente_id % 800), 3, '0')),
    'Generada por procedimiento',
    1
  FROM clientes c
  WHERE c.cliente_id > v_base_cliente;
END $$

DROP PROCEDURE IF EXISTS sp_registrar_evento_auditoria $$
CREATE PROCEDURE sp_registrar_evento_auditoria(
  IN p_entidad VARCHAR(60),
  IN p_entidad_id BIGINT UNSIGNED,
  IN p_accion VARCHAR(20),
  IN p_usuario VARCHAR(80),
  IN p_detalle JSON
)
BEGIN
  INSERT INTO auditoria_eventos (entidad, entidad_id, accion, usuario_sistema, detalle, fecha_evento)
  VALUES (p_entidad, p_entidad_id, p_accion, p_usuario, p_detalle, NOW());
END $$

DELIMITER ;
