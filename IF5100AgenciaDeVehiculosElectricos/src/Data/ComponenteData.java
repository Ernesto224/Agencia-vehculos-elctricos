/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Data;
import java.sql.CallableStatement;
import java.sql.SQLException;
import java.sql.ResultSet;

/**
 *
 * @author User
 */
public class ComponenteData extends BaseData{

    public ComponenteData() {
        
    }
    public String listarPeliculasDisponiblesAsString() throws SQLException {
    String sqlCallStoreProcedure = "{call sp_listar_peliculas_disponibles}"; // Cambio aquí
    java.sql.Connection connection = getSqlConnection();
    StringBuilder resultStringBuilder = new StringBuilder();
    CallableStatement callable = connection.prepareCall(sqlCallStoreProcedure);
    ResultSet resultSet = callable.executeQuery();
    while (resultSet.next()) {
        int id = resultSet.getInt("Id");
        String nombre = resultSet.getString("Nombre");
        String fechaPublicacion = resultSet.getString("FechaPublicacion");
        int anio = resultSet.getInt("Anio");

        // Concatenar los datos al StringBuilder
        resultStringBuilder.append("ID: ").append(id).append(", ");
        resultStringBuilder.append("Nombre: ").append(nombre).append(", ");
        resultStringBuilder.append("Fecha de Publicación: ").append(fechaPublicacion).append(", ");
        resultStringBuilder.append("Año: ").append(anio).append("\n");
    }
    connection.close();

    return resultStringBuilder.toString();
}

    
    
}
