\connect enterprise_sql_lab

DROP PROCEDURE IF EXISTS sp_recalcular_totales_pedido;
CREATE PROCEDURE sp_recalcular_totales_pedido(IN p_pedido_id BIGINT)
LANGUAGE plpgsql
AS $$
DECLARE
  v_subtotal NUMERIC(12,2) := 0;
  v_descuento_linea NUMERIC(12,2) := 0;
  v_descuento_cupon NUMERIC(12,2) := 0;
  v_logistica NUMERIC(12,2) := 0;
BEGIN
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
END;
$$;

DROP PROCEDURE IF EXISTS sp_generar_clientes_extra;
CREATE PROCEDURE sp_generar_clientes_extra(IN p_cantidad INTEGER)
LANGUAGE plpgsql
AS $$
DECLARE
  v_base_cliente INTEGER := 0;
BEGIN
  IF p_cantidad IS NULL OR p_cantidad <= 0 THEN
    RAISE EXCEPTION 'p_cantidad debe ser mayor que cero';
  END IF;

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
    'CC'::tipo_documento_cliente,
    CONCAT('10', LPAD((1000000 + v_base_cliente + n)::text, 8, '0')),
    CONCAT('Cliente', v_base_cliente + n),
    CONCAT('Apellido', v_base_cliente + n),
    CONCAT('cliente', LPAD((v_base_cliente + n)::text, 5, '0'), '@correo.com'),
    CONCAT('+57 3', LPAD((200000000 + v_base_cliente + n)::text, 9, '0')),
    (DATE '1975-01-01' + (((v_base_cliente + n) % 15000) * INTERVAL '1 day'))::date,
    (DATE '2021-01-01' + (((v_base_cliente + n) % 1460) * INTERVAL '1 day') + make_interval(secs => (((v_base_cliente + n) * 97) % 86400))),
    CASE
      WHEN (v_base_cliente + n) % 40 = 0 THEN 'platino'
      WHEN (v_base_cliente + n) % 15 = 0 THEN 'oro'
      WHEN (v_base_cliente + n) % 6 = 0 THEN 'plata'
      ELSE 'bronce'
    END::nivel_fidelidad_cliente,
    CASE WHEN (v_base_cliente + n) % 9 = 0 THEN FALSE ELSE TRUE END
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
    'Generada por procedimiento',
    TRUE
  FROM clientes c
  WHERE c.cliente_id > v_base_cliente;
END;
$$;

DROP PROCEDURE IF EXISTS sp_registrar_evento_auditoria;
CREATE PROCEDURE sp_registrar_evento_auditoria(
  IN p_entidad VARCHAR(60),
  IN p_entidad_id BIGINT,
  IN p_accion VARCHAR(20),
  IN p_usuario VARCHAR(80),
  IN p_detalle JSONB
)
LANGUAGE plpgsql
AS $$
BEGIN
  INSERT INTO auditoria_eventos (entidad, entidad_id, accion, usuario_sistema, detalle, fecha_evento)
  VALUES (p_entidad, p_entidad_id, p_accion::accion_auditoria_tipo, p_usuario, p_detalle, NOW());
END;
$$;
