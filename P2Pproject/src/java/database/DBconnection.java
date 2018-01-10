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
            
      public static Connection getConnection(){
        
         try
         {
             Class.forName("com.mysql.jdbc.Driver");

            
            try
            {            	
               con  = DriverManager.getConnection("jdbc:mysql:///p2pweb",
                    "root", "");;            								              
            }
            
            catch (SQLException ex)
            {
               ex.printStackTrace();
            }
         }

         catch(ClassNotFoundException e)
         {
            System.out.println(e);
         }

      return con;
}
}