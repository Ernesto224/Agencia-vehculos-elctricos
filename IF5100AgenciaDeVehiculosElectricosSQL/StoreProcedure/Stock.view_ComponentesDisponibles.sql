CREATE OR ALTER VIEW Stock.view_ComponentesDisponibles
AS
SELECT 
	Producto.IDProducto,
	Componente.NombreComponente,
	Componente.MarcaComponente,
	Componente.DescripcionComponente,
	Componente.CategoriaComponente,
	Stock.CantidadProducto,
	'ID : '+CAST(Almacen.IDAlmacen AS VARCHAR)+' Ubicacion '+Almacen.NombreAlmacen+', '+Almacen.Ubicacion AS Ubicacion,
	Stock.Disponible
FROM Stock.Producto AS Producto
	INNER JOIN Stock.Componente AS Componente
		ON Producto.IDProducto = Componente.IDProducto
			INNER JOIN Stock.Vehiculo AS Vehiculo
			ON Componente.IDVehiculo = Vehiculo.IDVehiculo
				INNER JOIN Stock.Stock AS Stock
					ON Producto.IDProducto = Stock.IDProducto
						INNER JOIN Stock.Almacen AS Almacen
						ON Stock.IDAlmacen = Almacen.IDAlmacen
WHERE Stock.Disponible = 1
GO
