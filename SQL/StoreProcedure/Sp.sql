USE Agencia_De_Vehiculos_Electricos
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

        -- Verificar la existencia del producto en el almacén
        IF NOT EXISTS (SELECT 1 FROM Stock.Stock WHERE IDProducto = @IDProducto AND IDAlmacen = @IDAlmacen)
        BEGIN
            ROLLBACK;
            RETURN -1;
        END

        -- Obtener la cantidad actual del producto en el almacén
        DECLARE @CantidadActual INT;
        SELECT @CantidadActual = CantidadProducto FROM Stock.Stock WHERE IDProducto = @IDProducto AND IDAlmacen = @IDAlmacen;

        -- Verificar si la cantidad a reducir no excede la cantidad actual
        IF @CantidadActual < @CantidadReducir
        BEGIN
            ROLLBACK;
            RETURN -1;
        END

        -- Reducir la cantidad del producto en el almacén
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
            RETURN -1;
        END

        -- Validar existencia del almacén
        IF NOT EXISTS (SELECT 1 FROM Stock.Almacen WHERE IDAlmacen = @IDAlmacen)
        BEGIN
            ROLLBACK;
            RETURN -1;
        END

        -- Validar existencia del empleado
        IF NOT EXISTS (SELECT 1 FROM RRHH.Empleado WHERE IDEmpleado = @IDEmpleado AND IDPuesto = 3)
        BEGIN
            ROLLBACK;
            RETURN -1;
        END

        -- Validar existencia del pedido si se proporciona
        IF NOT EXISTS (SELECT 1 FROM FinanzaVenta.Pedido WHERE IDPedido = @IDPedido)
        BEGIN
            ROLLBACK;
            RETURN -1;
        END

        -- Llamar al procedimiento para reducir la cantidad del producto en el almacén
        DECLARE @ResultadoReduccion INT;
        EXEC @ResultadoReduccion = Stock.sp_ReducirCantidadProducto @IDProducto, @IDAlmacen, @CantidadMovida;

        -- Verificar el resultado del procedimiento de reducción de cantidad
        IF @ResultadoReduccion <> 1
        BEGIN
            ROLLBACK;
            RETURN -1;
        END

        -- Insertar el movimiento de inventario
        INSERT INTO Stock.MovimientoInventario (FechaMovimiento, TipoMovimiento, CantidadMovida, IDProducto, IDAlmacen, IDEmpleado, IDPedido)
        VALUES (GETDATE(), 'salida', @CantidadMovida, @IDProducto, @IDAlmacen, @IDEmpleado, @IDPedido);

        COMMIT;
        RETURN 0; -- Éxito
    END TRY
    BEGIN CATCH
        ROLLBACK;
        RETURN -1;
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

        -- Verificar la existencia del producto en el almacén
        IF NOT EXISTS (SELECT 1 FROM Stock.Stock WHERE IDProducto = @IDProducto AND IDAlmacen = @IDAlmacen)
        BEGIN
            ROLLBACK;
            RETURN -1;
        END

        -- Obtener la cantidad actual del producto en el almacén
        DECLARE @CantidadActual INT;
        SELECT @CantidadActual = CantidadProducto FROM Stock.Stock WHERE IDProducto = @IDProducto AND IDAlmacen = @IDAlmacen;

        -- Verificar si la cantidad a reducir no excede la cantidad actual
        IF @CantidadAumentar < 0
        BEGIN
            ROLLBACK;
            RETURN -1;
        END

        -- Reducir la cantidad del producto en el almacén
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
        RETURN 0; -- Éxito
    END TRY
    BEGIN CATCH
        ROLLBACK;
        RETURN -1; -- Error
    END CATCH;
END
GO

CREATE OR ALTER VIEW FinanzaVenta.view_ListarClientesRegistrados
AS
SELECT 
	IDCliente,
	Identificacion,
	NombreCliente,
	CONCAT(SUBSTRING(Telefono, 4, LEN(Telefono)), '-####') AS Telefono,
	CorreoElectronico
FROM FinanzaVenta.Cliente
GO

CREATE OR ALTER PROCEDURE FinanzaVenta.sp_FiltrarClientesRegistrados
	@Identificacion nvarchar(65)
AS
BEGIN
	BEGIN TRY
		
		SELECT
			Clientes.IDCliente,
			CONCAT(SUBSTRING(Clientes.Identificacion, 4, LEN(Clientes.Identificacion)), '####') AS Identificacion,
			Clientes.NombreCliente,
			Clientes.Telefono,
			Clientes.CorreoElectronico
		FROM FinanzaVenta.view_ListarClientesRegistrados AS Clientes
		WHERE (Clientes.Identificacion = @Identificacion OR @Identificacion IS NULL)
		
	END TRY
	BEGIN CATCH
		SELECT 'NO DATA' AS Respuesta
	END CATCH

END
GO

CREATE OR ALTER PROCEDURE FinanzaVenta.sp_ListarProductosAgregados
	@IDPedido INT
AS
BEGIN
	BEGIN TRY
		
		SELECT
			Movimiento.IDProducto,
			Vehiculo.MarcaVehiculo +' '+Vehiculo.ModeloVehiculo AS Vehiculo,
			Accesorio.MarcaAccesorio +' '+Accesorio.NombreAccesorio AS Accesorio,
			Componente.MarcaComponente +' '+Componente.NombreComponente AS Componenente,
			Movimiento.CantidadMovida
		FROM Stock.MovimientoInventario AS Movimiento
		LEFT JOIN Stock.Vehiculo AS Vehiculo
			ON Movimiento.IDProducto = Vehiculo.IDProducto
			Left JOIN Stock.Accesorio AS Accesorio
				ON Movimiento.IDProducto = Accesorio.IDProducto
				left JOIN Stock.Componente AS Componente
					ON Movimiento.IDProducto = Componente.IDProducto
		WHERE Movimiento.IDPedido = @IDPedido;

	END TRY
	BEGIN CATCH
		SELECT 'NO DATA' AS Respuesta
	END CATCH

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
    @TrakingPedido VARCHAR(50) = NULL
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
        VALUES (GETDATE(), 0, @ProvedorEnvio, @DireccionEnvio, @TrakingPedido);

        -- Obtener el ID de la factura recién insertada
        SET @IDFactura = SCOPE_IDENTITY();

        -- Calcular el monto total del pedido
        DECLARE @MontoTotal DECIMAL(19, 2);
        EXEC @MontoTotal = FinanzaVenta.sp_CalcularMontoTotalPedido @IDPedido;

        -- Actualizar el total de la factura con el monto total calculado
        UPDATE FinanzaVenta.Factura
        SET TotalFactura = @MontoTotal
        WHERE IDFactura = @IDFactura;

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
