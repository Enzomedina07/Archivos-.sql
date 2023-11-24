-- Creacion de vistas

CREATE VIEW `ventas_por_cliente` AS
SELECT
    c.`id_cliente`,
    c.`nombre_cliente`,
    SUM(v.`total_venta`) AS `total_gastado`
FROM `clientes` c
LEFT JOIN `ventas` v ON c.`id_cliente` = v.`id_cliente`
GROUP BY c.`id_cliente`, c.`nombre_cliente`;

CREATE VIEW `productos_agotados` AS
SELECT
    `id_producto`,
    `nombre_producto`
FROM `productos`
WHERE `stock_disponible` = 0;

CREATE VIEW `proveedores_con_contacto` AS
SELECT
    p.`idproveedor`,
    p.`nombre_proveedor`,
    p.`contacto_proveedor`,
    p.`email_proveedor`
FROM `proveedores` p;

CREATE VIEW `ventas_mensuales` AS
SELECT
    YEAR(`fecha_venta`) AS `anio`,
    MONTH(`fecha_venta`) AS `mes`,
    SUM(`total_venta`) AS `total_mes`
FROM `ventas`
GROUP BY `anio`, `mes`;

CREATE VIEW `detalles_de_ventas` AS
SELECT
    dv.`id_detalle_venta`,
    v.`id_venta`,
    v.`fecha_venta`,
    c.`nombre_cliente`,
    p.`nombre_producto`,
    dv.`cantidad`,
    dv.`precio_unitario`,
    (dv.`cantidad` * dv.`precio_unitario`) AS `subtotal`
FROM `detalles_venta` dv
INNER JOIN `ventas` v ON dv.`id_venta` = v.`id_venta`
INNER JOIN `clientes` c ON v.`id_cliente` = c.`id_cliente`
INNER JOIN `productos` p ON dv.`id_producto` = p.`id_producto`;
