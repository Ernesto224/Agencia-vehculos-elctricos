USE Agencia_De_Vehiculos_Electricos
GO
-- Tabla: Producto 3NF
CREATE TABLE Stock.Producto (
    IDProducto INT PRIMARY KEY IDENTITY,
    Precio DECIMAL(19, 2) NOT NULL
);
