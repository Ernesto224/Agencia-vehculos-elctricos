USE Agencia_De_Vehiculos_Electricos
GO

-- Tabla: Servicio 3FN
CREATE TABLE Servicio.Servicio (
    IDServicio INT PRIMARY KEY IDENTITY,
    NombreServicio VARCHAR(100) NOT NULL,
    Descripcion VARCHAR(300)
);
