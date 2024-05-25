USE Agencia_De_Vehiculos_Electricos
GO

CREATE TABLE Stock.Componente (
    IDComponente INT PRIMARY KEY IDENTITY,
    NombreComponente VARCHAR(100) NOT NULL,
	MarcaComponente VARCHAR(50) NOT NULL,
    DescripcionComponente VARCHAR(100),
	CategoriaComponente VARCHAR(50) NOT NULL,
    IDProducto INT NOT NULL,
    IDVehiculo INT NOT NULL,
	CONSTRAINT fk_Producto_Componente
	FOREIGN KEY (IDProducto)
	REFERENCES Stock.Producto(IDProducto),
	CONSTRAINT fk_Vehiculo_Componente
	FOREIGN KEY (IDVehiculo)
	REFERENCES Stock.Vehiculo(IDVehiculo)
);
