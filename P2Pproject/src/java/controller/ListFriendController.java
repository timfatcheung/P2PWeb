package controller;

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
            HttpSession session = request.getSession(true);
            FriendListBean user = new FriendListBean();
            user.setUserName(session.getAttribute("SessionUser").toString());
            user = FriendListDAO.ListFriend(user, request , response);

            String username =  user.getUserName();

        } catch (Throwable Exception) {
            System.out.println(Exception);
        }
    }
}
