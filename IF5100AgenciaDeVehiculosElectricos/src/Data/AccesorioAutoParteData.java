/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Data;

import Domain.AccesorioAutoparte;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author User
 */
public class AccesorioAutoParteData extends BaseData {

    public AccesorioAutoParteData() {
    }

    public ArrayList<AccesorioAutoparte> obtenerAccesoriosOAutoPartes() throws SQLException {
        ArrayList<AccesorioAutoparte> accesorioAutopartes = new ArrayList<>();
        String sqlCallStoreProcedure = "{call sp_listar_peliculas_disponibles}"; // Cambio aquí
        java.sql.Connection connection = getSqlConnection();
        CallableStatement callable = connection.prepareCall(sqlCallStoreProcedure);
        ResultSet resultSet = callable.executeQuery();
        while (resultSet.next()) {
            int idProducto = resultSet.getInt("IdProducto");
            String nombre = resultSet.getString("Nombre");
            String marca = resultSet.getString("Marca");
            String categoria = resultSet.getString("Categoria");
            double precio = resultSet.getDouble("Precio");

            AccesorioAutoparte accesorioAutoparte = new AccesorioAutoparte(idProducto, nombre, marca, categoria, precio);
            accesorioAutopartes.add(accesorioAutoparte);
        }

        connection.close();
        return accesorioAutopartes;
    }
}
