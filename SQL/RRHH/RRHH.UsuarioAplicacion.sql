USE Agencia_De_Vehiculos_Electricos
GO

-- Tabla: UsuarioAplicacion
CREATE TABLE RRHH.UsuarioAplicacion(
	IDEmpleado INT NOT NULL,
	NombreUsuario VARCHAR(20) NOT NULL,
	Contrasenia VARCHAR(200) NOT NULL,
	CONSTRAINT fk_Empleado_UsuarioAplicacion
	FOREIGN KEY (IDEmpleado)
	REFERENCES RRHH.Empleado(IDEmpleado),
	PRIMARY KEY(IDEmpleado)
)
