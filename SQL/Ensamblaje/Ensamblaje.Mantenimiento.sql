USE Agencia_De_Vehiculos_Electricos
GO

-- Tabla: Mantenimiento 3NF
CREATE TABLE Ensamblaje.Mantenimiento (
    IDMantenimiento INT PRIMARY KEY IDENTITY,
    FechaActualizacion DATE,
    Estado VARCHAR(20) NOT NULL,
    PruebasQA BIT,
    Listo BIT,
    IDVehiculo INT NOT NULL,
    IDDepartamento INT NOT NULL,
    IDServicio INT,
	CONSTRAINT fk_Vehiculo_Mantenimiento
	FOREIGN KEY (IDVehiculo)
	REFERENCES Stock.Vehiculo(IDVehiculo),
	CONSTRAINT fk_Departamento_Mantenimiento
	FOREIGN KEY (IDDepartamento)
	REFERENCES RRHH.Departamento(IDDepartamento),
	CONSTRAINT fk_Servicio_Mantenimiento
	FOREIGN KEY (IDServicio)
	REFERENCES Servicio.Servicio(IDServicio),
);
