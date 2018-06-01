package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ListFriendController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, java.io.IOException {

        try {
            FriendListBean user = new FriendListBean();
            user.setUserName(request.getParameter("SessionUser").toString());
            user = FriendListDAO.ListFriend(user, request , response);
                 String ListFriends =  user.getFriendName();
                response.sendRedirect("FriendList.jsp");      		

        } catch (Throwable Exception) {
            System.out.println(Exception);
        }
    }
}
