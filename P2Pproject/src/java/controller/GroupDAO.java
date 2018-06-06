package controller;

import database.DBconnection;
import java.text.*;
import java.util.*;
import java.sql.*;
import database.DBlocal;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GroupDAO {

    static Connection currentCon = null;
    static ResultSet rs = null;

    public static GroupBean AddGroup(GroupBean bean) {
        Statement stmt = null;

        String GroupName = bean.getGroupName();
        String member1 = bean.getMember1();
        String member2 = bean.getMember2();
        String member3 = bean.getMember3();
        String member4 = bean.getMember4();
        String member5 = bean.getMember5();

         try {
            currentCon = DBlocal.getConnection();

            stmt = currentCon.createStatement();
            String query = "INSERT INTO GroupList (GroupName, Member1, Member2, Member3, Member4, Member5) VALUES ('" + GroupName
                    + "', '" + member1 + "', "
                    + "', '" + member2 + "', "
                    + "', '" + member3 + "', "
                    + "', '" + member4 + "', "
                    + "', '" + member5 + "')";

            if (stmt.executeUpdate(query) != 1) {
                throw new Exception("Error adding user");
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
}
