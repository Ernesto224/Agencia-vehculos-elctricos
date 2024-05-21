CREATE DATABASE Agencia_De_Vehiculos_Electricos;
GO

USE Agencia_De_Vehiculos_Electricos
GO

CREATE SCHEMA Stock
GO

BEGIN

-- Tabla: Producto 3NF
CREATE TABLE Stock.Producto (
    IDProducto INT PRIMARY KEY IDENTITY,
    Precio DECIMAL(19, 2) NOT NULL
);

--Tabla:TipoVehiculo 3NF
CREATE TABLE Stock.TipoVehiculo (
    IDTipoVehiculo INT PRIMARY KEY IDENTITY,
    Nombre VARCHAR(20) NOT NULL
);

-- Tabla: Vehículo 3NF
CREATE TABLE Stock.Vehiculo (
    IDVehiculo INT PRIMARY KEY IDENTITY,
    MarcaVehiculo VARCHAR(50) NOT NULL,
    ModeloVehiculo VARCHAR(100) NOT NULL,
    PaisImportacion VARCHAR(100) NOT NULL,
    DestinadoVenta VARCHAR(50) CHECK (DestinadoVenta IN ('Publica', 'Privada')),
	IDProducto INT,
	IDTipoVehiculo INT,
	CONSTRAINT fk_Producto_Vehiculo
	FOREIGN KEY (IDProducto)
	REFERENCES Stock.Producto(IDProducto),
	CONSTRAINT fk_TipoVehiculo_Vehiculo
	FOREIGN KEY (IDTipoVehiculo)
	REFERENCES Stock.TipoVehiculo(IDTipoVehiculo)	
);

-- Tabla: Componente 3FN
CREATE TABLE Stock.Componente (
    IDComponente INT PRIMARY KEY IDENTITY,
    NombreComponente VARCHAR(100) NOT NULL,
	MarcaComponente VARCHAR(50) NOT NULL,
    DescripcionComponente VARCHAR(100),
	CategoriaComponente VARCHAR(50),
    IDProducto INT,
    IDVehiculo INT,
	CONSTRAINT fk_Producto_Componente
	FOREIGN KEY (IDProducto)
	REFERENCES Stock.Producto(IDProducto),
	CONSTRAINT fk_Vehiculo_Componente
	FOREIGN KEY (IDVehiculo)
	REFERENCES Stock.Vehiculo(IDVehiculo)
);

-- Tabla: Accesorio 3NF
CREATE TABLE Stock.Accesorio (
    IDAccesorio INT PRIMARY KEY IDENTITY,
    NombreAccesorio VARCHAR(100) NOT NULL,
	MarcaAccesorio VARCHAR(50) NOT NULL,
    DescripcionAccesorio VARCHAR(100),
	CategoriaAccesorio VARCHAR(50),
    IDProducto INT,
	CONSTRAINT fk_Producto_Accesorio
	FOREIGN KEY (IDProducto)
	REFERENCES Stock.Producto(IDProducto)
);

-- Tabla: Almacén 3NF
CREATE TABLE Stock.Almacen (
    IDAlmacen INT PRIMARY KEY IDENTITY,
    NombreAlmacen VARCHAR(100) NOT NULL,
    Ubicacion VARCHAR(255) NOT NULL
);

-- Tabla: MovimientoInventario 3NF
CREATE TABLE Stock.MovimientoInventario (
    IDMovimiento INT PRIMARY KEY IDENTITY,
    FechaMovimiento DATE NOT NULL,
    TipoMovimiento VARCHAR(100) NOT NULL,
    CantidadMovida INT NOT NULL,
    IDProducto INT,
    IDAlmacen INT,
	CONSTRAINT fk_Producto_MovimientoInventario
	FOREIGN KEY (IDProducto)
	REFERENCES Stock.Producto(IDProducto),
	CONSTRAINT fk_Almacen_MovimientoInventario
	FOREIGN KEY (IDAlmacen)
	REFERENCES Stock.Almacen(IDAlmacen)
);

-- Tabla: Stock 3NF
CREATE TABLE Stock.Stock (
    IDProducto INT,
    IDAlmacen INT,
    CantidadProducto INT,
    Disponible BIT NOT NULL,
    PRIMARY KEY (IDProducto, IDAlmacen),
	CONSTRAINT fk_Producto_Stock
	FOREIGN KEY (IDProducto)
	REFERENCES Stock.Producto(IDProducto),
	CONSTRAINT fk_Almacen_Stock
	FOREIGN KEY (IDAlmacen)
	REFERENCES Stock.Almacen(IDAlmacen)
);

END

BEGIN

-- Productos para Vehículos
INSERT INTO Stock.Producto (Precio) VALUES (15000.00);  -- ID 1
INSERT INTO Stock.Producto (Precio) VALUES (20000.00);  -- ID 2
INSERT INTO Stock.Producto (Precio) VALUES (5000.00);   -- ID 3
INSERT INTO Stock.Producto (Precio) VALUES (8000.00);   -- ID 4
INSERT INTO Stock.Producto (Precio) VALUES (12000.00);  -- ID 5

-- Productos para Componentes
INSERT INTO Stock.Producto (Precio) VALUES (2000.00);  -- ID 6
INSERT INTO Stock.Producto (Precio) VALUES (3000.00);  -- ID 7
INSERT INTO Stock.Producto (Precio) VALUES (1500.00);  -- ID 8
INSERT INTO Stock.Producto (Precio) VALUES (1200.00);  -- ID 9
INSERT INTO Stock.Producto (Precio) VALUES (800.00);   -- ID 10

-- Productos para Accesorios
INSERT INTO Stock.Producto (Precio) VALUES (300.00);   -- ID 11
INSERT INTO Stock.Producto (Precio) VALUES (150.00);   -- ID 12
INSERT INTO Stock.Producto (Precio) VALUES (200.00);   -- ID 13
INSERT INTO Stock.Producto (Precio) VALUES (100.00);   -- ID 14
INSERT INTO Stock.Producto (Precio) VALUES (250.00);   -- ID 15

INSERT INTO Stock.TipoVehiculo (Nombre) VALUES ('Bus');
INSERT INTO Stock.TipoVehiculo (Nombre) VALUES ('Tren');
INSERT INTO Stock.TipoVehiculo (Nombre) VALUES ('Automovil');
INSERT INTO Stock.TipoVehiculo (Nombre) VALUES ('Motocicleta');
INSERT INTO Stock.TipoVehiculo (Nombre) VALUES ('Bicicleta');

INSERT INTO Stock.Vehiculo (MarcaVehiculo, ModeloVehiculo, PaisImportacion, DestinadoVenta, IDProducto, IDTipoVehiculo)
VALUES ('Mercedes', 'Citaro', 'Germany', 'Publica', 1, 1);
INSERT INTO Stock.Vehiculo (MarcaVehiculo, ModeloVehiculo, PaisImportacion, DestinadoVenta, IDProducto, IDTipoVehiculo)
VALUES ('Siemens', 'Velaro', 'Germany', 'Publica', 2, 2);
INSERT INTO Stock.Vehiculo (MarcaVehiculo, ModeloVehiculo, PaisImportacion, DestinadoVenta, IDProducto, IDTipoVehiculo)
VALUES ('Toyota', 'Corolla', 'Japan', 'Privada', 3, 3);
INSERT INTO Stock.Vehiculo (MarcaVehiculo, ModeloVehiculo, PaisImportacion, DestinadoVenta, IDProducto, IDTipoVehiculo)
VALUES ('Honda', 'CBR600RR', 'Japan', 'Privada', 4, 4);
INSERT INTO Stock.Vehiculo (MarcaVehiculo, ModeloVehiculo, PaisImportacion, DestinadoVenta, IDProducto, IDTipoVehiculo)
VALUES ('Giant', 'Escape 3', 'Taiwan', 'Privada', 5, 5);

INSERT INTO Stock.Componente (NombreComponente, MarcaComponente, DescripcionComponente, CategoriaComponente, IDProducto, IDVehiculo)
VALUES ('Motor', 'Mercedes', 'Motor Diesel', 'Engine', 6, 1);
INSERT INTO Stock.Componente (NombreComponente, MarcaComponente, DescripcionComponente, CategoriaComponente, IDProducto, IDVehiculo)
VALUES ('Bogies', 'Siemens', 'Bogies de tren', 'Underframe', 7, 2);
INSERT INTO Stock.Componente (NombreComponente, MarcaComponente, DescripcionComponente, CategoriaComponente, IDProducto, IDVehiculo)
VALUES ('Transmision', 'Toyota', 'Transmision automatica', 'Transmission', 8, 3);
INSERT INTO Stock.Componente (NombreComponente, MarcaComponente, DescripcionComponente, CategoriaComponente, IDProducto, IDVehiculo)
VALUES ('Escape', 'Honda', 'Sistema de escape', 'Exhaust', 9, 4);
INSERT INTO Stock.Componente (NombreComponente, MarcaComponente, DescripcionComponente, CategoriaComponente, IDProducto, IDVehiculo)
VALUES ('Pedales', 'Giant', 'Pedales de bicicleta', 'Pedals', 10, 5);

INSERT INTO Stock.Accesorio (NombreAccesorio, MarcaAccesorio, DescripcionAccesorio, CategoriaAccesorio, IDProducto)
VALUES ('GPS', 'Garmin', 'Sistema de navegación', 'Electronics', 11);
INSERT INTO Stock.Accesorio (NombreAccesorio, MarcaAccesorio, DescripcionAccesorio, CategoriaAccesorio, IDProducto)
VALUES ('Cubreasientos', 'WeatherTech', 'Cubreasientos de alta calidad', 'Interior', 12);
INSERT INTO Stock.Accesorio (NombreAccesorio, MarcaAccesorio, DescripcionAccesorio, CategoriaAccesorio, IDProducto)
VALUES ('Portaequipajes', 'Thule', 'Portaequipajes para automóvil', 'Exterior', 13);
INSERT INTO Stock.Accesorio (NombreAccesorio, MarcaAccesorio, DescripcionAccesorio, CategoriaAccesorio, IDProducto)
VALUES ('Cámara trasera', 'Pioneer', 'Cámara de visión trasera', 'Safety', 14);
INSERT INTO Stock.Accesorio (NombreAccesorio, MarcaAccesorio, DescripcionAccesorio, CategoriaAccesorio, IDProducto)
VALUES ('Sistema de sonido', 'Bose', 'Sistema de sonido premium', 'Audio', 15);

INSERT INTO Stock.Almacen (NombreAlmacen, Ubicacion) VALUES ('Central Warehouse', '123 Main St, Springfield');
INSERT INTO Stock.Almacen (NombreAlmacen, Ubicacion) VALUES ('East Warehouse', '456 East St, Springfield');
INSERT INTO Stock.Almacen (NombreAlmacen, Ubicacion) VALUES ('West Warehouse', '789 West St, Springfield');
INSERT INTO Stock.Almacen (NombreAlmacen, Ubicacion) VALUES ('North Warehouse', '101 North St, Springfield');
INSERT INTO Stock.Almacen (NombreAlmacen, Ubicacion) VALUES ('South Warehouse', '202 South St, Springfield');

INSERT INTO Stock.MovimientoInventario (FechaMovimiento, TipoMovimiento, CantidadMovida, IDProducto, IDAlmacen)
VALUES ('2023-05-01', 'Entrada', 100, 1, 1);
INSERT INTO Stock.MovimientoInventario (FechaMovimiento, TipoMovimiento, CantidadMovida, IDProducto, IDAlmacen)
VALUES ('2023-05-02', 'Entrada', 50, 2, 2);
INSERT INTO Stock.MovimientoInventario (FechaMovimiento, TipoMovimiento, CantidadMovida, IDProducto, IDAlmacen)
VALUES ('2023-05-03', 'Entrada', 75, 3, 3);
INSERT INTO Stock.MovimientoInventario (FechaMovimiento, TipoMovimiento, CantidadMovida, IDProducto, IDAlmacen)
VALUES ('2023-05-04', 'Entrada', 25, 4, 4);
INSERT INTO Stock.MovimientoInventario (FechaMovimiento, TipoMovimiento, CantidadMovida, IDProducto, IDAlmacen)
VALUES ('2023-05-05', 'Entrada', 60, 5, 5);

INSERT INTO Stock.Stock (IDProducto, IDAlmacen, CantidadProducto, Disponible)
VALUES (1, 1, 50, 1);
INSERT INTO Stock.Stock (IDProducto, IDAlmacen, CantidadProducto, Disponible)
VALUES (2, 2, 40, 1);
INSERT INTO Stock.Stock (IDProducto, IDAlmacen, CantidadProducto, Disponible)
VALUES (3, 3, 30, 1);
INSERT INTO Stock.Stock (IDProducto, IDAlmacen, CantidadProducto, Disponible)
VALUES (4, 4, 20, 1);
INSERT INTO Stock.Stock (IDProducto, IDAlmacen, CantidadProducto, Disponible)
VALUES (5, 5, 10, 1);
INSERT INTO Stock.Stock (IDProducto, IDAlmacen, CantidadProducto, Disponible)
VALUES (6, 1, 50, 1);
INSERT INTO Stock.Stock (IDProducto, IDAlmacen, CantidadProducto, Disponible)
VALUES (7, 2, 30, 1);
INSERT INTO Stock.Stock (IDProducto, IDAlmacen, CantidadProducto, Disponible)
VALUES (11, 1, 20, 1);
INSERT INTO Stock.Stock (IDProducto, IDAlmacen, CantidadProducto, Disponible)
VALUES (12, 2, 40, 1);

-- Movimiento de inventario para Componente: Motor (Producto ID 6), Almacén ID 1
INSERT INTO Stock.MovimientoInventario (FechaMovimiento, TipoMovimiento, CantidadMovida, IDProducto, IDAlmacen)
VALUES (GETDATE(), 'Entrada', 50, 6, 1);

-- Movimiento de inventario para Componente: Bogies (Producto ID 7), Almacén ID 2
INSERT INTO Stock.MovimientoInventario (FechaMovimiento, TipoMovimiento, CantidadMovida, IDProducto, IDAlmacen)
VALUES (GETDATE(), 'Entrada', 30, 7, 2);

-- Movimiento de inventario para Accesorio: GPS (Producto ID 11), Almacén ID 1
INSERT INTO Stock.MovimientoInventario (FechaMovimiento, TipoMovimiento, CantidadMovida, IDProducto, IDAlmacen)
VALUES (GETDATE(), 'Entrada', 20, 11, 1);

-- Movimiento de inventario para Accesorio: Cubreasientos (Producto ID 12), Almacén ID 2
INSERT INTO Stock.MovimientoInventario (FechaMovimiento, TipoMovimiento, CantidadMovida, IDProducto, IDAlmacen)
VALUES (GETDATE(), 'Entrada', 40, 12, 2);

END


CREATE SCHEMA FinanzaVenta
GO

BEGIN

-- Tabla: Cliente 3NF
CREATE TABLE FinanzaVenta.Cliente (
    IDCliente INT PRIMARY KEY IDENTITY,
    NombreCliente VARCHAR(50) NOT NULL,
    Telefono VARCHAR(15),
    Correo VARCHAR(100) NOT NULL
);

-- Tabla: Factura 3NF
CREATE TABLE FinanzaVenta.Factura (
    IDFactura INT PRIMARY KEY IDENTITY,
    Fecha DATE NOT NULL,
    Total DECIMAL(19, 2) NOT NULL,
    ProvedorEnvio VARCHAR(100),
    DireccionEnvio VARCHAR(255)
);

-- Tabla: Pedido 3NF
CREATE TABLE FinanzaVenta.Pedido (
    IDPedido INT PRIMARY KEY IDENTITY,
    Fecha DATE NOT NULL,
    Estado VARCHAR(30),
    Monto DECIMAL(19, 2),
    IDCliente INT,
	IDFactura INT,
	CONSTRAINT fk_Cliente_Pedido
	FOREIGN KEY (IDCliente)
	REFERENCES FinanzaVenta.Cliente(IDCliente),
	CONSTRAINT fk_Factura_Pedido
	FOREIGN KEY (IDFactura)
	REFERENCES FinanzaVenta.Factura(IDFactura)
);

-- Tabla: MovimientoPedido
CREATE TABLE FinanzaVenta.MovimientoPedido (
    IDPedido INT,
    IDMovimiento INT,
    PRIMARY KEY (IDPedido, IDMovimiento),
	CONSTRAINT fk_Pedido_MovimientoPedido
	FOREIGN KEY (IDPedido)
	REFERENCES FinanzaVenta.Pedido(IDPedido),
	CONSTRAINT fk_Movimiento_MovimientoPedido
	FOREIGN KEY (IDMovimiento)
	REFERENCES  Stock.MovimientoInventario(IDMovimiento)
);


END

CREATE SCHEMA Servicio
GO

BEGIN

-- Tabla: Servicio 3FN
CREATE TABLE Servicio.Servicio (
    IDServicio INT PRIMARY KEY IDENTITY,
    Nombre VARCHAR(100) NOT NULL,
    Descripcion VARCHAR(255)
);

-- Tabla: Servicio_Pedido 
CREATE TABLE Servicio.ServicioPedido (
    IDServicio INT,
    IDPedido INT,
    PRIMARY KEY (IDServicio, IDPedido),
	CONSTRAINT fk_Servicio_ServicioPedido
	FOREIGN KEY (IDServicio)
	REFERENCES Servicio.Servicio(IDServicio),
	CONSTRAINT fk_Pedido_ServicioPedido
	FOREIGN KEY (IDPedido)
	REFERENCES FinanzaVenta.Pedido(IDPedido)
);

END

BEGIN

-- Insertar datos en la tabla Servicio.Servicio
INSERT INTO Servicio.Servicio (Nombre, Descripcion)
VALUES ('Mantenimiento General', 'Servicio completo de mantenimiento para vehículos, incluyendo cambios de aceite, revisiones y ajustes.');

INSERT INTO Servicio.Servicio (Nombre, Descripcion)
VALUES ('Inspección de Seguridad', 'Inspección completa de seguridad vehicular, incluyendo frenos, luces y sistemas de dirección.');

INSERT INTO Servicio.Servicio (Nombre, Descripcion)
VALUES ('Diagnóstico Electrónico', 'Diagnóstico y reparación de sistemas electrónicos y computarizados de vehículos.');

END

CREATE SCHEMA RRHH
GO
BEGIN

-- Tabla: Departamento 3FN
CREATE TABLE RRHH.Departamento (
    IDDepartamento INT PRIMARY KEY IDENTITY,
    NombreDepartamento VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(100)
);

-- Tabla: Puesto 3NF
CREATE TABLE RRHH.Puesto (
    IDPuesto INT PRIMARY KEY IDENTITY,
    NombrePuesto VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(100)
);

-- Tabla: Empleado 3NF
CREATE TABLE RRHH.Empleado (
    IDEmpleado INT PRIMARY KEY IDENTITY,
    Nombre VARCHAR(20) NOT NULL,
    Apellido VARCHAR(30) NOT NULL,
    FechaContratacion DATE NOT NULL,
    Salario DECIMAL(19, 2) NOT NULL,
    CorreoElectronico VARCHAR(100) NOT NULL,
    Telefono VARCHAR(15),
    Activo BIT,
    IDPuesto INT,
    IDDepartamento INT,
	CONSTRAINT fk_Puesto_Empleado
	FOREIGN KEY (IDPuesto)
	REFERENCES RRHH.Puesto(IDPuesto),
	CONSTRAINT fk_Departamento_Empleado
	FOREIGN KEY (IDDepartamento)
	REFERENCES RRHH.Departamento(IDDepartamento)
);

CREATE TABLE RRHH.UsuarioAplicacion(
	IDEmpleado INT,
	NombreUsuario VARCHAR(20),
	Contrasenia VARCHAR(18),
	CONSTRAINT fk_Empleado_UsuarioAplicacion
	FOREIGN KEY (IDEmpleado)
	REFERENCES RRHH.Empleado(IDEmpleado),
	PRIMARY KEY(IDEmpleado)
)


END

BEGIN

-- Insertar datos en la tabla RRHH.Departamento
INSERT INTO RRHH.Departamento (NombreDepartamento, Descripcion)
VALUES ('Recursos Humanos', 'Gestión de personal y relaciones laborales.');

INSERT INTO RRHH.Departamento (NombreDepartamento, Descripcion)
VALUES ('Finanzas', 'Gestión financiera y contabilidad.');

INSERT INTO RRHH.Departamento (NombreDepartamento, Descripcion)
VALUES ('Ventas', 'Gestión de ventas y atención al cliente.');

INSERT INTO RRHH.Departamento (NombreDepartamento, Descripcion)
VALUES ('Mantenimiento', 'Mantenimiento y reparación de vehículos.');

INSERT INTO RRHH.Departamento (NombreDepartamento, Descripcion)
VALUES ('IT', 'Gestión de sistemas y tecnologías de la información.');

-- Insertar datos en la tabla RRHH.Puesto
INSERT INTO RRHH.Puesto (NombrePuesto, Descripcion)
VALUES ('Gerente de RRHH', 'Encargado de la gestión de recursos humanos.');

INSERT INTO RRHH.Puesto (NombrePuesto, Descripcion)
VALUES ('Contador', 'Encargado de la contabilidad y finanzas.');

INSERT INTO RRHH.Puesto (NombrePuesto, Descripcion)
VALUES ('Vendedor', 'Encargado de las ventas y atención al cliente.');

INSERT INTO RRHH.Puesto (NombrePuesto, Descripcion)
VALUES ('Técnico de Mantenimiento', 'Encargado del mantenimiento y reparación de vehículos.');

INSERT INTO RRHH.Puesto (NombrePuesto, Descripcion)
VALUES ('Administrador de Sistemas', 'Encargado de la administración de sistemas y tecnologías de la información.');

-- Insertar datos en la tabla RRHH.Empleado
INSERT INTO RRHH.Empleado (Nombre, Apellido, FechaContratacion, Salario, CorreoElectronico, Telefono, Activo, IDPuesto, IDDepartamento)
VALUES ('Juan', 'Perez', '2020-01-15', 50000.00, 'juan.perez@example.com', '1234567890', 1, 1, 1);

INSERT INTO RRHH.Empleado (Nombre, Apellido, FechaContratacion, Salario, CorreoElectronico, Telefono, Activo, IDPuesto, IDDepartamento)
VALUES ('Ana', 'Garcia', '2019-03-10', 55000.00, 'ana.garcia@example.com', '0987654321', 1, 2, 2);

INSERT INTO RRHH.Empleado (Nombre, Apellido, FechaContratacion, Salario, CorreoElectronico, Telefono, Activo, IDPuesto, IDDepartamento)
VALUES ('Carlos', 'Lopez', '2018-07-25', 45000.00, 'carlos.lopez@example.com', '1122334455', 1, 3, 3);

INSERT INTO RRHH.Empleado (Nombre, Apellido, FechaContratacion, Salario, CorreoElectronico, Telefono, Activo, IDPuesto, IDDepartamento)
VALUES ('Marta', 'Hernandez', '2021-11-30', 47000.00, 'marta.hernandez@example.com', '6677889900', 1, 4, 4);

INSERT INTO RRHH.Empleado (Nombre, Apellido, FechaContratacion, Salario, CorreoElectronico, Telefono, Activo, IDPuesto, IDDepartamento)
VALUES ('Luis', 'Martinez', '2022-05-20', 52000.00, 'luis.martinez@example.com', '4455667788', 1, 5, 5);

--inserts de usuarios de aplicacion

INSERT INTO RRHH.UsuarioAplicacion (IDEmpleado, NombreUsuario, Contrasenia)
VALUES (1, 'jperez', 'password123');

INSERT INTO RRHH.UsuarioAplicacion (IDEmpleado, NombreUsuario, Contrasenia)
VALUES (2, 'agarcia', 'securepass456');

INSERT INTO RRHH.UsuarioAplicacion (IDEmpleado, NombreUsuario, Contrasenia)
VALUES (3, 'clopez', 'mypassword789');

INSERT INTO RRHH.UsuarioAplicacion (IDEmpleado, NombreUsuario, Contrasenia)
VALUES (4, 'mhernandez', 'password012');

INSERT INTO RRHH.UsuarioAplicacion (IDEmpleado, NombreUsuario, Contrasenia)
VALUES (5, 'lmartinez', 'password345');

END

CREATE SCHEMA Ensamblaje
GO

BEGIN

-- Tabla: Mantenimiento 3NF
CREATE TABLE Ensamblaje.Mantenimiento (
    IDMantenimiento INT PRIMARY KEY IDENTITY,
    FechaActualizacion DATE,
    Estado VARCHAR(20) NOT NULL,
    PruebasQA BIT,
    Listo BIT,
    IDVehiculo INT,
    IDDepartamento INT,
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

END

--ROLES
BEGIN

CREATE SERVER ROLE RolSYSAdmin;
ALTER SERVER ROLE RolSYSAdmin ADD MEMBER sa;
GRANT CONTROL SERVER TO RolSYSAdmin;

CREATE ROLE RolDBOwner;
GRANT CONTROL ON DATABASE::Agencia_De_Vehiculos_Electricos TO RolDBOwner;

CREATE ROLE RolVentas;
GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA::FinanzaVenta TO RolVentas;
GRANT EXECUTE ON SCHEMA::FinanzaVenta TO RolVentas;

CREATE ROLE RolMantenimiento;
GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA::Ensamblaje TO RolMantenimiento;
GRANT EXECUTE ON SCHEMA::Ensamblaje TO RolMantenimiento;

CREATE ROLE RolRRHH;
GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA::RRHH TO RolRRHH;
GRANT EXECUTE ON SCHEMA::RRHH TO RolRRHH;

CREATE ROLE RolContabilidad;
GRANT SELECT ON SCHEMA::FinanzaVenta TO RolContabilidad;
GRANT EXECUTE ON SCHEMA::FinanzaVenta TO RolContabilidad;

END
GO

--LOGINS
BEGIN

CREATE LOGIN LoginDBOwner WITH PASSWORD = '123DBOWNER';
CREATE USER UserDBOwner FOR LOGIN LoginDBOwner;
ALTER ROLE RolDBOwner ADD MEMBER UserDBOwner;

END
GO

--VIEWS y SPS
--Requerimento 1
CREATE OR ALTER PROCEDURE RRHH.sp_InicioSesion
	@NombreUsuario VARCHAR(20),
	@Contrasenia VARCHAR(18)
AS
BEGIN
	BEGIN TRY

		IF EXISTS (SELECT TOP(1) * FROM RRHH.UsuarioAplicacion WHERE NombreUsuario = @NombreUsuario AND Contrasenia = @Contrasenia)
		BEGIN

			SELECT 
				Puesto.NombrePuesto AS Respuesta
			FROM RRHH.UsuarioAplicacion AS Usuario
			INNER JOIN RRHH.Empleado AS Empleado
				ON Usuario.IDEmpleado = Empleado.IDEmpleado
				INNER JOIN RRHH.Puesto AS Puesto
					ON Puesto.IDPuesto = Empleado.IDPuesto
			WHERE Usuario.NombreUsuario = @NombreUsuario
				AND Usuario.Contrasenia = @Contrasenia

		END

	END TRY
	BEGIN CATCH
		SELECT 'NO EXISTE EL USUARIO' AS Respuesta
	END CATCH
END
GO

CREATE OR ALTER PROCEDURE sp_ReservarProducto
	@IDProducto INT,
	@Cantidad INT,
	@IDAlmacen INT,
	@IDCliente INT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION;

		IF NOT EXISTS (SELECT IDProducto FROM Stock.Producto WHERE IDProducto = @IDProducto)
		BEGIN
			ROLLBACK;
			SELECT 'NO EXISTE EL PRODUCTO' AS Respuesta;
		END

		IF NOT EXISTS (SELECT IDAlmacen FROM Stock.Almacen WHERE IDAlmacen = @IDAlmacen)
		BEGIN
			ROLLBACK;
			SELECT 'NO EXISTE EL ALMACEN' AS Respuesta;
		END

		IF NOT EXISTS (SELECT IDCliente FROM FinanzaVenta.Cliente WHERE IDCliente = @IDCliente)
		BEGIN
			ROLLBACK;
			SELECT 'NO EXISTE EL CLIENTE' AS Respuesta;
		END



		COMMIT;
		RETURN 1;
	END TRY
	BEGIN CATCH
		ROLLBACK;
		RETURN 0;
	END CATCH
END--REVISAR Estado = Pendiente
GO

--Requerimiento 2

CREATE OR ALTER VIEW Stock.view_AccesoriosDisponibles
AS
SELECT 
	Producto.IDProducto,
	Accesorio.NombreAccesorio,
	Accesorio.MarcaAccesorio,
	Accesorio.DescripcionAccesorio,
	Accesorio.CategoriaAccesorio,
	Stock.CantidadProducto,
	Almacen.NombreAlmacen+', '+Almacen.Ubicacion AS Ubicacion,
	Stock.Disponible
FROM Stock.Producto AS Producto
	INNER JOIN Stock.Accesorio AS Accesorio
		ON Producto.IDProducto = Accesorio.IDProducto
			INNER JOIN Stock.Stock AS Stock
				ON Producto.IDProducto = Stock.IDProducto
					INNER JOIN Stock.Almacen AS Almacen
					ON Stock.IDAlmacen = Almacen.IDAlmacen
WHERE Stock.Disponible = 1
GO

CREATE OR ALTER PROCEDURE Stock.sp_FiltararAccesoriosDisponibles
	@MarcaAccesorio VARCHAR(50),
	@NombreAccesorio VARCHAR(50),
	@CategoriaAccesorio VARCHAR(50)
AS
BEGIN
	BEGIN TRY
		
		SELECT
			ViewAccesorios.IDProducto,
			ViewAccesorios.NombreAccesorio,
			ViewAccesorios.MarcaAccesorio,
			ViewAccesorios.DescripcionAccesorio,
			ViewAccesorios.CategoriaAccesorio,
			ViewAccesorios.CantidadProducto,
			ViewAccesorios.Ubicacion,
			ViewAccesorios.Disponible
		FROM view_AccesoriosDisponibles AS ViewAccesorios
		WHERE (ViewAccesorios.MarcaAccesorio = @MarcaAccesorio OR @MarcaAccesorio IS NULL)
			AND (ViewAccesorios.NombreAccesorio = @NombreAccesorio OR @NombreAccesorio IS NULL)
			AND (ViewAccesorios.CategoriaAccesorio = @CategoriaAccesorio OR @CategoriaAccesorio IS NULL)

	END TRY
	BEGIN CATCH
		SELECT 'NO DATA' AS Respuesta
	END CATCH
END
GO

--Requermineto 3
CREATE OR ALTER VIEW Stock.view_VehiculosDisponibles
AS
	SELECT
		Vehiculo.IDProducto,
		Vehiculo.MarcaVehiculo,
		Vehiculo.ModeloVehiculo,
		Vehiculo.PaisImportacion,
		Vehiculo.DestinadoVenta,
		Producto.Precio,
		Stock.CantidadProducto,
		Almacen.NombreAlmacen+', '+Almacen.Ubicacion AS Ubicacion
	FROM Stock.Vehiculo AS Vehiculo
	INNER JOIN Stock.Stock AS Stock
		ON Vehiculo.IDProducto = Stock.IDProducto
		INNER JOIN Stock.Almacen AS Almacen
			ON Stock.IDAlmacen = Almacen.IDAlmacen
			INNER JOIN Stock.Producto AS Producto
				ON Producto.IDProducto = Vehiculo.IDProducto
	WHERE Stock.Disponible = 1
GO

CREATE OR ALTER PROCEDURE Stock.sp_FiltrarVehiculosDisponibles
	@Marca VARCHAR(50),
	@Modelo VARCHAR(100),
	@Precio DECIMAL(19,2)
AS
BEGIN
	BEGIN TRY

		SELECT 
			ViewVehiculos.IDProducto,
			ViewVehiculos.MarcaVehiculo,
			ViewVehiculos.ModeloVehiculo,
			ViewVehiculos.PaisImportacion,
			ViewVehiculos.DestinadoVenta,
			ViewVehiculos.Precio,
			ViewVehiculos.CantidadProducto,
			ViewVehiculos.CantidadProducto
		FROM view_VehiculosDisponibles AS ViewVehiculos
		WHERE (ViewVehiculos.MarcaVehiculo = @Marca OR @Marca IS NULL)
			AND(ViewVehiculos.ModeloVehiculo = @Modelo OR @Modelo IS NULL)
			AND(ViewVehiculos.Precio = @Precio OR @Precio IS NULL)

	END TRY
	BEGIN CATCH
		SELECT 'NO DATA' AS Respuesta
	END CATCH
END
GO

--Requerimiento 4

--Requerimiento 5

CREATE OR ALTER PROCEDURE FinanzaVenta.sp_RegistrarCliente
	@NombreCliente VARCHAR(50),
	@TelefonoCliente VARCHAR(15),
	@CorreoCliente VARCHAR(100)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION RegistroCliente;

		IF @NombreCliente IS NULL OR LEN(@NombreCliente) < 5
		BEGIN
			ROLLBACK TRANSACTION RegistroCliente;
			RETURN 0;
		END

		IF @TelefonoCliente IS NULL OR LEN(@TelefonoCliente) < 10 
			OR LEN(@TelefonoCliente) > 10 
		BEGIN
			ROLLBACK TRANSACTION RegistroCliente;
			RETURN 0;
		END

		IF @CorreoCliente IS NULL OR LEN(@CorreoCliente) < 10
		BEGIN
			ROLLBACK TRANSACTION RegistroCliente;
			RETURN 0;
		END

		INSERT INTO FinanzaVenta.Cliente
		(NombreCliente, Telefono, Correo)
		VALUES (@NombreCliente, @TelefonoCliente, @CorreoCliente)
		
		COMMIT TRANSACTION RegistroCliente;
		RETURN 1;
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION RegistroCliente;
		RETURN 0;
	END CATCH
END
GO

--Requerimiento 6
CREATE OR ALTER VIEW Stock.view_ComponentesDisponibles
AS
SELECT 
	Producto.IDProducto,
	Componente.NombreComponente,
	Componente.MarcaComponente,
	Componente.DescripcionComponente,
	Componente.CategoriaComponente,
	Stock.CantidadProducto,
	Almacen.NombreAlmacen+', '+Almacen.Ubicacion AS Ubicacion,
	Stock.Disponible
FROM Stock.Producto AS Producto
	INNER JOIN Stock.Componente AS Componente
		ON Producto.IDProducto = Componente.IDProducto
			INNER JOIN Stock.Vehiculo AS Vehiculo
			ON Componente.IDVehiculo = Vehiculo.IDVehiculo
				INNER JOIN Stock.Stock AS Stock
					ON Producto.IDProducto = Stock.IDProducto
						INNER JOIN Stock.Almacen AS Almacen
						ON Stock.IDAlmacen = Almacen.IDAlmacen
WHERE Stock.Disponible = 1
GO

CREATE OR ALTER PROCEDURE Stock.sp_FiltararComponentesDisponibles
	@MarcaComponente VARCHAR(50),
	@NombreComponente VARCHAR(50),
	@CategoriaComponente VARCHAR(50)
AS
BEGIN
	BEGIN TRY
		
		SELECT
			ViewComponentes.IDProducto,
			ViewComponentes.NombreComponente,
			ViewComponentes.MarcaComponente,
			ViewComponentes.DescripcionComponente,
			ViewComponentes.CategoriaComponente,
			ViewComponentes.CantidadProducto,
			ViewComponentes.Ubicacion,
			ViewComponentes.Disponible
		FROM view_ComponentesDisponibles AS ViewComponentes
		WHERE (ViewComponentes.MarcaComponente = @MarcaComponente OR @MarcaComponente IS NULL)
			AND (ViewComponentes.NombreComponente = @NombreComponente OR @NombreComponente IS NULL)
			AND (ViewComponentes.CategoriaComponente = @CategoriaComponente OR @CategoriaComponente IS NULL)

	END TRY
	BEGIN CATCH
		SELECT 'NO DATA' AS Respuesta
	END CATCH
END
GO

--Requerimiento 7
CREATE OR ALTER VIEW Stock.view_VehiculosVendidos 
AS
SELECT 
    Vehiculo.IDVehiculo,
    Vehiculo.MarcaVehiculo,
    Vehiculo.ModeloVehiculo,
    Producto.Precio,
    Pedido.IDPedido,
    Factura.Fecha AS FechaVenta,
    Cliente.NombreCliente,
    Cliente.Correo AS CorreoCliente,
    Factura.Total AS PrecioVenta
FROM Stock.Vehiculo AS Vehiculo
INNER JOIN Stock.Producto AS Producto 
	ON Vehiculo.IDProducto = Producto.IDProducto
    INNER JOIN FinanzaVenta.Pedido AS Pedido 
		ON Pedido.IDPedido = Vehiculo.IDVehiculo
		INNER JOIN FinanzaVenta.Cliente AS Cliente 
			ON Pedido.IDCliente = Cliente.IDCliente
			INNER JOIN FinanzaVenta.Factura AS Factura 
				ON Pedido.IDFactura = Factura.IDFactura
WHERE Pedido.Estado = 'Vendido';
GO

CREATE OR ALTER PROCEDURE Stock.sp_FiltrarVehiculosVendidos
    @FechaInicio DATE,
    @FechaFin DATE,
    @Marca VARCHAR(50) = NULL,
    @Modelo VARCHAR(100) = NULL,
    @IDTipoVehiculo INT = NULL
AS
BEGIN
    BEGIN TRY
        SELECT 
            VehiculoVendidos.IDVehiculo,
            VehiculoVendidos.MarcaVehiculo,
            VehiculoVendidos.ModeloVehiculo,
            VehiculoVendidos.Precio,
            VehiculoVendidos.IDPedido,
            VehiculoVendidos.FechaVenta,
            VehiculoVendidos.NombreCliente,
            VehiculoVendidos.CorreoCliente,
            VehiculoVendidos.PrecioVenta
        FROM Stock.view_VehiculosVendidos AS VehiculoVendidos
        INNER JOIN Stock.Vehiculo AS Vehiculo ON VehiculoVendidos.IDVehiculo = Vehiculo.IDVehiculo
        WHERE VehiculoVendidos.FechaVenta BETWEEN @FechaInicio AND @FechaFin
            AND (VehiculoVendidos.MarcaVehiculo = @Marca OR @Marca IS NULL)
            AND (VehiculoVendidos.ModeloVehiculo = @Modelo OR @Modelo IS NULL)
            AND (Vehiculo.IDTipoVehiculo = @IDTipoVehiculo OR @IDTipoVehiculo IS NULL);
    END TRY
    BEGIN CATCH
        SELECT 'NO DATA' AS Respuesta;
    END CATCH
END
GO
