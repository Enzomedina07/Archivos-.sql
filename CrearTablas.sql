-- Creación de la tabla Proveedores
CREATE TABLE `farmaciadb`.`proveedores` (
  `idproveedor` INT NOT NULL,
  `nombre_proveedor` VARCHAR(45) NOT NULL,
  `contacto_proveedor` VARCHAR(45) NOT NULL,
  `telefono_proveedor` INT NOT NULL,
  `email_proveedor` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idproveedor`)
) COMMENT = 'Información sobre los proveedores';

-- Creación de la tabla Productos
CREATE TABLE `farmaciadb`.`productos` (
  `id_producto` INT NOT NULL AUTO_INCREMENT,
  `nombre_producto` VARCHAR(100) NOT NULL,
  `precio_unitario` DECIMAL(10, 2) NOT NULL,
  `stock_disponible` INT NOT NULL,
  `id_proveedor` INT NOT NULL,
  PRIMARY KEY (`id_producto`),
  FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`idproveedor`)
) COMMENT = 'Almacena productos disponibles';

-- Creación de la tabla Clientes
CREATE TABLE `farmaciadb`.`clientes` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `nombre_cliente` VARCHAR(100) NOT NULL,
  `direccion_cliente` VARCHAR(100) NOT NULL,
  `telefono_cliente` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_cliente`)
) COMMENT = 'Almacena información sobre los clientes de la farmacia';

-- Creación de la tabla Ventas
CREATE TABLE `farmaciadb`.`ventas` (
  `id_venta` INT NOT NULL AUTO_INCREMENT,
  `fecha_venta` DATETIME NOT NULL,
  `total_venta` DECIMAL(10, 2) NOT NULL,
  `id_cliente` INT NOT NULL,
  `id_producto` INT NOT NULL,
  PRIMARY KEY (`id_venta`),
  FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) COMMENT = 'Registra detalles de las ventas realizadas en la farmacia';

-- Creación de la tabla Detalles_Venta
CREATE TABLE `farmaciadb`.`detalles_venta` (
  `id_detalle_venta` INT NOT NULL AUTO_INCREMENT,
  `id_venta` INT NOT NULL,
  `id_producto` INT NOT NULL,
  `cantidad` INT NOT NULL,
  `precio_unitario` DECIMAL(10, 2) NOT NULL,
  PRIMARY KEY (`id_detalle_venta`),
  FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`),
  FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) COMMENT = 'Registra los productos vendidos en cada transacción';
