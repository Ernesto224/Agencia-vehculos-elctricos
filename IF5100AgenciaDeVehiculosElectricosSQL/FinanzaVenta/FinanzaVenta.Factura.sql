USE Agencia_De_Vehiculos_Electricos
GO

-- Tabla: Factura 3NF
CREATE TABLE FinanzaVenta.Factura (
    IDFactura INT PRIMARY KEY IDENTITY,
    FechaFactura DATE NOT NULL,
    TotalFactura DECIMAL(19, 2) NOT NULL,
    ProvedorEnvio VARCHAR(100),
    DireccionEnvio VARCHAR(300),
	TrakingPedido VARCHAR(50)
);
