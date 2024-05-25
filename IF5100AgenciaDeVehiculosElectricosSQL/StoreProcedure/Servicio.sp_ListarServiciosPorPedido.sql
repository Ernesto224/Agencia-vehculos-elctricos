CREATE OR ALTER PROCEDURE Servicio.sp_ListarServiciosPorPedido
    @IDPedido INT
AS
BEGIN
    BEGIN TRY
        -- Verificar si el pedido existe
        IF NOT EXISTS (SELECT 1 FROM FinanzaVenta.Pedido WHERE IDPedido = @IDPedido)
        BEGIN
            RETURN -1; -- Pedido no existe
        END

        -- Obtener los servicios relacionados con el pedido
        SELECT 
            s.IDServicio,
            s.NombreServicio,
            s.Descripcion
        FROM Servicio.view_ListarTodosLosServicios s
        JOIN Servicio.ServicioPedido sp ON s.IDServicio = sp.IDServicio
        WHERE sp.IDPedido = @IDPedido;

        RETURN 0; -- �xito
    END TRY
    BEGIN CATCH
        -- Manejar el error aqu� seg�n sea necesario
        RETURN -1; -- Error
    END CATCH
END
GO