USE Agencia_De_Vehiculos_Electricos
GO

-- Tabla: Accesorio 3NF
CREATE TABLE Stock.Accesorio (
    IDAccesorio INT PRIMARY KEY IDENTITY,
    NombreAccesorio VARCHAR(100) NOT NULL,
	MarcaAccesorio VARCHAR(50) NOT NULL,
    DescripcionAccesorio VARCHAR(100),
	CategoriaAccesorio VARCHAR(50) NOT NULL,
    IDProducto INT NOT NULL,
	CONSTRAINT fk_Producto_Accesorio
	FOREIGN KEY (IDProducto)
	REFERENCES Stock.Producto(IDProducto)
);
