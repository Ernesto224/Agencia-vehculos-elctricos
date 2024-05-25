CREATE OR ALTER VIEW Stock.view_AccesoriosDisponibles
AS
SELECT 
	Producto.IDProducto,
	Accesorio.NombreAccesorio,
	Accesorio.MarcaAccesorio,
	Accesorio.DescripcionAccesorio,
	Accesorio.CategoriaAccesorio,
	Stock.CantidadProducto,
	'ID : '+CAST(Almacen.IDAlmacen AS VARCHAR)+' Ubicacion '+Almacen.NombreAlmacen+', '+Almacen.Ubicacion AS Ubicacion,
	Stock.Disponible
FROM Stock.Producto AS Producto
	INNER JOIN Stock.Accesorio AS Accesorio
		ON Producto.IDProducto = Accesorio.IDProducto
			INNER JOIN Stock.Stock AS Stock
				ON Producto.IDProducto = Stock.IDProducto
					INNER JOIN Stock.Almacen AS Almacen
					ON Stock.IDAlmacen = Almacen.IDAlmacen
WHERE Stock.Disponible = 1
GO