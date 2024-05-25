CREATE OR ALTER PROCEDURE Stock.sp_FiltrarVehiculosDisponibles
	@Marca VARCHAR(50),
	@Modelo VARCHAR(100),
	@Precio DECIMAL(19,2)
AS
BEGIN
	BEGIN TRY

		SELECT 
			ViewVehiculos.IDProducto,
			ViewVehiculos.MarcaVehiculo,
			ViewVehiculos.ModeloVehiculo,
			ViewVehiculos.PaisImportacion,
			ViewVehiculos.DestinadoVenta,
			ViewVehiculos.Precio,
			ViewVehiculos.CantidadProducto,
			ViewVehiculos.Ubicacion
		FROM view_VehiculosDisponibles AS ViewVehiculos
		WHERE (ViewVehiculos.MarcaVehiculo = @Marca OR @Marca IS NULL)
			AND(ViewVehiculos.ModeloVehiculo = @Modelo OR @Modelo IS NULL)
			AND(ViewVehiculos.Precio = @Precio OR @Precio IS NULL)

	END TRY
	BEGIN CATCH
		SELECT 'NO DATA' AS Respuesta
	END CATCH
END
GO
