/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Data;

import Domain.Vehiculo;
import Domain.VehiculoDisponible;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.math.BigDecimal;

/**
 *
 * @author User
 */
public class VehiculoData extends BaseData {

    public VehiculoData() {
    }

    public ArrayList<VehiculoDisponible> obtenerVehiculos(Vehiculo vehiculo) {
        ArrayList<VehiculoDisponible> vehiculos = new ArrayList<>();

        String sqlCallStoreProcedure = "{call [Stock].[sp_FiltrarVehiculosDisponibles](?,?,?)}";

        try ( Connection connection = getSqlConnection()) {
            CallableStatement callable = connection.prepareCall(sqlCallStoreProcedure);
            if (vehiculo != null) {
                if (!vehiculo.getMarca().isEmpty()) {
                    callable.setString(1, vehiculo.getMarca());
                } else {
                    callable.setNull(1, java.sql.Types.VARCHAR);
                }

                if (!vehiculo.getModelo().isEmpty()) {
                    callable.setString(2, vehiculo.getModelo());
                } else {
                    callable.setNull(2, java.sql.Types.VARCHAR);
                }

                BigDecimal precio = BigDecimal.valueOf(vehiculo.getPrecio());
                if (precio.compareTo(BigDecimal.ZERO) != 0) {
                    callable.setBigDecimal(3, precio);
                } else {
                    callable.setNull(3, java.sql.Types.DECIMAL);
                }

            } else {
                callable.setNull(1, java.sql.Types.VARCHAR);
                callable.setNull(2, java.sql.Types.VARCHAR);
                callable.setNull(3, java.sql.Types.DECIMAL);
            }

            try ( ResultSet resultSet = callable.executeQuery()) {
                while (resultSet.next()) {
                    int idProducto = resultSet.getInt("IDProducto");
                    String marcaVehiculo = resultSet.getString("MarcaVehiculo");
                    String modeloVehiculo = resultSet.getString("ModeloVehiculo");
                    String paisImportacion = resultSet.getString("PaisImportacion");
                    boolean destinadoVenta = resultSet.getBoolean("DestinadoVenta");
                    double precio = resultSet.getDouble("Precio");
                    int cantidadProducto = resultSet.getInt("CantidadProducto");
                    String ubicacion = resultSet.getString("Ubicacion");

                    VehiculoDisponible vehiculoAux = new VehiculoDisponible(
                            idProducto, marcaVehiculo, modeloVehiculo, paisImportacion,
                            destinadoVenta, precio, cantidadProducto, ubicacion
                    );
                    vehiculos.add(vehiculoAux);
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(VehiculoData.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vehiculos;
    }

}
