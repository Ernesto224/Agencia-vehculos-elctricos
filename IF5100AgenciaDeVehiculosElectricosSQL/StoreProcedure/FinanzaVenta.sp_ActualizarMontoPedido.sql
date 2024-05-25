CREATE OR ALTER PROCEDURE FinanzaVenta.sp_ActualizarMontoPedido
    @IDPedido INT,
    @MontoTotal DECIMAL(19, 2)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Validar existencia del pedido
        IF NOT EXISTS (SELECT 1 FROM FinanzaVenta.Pedido WHERE IDPedido = @IDPedido)
        BEGIN
            ROLLBACK;
            RETURN -1;
        END

        -- Actualizar el monto total del pedido
        UPDATE FinanzaVenta.Pedido
        SET MontoPedido = @MontoTotal
        WHERE IDPedido = @IDPedido;

        COMMIT;
        RETURN @MontoTotal; -- �xito
    END TRY
    BEGIN CATCH
        ROLLBACK;
        -- Manejar el error aqu� seg�n sea necesario
        RETURN -1; -- Error
    END CATCH
END
GO