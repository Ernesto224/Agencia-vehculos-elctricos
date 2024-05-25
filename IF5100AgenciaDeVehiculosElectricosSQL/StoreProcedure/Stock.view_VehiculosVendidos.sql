CREATE OR ALTER VIEW Stock.view_VehiculosVendidos 
AS
SELECT 
    Vehiculo.IDVehiculo,
    Vehiculo.MarcaVehiculo,
    Vehiculo.ModeloVehiculo,
    Producto.Precio,
    Pedido.IDPedido,
    Factura.FechaFactura AS FechaVenta,
    Cliente.NombreCliente,
    Cliente.CorreoElectronico AS CorreoCliente,
    Factura.TotalFactura AS PrecioVenta,
	Vehiculo.IDTipoVehiculo
FROM Stock.Vehiculo AS Vehiculo
INNER JOIN Stock.Producto AS Producto 
	ON Vehiculo.IDProducto = Producto.IDProducto
    INNER JOIN FinanzaVenta.Pedido AS Pedido 
		ON Pedido.IDPedido = Vehiculo.IDVehiculo
		INNER JOIN FinanzaVenta.Cliente AS Cliente 
			ON Pedido.IDCliente = Cliente.IDCliente
			INNER JOIN FinanzaVenta.Factura AS Factura 
				ON Pedido.IDFactura = Factura.IDFactura
WHERE Pedido.EstadoPedido = 'vendido';
GO