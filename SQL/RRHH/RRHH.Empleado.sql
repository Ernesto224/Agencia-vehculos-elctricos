USE Agencia_De_Vehiculos_Electricos
GO

-- Tabla: Empleado 3NF
CREATE TABLE RRHH.Empleado (
    IDEmpleado INT PRIMARY KEY IDENTITY,
    Nombre VARCHAR(20) NOT NULL,
    Apellido VARCHAR(30) NOT NULL,
    FechaContratacion DATE NOT NULL,
    Salario DECIMAL(19, 2) NOT NULL,
    CorreoElectronico VARCHAR(100) NOT NULL,
    Telefono VARCHAR(15),
    Activo BIT NOT NULL,
    IDPuesto INT NOT NULL,
    IDDepartamento INT NOT NULL,
	CONSTRAINT fk_Puesto_Empleado
	FOREIGN KEY (IDPuesto)
	REFERENCES RRHH.Puesto(IDPuesto),
	CONSTRAINT fk_Departamento_Empleado
	FOREIGN KEY (IDDepartamento)
	REFERENCES RRHH.Departamento(IDDepartamento)
);
