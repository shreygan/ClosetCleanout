package Classes;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class SQLCon {
    
    private static Connection conn;
    private static boolean isConn;
    
    public static Connection getConn() {
        return conn;
    }
    
    public static boolean getIsConn() {
        return isConn;
    }

    public static void Connect() throws SQLException {
       
        String url = "jdbc:derby://localhost:1527/IA_DB";
        String user = "IAuser";
        String pass = "root";
        
        try {
            conn = DriverManager.getConnection(url, user, pass);
            
            isConn = true;
        } catch(SQLException e) {
            isConn = false;
            e.printStackTrace();
        }
    }
}