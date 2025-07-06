-- Crear base de datos si no existe
CREATE DATABASE IF NOT EXISTS ventas_db;
USE ventas_db;

-- Eliminación de tablas si existen previamente (en orden para evitar conflictos por claves foráneas)
DROP TABLE IF EXISTS detalle;
DROP TABLE IF EXISTS producto_extra_info;
DROP TABLE IF EXISTS lote;
DROP TABLE IF EXISTS producto;
DROP TABLE IF EXISTS categoria;
DROP TABLE IF EXISTS factura;
DROP TABLE IF EXISTS vendedor;
DROP TABLE IF EXISTS cliente;

-- Tabla cliente
CREATE TABLE IF NOT EXISTS cliente (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(255),
    telefono VARCHAR(20) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE
);

-- Tabla vendedor
CREATE TABLE IF NOT EXISTS vendedor (
    id_vendedor INT PRIMARY KEY,
    usuario_nombre VARCHAR(45) UNIQUE NOT NULL,
    usuario_contra VARCHAR(45) NOT NULL, 
    reference_vend VARCHAR(12) UNIQUE NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(255),
    telefono VARCHAR(15) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE
);

-- Tabla factura
CREATE TABLE IF NOT EXISTS factura (
    idfactura INT PRIMARY KEY,
    fecha DATE NOT NULL,
    id_cliente INT NOT NULL,
    id_vendedor INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_vendedor) REFERENCES vendedor(id_vendedor)
);

-- Tabla categoria
CREATE TABLE IF NOT EXISTS categoria (
    id_categoria INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    detalle VARCHAR(555),
    categoria_padre INT,
    FOREIGN KEY (categoria_padre) REFERENCES categoria(id_categoria)
);

-- Tabla producto
CREATE TABLE IF NOT EXISTS producto (
    id_producto INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    codigo VARCHAR(50) UNIQUE NOT NULL,
    detalle VARCHAR(255),
    numero_categoria INT NOT NULL,
    FOREIGN KEY (numero_categoria) REFERENCES categoria(id_categoria)
);

-- Tabla lote
CREATE TABLE IF NOT EXISTS lote (
    idciclo INT PRIMARY KEY,
    references_lote INT NOT NULL,
    fecha_fabricacion DATE NOT NULL,
    fecha_venciiento DATE DEFAULT NOW()
);

-- Tabla producto_extra_info
CREATE TABLE IF NOT EXISTS producto_extra_info (
    id_producto_lote INT PRIMARY KEY,
    precio DECIMAL(10,2) NOT NULL,
    precio_promocional DECIMAL(10,2),
    comision_vendedor DECIMAL(5,2),
    iva DECIMAL(10,2),
    num_lote INT NOT NULL,
    num_producto INT NOT NULL,
    FOREIGN KEY (num_lote) REFERENCES lote(idciclo),
    FOREIGN KEY (num_producto) REFERENCES producto(id_producto)
);

-- Tabla detalle
CREATE TABLE IF NOT EXISTS detalle (
    id_detalle INT PRIMARY KEY,
    cantidad INT NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    num_producto_lote INT NOT NULL,
    num_factura INT NOT NULL,
    FOREIGN KEY (num_producto_lote) REFERENCES producto_extra_info (id_producto_lote),
    FOREIGN KEY (num_factura) REFERENCES factura(idfactura)
);
