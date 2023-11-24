-- SP para ordenar una tabla en farmaciadb
CREATE PROCEDURE `ordenar_tabla_farmaciadb` (
    IN tabla_nombre VARCHAR(100),
    IN campo_ordenamiento VARCHAR(100),
    IN orden VARCHAR(4) -- Puede ser 'ASC' o 'DESC'
)
BEGIN
    SET @sql = CONCAT('SELECT * FROM farmaciadb.', tabla_nombre, ' ORDER BY ', campo_ordenamiento, ' ', orden);
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END;

//

DELIMITER ;

DELIMITER //

-- SP para insertar registros en una tabla en farmaciadb
CREATE PROCEDURE `insertar_registro_farmaciadb` (
    IN tabla_nombre VARCHAR(100),
    -- Define aquí los parámetros correspondientes a los campos de la tabla
)
BEGIN
    SET @sql = CONCAT('INSERT INTO farmaciadb.', tabla_nombre, ' VALUES (', -- Lista de valores separados por comas
    -- Proporciona aquí los valores para cada campo
    ');');
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END;

//
