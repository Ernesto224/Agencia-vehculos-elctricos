CREATE OR ALTER PROCEDURE Stock.sp_EliminarMovimientoInventario
    @IDPedido INT,
    @IDProducto INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Validar existencia del movimiento de inventario
        IF NOT EXISTS (SELECT 1 FROM Stock.MovimientoInventario WHERE IDPedido = @IDPedido AND IDProducto = @IDProducto)
        BEGIN
            ROLLBACK;
            RETURN -1;
        END

        -- Restaurar la cantidad del producto eliminado
        DECLARE @IDAlmacen INT, @CantidadEliminada INT;
        SELECT @IDAlmacen = IDAlmacen, @CantidadEliminada = CantidadMovida FROM Stock.MovimientoInventario 
		WHERE IDPedido = @IDPedido AND IDProducto = @IDProducto;
        EXEC Stock.sp_RestaurarCantidadProducto @IDProducto, @IDAlmacen, @CantidadEliminada;

		-- Eliminar el movimiento de inventario
        DELETE FROM Stock.MovimientoInventario
        WHERE IDPedido = @IDPedido AND IDProducto = @IDProducto;

        COMMIT;
        RETURN 0; -- �xito
    END TRY
    BEGIN CATCH
        ROLLBACK;
        RETURN -1; -- Error
    END CATCH;
END
GO