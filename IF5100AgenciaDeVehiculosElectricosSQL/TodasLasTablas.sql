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

-- Tabla: Veh�culo 3NF
CREATE TABLE Stock.Vehiculo (
    IDVehiculo INT PRIMARY KEY IDENTITY,
    MarcaVehiculo VARCHAR(50) NOT NULL,
    ModeloVehiculo VARCHAR(100) NOT NULL,
    PaisImportacion VARCHAR(100) NOT NULL,
    DestinadoVenta VARCHAR(10) NOT NULL 
	CHECK (DestinadoVenta IN ('Publica', 'Privada')),
	IDProducto INT NOT NULL,
	IDTipoVehiculo INT NOT NULL,
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
	CategoriaComponente VARCHAR(50) NOT NULL,
    IDProducto INT NOT NULL,
    IDVehiculo INT NOT NULL,
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
	CategoriaAccesorio VARCHAR(50) NOT NULL,
    IDProducto INT NOT NULL,
	CONSTRAINT fk_Producto_Accesorio
	FOREIGN KEY (IDProducto)
	REFERENCES Stock.Producto(IDProducto)
);

-- Tabla: Almac�n 3NF
CREATE TABLE Stock.Almacen (
    IDAlmacen INT PRIMARY KEY IDENTITY,
    NombreAlmacen VARCHAR(100) NOT NULL,
    Ubicacion VARCHAR(300) NOT NULL
);

-- Tabla: Stock 3NF
CREATE TABLE Stock.Stock (
    IDProducto INT NOT NULL,
    IDAlmacen INT NOT NULL,
    CantidadProducto INT NOT NULL,
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
GO

CREATE SCHEMA FinanzaVenta
GO
BEGIN

-- Tabla: Cliente 3NF
CREATE TABLE FinanzaVenta.Cliente (
    IDCliente INT PRIMARY KEY IDENTITY,
    Identificacion VARCHAR(64) NOT NULL,
	NombreCliente VARCHAR(50) NOT NULL,
    Telefono VARCHAR(15),
    CorreoElectronico VARCHAR(100) NOT NULL
);

-- Tabla: Factura 3NF
CREATE TABLE FinanzaVenta.Factura (
    IDFactura INT PRIMARY KEY IDENTITY,
    FechaFactura DATE NOT NULL,
    TotalFactura DECIMAL(19, 2) NOT NULL,
    ProvedorEnvio VARCHAR(100),
    DireccionEnvio VARCHAR(300),
	TrakingPedido VARCHAR(50)
);

-- Tabla: Pedido 3NF
CREATE TABLE FinanzaVenta.Pedido (
    IDPedido INT PRIMARY KEY IDENTITY,
    FechaPedido DATE NOT NULL,
    EstadoPedido VARCHAR(10) NOT NULL DEFAULT('pendiente'),
    MontoPedido DECIMAL(19, 2),
    IDCliente INT NOT NULL,
	IDFactura INT,
	CONSTRAINT fk_Cliente_Pedido
	FOREIGN KEY (IDCliente)
	REFERENCES FinanzaVenta.Cliente(IDCliente),
	CONSTRAINT fk_Factura_Pedido
	FOREIGN KEY (IDFactura)
	REFERENCES FinanzaVenta.Factura(IDFactura)
);

END
GO

CREATE SCHEMA Servicio
GO
BEGIN

-- Tabla: Servicio 3FN
CREATE TABLE Servicio.Servicio (
    IDServicio INT PRIMARY KEY IDENTITY,
    NombreServicio VARCHAR(100) NOT NULL,
    Descripcion VARCHAR(300)
);

END
GO

CREATE SCHEMA RRHH
GO
BEGIN

-- Tabla: Departamento 3FN
CREATE TABLE RRHH.Departamento (
    IDDepartamento INT PRIMARY KEY IDENTITY,
    NombreDepartamento VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(300)
);

-- Tabla: Puesto 3NF
CREATE TABLE RRHH.Puesto (
    IDPuesto INT PRIMARY KEY IDENTITY,
    NombrePuesto VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(300)
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

END
GO

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

END
GO

--TABLAS DE FLUJO MOVIMIENTO INVENTARIO Y SERVICIO PEDIDO
BEGIN

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

END
GO

--Vistas y spas
--Requerimento 1
CREATE OR ALTER PROCEDURE RRHH.sp_InicioSesion
	@NombreUsuario VARCHAR(20),
	@Contrasenia VARCHAR(200)
AS
BEGIN
	BEGIN TRY

		--Se verifica que exista ese usuario con esa password
		IF EXISTS (SELECT TOP 1 1 FROM RRHH.UsuarioAplicacion 
					WHERE NombreUsuario = @NombreUsuario 
					AND Contrasenia = @Contrasenia)
		BEGIN

			SELECT 
				Usuario.IDEmpleado,
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

CREATE OR ALTER PROCEDURE FinanzaVenta.sp_RegistrarPedido
    @IDCliente INT
AS
BEGIN
    DECLARE @IDPedido INT;

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Validar existencia del cliente
        IF NOT EXISTS (SELECT 1 FROM FinanzaVenta.Cliente WHERE IDCliente = @IDCliente)
        BEGIN
            RAISERROR('Cliente no existe', 16, 1);
            ROLLBACK;
            RETURN -1;
        END

        -- Insertar el pedido
        INSERT INTO FinanzaVenta.Pedido (FechaPedido, IDCliente)
        VALUES (GETDATE(), @IDCliente);

        -- Obtener el ID del pedido insertado
        SET @IDPedido = SCOPE_IDENTITY();

        COMMIT;
        RETURN @IDPedido;
    END TRY
    BEGIN CATCH
        ROLLBACK;
        RETURN -1;
    END CATCH;
END
GO

CREATE OR ALTER PROCEDURE FinanzaVenta.sp_CalcularMontoTotalPedido
    @IDPedido INT
AS
BEGIN
	DECLARE @MontoTotal DECIMAL(19, 2);
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Validar existencia del pedido
        IF NOT EXISTS (SELECT 1 FROM FinanzaVenta.Pedido WHERE IDPedido = @IDPedido)
        BEGIN
            ROLLBACK;
            RETURN -1;
        END

        -- Calcular el monto total sumando los precios de 
		--los productos asociados al pedido en los movimientos de inventario
        SELECT @MontoTotal = SUM(p.Precio * mi.CantidadMovida)
        FROM Stock.MovimientoInventario mi
        JOIN Stock.Producto p ON mi.IDProducto = p.IDProducto
        WHERE mi.IDPedido = @IDPedido;

        -- Validar si el pedido no tiene movimientos de inventario asociados
        IF @MontoTotal IS NULL
        BEGIN
            SET @MontoTotal = 0;
        END

        -- Actualizar el monto del pedido en la tabla Pedido
        UPDATE FinanzaVenta.Pedido
        SET MontoPedido = @MontoTotal
        WHERE IDPedido = @IDPedido;

        COMMIT;
        -- Retornar el monto total
        RETURN @MontoTotal;
    END TRY
    BEGIN CATCH
        ROLLBACK;
        RETURN -1;
    END CATCH;
END
GO

CREATE OR ALTER PROCEDURE Stock.sp_ReducirCantidadProducto
    @IDProducto INT,
    @IDAlmacen INT,
    @CantidadReducir INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Verificar la existencia del producto en el almac�n
        IF NOT EXISTS (SELECT 1 FROM Stock.Stock WHERE IDProducto = @IDProducto AND IDAlmacen = @IDAlmacen)
        BEGIN
            ROLLBACK;
            RETURN -1;
        END

        -- Obtener la cantidad actual del producto en el almac�n
        DECLARE @CantidadActual INT;
        SELECT @CantidadActual = CantidadProducto FROM Stock.Stock WHERE IDProducto = @IDProducto AND IDAlmacen = @IDAlmacen;

        -- Verificar si la cantidad a reducir no excede la cantidad actual
        IF @CantidadActual < @CantidadReducir
        BEGIN
            ROLLBACK;
            RETURN -1;
        END

        -- Reducir la cantidad del producto en el almac�n
        UPDATE Stock.Stock
        SET CantidadProducto = CantidadProducto - @CantidadReducir
        WHERE IDProducto = @IDProducto AND IDAlmacen = @IDAlmacen;

        -- Verificar si la cantidad resultante es igual a 0 para actualizar el bit de disponibilidad
        IF (@CantidadActual - @CantidadReducir) = 0
        BEGIN
            UPDATE Stock.Stock
            SET Disponible = 0
            WHERE IDProducto = @IDProducto AND IDAlmacen = @IDAlmacen;
        END

        COMMIT;
        RETURN 1;
    END TRY
    BEGIN CATCH
        ROLLBACK;
        RETURN -1;
    END CATCH;
END
GO

CREATE OR ALTER PROCEDURE Stock.sp_AgregarMovimientoInventario
    @CantidadMovida INT,
    @IDProducto INT,
    @IDAlmacen INT,
    @IDEmpleado INT,
    @IDPedido INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

		 -- Validar existencia del producto
        IF NOT EXISTS (SELECT 1 FROM Stock.Producto WHERE IDProducto = @IDProducto)
        BEGIN
            ROLLBACK;
            RETURN 1;
        END

        -- Validar existencia del almac�n
        IF NOT EXISTS (SELECT 1 FROM Stock.Almacen WHERE IDAlmacen = @IDAlmacen)
        BEGIN
            ROLLBACK;
            RETURN 2;
        END

        -- Validar existencia del empleado
        IF NOT EXISTS (SELECT 1 FROM RRHH.Empleado WHERE IDEmpleado = @IDEmpleado AND IDPuesto = 3)
        BEGIN
            ROLLBACK;
            RETURN 3;
        END

        -- Validar existencia del pedido si se proporciona
        IF NOT EXISTS (SELECT 1 FROM FinanzaVenta.Pedido WHERE IDPedido = @IDPedido)
        BEGIN
            ROLLBACK;
            RETURN 4;
        END

        -- Llamar al procedimiento para reducir la cantidad del producto en el almac�n
        DECLARE @ResultadoReduccion INT;
        EXEC @ResultadoReduccion = Stock.sp_ReducirCantidadProducto @IDProducto, @IDAlmacen, @CantidadMovida;

        -- Verificar el resultado del procedimiento de reducci�n de cantidad
        IF @ResultadoReduccion <> 1
        BEGIN
            ROLLBACK;
            RETURN 5;
        END

        -- Insertar el movimiento de inventario
        INSERT INTO Stock.MovimientoInventario (FechaMovimiento, TipoMovimiento, CantidadMovida, IDProducto, IDAlmacen, IDEmpleado, IDPedido)
        VALUES (GETDATE(), 'salida', @CantidadMovida, @IDProducto, @IDAlmacen, @IDEmpleado, @IDPedido);

        COMMIT;
        RETURN 0; -- �xito
    END TRY
    BEGIN CATCH
        ROLLBACK;
        SELECT ERROR_MESSAGE()
    END CATCH;
END
GO

CREATE OR ALTER PROCEDURE Stock.sp_RestaurarCantidadProducto
    @IDProducto INT,
    @IDAlmacen INT,
    @CantidadAumentar INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Verificar la existencia del producto en el almac�n
        IF NOT EXISTS (SELECT 1 FROM Stock.Stock WHERE IDProducto = @IDProducto AND IDAlmacen = @IDAlmacen)
        BEGIN
            ROLLBACK;
            RETURN -1;
        END

        -- Obtener la cantidad actual del producto en el almac�n
        DECLARE @CantidadActual INT;
        SELECT @CantidadActual = CantidadProducto FROM Stock.Stock WHERE IDProducto = @IDProducto AND IDAlmacen = @IDAlmacen;

        -- Verificar si la cantidad a reducir no excede la cantidad actual
        IF @CantidadAumentar < 0
        BEGIN
            ROLLBACK;
            RETURN -1;
        END

        -- Reducir la cantidad del producto en el almac�n
        UPDATE Stock.Stock
        SET CantidadProducto = CantidadProducto + @CantidadAumentar,
		Disponible = 1
        WHERE IDProducto = @IDProducto AND IDAlmacen = @IDAlmacen;

        COMMIT;
        RETURN 1;
    END TRY
    BEGIN CATCH
        ROLLBACK;
        RETURN -1;
    END CATCH;
END
GO

CREATE OR ALTER PROCEDURE Stock.sp_EliminarMovimientoInventario
    @IDPedido INT,
    @IDProducto INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Validar existencia del movimiento de inventario
        IF NOT EXISTS (SELECT 1 FROM Stock.MovimientoInventario WHERE IDPedido = @IDPedido AND IDProducto = @IDProducto)
        BEGIN
            ROLLBACK;
            RETURN -1;
        END

        -- Restaurar la cantidad del producto eliminado
        DECLARE @IDAlmacen INT, @CantidadEliminada INT;
        SELECT @IDAlmacen = IDAlmacen, @CantidadEliminada = CantidadMovida FROM Stock.MovimientoInventario 
		WHERE IDPedido = @IDPedido AND IDProducto = @IDProducto;
        EXEC Stock.sp_RestaurarCantidadProducto @IDProducto, @IDAlmacen, @CantidadEliminada;

		-- Eliminar el movimiento de inventario
        DELETE FROM Stock.MovimientoInventario
        WHERE IDPedido = @IDPedido AND IDProducto = @IDProducto;

        COMMIT;
        RETURN 0; -- �xito
    END TRY
    BEGIN CATCH
        ROLLBACK;
        RETURN -1; -- Error
    END CATCH;
END
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
	CAST(Almacen.IDAlmacen AS VARCHAR)+' '+Almacen.NombreAlmacen+', '+Almacen.Ubicacion AS Ubicacion,
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

CREATE OR ALTER PROCEDURE Stock.sp_FiltrarAccesoriosDisponibles
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
		CAST(Almacen.IDAlmacen AS VARCHAR)+' '+Almacen.NombreAlmacen+', '+Almacen.Ubicacion AS Ubicacion
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
			ViewVehiculos.Ubicacion
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

CREATE OR ALTER VIEW Stock.view_ComponentesDisponibles
AS
SELECT 
	Producto.IDProducto,
	Componente.NombreComponente,
	Componente.MarcaComponente,
	Componente.DescripcionComponente,
	Componente.CategoriaComponente,
	Stock.CantidadProducto,
	CAST(Almacen.IDAlmacen AS VARCHAR)+' '+Almacen.NombreAlmacen+', '+Almacen.Ubicacion AS Ubicacion,
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

--Requerimiento 3
CREATE OR ALTER PROCEDURE FinanzaVenta.sp_ListarPedidosPendientesPorCliente
    @IDCliente INT
AS
BEGIN
    SELECT 
		Pedido.IDPedido, 
		Pedido.FechaPedido, 
		Pedido.EstadoPedido, 
		Pedido.MontoPedido
    FROM FinanzaVenta.Pedido AS Pedido
    WHERE Pedido.IDCliente = @IDCliente 
		AND Pedido.EstadoPedido = 'pendiente';
END
GO

CREATE OR ALTER PROCEDURE FinanzaVenta.sp_RegistrarFactura
    @IDPedido INT,
    @IDCliente INT,
    @ProvedorEnvio VARCHAR(100) = NULL,
    @DireccionEnvio VARCHAR(300) = NULL,
    @TrakingPedido VARCHAR(50) = NULL,
	@MontoTotal DECIMAL(19, 2)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Verificar si el pedido existe
        IF NOT EXISTS (SELECT 1 FROM FinanzaVenta.Pedido WHERE IDPedido = @IDPedido)
        BEGIN
            ROLLBACK;
            RETURN -1; -- Error: El pedido no existe
        END

        -- Verificar si el cliente existe
        IF NOT EXISTS (SELECT 1 FROM FinanzaVenta.Cliente WHERE IDCliente = @IDCliente)
        BEGIN
            ROLLBACK;
            RETURN -1; -- Error: El cliente no existe
        END

        -- Insertar una nueva factura
        DECLARE @IDFactura INT;
        INSERT INTO FinanzaVenta.Factura (FechaFactura, TotalFactura, ProvedorEnvio, DireccionEnvio, TrakingPedido)
        VALUES (GETDATE(), @MontoTotal, @ProvedorEnvio, @DireccionEnvio, @TrakingPedido);

        -- Obtener el ID de la factura reci�n insertada
        SET @IDFactura = SCOPE_IDENTITY();
		print(@IDFactura);

        -- Asociar la factura al pedido
        UPDATE FinanzaVenta.Pedido
        SET IDFactura = @IDFactura,
		EstadoPedido = 'vendido'
        WHERE IDPedido = @IDPedido;

        COMMIT;
        RETURN @IDFactura;
    END TRY
    BEGIN CATCH
        ROLLBACK;
        RETURN -1;
    END CATCH;
END
GO

--Requerimiento 4
CREATE OR ALTER PROCEDURE FinanzaVenta.sp_RegistrarCliente
	@NombreCliente VARCHAR(50),
	@TelefonoCliente VARCHAR(15),
	@CorreoCliente VARCHAR(100),
	@Identificacion VARCHAR(100)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION;

		IF @NombreCliente IS NULL
		BEGIN
			ROLLBACK;
			RETURN 0;
		END

		IF @TelefonoCliente IS NULL  
		BEGIN
			ROLLBACK;
			RETURN 0;
		END

		IF @CorreoCliente IS NULL
		BEGIN
			ROLLBACK;
			RETURN 0;
		END

		IF @Identificacion IS NULL
		BEGIN
			ROLLBACK;
			RETURN 0;
		END

		INSERT INTO FinanzaVenta.Cliente
		(NombreCliente, Telefono, [CorreoElectronico], Identificacion)
		VALUES (@NombreCliente, @TelefonoCliente, @CorreoCliente, @Identificacion)
		
		COMMIT;
		RETURN 1;
	END TRY
	BEGIN CATCH
		ROLLBACK;
		RETURN 0;
	END CATCH
END
GO

--Requerimiento 5
CREATE OR ALTER VIEW Stock.view_VehiculosVendidos 
AS
SELECT 
    Vehiculo.IDVehiculo,
    Vehiculo.MarcaVehiculo,
    Vehiculo.ModeloVehiculo,
    Producto.Precio,
    Pedido.IDPedido,
    Factura.FechaFactura AS FechaVenta,
    Cliente.NombreCliente,
    Cliente.CorreoElectronico AS CorreoCliente,
    Factura.TotalFactura AS PrecioVenta
FROM Stock.Vehiculo AS Vehiculo
INNER JOIN Stock.Producto AS Producto 
	ON Vehiculo.IDProducto = Producto.IDProducto
    INNER JOIN FinanzaVenta.Pedido AS Pedido 
		ON Pedido.IDPedido = Vehiculo.IDVehiculo
		INNER JOIN FinanzaVenta.Cliente AS Cliente 
			ON Pedido.IDCliente = Cliente.IDCliente
			INNER JOIN FinanzaVenta.Factura AS Factura 
				ON Pedido.IDFactura = Factura.IDFactura
WHERE Pedido.EstadoPedido = 'vendido';
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
        
    END TRY
    BEGIN CATCH
        SELECT 'NO DATA' AS Respuesta;
    END CATCH
END
GO

--WHERE (VehiculoVendidos.MarcaVehiculo = @Marca OR @Marca IS NULL)
--            AND (VehiculoVendidos.ModeloVehiculo = @Modelo OR @Modelo IS NULL)
--            AND (Vehiculo.IDTipoVehiculo = @IDTipoVehiculo OR @IDTipoVehiculo IS NULL);

--VehiculoVendidos.FechaVenta BETWEEN @FechaInicio AND @FechaFin
--Requerimiento 6

--ROLES
BEGIN

-- Crear roles
CREATE ROLE Topacio;
CREATE ROLE Rubi;
CREATE ROLE Zafiro;
CREATE ROLE ZafiroRojo;
CREATE ROLE ZafiroVerde;
CREATE ROLE Bronce;
CREATE ROLE Amatista;

-- Asignar permisos al rol Topacio (SYSAdmin)*
ALTER SERVER ROLE sysadmin ADD MEMBER Topacio;

-- Asignar permisos al rol Rubi (DBOwner)+
ALTER ROLE db_owner ADD MEMBER Rubi;

-- Asignar permisos al rol Zafiro (Aplicaci�n)+
-- Permisos espec�ficos para procedimientos almacenados y vistas
-- Ejemplo de permisos en procedimientos almacenados
GRANT EXECUTE ON OBJECT::RRHH.sp_InicioSesion TO Zafiro;
GRANT EXECUTE ON OBJECT::FinanzaVenta.sp_RegistrarPedido TO Zafiro;
GRANT EXECUTE ON OBJECT::FinanzaVenta.sp_CalcularMontoTotalPedido TO Zafiro;
GRANT EXECUTE ON OBJECT::Stock.sp_AgregarMovimientoInventario TO Zafiro;
GRANT EXECUTE ON OBJECT::Stock.sp_EliminarMovimientoInventario TO Zafiro;

GRANT EXECUTE ON OBJECT::Stock.sp_FiltrarAccesoriosDisponibles TO Zafiro;
GRANT EXECUTE ON OBJECT::Stock.sp_FiltrarVehiculosDisponibles TO Zafiro;
GRANT EXECUTE ON OBJECT::Stock.sp_FiltararComponentesDisponibles TO Zafiro;

GRANT EXECUTE ON OBJECT::FinanzaVenta.sp_ListarPedidosPendientesPorCliente TO Zafiro;
GRANT EXECUTE ON OBJECT::FinanzaVenta.sp_RegistrarFactura TO Zafiro;

GRANT EXECUTE ON OBJECT::FinanzaVenta.sp_RegistrarCliente TO Zafiro;
GRANT EXECUTE ON OBJECT::Stock.sp_FiltrarVehiculosVendidos TO Zafiro;

GRANT SELECT ON FinanzaVenta.Cliente TO Zafiro;
GRANT SELECT ON FinanzaVenta.Pedido TO Zafiro;
GRANT SELECT ON FinanzaVenta.Factura TO Zafiro;



-- Asignar permisos al rol ZafiroRojo (Ventas)
GRANT SELECT, INSERT, UPDATE, DELETE ON FinanzaVenta.Cliente TO ZafiroRojo;
GRANT SELECT, INSERT, UPDATE, DELETE ON FinanzaVenta.Pedido TO ZafiroRojo;
GRANT SELECT, INSERT, UPDATE, DELETE ON FinanzaVenta.Factura TO ZafiroRojo;
GRANT SELECT ON Stock.Producto TO ZafiroRojo;
GRANT SELECT ON Stock.Stock TO ZafiroRojo;

-- Asignar permisos al rol ZafiroVerde (Contabilidad)+
GRANT SELECT ON FinanzaVenta.Cliente TO ZafiroVerde;
GRANT SELECT ON FinanzaVenta.Pedido TO ZafiroVerde;
GRANT SELECT ON FinanzaVenta.Factura TO ZafiroVerde;
GRANT SELECT ON Stock.Producto TO ZafiroVerde;
GRANT SELECT ON Stock.Stock TO ZafiroVerde;

-- Asignar permisos al rol Bronce (Mantenimiento)+
GRANT SELECT, INSERT, UPDATE, DELETE ON Ensamblaje.Mantenimiento TO Bronce;
GRANT SELECT ON Stock.Componente TO Bronce;
GRANT SELECT ON Stock.Stock TO Bronce;
GRANT SELECT ON Stock.Almacen TO Bronce;

-- Asignar permisos al rol Amatista (Recursos Humanos)+
GRANT SELECT, INSERT, UPDATE, DELETE ON RRHH.Empleado TO Amatista;
GRANT SELECT, INSERT, UPDATE, DELETE ON RRHH.Departamento TO Amatista;
GRANT SELECT, INSERT, UPDATE, DELETE ON RRHH.Puesto TO Amatista;
GRANT SELECT, INSERT, UPDATE, DELETE ON RRHH.UsuarioAplicacion TO Amatista;

END
GO

--LOGINS
BEGIN

-- Crear login y usuario para el rol Topacio (SYSAdmin)
CREATE LOGIN TopacioLogin WITH PASSWORD = 'topacio123';
CREATE USER TopacioUser FOR LOGIN TopacioLogin;
ALTER SERVER ROLE sysadmin ADD MEMBER TopacioLogin;

-- Crear login y usuario para el rol Rubi (DBOwner)*
CREATE LOGIN RubiLogin WITH PASSWORD = 'rubi123';
CREATE USER RubiUser FOR LOGIN RubiLogin;
ALTER ROLE Rubi ADD MEMBER RubiUser;

-- Crear login y usuario para el rol Zafiro (Aplicaci�n)
CREATE LOGIN ZafiroLogin WITH PASSWORD = 'zafiro123';
CREATE USER ZafiroUser FOR LOGIN ZafiroLogin;
EXEC sp_addrolemember 'Zafiro', 'ZafiroUser';

-- Crear login y usuario para el rol ZafiroRojo (Ventas)*
CREATE LOGIN ZafiroRojoLogin WITH PASSWORD = 'YourSecurePassword4!';
CREATE USER ZafiroRojoUser FOR LOGIN ZafiroRojoLogin;
EXEC sp_addrolemember 'ZafiroRojo', 'ZafiroRojoUser';

-- Crear login y usuario para el rol ZafiroVerde (Contabilidad)
CREATE LOGIN ZafiroVerdeLogin WITH PASSWORD = 'YourSecurePassword5!';
CREATE USER ZafiroVerdeUser FOR LOGIN ZafiroVerdeLogin;
EXEC sp_addrolemember 'ZafiroVerde', 'ZafiroVerdeUser';

-- Crear login y usuario para el rol Bronce (Mantenimiento)*
CREATE LOGIN BronceLogin WITH PASSWORD = 'bronce123';
CREATE USER BronceUser FOR LOGIN BronceLogin;
EXEC sp_addrolemember 'Bronce', 'BronceUser';

-- Crear login y usuario para el rol Amatista (Recursos Humanos)*
CREATE LOGIN AmatistaLogin WITH PASSWORD = 'amatista123';
CREATE USER AmatistaUser FOR LOGIN AmatistaLogin;
EXEC sp_addrolemember 'Amatista', 'AmatistaUser';

END
GO