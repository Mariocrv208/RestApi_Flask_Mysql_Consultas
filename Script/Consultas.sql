-- Consultas 

-- CONSULTA 1
DELIMITER $$
CREATE PROCEDURE Consulta1()
begin
	select c.id_cliente, c.nombre, c.apellido, p.id_pais, SUM(n.precio*d.cantidad) AS monto_total 
	from Cliente c 
	INNER JOIN pais p on c.Pais_id_pais = p.id_pais
	INNER JOIN orden o on o.Cliente_id_cliente = c.id_cliente
	INNER JOIN Detalle d on d.Orden_id_orden = o.id_orden 
	INNER JOIN Producto n on d.Producto_id_producto = n.id_producto
	GROUP BY c.id_cliente
	ORDER BY SUM(n.precio*d.cantidad) desc
	LIMIT 1;
end $$


-- CONSULTA 2
DELIMITER $$
CREATE PROCEDURE Consulta2()
begin
(Select p.id_producto, p.Nombre, c.id_categoria, COUNT(d.cantidad) AS 'CANTDAD', d.cantidad*p.precio AS 'MONTO VENDIDO'
from Producto p
INNER JOIN Detalle d ON p.id_producto= d.Producto_id_producto
INNER JOIN Categoria c ON c.id_categoria = p.Categoria_id_categoria
GROUP BY p.id_producto
ORDER BY COUNT(d.cantidad) DESC
LIMIT 1)
UNION(
Select p.id_producto, p.Nombre, c.id_categoria, COUNT(d.cantidad) AS 'CANTDAD', d.cantidad*p.precio AS 'MONTO VENDIDO'
from Producto p
INNER JOIN Detalle d ON p.id_producto= d.Producto_id_producto
INNER JOIN Categoria c ON c.id_categoria = p.Categoria_id_categoria
GROUP BY p.id_producto
ORDER BY COUNT(d.cantidad) ASC
LIMIT 1);
end $$

-- CONSULTA 3
DELIMITER $$
CREATE PROCEDURE Consulta3()
begin
select v.id_vendedor, v.nombre, SUM(n.precio*d.cantidad) AS monto_total 
from Vendedor v
INNER JOIN Detalle d on d.Vendedor_id_vendedor = v.id_vendedor 
INNER JOIN Producto n on d.Producto_id_producto = n.id_producto
GROUP BY v.id_vendedor
ORDER BY SUM(n.precio*d.cantidad) desc
LIMIT 1;
end $$

-- CONSULTA 4
DELIMITER $$
CREATE PROCEDURE Consulta4()
begin
(select p.nombre, SUM(n.precio*d.cantidad) AS 'MONTO TOTAL'
from Pais p
INNER JOIN Vendedor v on v.Pais_id_pais = p.id_pais
INNER JOIN Detalle d on d.Vendedor_id_vendedor = v.id_vendedor 
INNER JOIN Producto n on d.Producto_id_producto = n.id_producto
GROUP BY p.id_pais
ORDER BY SUM(n.precio*d.cantidad) desc
LIMIT 1)
UNION
(select p.nombre, SUM(n.precio*d.cantidad) AS 'MONTO TOTAL'
from Pais p
INNER JOIN Vendedor v on v.Pais_id_pais = p.id_pais
INNER JOIN Detalle d on d.Vendedor_id_vendedor = v.id_vendedor 
INNER JOIN Producto n on d.Producto_id_producto = n.id_producto
GROUP BY p.id_pais
ORDER BY SUM(n.precio*d.cantidad) ASC
LIMIT 1);
end $$

-- CONSULTA 5
DELIMITER $$
CREATE PROCEDURE Consulta5()
begin
select p.id_pais ,p.nombre, SUM(n.precio*d.cantidad) AS 'MONTO TOTAL'
from Pais p
INNER JOIN Vendedor v on v.Pais_id_pais = p.id_pais
INNER JOIN Detalle d on d.Vendedor_id_vendedor = v.id_vendedor 
INNER JOIN Producto n on d.Producto_id_producto = n.id_producto
GROUP BY p.id_pais
ORDER BY SUM(n.precio*d.cantidad) ASC
LIMIT 5;
end $$

-- CONSULTA 6
DELIMITER $$
CREATE PROCEDURE Consulta6()
begin
(select c.nombre, COUNT(d.cantidad) AS 'UNIDADES'
from Categoria c
INNER JOIN Producto p on p.Categoria_id_categoria = c.id_categoria
INNER JOIN Detalle d on d.Producto_id_producto = p.id_producto
GROUP BY c.id_categoria
ORDER BY SUM(p.precio*d.cantidad) ASC
LIMIT 1)
UNION
(select c.nombre, COUNT(d.cantidad) AS 'UNIDADES'
from Categoria c
INNER JOIN Producto p on p.Categoria_id_categoria = c.id_categoria
INNER JOIN Detalle d on d.Producto_id_producto = p.id_producto
GROUP BY c.id_categoria
ORDER BY SUM(p.precio*d.cantidad) DESC
LIMIT 1);
end $$

-- CONSULTA 7
DELIMITER $$
CREATE PROCEDURE Consulta7()
begin
select t.nombre AS 'CIUDAD', c.nombre 'CATEGORIA', COUNT(d.cantidad) AS 'UNIDADES'
from Categoria c
INNER JOIN Producto p on p.Categoria_id_categoria = c.id_categoria
INNER JOIN Detalle d on d.Producto_id_producto = p.id_producto
INNER JOIN Orden o on o.id_orden = d.Orden_id_orden
INNER JOIN Cliente e on e.id_cliente = o.Cliente_id_cliente
INNER JOIN Pais t on t.id_pais = e.Pais_id_pais
GROUP BY c.id_categoria AND t.id_pais
ORDER BY SUM(p.precio*d.cantidad) DESC
LIMIT 1;
end $$

-- CONSULTA 8
DELIMITER $$
CREATE PROCEDURE Consulta8()
begin
select EXTRACT(MONTH FROM o.fecha_orden) AS MES, SUM(p.precio*d.cantidad) AS 'Ventas'
from Orden o
INNER JOIN Detalle d on d.Orden_id_orden = o.id_orden
INNER JOIN Producto p on p.id_producto = d.Producto_id_producto
INNER JOIN vendedor v on v.id_vendedor = d.Vendedor_id_vendedor
INNER JOIN Pais t on t.id_pais = v.Pais_id_pais
WHERE t.nombre = 'Inglaterra'
GROUP BY t.id_pais;
end $$

-- CONSULTA 9
DELIMITER $$
CREATE PROCEDURE Consulta9()
begin
(select EXTRACT(MONTH FROM o.fecha_orden) AS MES, SUM(p.precio*d.cantidad) AS 'Ventas'
from Orden o
INNER JOIN Detalle d on d.Orden_id_orden = o.id_orden
INNER JOIN Producto p on p.id_producto = d.Producto_id_producto
GROUP BY o.id_orden
ORDER BY SUM(p.precio*d.cantidad) DESC
LIMIT 1)
UNION
(select EXTRACT(MONTH FROM o.fecha_orden) AS MES, SUM(p.precio*d.cantidad) AS 'Ventas'
from Orden o
INNER JOIN Detalle d on d.Orden_id_orden = o.id_orden
INNER JOIN Producto p on p.id_producto = d.Producto_id_producto
GROUP BY o.id_orden
ORDER BY SUM(p.precio*d.cantidad) ASC
LIMIT 1);
end $$

-- CONSULTA 10
DELIMITER $$
CREATE PROCEDURE Consulta10()
begin
select p.id_producto, p.nombre AS 'PRODUCTO', SUM(p.precio*d.cantidad) AS 'MONTO'
from Producto p
INNER JOIN Detalle d on d.Producto_id_producto = p.id_producto
INNER JOIN categoria c on c.id_categoria = p.Categoria_id_categoria
WHERE c.nombre = 'Deportes'
GROUP BY p.id_producto;
end $$




