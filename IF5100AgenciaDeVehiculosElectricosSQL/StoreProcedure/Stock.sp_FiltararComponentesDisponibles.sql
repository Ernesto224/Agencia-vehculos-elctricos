CREATE OR ALTER PROCEDURE Stock.sp_FiltararComponentesDisponibles
	@MarcaComponente VARCHAR(50),
	@NombreComponente VARCHAR(50),
	@CategoriaComponente VARCHAR(50)
AS
BEGIN
	BEGIN TRY
		
		SELECT
			ViewComponentes.IDProducto,
			ViewComponentes.NombreComponente,
			ViewComponentes.MarcaComponente,
			ViewComponentes.DescripcionComponente,
			ViewComponentes.CategoriaComponente,
			ViewComponentes.CantidadProducto,
			ViewComponentes.Ubicacion,
			ViewComponentes.Disponible
		FROM view_ComponentesDisponibles AS ViewComponentes
		WHERE (ViewComponentes.MarcaComponente = @MarcaComponente OR @MarcaComponente IS NULL)
			AND (ViewComponentes.NombreComponente = @NombreComponente OR @NombreComponente IS NULL)
			AND (ViewComponentes.CategoriaComponente = @CategoriaComponente OR @CategoriaComponente IS NULL)

	END TRY
	BEGIN CATCH
		SELECT 'NO DATA' AS Respuesta
	END CATCH
END
GO
