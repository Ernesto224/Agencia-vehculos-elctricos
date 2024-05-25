CREATE OR ALTER PROCEDURE FinanzaVenta.sp_ListarProductosAgregados
	@IDPedido INT
AS
BEGIN
	BEGIN TRY
		
		SELECT
			Movimiento.IDProducto,
			Vehiculo.MarcaVehiculo +' '+Vehiculo.ModeloVehiculo AS Vehiculo,
			Accesorio.MarcaAccesorio +' '+Accesorio.NombreAccesorio AS Accesorio,
			Componente.MarcaComponente +' '+Componente.NombreComponente AS Componenente,
			Movimiento.CantidadMovida
		FROM Stock.MovimientoInventario AS Movimiento
		LEFT JOIN Stock.Vehiculo AS Vehiculo
			ON Movimiento.IDProducto = Vehiculo.IDProducto
			Left JOIN Stock.Accesorio AS Accesorio
				ON Movimiento.IDProducto = Accesorio.IDProducto
				left JOIN Stock.Componente AS Componente
					ON Movimiento.IDProducto = Componente.IDProducto
		WHERE Movimiento.IDPedido = @IDPedido;

	END TRY
	BEGIN CATCH
		SELECT 'NO DATA' AS Respuesta
	END CATCH

END
GO