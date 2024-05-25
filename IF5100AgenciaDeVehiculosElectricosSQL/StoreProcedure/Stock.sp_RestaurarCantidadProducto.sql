CREATE OR ALTER PROCEDURE Stock.sp_RestaurarCantidadProducto
    @IDProducto INT,
    @IDAlmacen INT,
    @CantidadAumentar INT
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
        IF @CantidadAumentar < 0
        BEGIN
            ROLLBACK;
            RETURN -1;
        END

        -- Reducir la cantidad del producto en el almac�n
        UPDATE Stock.Stock
        SET CantidadProducto = CantidadProducto + @CantidadAumentar,
		Disponible = 1
        WHERE IDProducto = @IDProducto AND IDAlmacen = @IDAlmacen;

        COMMIT;
        RETURN 1;
    END TRY
    BEGIN CATCH
        ROLLBACK;
        RETURN -1;
    END CATCH;
END
GO