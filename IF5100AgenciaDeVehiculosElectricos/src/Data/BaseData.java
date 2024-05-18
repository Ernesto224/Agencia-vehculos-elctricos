package Data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public abstract class BaseData {
    private final String sqlUrl = "jdbc:sqlserver://163.178.107.10:1433;databaseName=BDProject;user=laboratorios;password=TUy&)&nfC7QqQau.%278UQ24/=%;encrypt=false";
    public Connection getSqlConnection() throws SQLException {
        Connection connection = DriverManager.getConnection(sqlUrl);
        return connection;
    }
} 
