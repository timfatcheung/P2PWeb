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

public class searchController extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, java.io.IOException {

        try {
            UserBean user = new UserBean();
            user.setUserName(request.getParameter("username").toString());
            user = UserDAO.search(user);
            if (user.isValid()) {
               
                String username =  user.getUserName();

                response.sendRedirect("search.jsp"); //if logged-in,redirect     		
            } else {
                response.sendRedirect("invalidLogin.jsp"); //login failed
            }
        } catch (Throwable Exception) {
            System.out.println(Exception);
        }
    }
}
