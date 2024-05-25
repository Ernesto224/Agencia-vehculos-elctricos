package Data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public abstract class BaseData {

   private final String sqlUrl = "jdbc:sqlserver://20.169.167.245;databaseName=Agencia_De_Vehiculos_Electricos;user=ZafiroLogin;password=zafiro123;encrypt=false";

    public Connection getSqlConnection() throws SQLException {
        Connection connection = DriverManager.getConnection(sqlUrl);
        return connection;
    }
} 
