USE Agencia_De_Vehiculos_Electricos
GO

-- Tabla: Departamento 3FN
CREATE TABLE RRHH.Departamento (
    IDDepartamento INT PRIMARY KEY IDENTITY,
    NombreDepartamento VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(300)
);
