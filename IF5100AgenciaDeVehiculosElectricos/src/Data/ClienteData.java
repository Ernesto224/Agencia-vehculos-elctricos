/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Data;

import Domain.Cliente;
import java.sql.CallableStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author User
 */
public class ClienteData extends BaseData{
    
    public ClienteData() {
        
    }
    
    public boolean registrarCliente(Cliente cliente) {
        String sqlCallStoreProcedure = "{call sp_RegistrarCliente(?,?,?)}"; // Asegúrate de usar el nombre correcto del procedimiento almacenado
        
        try (java.sql.Connection connection = getSqlConnection();
             CallableStatement callable = connection.prepareCall(sqlCallStoreProcedure)) {

            callable.setString(1, cliente.getNombreCliente());
            callable.setString(2, cliente.getTelefono());
            callable.setString(3, cliente.getCorreo());

            callable.executeUpdate();
            return true;

        } catch (SQLException ex) {
            Logger.getLogger(ClienteData.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    
}
