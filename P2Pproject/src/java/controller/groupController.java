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
            GroupBean group = new GroupBean();

            String[] member = request.getParameterValues("member");
            group.setMember1(request.getParameter("SessionUser").toString());
            group.setMember2(member[0].toString());
            group.setMember3(member[1].toString());
            group.setMember4(member[2].toString());
            group.setMember5(member[3].toString());

            group = GroupDAO.AddGroup(group);

            response.sendRedirect("index.jsp");

        } catch (Throwable Exception) {
            System.out.println(Exception);
        }
    }
}
