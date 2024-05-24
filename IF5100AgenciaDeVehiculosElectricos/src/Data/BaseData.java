package Data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public abstract class BaseData {
<<<<<<< HEAD
   private final String sqlUrl = "jdbc:sqlserver://20.169.167.245;databaseName=Agencia_De_Vehiculos_Electricos;user=ZafiroLogin;password=zafiro123;encrypt=false";
=======
   private final String sqlUrl = "jdbc:sqlserver://20.169.167.245:1433;databaseName=Agencia_De_Vehiculos_Electricos;user=ZafiroLogin;password=zafiro123;encrypt=false";
>>>>>>> 3a90e5e775e1f23b729ccbb8781b0e8882ff3c93
    public Connection getSqlConnection() throws SQLException {
        Connection connection = DriverManager.getConnection(sqlUrl);
        return connection;
    }
} 
