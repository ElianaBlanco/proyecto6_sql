--Calcular el precio promedio de los productos en cada categoría
SELECT 
    c.nombre AS categoria,
    AVG(p.precio_unitario) AS precio_promedio
FROM Productos p
JOIN Categoria c ON p.categoria_id = c.id
GROUP BY c.nombre;

--Obtener la cantidad total de productos en stock por categoría
SELECT 
    c.nombre AS categoria,
    SUM(s.Cantidad) AS cantidad_total_en_stock
FROM Stocks s
JOIN Productos p ON s.Producto_Id = p.id
JOIN Categoria c ON p.categoria_id = c.id
GROUP BY c.nombre;


--Calcular el total de ventas por sucursal
SELECT 
    o.sucursal_id,
    SUM(i.monto_venta) AS total_ventas_por_sucursal
FROM Órdenes o
JOIN Items i ON o.id = i.orden_id
GROUP BY o.sucursal_id;

--Obtener el cliente que ha realizado el mayor monto de compras
SELECT 
    o.cliente_id,
    SUM(i.monto_venta) AS total_compras
FROM Órdenes o
JOIN Items i ON o.id = i.orden_id
GROUP BY o.cliente_id
ORDER BY total_compras DESC
LIMIT 1;
