 -- Primero creamos las tablas log para usar los Trigger
 
 CREATE TABLE `farmaciadb`.`ventas_log` (
  `id_log` INT NOT NULL AUTO_INCREMENT,
  `id_venta` INT NOT NULL,
  `fecha_operacion` DATETIME NOT NULL,
  `usuario` VARCHAR(100) NOT NULL,
  -- Otros campos para detalles de la operación
  PRIMARY KEY (`id_log`)
) COMMENT = 'Registro de operaciones de ventas';
CREATE TABLE `farmaciadb`.`inventario_log` (
  `id_log` INT NOT NULL AUTO_INCREMENT,
  `id_producto` INT NOT NULL,
  `fecha_operacion` DATETIME NOT NULL,
  `usuario` VARCHAR(100) NOT NULL,
  `stock_anterior` INT NOT NULL,
  `stock_actual` INT NOT NULL,
  `diferencia_stock` INT NOT NULL,
  -- Otros campos para detalles de la operación
  PRIMARY KEY (`id_log`)
) COMMENT = 'Registro de operaciones de inventario';

DELIMITER //

-- Trigger BEFORE INSERT en ventas_log
CREATE TRIGGER `ventas_log_before_insert` BEFORE INSERT ON `ventas_log`
FOR EACH ROW
BEGIN
    -- Registra la fecha y hora de la operación
    SET NEW.fecha_registro = NOW();
    -- Registra el usuario que realizó la operación (asumiendo que tienes una columna `usuario` en la tabla)
    SET NEW.usuario_registro = CURRENT_USER();
END;

//

DELIMITER ;
DELIMITER //

-- Trigger AFTER INSERT en ventas_log
CREATE TRIGGER `ventas_log_after_insert` AFTER INSERT ON `ventas_log`
FOR EACH ROW
BEGIN
    -- Puedes realizar acciones posteriores a la inserción aquí, como generar un mensaje o enviar notificaciones.
END;

//

DELIMITER ;
DELIMITER //

-- Trigger BEFORE UPDATE en inventario_log
CREATE TRIGGER `inventario_log_before_update` BEFORE UPDATE ON `inventario_log`
FOR EACH ROW
BEGIN
    -- Registra el stock actual antes de la actualización
    SET NEW.stock_anterior = OLD.stock_actual;
END;

//

DELIMITER ;
DELIMITER //

-- Trigger AFTER UPDATE en inventario_log
CREATE TRIGGER `inventario_log_after_update` AFTER UPDATE ON `inventario_log`
FOR EACH ROW
BEGIN
    -- Calcula la diferencia de stock después de la actualización
    SET NEW.diferencia_stock = NEW.stock_actual - NEW.stock_anterior;
    -- Puedes realizar otras acciones posteriores a la actualización aquí.
END;

//

DELIMITER ;
