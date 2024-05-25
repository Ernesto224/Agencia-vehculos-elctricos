USE Agencia_De_Vehiculos_Electricos
GO

-- Tabla: Servicio_Pedido 
CREATE TABLE Servicio.ServicioPedido (
    IDServicio INT NOT NULL,
    IDPedido INT NOT NULL,
	IDEmpleado INT NOT NULL,
	CONSTRAINT fk_Servicio_ServicioPedido
	FOREIGN KEY (IDServicio)
	REFERENCES Servicio.Servicio(IDServicio),
	CONSTRAINT fk_Pedido_ServicioPedido
	FOREIGN KEY (IDPedido)
	REFERENCES FinanzaVenta.Pedido(IDPedido),
	CONSTRAINT fk_Empleado_ServicioPedido
	FOREIGN KEY (IDEmpleado)
	REFERENCES RRHH.Empleado(IDEmpleado),
    PRIMARY KEY (IDServicio, IDPedido)
);

