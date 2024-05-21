package Data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public abstract class BaseData {
   private final String sqlUrl = "jdbc:sqlserver://163.178.107.10;User Id=Laboratorios;Password=TUy&)&nfC7QqQau.%278UQ24/=%;Initial Catalog=Agencia_De_Vehiculos_Electricos;TrustServerCertificate=true;";
    public Connection getSqlConnection() throws SQLException {
        Connection connection = DriverManager.getConnection(sqlUrl);
        return connection;
    }
} 
