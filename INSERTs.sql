-- Agregar datos a la tabla de Proveedores
INSERT INTO `farmaciadb`.`proveedores` (`idproveedor`, `nombre_proveedor`, `contacto_proveedor`, `telefono_proveedor`, `email_proveedor`)
VALUES
    (1, 'Proveedor A', 'Contacto A', 123456789, 'proveedorA@email.com'),
    (2, 'Proveedor B', 'Contacto B', 987654321, 'proveedorB@email.com'),
    (3, 'Proveedor C', 'Contacto C', 555555555, 'proveedorC@email.com');

-- Agregar datos a la tabla de Productos
INSERT INTO `farmaciadb`.`productos` (`id_producto`, `nombre_producto`, `precio_unitario`, `stock_disponible`, `id_proveedor`)
VALUES
    (1, 'Ibuprofeno', 5.99, 100, 1),
    (2, 'Paracetamol', 4.49, 150, 2),
    (3, 'Amoxicilina', 7.99, 80, 3),
    (4, 'Omeprazol', 6.79, 120, 2),
    (5, 'Aspirina', 3.99, 200, 1);

-- Agregar datos a la tabla de Clientes
INSERT INTO `farmaciadb`.`clientes` (`id_cliente`, `nombre_cliente`, `direccion_cliente`, `telefono_cliente`)
VALUES
    (1, 'Cliente 1', 'Dirección 1', '123-456-7890'),
    (2, 'Cliente 2', 'Dirección 2', '987-654-3210'),
    (3, 'Cliente 3', 'Dirección 3', '555-555-5555');

-- Agregar datos a la tabla de Ventas
INSERT INTO `farmaciadb`.`ventas` (`id_venta`, `fecha_venta`, `total_venta`, `id_cliente`, `id_producto`)
VALUES
    (1, '2023-09-01 10:00:00', 25.99, 1, 1),
    (2, '2023-09-02 11:30:00', 15.49, 2, 2),
    (3, '2023-09-03 15:45:00', 30.99, 3, 3),
    (4, '2023-09-04 12:15:00', 22.79, 1, 4),
    (5, '2023-09-05 09:30:00', 11.99, 2, 5);

-- Agregar datos a la tabla de Detalles_Venta
INSERT INTO `farmaciadb`.`detalles_venta` (`id_detalle_venta`, `id_venta`, `id_producto`, `cantidad`, `precio_unitario`)
VALUES
    (1, 1, 1, 2, 5.99),
    (2, 2, 2, 3, 4.49),
    (3, 3, 3, 1, 7.99),
    (4, 4, 4, 4, 6.79),
    (5, 5, 5, 5, 3.99);
