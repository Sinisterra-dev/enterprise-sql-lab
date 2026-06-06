SET NAMES utf8mb4;

CREATE DATABASE IF NOT EXISTS enterprise_sql_lab
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_0900_ai_ci;

USE enterprise_sql_lab;

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS auditoria_eventos;
DROP TABLE IF EXISTS resenas;
DROP TABLE IF EXISTS devoluciones;
DROP TABLE IF EXISTS envios;
DROP TABLE IF EXISTS pagos;
DROP TABLE IF EXISTS detalle_pedidos;
DROP TABLE IF EXISTS pedido_cupones;
DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS inventario;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS categorias;
DROP TABLE IF EXISTS proveedores;
DROP TABLE IF EXISTS cupones;
DROP TABLE IF EXISTS direcciones;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS empleados;
DROP TABLE IF EXISTS sucursales;
DROP TABLE IF EXISTS ciudades;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE ciudades (
  ciudad_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(80) NOT NULL,
  departamento_estado VARCHAR(80) NOT NULL,
  pais VARCHAR(80) NOT NULL,
  codigo_dane VARCHAR(10) NULL,
  UNIQUE KEY uk_ciudad_region_pais (nombre, departamento_estado, pais)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE sucursales (
  sucursal_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL,
  ciudad_id INT UNSIGNED NOT NULL,
  direccion VARCHAR(180) NOT NULL,
  telefono VARCHAR(25) NOT NULL,
  fecha_apertura DATE NOT NULL,
  activa TINYINT(1) NOT NULL DEFAULT 1,
  UNIQUE KEY uk_sucursal_nombre (nombre),
  CONSTRAINT fk_sucursal_ciudad FOREIGN KEY (ciudad_id) REFERENCES ciudades(ciudad_id),
  CONSTRAINT chk_sucursal_fecha CHECK (fecha_apertura >= '2000-01-01')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE empleados (
  empleado_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  sucursal_id INT UNSIGNED NOT NULL,
  nombres VARCHAR(90) NOT NULL,
  apellidos VARCHAR(90) NOT NULL,
  email VARCHAR(140) NOT NULL,
  telefono VARCHAR(25) NOT NULL,
  cargo ENUM('asesor_ventas', 'cajero', 'bodega', 'soporte', 'gerente') NOT NULL,
  salario_mensual DECIMAL(12,2) NOT NULL,
  fecha_contratacion DATE NOT NULL,
  activo TINYINT(1) NOT NULL DEFAULT 1,
  UNIQUE KEY uk_empleado_email (email),
  CONSTRAINT fk_empleado_sucursal FOREIGN KEY (sucursal_id) REFERENCES sucursales(sucursal_id),
  CONSTRAINT chk_empleado_salario CHECK (salario_mensual > 0),
  CONSTRAINT chk_empleado_fecha CHECK (fecha_contratacion >= '2010-01-01')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE clientes (
  cliente_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  tipo_documento ENUM('CC', 'CE', 'NIT', 'PASAPORTE') NOT NULL,
  numero_documento VARCHAR(30) NOT NULL,
  nombres VARCHAR(90) NOT NULL,
  apellidos VARCHAR(90) NOT NULL,
  email VARCHAR(140) NOT NULL,
  telefono VARCHAR(25) NOT NULL,
  fecha_nacimiento DATE NULL,
  fecha_registro DATETIME NOT NULL,
  nivel_fidelidad ENUM('bronce', 'plata', 'oro', 'platino') NOT NULL DEFAULT 'bronce',
  acepta_marketing TINYINT(1) NOT NULL DEFAULT 1,
  UNIQUE KEY uk_cliente_documento (tipo_documento, numero_documento),
  UNIQUE KEY uk_cliente_email (email),
  CONSTRAINT chk_cliente_fecha_registro CHECK (fecha_registro >= '2018-01-01')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE direcciones (
  direccion_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  cliente_id INT UNSIGNED NOT NULL,
  ciudad_id INT UNSIGNED NOT NULL,
  linea_1 VARCHAR(180) NOT NULL,
  linea_2 VARCHAR(180) NULL,
  codigo_postal VARCHAR(20) NULL,
  referencia VARCHAR(180) NULL,
  es_principal TINYINT(1) NOT NULL DEFAULT 0,
  CONSTRAINT fk_direccion_cliente FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id),
  CONSTRAINT fk_direccion_ciudad FOREIGN KEY (ciudad_id) REFERENCES ciudades(ciudad_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE proveedores (
  proveedor_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(140) NOT NULL,
  contacto_nombre VARCHAR(120) NOT NULL,
  email VARCHAR(140) NOT NULL,
  telefono VARCHAR(25) NOT NULL,
  ciudad_id INT UNSIGNED NOT NULL,
  tiempo_entrega_dias TINYINT UNSIGNED NOT NULL DEFAULT 5,
  activo TINYINT(1) NOT NULL DEFAULT 1,
  UNIQUE KEY uk_proveedor_nombre (nombre),
  UNIQUE KEY uk_proveedor_email (email),
  CONSTRAINT fk_proveedor_ciudad FOREIGN KEY (ciudad_id) REFERENCES ciudades(ciudad_id),
  CONSTRAINT chk_proveedor_tiempo CHECK (tiempo_entrega_dias BETWEEN 1 AND 30)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE categorias (
  categoria_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  categoria_padre_id INT UNSIGNED NULL,
  nombre VARCHAR(120) NOT NULL,
  descripcion VARCHAR(255) NULL,
  activa TINYINT(1) NOT NULL DEFAULT 1,
  UNIQUE KEY uk_categoria_nombre (nombre),
  CONSTRAINT fk_categoria_padre FOREIGN KEY (categoria_padre_id) REFERENCES categorias(categoria_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE productos (
  producto_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  categoria_id INT UNSIGNED NOT NULL,
  proveedor_id INT UNSIGNED NOT NULL,
  sku VARCHAR(30) NOT NULL,
  nombre VARCHAR(140) NOT NULL,
  descripcion VARCHAR(255) NULL,
  precio_venta DECIMAL(12,2) NOT NULL,
  costo_unitario DECIMAL(12,2) NOT NULL,
  peso_kg DECIMAL(8,3) NOT NULL,
  activo TINYINT(1) NOT NULL DEFAULT 1,
  fecha_alta DATETIME NOT NULL,
  UNIQUE KEY uk_producto_sku (sku),
  CONSTRAINT fk_producto_categoria FOREIGN KEY (categoria_id) REFERENCES categorias(categoria_id),
  CONSTRAINT fk_producto_proveedor FOREIGN KEY (proveedor_id) REFERENCES proveedores(proveedor_id),
  CONSTRAINT chk_producto_precio CHECK (precio_venta > 0),
  CONSTRAINT chk_producto_costo CHECK (costo_unitario > 0),
  CONSTRAINT chk_producto_margen CHECK (precio_venta >= costo_unitario),
  CONSTRAINT chk_producto_peso CHECK (peso_kg > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE inventario (
  inventario_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  sucursal_id INT UNSIGNED NOT NULL,
  producto_id INT UNSIGNED NOT NULL,
  stock_actual INT NOT NULL,
  stock_minimo INT NOT NULL,
  stock_maximo INT NOT NULL,
  punto_reorden INT NOT NULL,
  fecha_actualizacion DATETIME NOT NULL,
  UNIQUE KEY uk_inventario_sucursal_producto (sucursal_id, producto_id),
  CONSTRAINT fk_inventario_sucursal FOREIGN KEY (sucursal_id) REFERENCES sucursales(sucursal_id),
  CONSTRAINT fk_inventario_producto FOREIGN KEY (producto_id) REFERENCES productos(producto_id),
  CONSTRAINT chk_inventario_stock CHECK (stock_actual >= 0),
  CONSTRAINT chk_inventario_min_max CHECK (stock_minimo >= 0 AND stock_maximo >= stock_minimo),
  CONSTRAINT chk_inventario_reorden CHECK (punto_reorden BETWEEN stock_minimo AND stock_maximo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE cupones (
  cupon_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  codigo VARCHAR(40) NOT NULL,
  descripcion VARCHAR(180) NOT NULL,
  tipo_descuento ENUM('porcentaje', 'valor_fijo') NOT NULL,
  valor_descuento DECIMAL(10,2) NOT NULL,
  monto_minimo DECIMAL(10,2) NOT NULL DEFAULT 0,
  fecha_inicio DATE NOT NULL,
  fecha_fin DATE NOT NULL,
  uso_maximo INT UNSIGNED NOT NULL,
  activo TINYINT(1) NOT NULL DEFAULT 1,
  UNIQUE KEY uk_cupon_codigo (codigo),
  CONSTRAINT chk_cupon_valor CHECK (valor_descuento > 0),
  CONSTRAINT chk_cupon_fechas CHECK (fecha_fin >= fecha_inicio)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE pedidos (
  pedido_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  cliente_id INT UNSIGNED NOT NULL,
  direccion_envio_id INT UNSIGNED NOT NULL,
  empleado_id INT UNSIGNED NULL,
  sucursal_id INT UNSIGNED NOT NULL,
  fecha_pedido DATETIME NOT NULL,
  estado ENUM('creado', 'pagado', 'enviado', 'entregado', 'cancelado', 'devuelto') NOT NULL,
  subtotal DECIMAL(12,2) NOT NULL DEFAULT 0,
  descuento_total DECIMAL(12,2) NOT NULL DEFAULT 0,
  costo_logistico DECIMAL(12,2) NOT NULL DEFAULT 0,
  total DECIMAL(12,2) NOT NULL DEFAULT 0,
  observaciones VARCHAR(255) NULL,
  CONSTRAINT fk_pedido_cliente FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id),
  CONSTRAINT fk_pedido_direccion FOREIGN KEY (direccion_envio_id) REFERENCES direcciones(direccion_id),
  CONSTRAINT fk_pedido_empleado FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id),
  CONSTRAINT fk_pedido_sucursal FOREIGN KEY (sucursal_id) REFERENCES sucursales(sucursal_id),
  CONSTRAINT chk_pedido_montos CHECK (
    subtotal >= 0
    AND descuento_total >= 0
    AND costo_logistico >= 0
    AND total >= 0
  )
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE pedido_cupones (
  pedido_cupon_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  pedido_id BIGINT UNSIGNED NOT NULL,
  cupon_id INT UNSIGNED NOT NULL,
  valor_aplicado DECIMAL(12,2) NOT NULL,
  CONSTRAINT fk_pedido_cupon_pedido FOREIGN KEY (pedido_id) REFERENCES pedidos(pedido_id),
  CONSTRAINT fk_pedido_cupon_cupon FOREIGN KEY (cupon_id) REFERENCES cupones(cupon_id),
  UNIQUE KEY uk_pedido_cupon_unico (pedido_id, cupon_id),
  CONSTRAINT chk_pedido_cupon_valor CHECK (valor_aplicado >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE detalle_pedidos (
  detalle_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  pedido_id BIGINT UNSIGNED NOT NULL,
  producto_id INT UNSIGNED NOT NULL,
  cantidad INT UNSIGNED NOT NULL,
  precio_unitario DECIMAL(12,2) NOT NULL,
  descuento_unitario DECIMAL(12,2) NOT NULL DEFAULT 0,
  impuesto_unitario DECIMAL(12,2) NOT NULL DEFAULT 0,
  CONSTRAINT fk_detalle_pedido FOREIGN KEY (pedido_id) REFERENCES pedidos(pedido_id),
  CONSTRAINT fk_detalle_producto FOREIGN KEY (producto_id) REFERENCES productos(producto_id),
  CONSTRAINT chk_detalle_cantidad CHECK (cantidad > 0),
  CONSTRAINT chk_detalle_precio CHECK (precio_unitario > 0),
  CONSTRAINT chk_detalle_descuento CHECK (descuento_unitario >= 0),
  CONSTRAINT chk_detalle_impuesto CHECK (impuesto_unitario >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE pagos (
  pago_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  pedido_id BIGINT UNSIGNED NOT NULL,
  fecha_pago DATETIME NOT NULL,
  metodo_pago ENUM('tarjeta_credito', 'tarjeta_debito', 'pse', 'transferencia', 'efectivo', 'wallet') NOT NULL,
  estado_pago ENUM('pendiente', 'aprobado', 'rechazado', 'reversado') NOT NULL,
  monto DECIMAL(12,2) NOT NULL,
  referencia_externa VARCHAR(80) NULL,
  CONSTRAINT fk_pago_pedido FOREIGN KEY (pedido_id) REFERENCES pedidos(pedido_id),
  CONSTRAINT chk_pago_monto CHECK (monto >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE envios (
  envio_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  pedido_id BIGINT UNSIGNED NOT NULL,
  transportadora VARCHAR(90) NOT NULL,
  numero_guia VARCHAR(80) NULL,
  fecha_envio DATETIME NOT NULL,
  fecha_entrega_estimada DATETIME NOT NULL,
  fecha_entrega_real DATETIME NULL,
  estado_envio ENUM('preparando', 'en_transito', 'entregado', 'devuelto') NOT NULL,
  costo_envio DECIMAL(12,2) NOT NULL,
  CONSTRAINT fk_envio_pedido FOREIGN KEY (pedido_id) REFERENCES pedidos(pedido_id),
  UNIQUE KEY uk_envio_pedido (pedido_id),
  CONSTRAINT chk_envio_costo CHECK (costo_envio >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE devoluciones (
  devolucion_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  pedido_id BIGINT UNSIGNED NOT NULL,
  detalle_id BIGINT UNSIGNED NOT NULL,
  fecha_solicitud DATETIME NOT NULL,
  motivo ENUM('producto_defectuoso', 'no_corresponde', 'arrepentimiento', 'demora_entrega', 'otro') NOT NULL,
  estado ENUM('solicitada', 'aprobada', 'rechazada', 'reembolsada') NOT NULL,
  cantidad INT UNSIGNED NOT NULL,
  monto_reembolso DECIMAL(12,2) NOT NULL,
  CONSTRAINT fk_devolucion_pedido FOREIGN KEY (pedido_id) REFERENCES pedidos(pedido_id),
  CONSTRAINT fk_devolucion_detalle FOREIGN KEY (detalle_id) REFERENCES detalle_pedidos(detalle_id),
  CONSTRAINT chk_devolucion_cantidad CHECK (cantidad > 0),
  CONSTRAINT chk_devolucion_monto CHECK (monto_reembolso >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE resenas (
  resena_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  producto_id INT UNSIGNED NOT NULL,
  cliente_id INT UNSIGNED NOT NULL,
  pedido_id BIGINT UNSIGNED NOT NULL,
  puntuacion TINYINT UNSIGNED NOT NULL,
  comentario VARCHAR(255) NULL,
  fecha_resena DATETIME NOT NULL,
  CONSTRAINT fk_resena_producto FOREIGN KEY (producto_id) REFERENCES productos(producto_id),
  CONSTRAINT fk_resena_cliente FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id),
  CONSTRAINT fk_resena_pedido FOREIGN KEY (pedido_id) REFERENCES pedidos(pedido_id),
  CONSTRAINT chk_resena_puntuacion CHECK (puntuacion BETWEEN 1 AND 5)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE auditoria_eventos (
  evento_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  entidad VARCHAR(60) NOT NULL,
  entidad_id BIGINT UNSIGNED NOT NULL,
  accion ENUM('insert', 'update', 'delete', 'estado') NOT NULL,
  usuario_sistema VARCHAR(80) NOT NULL,
  detalle JSON NULL,
  fecha_evento DATETIME NOT NULL,
  INDEX idx_auditoria_entidad_fecha (entidad, fecha_evento)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
