# enterprise-sql-lab

Laboratorio SQL empresarial orientado a **MySQL 8+** y **PostgreSQL 14+**, diseñado para practicar desde SQL básico hasta análisis avanzado con una base de e-commerce/retail realista (contexto LATAM/Colombia).

## Estructura del proyecto

### MySQL

- `/sql/01_schema.sql`  
  Crea la base `enterprise_sql_lab`, tablas, claves primarias/foráneas, restricciones `NOT NULL`, `UNIQUE`, `CHECK`, y motor `InnoDB` con `utf8mb4`.
- `/sql/02_seed_data.sql`  
  Carga datos semilla coherentes y generación masiva automática (más de 10,000 registros totales).
- `/sql/03_indexes_views.sql`  
  Crea índices para consultas frecuentes y vistas analíticas para exploración de negocio.
- `/sql/04_optional_procedures.sql`  
  Procedimientos opcionales para recalcular totales, registrar auditoría y expandir clientes sintéticos.

### PostgreSQL

- `/sql_postgresql/01_schema.sql`  
  Crea la base `enterprise_sql_lab`, tipos `ENUM`, tablas, restricciones e índices base.
- `/sql_postgresql/02_seed_data.sql`  
  Carga datos semilla y generación masiva con CTE recursivos.
- `/sql_postgresql/03_indexes_views.sql`  
  Crea índices y vistas analíticas equivalentes.
- `/sql_postgresql/04_optional_procedures.sql`  
  Crea procedimientos opcionales en `PL/pgSQL`.

## Cómo ejecutar (MySQL Workbench)

1. Abrir conexión en MySQL Workbench (MySQL 8+).
2. Ejecutar scripts en este orden:
   1. `sql/01_schema.sql`
   2. `sql/02_seed_data.sql`
   3. `sql/03_indexes_views.sql`
   4. `sql/04_optional_procedures.sql` (opcional)
3. Refrescar el esquema `enterprise_sql_lab`.

## Cómo ejecutar (PostgreSQL con psql)

1. Abrir terminal con acceso a PostgreSQL (14+).
2. Ejecutar scripts en este orden:
   1. `psql -U <usuario> -f sql_postgresql/01_schema.sql`
   2. `psql -U <usuario> -f sql_postgresql/02_seed_data.sql`
   3. `psql -U <usuario> -f sql_postgresql/03_indexes_views.sql`
   4. `psql -U <usuario> -f sql_postgresql/04_optional_procedures.sql` (opcional)

> Nota: los scripts de PostgreSQL usan `\connect`, por lo que deben ejecutarse con `psql` (no con una herramienta que ignore metacomandos).

## Alcance del modelo

El modelo cubre:

- Clientes, direcciones, ciudades
- Sucursales, empleados
- Categorías, proveedores, productos
- Inventario por sucursal
- Pedidos, detalle de pedidos, cupones y cupones aplicados
- Pagos, envíos, devoluciones, reseñas
- Auditoría de eventos

## Qué tipo de práctica permite

La base está preparada para practicar:

- `SELECT`, filtros, `ORDER BY`, `GROUP BY`, `HAVING`
- `JOIN` entre múltiples entidades de negocio
- Subconsultas, CTEs y funciones de ventana
- KPIs: ventas por día/mes/año/ciudad, ticket promedio, clientes más activos
- Productos más/menos vendidos, margen bruto por producto/categoría
- Métodos de pago, estados de pedido y desempeño logístico
- Rotación de inventario y alertas de stock
- Desempeño por sucursal y empleado
- Devoluciones y calidad percibida (reseñas)

## Uso posterior con Python

La estructura es compatible para consumo desde Python:

- MySQL: `mysql-connector-python`, `SQLAlchemy`, `pandas`
- PostgreSQL: `psycopg`, `SQLAlchemy`, `pandas`
Sinisterradev.com 
