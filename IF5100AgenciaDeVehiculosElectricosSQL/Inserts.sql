USE Agencia_De_Vehiculos_Electricos
GO

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

END
GO

BEGIN

-- Insertar datos en la tabla Servicio.Servicio
INSERT INTO Servicio.Servicio (NombreServicio, Descripcion)
VALUES ('Mantenimiento General', 'Servicio completo de mantenimiento para vehículos, incluyendo cambios de aceite, revisiones y ajustes.');

INSERT INTO Servicio.Servicio (NombreServicio, Descripcion)
VALUES ('Inspección de Seguridad', 'Inspección completa de seguridad vehicular, incluyendo frenos, luces y sistemas de dirección.');

INSERT INTO Servicio.Servicio (NombreServicio, Descripcion)
VALUES ('Diagnóstico Electrónico', 'Diagnóstico y reparación de sistemas electrónicos y computarizados de vehículos.');

END
GO

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
VALUES (2, 'agarcia', 'securepass456');

INSERT INTO RRHH.UsuarioAplicacion (IDEmpleado, NombreUsuario, Contrasenia)
VALUES (3, 'clopez', 'mypassword789');

END
GO

BEGIN
-- Insertar datos en la tabla Mantenimiento
INSERT INTO Ensamblaje.Mantenimiento (FechaActualizacion, Estado, PruebasQA, Listo, IDVehiculo, IDDepartamento, IDServicio)
VALUES 
    ('2024-05-24', 'En progreso', 1, 0, 1, 3, 1), -- Ejemplo de un registro
    ('2024-05-23', 'Completado', 1, 1, 2, 4, NULL), -- Ejemplo de otro registro
    ('2024-05-22', 'En espera', 0, 0, 3, 2, 1); -- Otro ejemplo

END
GO

BEGIN
INSERT INTO Stock.MovimientoInventario (FechaMovimiento, TipoMovimiento, CantidadMovida, IDProducto, IDAlmacen , IDEmpleado)
VALUES ('2023-05-01', 'entrada', 100, 1, 1, 4);
INSERT INTO Stock.MovimientoInventario (FechaMovimiento, TipoMovimiento, CantidadMovida, IDProducto, IDAlmacen , IDEmpleado)
VALUES ('2023-05-02', 'entrada', 50, 2, 2, 4);
INSERT INTO Stock.MovimientoInventario (FechaMovimiento, TipoMovimiento, CantidadMovida, IDProducto, IDAlmacen , IDEmpleado)
VALUES ('2023-05-03', 'entrada', 75, 3, 3, 4);
INSERT INTO Stock.MovimientoInventario (FechaMovimiento, TipoMovimiento, CantidadMovida, IDProducto, IDAlmacen , IDEmpleado)
VALUES ('2023-05-04', 'entrada', 25, 4, 4, 4);
INSERT INTO Stock.MovimientoInventario (FechaMovimiento, TipoMovimiento, CantidadMovida, IDProducto, IDAlmacen , IDEmpleado)
VALUES ('2023-05-05', 'entrada', 60, 5, 5, 4);
-- Movimiento de inventario para Componente: Motor (Producto ID 6), Almacén ID 1
INSERT INTO Stock.MovimientoInventario (FechaMovimiento, TipoMovimiento, CantidadMovida, IDProducto, IDAlmacen , IDEmpleado)
VALUES (GETDATE(), 'entrada', 50, 6, 1, 4);
-- Movimiento de inventario para Componente: Bogies (Producto ID 7), Almacén ID 2
INSERT INTO Stock.MovimientoInventario (FechaMovimiento, TipoMovimiento, CantidadMovida, IDProducto, IDAlmacen , IDEmpleado)
VALUES (GETDATE(), 'entrada', 30, 7, 2, 4);
-- Movimiento de inventario para Accesorio: GPS (Producto ID 11), Almacén ID 1
INSERT INTO Stock.MovimientoInventario (FechaMovimiento, TipoMovimiento, CantidadMovida, IDProducto, IDAlmacen , IDEmpleado)
VALUES (GETDATE(), 'entrada', 20, 11, 1, 4);
-- Movimiento de inventario para Accesorio: Cubreasientos (Producto ID 12), Almacén ID 2
INSERT INTO Stock.MovimientoInventario (FechaMovimiento, TipoMovimiento, CantidadMovida, IDProducto, IDAlmacen , IDEmpleado)
VALUES (GETDATE(), 'entrada', 40, 12, 2, 4);

END
GO