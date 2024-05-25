USE Agencia_De_Vehiculos_Electricos
GO

CREATE TABLE Stock.Almacen (
    IDAlmacen INT PRIMARY KEY IDENTITY,
    NombreAlmacen VARCHAR(100) NOT NULL,
    Ubicacion VARCHAR(300) NOT NULL
);
