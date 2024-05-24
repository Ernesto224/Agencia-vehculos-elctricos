/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Data;

import Domain.Cliente;
import java.sql.CallableStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.ResultSet;

/**
 *
 * @author User
 */
public class ClienteData extends BaseData {

    public ClienteData() {

    }

    public boolean registrarCliente(Cliente cliente) {
<<<<<<< HEAD
        String sqlCallStoreProcedure = "{call [FinanzaVenta].[sp_RegistrarCliente](?,?,?,?)}";
        
        try (java.sql.Connection connection = getSqlConnection();
             CallableStatement callable = connection.prepareCall(sqlCallStoreProcedure)) {
=======
        String sqlCallStoreProcedure = "{call [FinanzaVenta].[sp_RegistrarCliente](?,?,?,?)}"; // Asegúrate de usar el nombre correcto del procedimiento almacenado

        try ( java.sql.Connection connection = getSqlConnection();  CallableStatement callable = connection.prepareCall(sqlCallStoreProcedure)) {
>>>>>>> 323dea9970a22f404142c4563f5eff74da8c50d7

            callable.setString(1, cliente.getNombreCliente());
            callable.setString(2, cliente.getTelefono());
            callable.setString(3, cliente.getCorreo());
            callable.setString(4, cliente.getIdentificacion());

            callable.executeUpdate();
            return true;

        } catch (SQLException ex) {
            Logger.getLogger(ClienteData.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    public ArrayList<Cliente> obtenerClientes(int identificacion) {
        ArrayList<Cliente> clientes = new ArrayList<>();

        String sqlCallStoreProcedure = "{call FinanzaVenta.sp_FiltrarClientesRegistrados(?)}";

        try (java.sql.Connection connection = getSqlConnection();  CallableStatement callable = connection.prepareCall(sqlCallStoreProcedure)) {
            System.out.println("ENTRE");
            if (identificacion > 0) {
                callable.setInt(1, identificacion);
            } else {
                callable.setNull(1, java.sql.Types.INTEGER);
            }

            ResultSet resultSet = callable.executeQuery();

            while (resultSet.next()) {
                int idCliente = resultSet.getInt("IdCliente");
                String identificacionCliente = resultSet.getString("Identificacion");
                String nombreCliente = resultSet.getString("NombreCliente");
                String telefono = resultSet.getString("Telefono");
                String correo = resultSet.getString("CorreoElectronico");

                Cliente cliente = new Cliente(nombreCliente, telefono, correo, identificacionCliente, idCliente);
                clientes.add(cliente);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ClienteData.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println("FIN");
        return clientes;
    }


}
