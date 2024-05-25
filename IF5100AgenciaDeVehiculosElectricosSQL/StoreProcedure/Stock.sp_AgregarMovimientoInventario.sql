CREATE OR ALTER PROCEDURE Stock.sp_AgregarMovimientoInventario
    @CantidadMovida INT,
    @IDProducto INT,
    @IDAlmacen INT,
    @IDEmpleado INT,
    @IDPedido INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Validar existencia del producto
        IF NOT EXISTS (SELECT 1 FROM Stock.Producto WHERE IDProducto = @IDProducto)
        BEGIN
            ROLLBACK;
            RETURN -1;
        END

        -- Validar existencia del almac�n
        IF NOT EXISTS (SELECT 1 FROM Stock.Almacen WHERE IDAlmacen = @IDAlmacen)
        BEGIN
            ROLLBACK;
            RETURN -1;
        END

        -- Validar existencia del empleado
        IF NOT EXISTS (SELECT 1 FROM RRHH.Empleado WHERE IDEmpleado = @IDEmpleado AND IDPuesto = 3)
        BEGIN
            ROLLBACK;
            RETURN -1;
        END

        -- Validar existencia del pedido si se proporciona
        IF NOT EXISTS (SELECT 1 FROM FinanzaVenta.Pedido WHERE IDPedido = @IDPedido)
        BEGIN
            ROLLBACK;
            RETURN -1;
        END

        -- Llamar al procedimiento para reducir la cantidad del producto en el almac�n
        DECLARE @ResultadoReduccion INT;
        EXEC @ResultadoReduccion = Stock.sp_ReducirCantidadProducto @IDProducto, @IDAlmacen, @CantidadMovida;

        -- Verificar el resultado del procedimiento de reducci�n de cantidad
        IF @ResultadoReduccion <> 1
        BEGIN
            ROLLBACK;
            RETURN -1;
        END

        -- Insertar el movimiento de inventario
        INSERT INTO Stock.MovimientoInventario (FechaMovimiento, TipoMovimiento, CantidadMovida, IDProducto, IDAlmacen, IDEmpleado, IDPedido)
        VALUES (GETDATE(), 'salida', @CantidadMovida, @IDProducto, @IDAlmacen, @IDEmpleado, @IDPedido);

        COMMIT;
        RETURN 0; -- �xito
    END TRY
    BEGIN CATCH
        ROLLBACK;
        RETURN -1;
    END CATCH;
END
GO