/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public abstract class BaseData {
    private final String sqlUrl = "jdbc:sqlserver://localhost:1433;database=TallerBD;user=taller;password=taller1";

    
    public Connection getSqlConnection() throws SQLException {
        Connection connection = DriverManager.getConnection(sqlUrl);
        return connection;
    }
}
