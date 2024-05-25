CREATE OR ALTER PROCEDURE FinanzaVenta.sp_RegistrarCliente
	@NombreCliente VARCHAR(50),
	@TelefonoCliente VARCHAR(15),
	@CorreoCliente VARCHAR(100),
	@Identificacion VARCHAR(100)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION;

		IF @NombreCliente IS NULL
		BEGIN
			ROLLBACK;
			RETURN 0;
		END

		IF @TelefonoCliente IS NULL  
		BEGIN
			ROLLBACK;
			RETURN 0;
		END

		IF @CorreoCliente IS NULL
		BEGIN
			ROLLBACK;
			RETURN 0;
		END

		IF @Identificacion IS NULL
		BEGIN
			ROLLBACK;
			RETURN 0;
		END

		INSERT INTO FinanzaVenta.Cliente
		(NombreCliente, Telefono, [CorreoElectronico], Identificacion)
		VALUES (@NombreCliente, @TelefonoCliente, @CorreoCliente, @Identificacion)
		
		COMMIT;
		RETURN 1;
	END TRY
	BEGIN CATCH
		ROLLBACK;
		RETURN 0;
	END CATCH
END
GO
