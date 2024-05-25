USE Agencia_De_Vehiculos_Electricos
GO

-- Tabla: Pedido 3NF
CREATE TABLE FinanzaVenta.Pedido (
    IDPedido INT PRIMARY KEY IDENTITY,
    FechaPedido DATE NOT NULL,
    EstadoPedido VARCHAR(10) NOT NULL DEFAULT('pendiente'),
    MontoPedido DECIMAL(19, 2),
    IDCliente INT NOT NULL,
	IDFactura INT,
	CONSTRAINT fk_Cliente_Pedido
	FOREIGN KEY (IDCliente)
	REFERENCES FinanzaVenta.Cliente(IDCliente),
	CONSTRAINT fk_Factura_Pedido
	FOREIGN KEY (IDFactura)
	REFERENCES FinanzaVenta.Factura(IDFactura)
);
