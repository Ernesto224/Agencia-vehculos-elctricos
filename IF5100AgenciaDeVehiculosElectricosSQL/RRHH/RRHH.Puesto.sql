USE Agencia_De_Vehiculos_Electricos
GO

-- Tabla: Puesto 3NF
CREATE TABLE RRHH.Puesto (
    IDPuesto INT PRIMARY KEY IDENTITY,
    NombrePuesto VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(300)
);
