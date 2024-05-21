/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Data;

import Domain.Componente;
import Domain.ComponenteAux;
import java.sql.CallableStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author User
 */
public class ComponenteData extends BaseData {

    public ComponenteData() {

    }
    public ArrayList<ComponenteAux> obtenerComponentes(Componente filtro) {
        ArrayList<ComponenteAux> componentes = new ArrayList<>();

        String sqlCallStoreProcedure = "{call sp_FiltrarComponentesDisponibles(?,?,?)}";

        try (java.sql.Connection connection = getSqlConnection();
             CallableStatement callable = connection.prepareCall(sqlCallStoreProcedure)) {

            callable.setString(1, filtro.getNombreComponente());
            callable.setString(2, filtro.getMarcaComponente());
            callable.setString(3, filtro.getCategoriaComponente());

            ResultSet resultSet = callable.executeQuery();

            while (resultSet.next()) {
                int idProducto = resultSet.getInt("IDProducto");
                String nombreComponente = resultSet.getString("NombreComponente");
                String marcaComponente = resultSet.getString("MarcaComponente");
                String descripcionComponente = resultSet.getString("DescripcionComponente");
                String categoriaComponente = resultSet.getString("CategoriaComponente");
                int stock = resultSet.getInt("Stock");
                String ubicacion = resultSet.getString("Ubicacion");
                boolean disponible = resultSet.getBoolean("Disponible");

                ComponenteAux componenteAux = new ComponenteAux(idProducto, nombreComponente, marcaComponente, descripcionComponente, categoriaComponente, stock, ubicacion, disponible);
                componentes.add(componenteAux);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ComponenteData.class.getName()).log(Level.SEVERE, null, ex);
        }

        return componentes;
    }

}
