USE Agencia_De_Vehiculos_Electricos
GO

-- Tabla: Stock 3NF
CREATE TABLE Stock.Stock (
    IDProducto INT NOT NULL,
    IDAlmacen INT NOT NULL,
    CantidadProducto INT NOT NULL,
    Disponible BIT NOT NULL,
    PRIMARY KEY (IDProducto, IDAlmacen),
	CONSTRAINT fk_Producto_Stock
	FOREIGN KEY (IDProducto)
	REFERENCES Stock.Producto(IDProducto),
	CONSTRAINT fk_Almacen_Stock
	FOREIGN KEY (IDAlmacen)
	REFERENCES Stock.Almacen(IDAlmacen)
);
