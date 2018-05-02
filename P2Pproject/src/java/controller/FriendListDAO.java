package controller;

import database.DBconnection;
import java.text.*;
import java.util.*;
import java.sql.*;
import database.DBlocal;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FriendListDAO {

    static Connection currentCon = null;
    static ResultSet rs = null;

    public static FriendListBean confirmfriend(FriendListBean bean) {
        Statement stmt = null;
        String username = bean.getUserName();
        String friendname = bean.getFriendName();
        boolean Confirm = true;

        try {
            currentCon = DBlocal.getConnection();

            stmt = currentCon.createStatement();
            String query = "UPDATE FriendList SET  Confirm = " + Confirm + " WHERE Username = '" + username + "' AND FriendName = ' "
                    + friendname + "'";

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

    public static FriendListBean ListFriend(FriendListBean bean, HttpServletRequest request, HttpServletResponse response) {
        Statement stmt = null;
        List<FriendListBean> users = new ArrayList<FriendListBean>();
        String UserName = bean.getUserName();
        String searchQuery = "select * from FriendList WHERE username ='" + UserName + "'";

        try {
            currentCon = DBlocal.getConnection();
            stmt = currentCon.createStatement();
            rs = stmt.executeQuery(searchQuery);
            while (rs.next()) {
                FriendListBean user = new FriendListBean();
                user.setFriendName(rs.getString("FriendName"));
                users.add(user);
            }
            request.setAttribute("ListFriends", users);
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);

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
