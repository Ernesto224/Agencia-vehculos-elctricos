USE Agencia_De_Vehiculos_Electricos
GO
-- Tabla: Vehículo 3NF
CREATE TABLE Stock.Vehiculo (
    IDVehiculo INT PRIMARY KEY IDENTITY,
    MarcaVehiculo VARCHAR(50) NOT NULL,
    ModeloVehiculo VARCHAR(100) NOT NULL,
    PaisImportacion VARCHAR(100) NOT NULL,
    DestinadoVenta VARCHAR(10) NOT NULL 
	CHECK (DestinadoVenta IN ('Publica', 'Privada')),
	IDProducto INT NOT NULL,
	IDTipoVehiculo INT NOT NULL,
	CONSTRAINT fk_Producto_Vehiculo
	FOREIGN KEY (IDProducto)
	REFERENCES Stock.Producto(IDProducto),
	CONSTRAINT fk_TipoVehiculo_Vehiculo
	FOREIGN KEY (IDTipoVehiculo)
	REFERENCES Stock.TipoVehiculo(IDTipoVehiculo)	
);
