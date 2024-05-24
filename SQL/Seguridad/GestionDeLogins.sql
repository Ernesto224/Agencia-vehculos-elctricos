USE Agencia_De_Vehiculos_Electricos
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

-- Crear login y usuario para el rol Zafiro (Aplicación)
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