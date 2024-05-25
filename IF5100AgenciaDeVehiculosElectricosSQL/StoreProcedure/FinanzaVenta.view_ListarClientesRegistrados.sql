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