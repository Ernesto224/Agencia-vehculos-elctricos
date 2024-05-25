/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Business;

import Data.*;
import Domain.Cliente;

/**
 *
 * @author User
 */
public class ClienteBusiness extends BaseData{
    
    private final ClienteData clienteData;
    
    public ClienteBusiness() {
        this.clienteData = new ClienteData();
    }
    
    public boolean registrarCliente(Cliente cliente) {
        
        if (cliente.getNombreCliente().isEmpty() 
                || cliente.getNombreCliente().isEmpty() 
                || cliente.getNombreCliente().length() < 3 ) {
            return false;
        }
        
        if (cliente.getCorreo().isEmpty() 
                || cliente.getCorreo().isEmpty()
                || cliente.getCorreo().length() < 10) {
            return false;
        }
        
        if (cliente.getIdentificacion().isEmpty() 
                || cliente.getIdentificacion().isEmpty()
                || cliente.getIdentificacion().length() < 10) {
            return false;
        }
        
        if (cliente.getTelefono().isEmpty() 
                || cliente.getTelefono().isEmpty()
                || cliente.getTelefono().length() < 8) {
            return false;
        }
        
        return this.clienteData.registrarCliente(cliente);
    }
    
    
}
