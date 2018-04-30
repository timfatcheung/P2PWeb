package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DBlocal {

    private Connection connection;

    public PreparedStatement statement(String st) {
        try {
            return connection.prepareStatement(st);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    static Connection con;
    static String url;

    public static Connection getConnection() throws ClassNotFoundException {



            try {
                       Class.forName("org.apache.derby.jdbc.ClientDriver");
                       String url = "jdbc:derby://localhost:1527/p2p";
                       String username = "root";
                         String password = "root";
                con = DriverManager.getConnection(url, username, password);
            } catch (SQLException ex) {
                 System.out.println("Error obtaining connection with the database: " + ex);
            }
        

        return con;
    }
}
