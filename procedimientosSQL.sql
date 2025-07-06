
DELIMITER $$

-- Procedimiento para tabla cliente
CREATE PROCEDURE gestionar_cliente (
    IN accion VARCHAR(10),
    IN p_id_cliente INT,
    IN p_nombre VARCHAR(100),
    IN p_direccion VARCHAR(255),
    IN p_telefono VARCHAR(20),
    IN p_email VARCHAR(100),
    IN p_facebook VARCHAR(100),
    IN p_instagram VARCHAR(100),
    IN p_twitter VARCHAR(100),
    IN p_imagen VARCHAR(100)
)
BEGIN
    IF accion = 'INSERTAR' THEN
        INSERT INTO cliente VALUES (p_id_cliente, p_nombre, p_direccion, p_telefono, p_email, p_facebook, p_instagram, p_twitter, p_imagen);
    ELSEIF accion = 'ACTUALIZAR' THEN
        UPDATE cliente SET nombre = p_nombre, direccion = p_direccion, telefono = p_telefono, email = p_email, facebook = p_facebook, instagram = p_instagram, twitter = p_twitter, imagen = p_imagen WHERE id_cliente = p_id_cliente;
    ELSEIF accion = 'ELIMINAR' THEN
        DELETE FROM cliente WHERE id_cliente = p_id_cliente;
    END IF;
END$$

-- Procedimiento para tabla vendedor
CREATE PROCEDURE gestionar_vendedor (
    IN accion VARCHAR(10),
    IN p_id_vendedor INT,
    IN p_nombre VARCHAR(100),
    IN p_direccion VARCHAR(255),
    IN p_telefono VARCHAR(20),
    IN p_email VARCHAR(100),
    IN p_comision DECIMAL(5,2),
    IN p_foto VARCHAR(100)
)
BEGIN
    IF accion = 'INSERTAR' THEN
        INSERT INTO vendedor VALUES (p_id_vendedor, p_nombre, p_direccion, p_telefono, p_email, p_comision, p_foto);
    ELSEIF accion = 'ACTUALIZAR' THEN
        UPDATE vendedor SET nombre = p_nombre, direccion = p_direccion, telefono = p_telefono, email = p_email, comision = p_comision, foto = p_foto WHERE id_vendedor = p_id_vendedor;
    ELSEIF accion = 'ELIMINAR' THEN
        DELETE FROM vendedor WHERE id_vendedor = p_id_vendedor;
    END IF;
END$$

-- Procedimiento para tabla producto
CREATE PROCEDURE gestionar_producto (
    IN accion VARCHAR(10),
    IN p_id_producto INT,
    IN p_referencia VARCHAR(50),
    IN p_nombre VARCHAR(100),
    IN p_precio DECIMAL(10,2),
    IN p_stock INT,
    IN p_foto VARCHAR(100)
)
BEGIN
    IF accion = 'INSERTAR' THEN
        INSERT INTO producto VALUES (p_id_producto, p_referencia, p_nombre, p_precio, p_stock, p_foto);
    ELSEIF accion = 'ACTUALIZAR' THEN
        UPDATE producto SET referencia = p_referencia, nombre = p_nombre, precio = p_precio, stock = p_stock, foto = p_foto WHERE id_producto = p_id_producto;
    ELSEIF accion = 'ELIMINAR' THEN
        DELETE FROM producto WHERE id_producto = p_id_producto;
    END IF;
END$$

-- Procedimiento para tabla factura
CREATE PROCEDURE gestionar_factura (
    IN accion VARCHAR(10),
    IN p_id_factura INT,
    IN p_id_cliente INT,
    IN p_id_vendedor INT,
    IN p_fecha DATE,
    IN p_total DECIMAL(10,2)
)
BEGIN
    IF accion = 'INSERTAR' THEN
        INSERT INTO factura VALUES (p_id_factura, p_id_cliente, p_id_vendedor, p_fecha, p_total);
    ELSEIF accion = 'ACTUALIZAR' THEN
        UPDATE factura SET id_cliente = p_id_cliente, id_vendedor = p_id_vendedor, fecha = p_fecha, total = p_total WHERE id_factura = p_id_factura;
    ELSEIF accion = 'ELIMINAR' THEN
        DELETE FROM factura WHERE id_factura = p_id_factura;
    END IF;
END$$

-- Procedimiento para tabla detalle_factura
CREATE PROCEDURE gestionar_detalle_factura (
    IN accion VARCHAR(10),
    IN p_id_detalle INT,
    IN p_id_factura INT,
    IN p_id_producto INT,
    IN p_cantidad INT,
    IN p_precio_unitario DECIMAL(10,2)
)
BEGIN
    IF accion = 'INSERTAR' THEN
        INSERT INTO detalle_factura VALUES (p_id_detalle, p_id_factura, p_id_producto, p_cantidad, p_precio_unitario);
    ELSEIF accion = 'ACTUALIZAR' THEN
        UPDATE detalle_factura SET id_factura = p_id_factura, id_producto = p_id_producto, cantidad = p_cantidad, precio_unitario = p_precio_unitario WHERE id_detalle = p_id_detalle;
    ELSEIF accion = 'ELIMINAR' THEN
        DELETE FROM detalle_factura WHERE id_detalle = p_id_detalle;
    END IF;
END$$

DELIMITER ;
