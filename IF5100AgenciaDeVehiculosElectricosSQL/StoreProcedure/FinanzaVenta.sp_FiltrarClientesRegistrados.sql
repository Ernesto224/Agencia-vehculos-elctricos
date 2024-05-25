CREATE OR ALTER PROCEDURE FinanzaVenta.sp_FiltrarClientesRegistrados
	@Identificacion nvarchar(65)
AS
BEGIN
	BEGIN TRY
		
		SELECT
			Clientes.IDCliente,
			CONCAT(SUBSTRING(Clientes.Identificacion, 4, LEN(Clientes.Identificacion)), '####') AS Identificacion,
			Clientes.NombreCliente,
			Clientes.Telefono,
			Clientes.CorreoElectronico
		FROM FinanzaVenta.view_ListarClientesRegistrados AS Clientes
		WHERE (Clientes.Identificacion = @Identificacion OR @Identificacion IS NULL)
		
	END TRY
	BEGIN CATCH
		SELECT 'NO DATA' AS Respuesta
	END CATCH

END
GO