CREATE OR ALTER PROCEDURE Stock.sp_FiltrarVehiculosVendidos
    @FechaBuscada DATE
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
            VehiculoVendidos.PrecioVenta,
			VehiculoVendidos.IDTipoVehiculo
        FROM Stock.view_VehiculosVendidos AS VehiculoVendidos
        INNER JOIN Stock.Vehiculo AS Vehiculo ON VehiculoVendidos.IDVehiculo = Vehiculo.IDVehiculo
        WHERE (@FechaBuscada IS NULL OR VehiculoVendidos.FechaVenta = @FechaBuscada)

    END TRY
    BEGIN CATCH
        SELECT 'NO DATA' AS Respuesta;
    END CATCH
END
GO

CREATE VIEW FinanzaVenta.view_MovimientosInventario 
AS
SELECT 
    MI.IDMovimiento,
    MI.FechaMovimiento,
    MI.TipoMovimiento,
    MI.CantidadMovida,
    CASE 
        WHEN MI.IDProducto IN (SELECT IDVehiculo FROM Stock.Vehiculo) THEN V.MarcaVehiculo + ' ' + V.ModeloVehiculo
        WHEN MI.IDProducto IN (SELECT IDAccesorio FROM Stock.Accesorio) THEN AC.NombreAccesorio
        WHEN MI.IDProducto IN (SELECT IDComponente FROM Stock.Componente) THEN C.NombreComponente
        ELSE 'Producto Desconocido'
    END AS Producto,
    A.NombreAlmacen AS Almacen,
    E.Nombre AS EmpleadoResponsable
FROM Stock.MovimientoInventario MI
INNER JOIN Stock.Almacen A ON MI.IDAlmacen = A.IDAlmacen
INNER JOIN RRHH.Empleado E ON MI.IDEmpleado = E.IDEmpleado
LEFT JOIN Stock.Vehiculo V ON MI.IDProducto = V.IDProducto
LEFT JOIN Stock.Accesorio AC ON MI.IDProducto = AC.IDProducto
LEFT JOIN Stock.Componente C ON MI.IDProducto = C.IDProducto;
GO

CREATE VIEW FinanzaVenta.view_ResumenVentas 
AS
SELECT 
    P.IDPedido,
    P.FechaPedido,
    P.EstadoPedido,
    F.IDFactura,
    F.FechaFactura,
    F.TotalFactura,
    C.NombreCliente,
    C.CorreoElectronico
FROM FinanzaVenta.Pedido P
INNER JOIN FinanzaVenta.Factura F ON P.IDFactura = F.IDFactura
INNER JOIN FinanzaVenta.Cliente C ON P.IDCliente = C.IDCliente;
GO
