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