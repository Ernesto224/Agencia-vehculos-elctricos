/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Data;

import Domain.Accesorio;
import Domain.AccesorioAux;
import Domain.ComponenteAux;
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
public class AccesorioData extends BaseData{

    public AccesorioData() {
    }
    public ArrayList<AccesorioAux> obtenerAccesorios(Accesorio accesorio){
        ArrayList<AccesorioAux> accesorios = new ArrayList<>();

        String sqlCallStoreProcedure = "{call sp_FiltrarAccesoriosDisponibles(?,?,?)}";

        try (java.sql.Connection connection = getSqlConnection();
             CallableStatement callable = connection.prepareCall(sqlCallStoreProcedure)) {

            callable.setString(1, accesorio.getMarcaAccesorio());
            callable.setString(2, accesorio.getNombreAccesorio());
            callable.setString(3, accesorio.getCategoriaAccesorio());

            ResultSet resultSet = callable.executeQuery();

            while (resultSet.next()) {
                int idProducto = resultSet.getInt("IDProducto");
                String nombreAccesorio = resultSet.getString("NombreAccesorio");
                String marcaAccesorio = resultSet.getString("MarcaAccesorio");
                String descripcionAccesorio = resultSet.getString("DescripcionAccesorio");
                String categoriaAccesorio = resultSet.getString("CategoriaAccesorio");
                int stock = resultSet.getInt("Stock");
                String ubicacion = resultSet.getString("Ubicacion");
                boolean disponible = resultSet.getBoolean("Disponible");

                AccesorioAux accesorioAux = new AccesorioAux(idProducto, nombreAccesorio, marcaAccesorio, descripcionAccesorio, categoriaAccesorio, stock, ubicacion, disponible);
                accesorios.add(accesorioAux);
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccesorioData.class.getName()).log(Level.SEVERE, null, ex);
        }

        return accesorios;
    }
}
