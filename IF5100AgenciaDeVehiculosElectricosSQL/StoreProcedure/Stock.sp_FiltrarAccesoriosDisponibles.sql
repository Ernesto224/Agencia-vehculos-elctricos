CREATE OR ALTER PROCEDURE Stock.sp_FiltrarAccesoriosDisponibles
	@MarcaAccesorio VARCHAR(50),
	@NombreAccesorio VARCHAR(50),
	@CategoriaAccesorio VARCHAR(50)
AS
BEGIN
	BEGIN TRY
		
		SELECT
			ViewAccesorios.IDProducto,
			ViewAccesorios.NombreAccesorio,
			ViewAccesorios.MarcaAccesorio,
			ViewAccesorios.DescripcionAccesorio,
			ViewAccesorios.CategoriaAccesorio,
			ViewAccesorios.CantidadProducto,
			ViewAccesorios.Ubicacion,
			ViewAccesorios.Disponible
		FROM view_AccesoriosDisponibles AS ViewAccesorios
		WHERE (ViewAccesorios.MarcaAccesorio = @MarcaAccesorio OR @MarcaAccesorio IS NULL)
			AND (ViewAccesorios.NombreAccesorio = @NombreAccesorio OR @NombreAccesorio IS NULL)
			AND (ViewAccesorios.CategoriaAccesorio = @CategoriaAccesorio OR @CategoriaAccesorio IS NULL)

	END TRY
	BEGIN CATCH
		SELECT 'NO DATA' AS Respuesta
	END CATCH
END
GO
