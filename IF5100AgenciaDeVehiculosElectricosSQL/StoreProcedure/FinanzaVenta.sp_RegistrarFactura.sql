CREATE OR ALTER PROCEDURE FinanzaVenta.sp_RegistrarFactura
    @IDPedido INT,
    @IDCliente INT,
    @ProvedorEnvio VARCHAR(100) = NULL,
    @DireccionEnvio VARCHAR(300) = NULL,
    @TrakingPedido VARCHAR(50) = NULL,
    @MontoTotal DECIMAL(19, 2)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Verificar si el pedido existe
        IF NOT EXISTS (SELECT 1 FROM FinanzaVenta.Pedido WHERE IDPedido = @IDPedido)
        BEGIN
            ROLLBACK;
            RETURN -1; -- Error: El pedido no existe
        END

        -- Verificar si el cliente existe
        IF NOT EXISTS (SELECT 1 FROM FinanzaVenta.Cliente WHERE IDCliente = @IDCliente)
        BEGIN
            ROLLBACK;
            RETURN -1; -- Error: El cliente no existe
        END

        -- Insertar una nueva factura
        DECLARE @IDFactura INT;
        INSERT INTO FinanzaVenta.Factura (FechaFactura, TotalFactura, ProvedorEnvio, DireccionEnvio, TrakingPedido)
        VALUES (GETDATE(), @MontoTotal, @ProvedorEnvio, @DireccionEnvio, @TrakingPedido);

        -- Obtener el ID de la factura recién insertada
        SET @IDFactura = SCOPE_IDENTITY();
        print(@IDFactura);

        -- Asociar la factura al pedido
        UPDATE FinanzaVenta.Pedido
        SET IDFactura = @IDFactura,
        EstadoPedido = 'vendido'
        WHERE IDPedido = @IDPedido;

        COMMIT;
        RETURN @IDFactura;
    END TRY
    BEGIN CATCH
        ROLLBACK;
        RETURN -1;
    END CATCH;
END
GO
