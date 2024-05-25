CREATE OR ALTER VIEW Stock.view_VehiculosDisponibles
AS
	SELECT
		Vehiculo.IDProducto,
		Vehiculo.MarcaVehiculo,
		Vehiculo.ModeloVehiculo,
		Vehiculo.PaisImportacion,
		Vehiculo.DestinadoVenta,
		Producto.Precio,
		Stock.CantidadProducto,
		'ID : '+CAST(Almacen.IDAlmacen AS VARCHAR)+' Ubicacion '+Almacen.NombreAlmacen+', '+Almacen.Ubicacion AS Ubicacion
	FROM Stock.Vehiculo AS Vehiculo
	INNER JOIN Stock.Stock AS Stock
		ON Vehiculo.IDProducto = Stock.IDProducto
		INNER JOIN Stock.Almacen AS Almacen
			ON Stock.IDAlmacen = Almacen.IDAlmacen
			INNER JOIN Stock.Producto AS Producto
				ON Producto.IDProducto = Vehiculo.IDProducto
	WHERE Stock.Disponible = 1
GO
