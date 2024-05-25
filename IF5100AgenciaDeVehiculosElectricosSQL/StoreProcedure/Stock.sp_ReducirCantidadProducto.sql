CREATE OR ALTER PROCEDURE Stock.sp_ReducirCantidadProducto
    @IDProducto INT,
    @IDAlmacen INT,
    @CantidadReducir INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Verificar la existencia del producto en el almac�n
        IF NOT EXISTS (SELECT 1 FROM Stock.Stock WHERE IDProducto = @IDProducto AND IDAlmacen = @IDAlmacen)
        BEGIN
            ROLLBACK;
            RETURN -1;
        END

        -- Obtener la cantidad actual del producto en el almac�n
        DECLARE @CantidadActual INT;
        SELECT @CantidadActual = CantidadProducto FROM Stock.Stock WHERE IDProducto = @IDProducto AND IDAlmacen = @IDAlmacen;

        -- Verificar si la cantidad a reducir no excede la cantidad actual
        IF @CantidadActual < @CantidadReducir
        BEGIN
            ROLLBACK;
            RETURN -1;
        END

        -- Reducir la cantidad del producto en el almac�n
        UPDATE Stock.Stock
        SET CantidadProducto = CantidadProducto - @CantidadReducir
        WHERE IDProducto = @IDProducto AND IDAlmacen = @IDAlmacen;

        -- Verificar si la cantidad resultante es igual a 0 para actualizar el bit de disponibilidad
        IF (@CantidadActual - @CantidadReducir) = 0
        BEGIN
            UPDATE Stock.Stock
            SET Disponible = 0
            WHERE IDProducto = @IDProducto AND IDAlmacen = @IDAlmacen;
        END

        COMMIT;
        RETURN 1;
    END TRY
    BEGIN CATCH
        ROLLBACK;
        RETURN -1;
    END CATCH;
END
GO