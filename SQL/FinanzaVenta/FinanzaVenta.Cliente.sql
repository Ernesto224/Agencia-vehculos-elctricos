USE Agencia_De_Vehiculos_Electricos
GO

-- Tabla: Cliente 3NF
CREATE TABLE FinanzaVenta.Cliente (
    IDCliente INT PRIMARY KEY IDENTITY,
    Identificacion VARCHAR(64) NOT NULL,
	NombreCliente VARCHAR(50) NOT NULL,
    Telefono VARCHAR(15),
    CorreoElectronico VARCHAR(100) NOT NULL
);
