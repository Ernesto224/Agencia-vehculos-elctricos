package Data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public abstract class BaseData {
<<<<<<< HEAD

   private final String sqlUrl = "jdbc:sqlserver://20.169.167.245;databaseName=Agencia_De_Vehiculos_Electricos;user=ZafiroLogin;password=zafiro123;encrypt=false";

=======
   private final String sqlUrl = "jdbc:sqlserver://20.169.167.245;databaseName=Agencia_De_Vehiculos_Electricos;user=ZafiroLogin;password=zafiro123;encrypt=false";
>>>>>>> 323dea9970a22f404142c4563f5eff74da8c50d7
    public Connection getSqlConnection() throws SQLException {
        Connection connection = DriverManager.getConnection(sqlUrl);
        return connection;
    }
} 
