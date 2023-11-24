-- Creacion de funciones
DELIMITER //

CREATE FUNCTION `calcular_precio_total_venta` (venta_id INT)
RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE total DECIMAL(10, 2);
    SELECT SUM(`precio_unitario` * `cantidad`) INTO total
    FROM `detalles_venta`
    WHERE `id_venta` = venta_id;
    RETURN total;
END;

//

DELIMITER ;
DELIMITER //

CREATE FUNCTION `obtener_nombre_completo_cliente` (cliente_id INT)
RETURNS VARCHAR(200)
BEGIN
    DECLARE nombre_completo VARCHAR(200);
    SELECT CONCAT(`nombre_cliente`, ' ', `apellido_cliente`) INTO nombre_completo
    FROM `clientes`
    WHERE `id_cliente` = cliente_id;
    RETURN nombre_completo;
END;

//

DELIMITER ;
DELIMITER //
