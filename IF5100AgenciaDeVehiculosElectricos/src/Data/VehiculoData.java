/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Data;

import Domain.VehiculoAux;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author User
 */
public class VehiculoData extends BaseData{

    public VehiculoData() {
    }
    public ArrayList<VehiculoAux> obtenerVehiculos(VehiculoAux vehiculo) {
        ArrayList<VehiculoAux> vehiculos = new ArrayList<>();

        String sqlCallStoreProcedure = "{call sp_FiltrarVehiculosDisponibles(?,?,?)}";

        try (java.sql.Connection connection = getSqlConnection();
             CallableStatement callable = connection.prepareCall(sqlCallStoreProcedure)) {

            callable.setString(1, vehiculo.getMarca());
            callable.setString(2, vehiculo.getModelo());
            callable.setString(3, vehiculo.getPaisImportacion());

            ResultSet resultSet = callable.executeQuery();

            while (resultSet.next()) {
                int idProducto = resultSet.getInt("IDProducto");
                String marca = resultSet.getString("Marca");
                String modelo = resultSet.getString("Modelo");
                String paisImportacion = resultSet.getString("PaisImportacion");
                boolean destinadoVenta = resultSet.getBoolean("DestinadoVenta");
                double precio = resultSet.getDouble("Precio");
                int stock = resultSet.getInt("Stock");
                String nombreAlmacen = resultSet.getString("NombreAlmacen");

                VehiculoAux vehiculoAux = new VehiculoAux(idProducto, marca, modelo, paisImportacion, destinadoVenta, precio, stock, nombreAlmacen);
                vehiculos.add(vehiculoAux);
            }

        } catch (SQLException ex) {
            Logger.getLogger(VehiculoData.class.getName()).log(Level.SEVERE, null, ex);
        }

        return vehiculos;
    }
}
