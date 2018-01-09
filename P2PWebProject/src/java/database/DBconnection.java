package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


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

    public DBconnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection("jdbc:mysql:///p2pweb",
                    "myuser", "mypass");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
