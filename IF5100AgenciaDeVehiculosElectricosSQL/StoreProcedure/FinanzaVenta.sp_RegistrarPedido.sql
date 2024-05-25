CREATE OR ALTER PROCEDURE FinanzaVenta.sp_RegistrarPedido
    @IDCliente INT
AS
BEGIN
    DECLARE @IDPedido INT;

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Validar existencia del cliente
        IF NOT EXISTS (SELECT 1 FROM FinanzaVenta.Cliente WHERE IDCliente = @IDCliente)
        BEGIN
            RAISERROR('Cliente no existe', 16, 1);
            ROLLBACK;
            RETURN -1;
        END

        -- Insertar el pedido
        INSERT INTO FinanzaVenta.Pedido (FechaPedido, IDCliente)
        VALUES (GETDATE(), @IDCliente);

        -- Obtener el ID del pedido insertado
        SET @IDPedido = SCOPE_IDENTITY();

        COMMIT;
        RETURN @IDPedido;
    END TRY
    BEGIN CATCH
        ROLLBACK;
        RETURN -1;
    END CATCH;
END
GO