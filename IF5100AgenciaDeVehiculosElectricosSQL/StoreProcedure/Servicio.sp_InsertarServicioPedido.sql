CREATE OR ALTER PROCEDURE Servicio.sp_InsertarServicioPedido
    @IDPedido INT,
    @IDEmpleado INT,
    @IDServicio INT
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

        -- Validar existencia del empleado
        IF NOT EXISTS (SELECT 1 FROM RRHH.Empleado WHERE IDEmpleado = @IDEmpleado)
        BEGIN
            ROLLBACK;
            RETURN -1;
        END

        -- Validar existencia del servicio
        IF NOT EXISTS (SELECT 1 FROM Servicio.Servicio WHERE IDServicio = @IDServicio)
        BEGIN
            ROLLBACK;
            RETURN -1;
        END

        -- Insertar el registro en Servicio.ServicioPedido
        INSERT INTO Servicio.ServicioPedido (IDServicio, IDPedido, IDEmpleado)
        VALUES (@IDServicio, @IDPedido, @IDEmpleado);

        COMMIT;
        RETURN 0; -- �xito
    END TRY
    BEGIN CATCH
        ROLLBACK;
        -- Manejar el error aqu� seg�n sea necesario
        RETURN -1; -- Error
    END CATCH
END
GO

CREATE OR ALTER VIEW Servicio.view_ListarTodosLosServicios
AS
SELECT 
    IDServicio,
    NombreServicio,
    Descripcion
FROM Servicio.Servicio;
GO