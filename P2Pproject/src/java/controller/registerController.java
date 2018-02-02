/**
 *
 * @author cheungtimfat
 */
package controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class registerController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, java.io.IOException {

        try {
            UserBean user = new UserBean();
            user.setUserName(request.getParameter("username").toString());
            user.setEmail(request.getParameter("email").toString());
            user.setGender(request.getParameter("gender").toString());
            user.setPassword(request.getParameter("password").toString());
            user.setPassword2(request.getParameter("password2").toString());
            user = UserDAO.Resgister(user);

            if (user.isValid()) {

                HttpSession session = request.getSession(true);
                session.setAttribute("SessionUser", user);
                response.sendRedirect("AfterRegistration.jsp"); //if inserted,redirect     		
            } else {
                response.sendRedirect("index.jsp"); // failed
            }

        } catch (Throwable Exception) {
            System.out.println(Exception);
        }
    }
}
