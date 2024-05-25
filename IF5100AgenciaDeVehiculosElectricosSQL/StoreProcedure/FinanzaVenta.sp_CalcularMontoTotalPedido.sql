CREATE OR ALTER PROCEDURE FinanzaVenta.sp_CalcularMontoTotalPedido
    @IDPedido INT
AS
BEGIN
	DECLARE @MontoTotal DECIMAL(19, 2);
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Validar existencia del pedido
        IF NOT EXISTS (SELECT 1 FROM FinanzaVenta.Pedido WHERE IDPedido = @IDPedido)
        BEGIN
            ROLLBACK;
            RETURN -1;
        END

        -- Calcular el monto total sumando los precios de 
		--los productos asociados al pedido en los movimientos de inventario
        SELECT @MontoTotal = SUM(p.Precio * mi.CantidadMovida)
        FROM Stock.MovimientoInventario mi
        JOIN Stock.Producto p ON mi.IDProducto = p.IDProducto
        WHERE mi.IDPedido = @IDPedido;

        -- Actualizar el monto del pedido en la tabla Pedido
        UPDATE FinanzaVenta.Pedido
        SET MontoPedido = @MontoTotal
        WHERE IDPedido = @IDPedido;

        COMMIT;
        -- Retornar el monto total
        RETURN @MontoTotal;
    END TRY
    BEGIN CATCH
        ROLLBACK;
        RETURN -1;
    END CATCH;
END
GO