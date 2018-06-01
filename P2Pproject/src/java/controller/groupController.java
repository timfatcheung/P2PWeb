package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;

public class groupController extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, java.io.IOException {

        try {
            FriendListBean friend = new FriendListBean();
            friend.setUserName(request.getParameter("username").toString());
            friend = FriendListDAO.ListFriend(friend , request , response);
            if (friend.isValid()) {
               
                String username =  friend.getUserName();

                response.sendRedirect("group.jsp"); //if logged-in,redirect     		
            } else {
                response.sendRedirect("invalidLogin.jsp"); //login failed
            }
        } catch (Throwable Exception) {
            System.out.println(Exception);
        }
    }
}
