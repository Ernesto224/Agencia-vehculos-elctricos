USE Agencia_De_Vehiculos_Electricos
GO

--Tabla:TipoVehiculo 3NF
CREATE TABLE Stock.TipoVehiculo (
    IDTipoVehiculo INT PRIMARY KEY IDENTITY,
    Nombre VARCHAR(20) NOT NULL
);