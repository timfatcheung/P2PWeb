package controller;

import java.text.*;
import java.util.*;
import java.sql.*;
import database.DBconnection;

public class UserDAO {

    static Connection currentCon = null;
    static ResultSet rs = null;

    public static UserBean login(UserBean bean) {
        Statement stmt = null;

        String UserName = bean.getUserName();
        String password = bean.getPassword();

        String searchQuery
                = "select * from Users where username='"
                + UserName
                + "' AND uPassword='"
                + password
                + "'";

        System.out.println("Your user name is " + UserName);
        System.out.println("Your password is " + password);
        System.out.println("Query: " + searchQuery);

        try {
            currentCon = DBconnection.getConnection();
            stmt = currentCon.createStatement();
            rs = stmt.executeQuery(searchQuery);
            boolean more = rs.next();

            // User not found, isValid == false
            if (!more) {
                System.out.println("Sorry, you are not a registered user! Please sign up first");
                bean.setValid(false);
            } //if user exists set the isValid variable to true
            else if (more) {
                String username = rs.getString("UserName");

                System.out.println("Welcome " + username);
                bean.setUserName(UserName);
                bean.setValid(true);
            }
        } catch (Exception ex) {
            System.out.println("Log In failed: An Exception has occurred! " + ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception e) {
                }
                rs = null;
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (Exception e) {
                }
                stmt = null;
            }
            if (currentCon != null) {
                try {
                    currentCon.close();
                } catch (Exception e) {
                }

                currentCon = null;
            }
        }
        return bean;

    }

    public static UserBean Resgister(UserBean bean) {
        Statement stmt = null;

        String username = bean.getUserName();
        String password = bean.getPassword();
        String Email = bean.getEmail();
        String Gender = bean.getGender();
        boolean Online = false;
        String searchQuery
                = "select * from Users where UserName='"
                + username + "'";

        System.out.println("user name is " + username);
        System.out.println("Query: " + searchQuery);

        try {
            currentCon = DBconnection.getConnection();
            stmt = currentCon.createStatement();
            rs = stmt.executeQuery(searchQuery);
            boolean more = rs.next();

            // User not found, isValid == true,insert data
            if (!more) {
                stmt = currentCon.createStatement();
                String query = "INSERT INTO Users VALUES ('" + username
                        + "', '" + password + "', "
                        + "'" + Email + "', "
                        + "'" + Gender + "', "
                        + Online + ")";

                if (stmt.executeUpdate(query) != 1) {
                    throw new Exception("Error adding user");
                }
                bean.setValid(true);
            } //if user exists set the isValid variable to true
            else if (more) {
                System.out.println("User exist");
                bean.setValid(false);
            }
        } catch (Exception ex) {
            System.out.println("failed:Exception" + ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception e) {
                }
                rs = null;
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (Exception e) {
                }
                stmt = null;
            }
            if (currentCon != null) {
                try {
                    currentCon.close();
                } catch (Exception e) {
                }
                currentCon = null;
            }
        }
        return bean;
    }

    public static UserBean search(UserBean bean) {
        Statement stmt = null;

        String UserName = bean.getUserName();
        String searchQuery
                = "select * from Users where username like'" + UserName + "%'";

        try {
            currentCon = DBconnection.getConnection();
            stmt = currentCon.createStatement();
            rs = stmt.executeQuery(searchQuery);
            boolean more = rs.next();

            // User not found, isValid == false
            if (!more) {
                System.out.println("Sorry, no user find");
                bean.setValid(false);
            } //if user exists set the isValid variable to true
            else if (more) {
                String username = rs.getString("UserName");
                bean.setUserName(UserName);
                bean.setValid(true);
            }
        } catch (Exception ex) {
            System.out.println("Log In failed: An Exception has occurred! " + ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception e) {
                }
                rs = null;
            }

            if (stmt != null) {
                try {
                    stmt.close();
                } catch (Exception e) {
                }
                stmt = null;
            }

            if (currentCon != null) {
                try {
                    currentCon.close();
                } catch (Exception e) {
                }
                currentCon = null;
            }
        }

        return bean;

    }
}
