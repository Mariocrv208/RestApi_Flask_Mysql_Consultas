-- CARGA DE TABLA AUXILIAR
LOAD DATA LOCAL INFILE 'C:/Users/Mario/OneDrive/Escritorio/USAC/S22022/Bases1/P1/ExcelCarga/Orden.csv' 
INTO TABLE AUX 
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

set global local_infile = 1;

-- CARGA DE TABLA ORDEN
INSERT INTO Orden (fecha_orden, Cliente_id_cliente) 
SELECT DISTINCT fecha_orden,Cliente_id_cliente FROM AUX;

-- CARGA DE TABLA DETALLE
INSERT INTO detalle ( linea_orden, cantidad, Vendedor_id_vendedor,Producto_id_producto, Orden_id_orden)
SELECT  a.linea_orden, a.cantidad, a.Vendedor_id_vendedor, a.Producto_id_producto, o.id_orden FROM AUX a
INNER JOIN orden o ON o.id_orden=a.id_orden;

-- CARGA DE TABLA CATEGORIA
LOAD DATA LOCAL INFILE 'C:/Users/Mario/OneDrive/Escritorio/USAC/S22022/Bases1/P1/ExcelCarga/Categoria.csv' 
INTO TABLE Categoria 
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- CARGA DE TABLA PAIS
LOAD DATA LOCAL INFILE 'C:/Users/Mario/OneDrive/Escritorio/USAC/S22022/Bases1/P1/ExcelCarga/Pais.csv' 
INTO TABLE Pais 
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- CARGA DE TABLA VENDEDOR
LOAD DATA LOCAL INFILE 'C:/Users/Mario/OneDrive/Escritorio/USAC/S22022/Bases1/P1/ExcelCarga/Vendedor.csv' 
INTO TABLE Vendedor 
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- CARGA DE TABLA CLIENTE
LOAD DATA LOCAL INFILE 'C:/Users/Mario/OneDrive/Escritorio/USAC/S22022/Bases1/P1/ExcelCarga/Cliente.csv' 
INTO TABLE Cliente 
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- CARGA DE TABLA PRODUCTO
LOAD DATA LOCAL INFILE 'C:/Users/Mario/OneDrive/Escritorio/USAC/S22022/Bases1/P1/ExcelCarga/Producto.csv' 
INTO TABLE Producto 
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


