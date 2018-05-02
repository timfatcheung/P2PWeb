package controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ConfirmFriendController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, java.io.IOException {

        try {
            FriendListBean user = new FriendListBean();
            user.setUserName(request.getParameter("user").toString());
            user.setFriendName(request.getParameter("frienduser").toString());
            user = FriendListDAO.confirmfriend(user);

            response.sendRedirect("index.jsp"); //if inserted,redirect     		

        } catch (Throwable Exception) {
            System.out.println(Exception);
        }
    }
}
