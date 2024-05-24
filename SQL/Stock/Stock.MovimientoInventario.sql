USE Agencia_De_Vehiculos_Electricos
GO

-- Tabla: MovimientoInventario 3NF
CREATE TABLE Stock.MovimientoInventario (
    IDMovimiento INT PRIMARY KEY IDENTITY,
    FechaMovimiento DATE NOT NULL,
    TipoMovimiento VARCHAR(100) NOT NULL,
    CantidadMovida INT NOT NULL,
    IDProducto INT NOT NULL,
    IDAlmacen INT NOT NULL,
	IDEmpleado INT NOT NULL,
	IDPedido INT,
	CONSTRAINT fk_Producto_MovimientoInventario
	FOREIGN KEY (IDProducto)
	REFERENCES Stock.Producto(IDProducto),
	CONSTRAINT fk_Almacen_MovimientoInventario
	FOREIGN KEY (IDAlmacen)
	REFERENCES Stock.Almacen(IDAlmacen),
	CONSTRAINT fk_Empleado_MovimientoInventario
	FOREIGN KEY (IDEmpleado)
	REFERENCES RRHH.Empleado(IDEmpleado),
	CONSTRAINT fk_Pedido_MovimientoInventario
	FOREIGN KEY (IDPedido)
	REFERENCES FinanzaVenta.Pedido(IDPedido)
);
