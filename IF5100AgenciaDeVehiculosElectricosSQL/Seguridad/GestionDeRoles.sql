USE Agencia_De_Vehiculos_Electricos
GO

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

-- Asignar permisos al rol Zafiro (Aplicación)+
-- Permisos específicos para procedimientos almacenados y vistas
-- Ejemplo de permisos en procedimientos almacenados
GRANT EXECUTE ON OBJECT::RRHH.sp_InicioSesion TO Zafiro;
GRANT EXECUTE ON OBJECT::FinanzaVenta.sp_RegistrarPedido TO Zafiro;
GRANT EXECUTE ON OBJECT::FinanzaVenta.sp_CalcularMontoTotalPedido TO Zafiro;
GRANT EXECUTE ON OBJECT::Stock.sp_AgregarMovimientoInventario TO Zafiro;
GRANT EXECUTE ON OBJECT::Stock.sp_EliminarMovimientoInventario TO Zafiro;
GRANT EXECUTE ON OBJECT::FinanzaVenta.sp_FiltrarClientesRegistrados TO Zafiro;
GRANT EXECUTE ON OBJECT::Stock.sp_FiltrarVehiculosVendidos TO Zafiro;
GRANT EXECUTE ON OBJECT::FinanzaVenta.sp_ListarProductosAgregados TO Zafiro;

GRANT EXECUTE ON OBJECT::Stock.sp_FiltrarAccesoriosDisponibles TO Zafiro;
GRANT EXECUTE ON OBJECT::Stock.sp_FiltrarVehiculosDisponibles TO Zafiro;
GRANT EXECUTE ON OBJECT::Stock.sp_FiltararComponentesDisponibles TO Zafiro;

GRANT EXECUTE ON OBJECT::FinanzaVenta.sp_ListarPedidosPendientesPorCliente TO Zafiro;
GRANT EXECUTE ON OBJECT::FinanzaVenta.sp_RegistrarFactura TO Zafiro;

GRANT EXECUTE ON OBJECT::FinanzaVenta.sp_RegistrarCliente TO Zafiro;
GRANT EXECUTE ON OBJECT::Stock.sp_FiltrarVehiculosVendidos TO Zafiro;
GRANT SELECT ON OBJECT::FinanzaVenta.MovimientosInventario TO Zafiro;
GRANT SELECT ON OBJECT::FinanzaVenta.view_ResumenVentas TO Zafiro;

GRANT EXECUTE ON OBJECT::Servicio.sp_InsertarServicioPedido TO Zafiro;
GRANT EXECUTE ON OBJECT::Servicio.sp_RegistrarServicioPedido TO Zafiro;
GRANT SELECT ON OBJECT::Servicio.view_ListarTodosLosServicios TO Zafiro;
GRANT EXECUTE ON OBJECT::FinanzaVenta.sp_ActualizarMontoPedido TO Zafiro;
GRANT EXECUTE ON OBJECT::Servicio.sp_ListarServiciosPorPedido TO Zafiro;

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
