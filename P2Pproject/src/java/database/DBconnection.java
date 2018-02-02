package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DBconnection {

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

    public static Connection getConnection() {

        try {
            Class.forName("com.mysql.jdbc.Driver");
            String dbName = "p2pweb";
            String userName = "cheungtimfat";
            String password = "p2pweb123456";
            String hostname = "p2pweb.cxkawmeddzl0.us-east-2.rds.amazonaws.com";
            String port = "3306";
            String jdbcUrl = "jdbc:mysql://" + hostname + ":" + port + "/" + dbName;

            try {

                con = DriverManager.getConnection(jdbcUrl, userName, password);
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        } catch (ClassNotFoundException e) {
            System.out.println(e);
        }

        return con;
    }
}
