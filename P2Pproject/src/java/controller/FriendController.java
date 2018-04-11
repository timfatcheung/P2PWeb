package controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class FriendController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, java.io.IOException {

        try {
            UserBean user = new UserBean();
            user.setUserName(request.getParameter("user").toString());
            user.setsessionName(request.getParameter("sessionuser").toString());
            user = UserDAO.addfriend(user);


                HttpSession session = request.getSession(true);
                session.setAttribute("SessionUser", user);
                response.sendRedirect("AfterRegistration.jsp"); //if inserted,redirect     		


        } catch (Throwable Exception) {
            System.out.println(Exception);
        }
    }
}

