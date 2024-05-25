CREATE OR ALTER PROCEDURE FinanzaVenta.sp_ListarPedidosPendientesPorCliente
    @IDCliente INT
AS
BEGIN
    SELECT 
		Pedido.IDPedido, 
		Pedido.FechaPedido, 
		Pedido.EstadoPedido, 
		Pedido.MontoPedido
    FROM FinanzaVenta.Pedido AS Pedido
    WHERE Pedido.IDCliente = @IDCliente 
		AND Pedido.EstadoPedido = 'pendiente';
END
GO
